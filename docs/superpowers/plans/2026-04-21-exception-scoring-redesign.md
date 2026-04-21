# Exception Scoring Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the `valid_exceptions`-only AI scoring gate with a rich rule context prompt (info, fix, category, OWASP risk, severity) so every exception gets a meaningful score calibrated to the rule's severity.

**Architecture:** The `AI_EXCEPTION_PROMPT` pref holds the static system prompt skeleton with a `{RULE_CONTEXT}` placeholder; `get_exception_score` fetches all rule fields via a join query, assembles the dynamic context block as a CLOB, and substitutes it into the template before calling `apex_ai.generate`. Scoring fires whenever at least one of `info` or `valid_exceptions` is non-null.

**Tech Stack:** Oracle PL/SQL, Liquibase (`runOnChange:true`), `apex_ai.generate` (APEX 24.2), `apex_debug`, JSON path expressions.

**Spec:** `docs/superpowers/specs/2026-04-21-exception-scoring-redesign.md`

---

### Task 1: Update `AI_EXCEPTION_PROMPT` pref

**Files:**
- Modify: `product/sert/sert_core/seed_data/055_prefs_internal_merge.sql`

The changeset already has `runOnChange:true` — edit the pref_value string in place, no new changeset needed.

- [ ] **Step 1: Replace the pref_value string**

In `product/sert/sert_core/seed_data/055_prefs_internal_merge.sql`, find the `AI_EXCEPTION_PROMPT` merge block (around line 107–117) and replace the entire `pref_value` string:

Old value (single long string starting with `'You are an Oracle IT security expert...`):
```sql
, 'You are an Oracle IT security expert reviewing an exception provided by a user in response to a flagged vulnerability from the APEX-SERT tool. The user believes the flag is a false positive. You are provided with a list of acceptable exceptions for this rule: {VALID_EXCEPTIONS} Evaluate how well the user exception aligns with the acceptable exceptions. Assign a score from 1 to 5, where: 1 = Poorly written or irrelevant exception 3 = Partially acceptable, needs improvement or clarification 5 = Clearly aligns with acceptable exceptions and is well-justified Return only a JSON document in the following format: { "score": <integer from 1 to 5>, "reason": "<brief explanation for the score>" } Keep the explanation concise (1–2 sentences) and do not return any additional commentary outside the JSON.' as pref_value
```

New value:
```sql
, 'You are a senior application security expert specializing in OWASP Top 10 vulnerabilities and secure APEX application development. You are reviewing exception justifications submitted by developers for security findings flagged by the APEX-SERT security evaluation tool. The developer believes their application is not at risk despite the flagged finding, and has submitted a written justification. Your job is to assess whether that justification is legitimate, specific, and credible. Apply scoring strictness according to the rule''s severity: - HIGH: The exception must demonstrate a concrete compensating control or a documented architectural decision. A score of 4 or 5 requires an exceptional, specific justification. Vague or generic responses must score 1 or 2. - MEDIUM: A clear and specific rationale is required. Partially relevant responses score 2-3. Well-justified exceptions with specifics score 4-5. - LOW: More flexibility is allowed, but the justification must still be directly relevant to the specific finding. Generic responses score 1-2. {RULE_CONTEXT} Evaluate the quality of the submitted exception justification based on the rule context above. Assign a score from 1 to 5, where: 1 = Poorly written, irrelevant, or dismissive 3 = Partially acceptable - relevant but vague or incomplete 5 = Specific, credible, and well-aligned with the security context Return only a JSON document in this exact format: { "score": <integer from 1 to 5>, "reason": "<1-2 sentence explanation>" } Do not return any text outside the JSON.' as pref_value
```

Note: `rule''s` uses doubled single-quote SQL escaping.

- [ ] **Step 2: Commit**

```bash
git add product/sert/sert_core/seed_data/055_prefs_internal_merge.sql
git commit -m "update AI_EXCEPTION_PROMPT pref to OWASP expert persona with RULE_CONTEXT placeholder"
```

---

### Task 2: Rewrite `get_exception_score` in `exceptions_api.pkb.sql`

**Files:**
- Modify: `product/sert/sert_core/package_body/exceptions_api.pkb.sql` (lines 363–419)

- [ ] **Step 1: Replace the procedure body**

Find the entire `get_exception_score` procedure (from the banner comment block at line 363 through `end get_exception_score;` at line 419) and replace it with:

```sql
----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: G E T _ E X C E P T I O N _ S C O R E
-- Using AI, generates a score and reason for a specific exception
-- get_exception_score
-- purpose: use an AI service to assign a score and reason to an exception for a specific rule.
-- behavior: when AI is enabled (pref AI_ENABLED='Y'), fetches rule context (info, fix, valid_exceptions,
--   category, risk, severity); skips scoring when both info and valid_exceptions are null; builds a
--   structured rule context block; substitutes {RULE_CONTEXT} in system prompt pref; calls apex_ai.generate;
--   extracts $.score and $.reason into OUT params.
-- parameters:
--   p_rule_id                - rule identifier
--   p_exception              - exception text to evaluate
--   p_exception_score        - OUT score (number)
--   p_exception_score_reason - OUT reason (varchar2)
-- usage:
--   exceptions_api.get_exception_score(
--      p_rule_id                => p_rule_id,
--      p_exception              => p_exception,
--      p_exception_score        => p_exception_score,
--      p_exception_score_reason => p_exception_score_reason
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure get_exception_score (
   p_rule_id                in number
   ,p_exception             in varchar2
   ,p_exception_score       out number
   ,p_exception_score_reason out varchar2 )
is
   l_rule_name        varchar2(250);
   l_info             clob;
   l_fix              clob;
   l_valid_exceptions varchar2(4000);
   l_category_name    varchar2(250);
   l_risk_code        varchar2(250);
   l_risk_name        varchar2(250);
   l_severity_key     varchar2(250);
   l_rule_context     clob;
   l_system_prompt    clob;
   l_summary          clob;
begin
   -- determine score of exception using AI
   if reports_pkg.get_pref_value(p_pref_key => 'AI_ENABLED') = 'Y' then
      -- fetch all rule context fields needed to build the scoring prompt
      select r.rule_name
            ,r.info
            ,r.fix
            ,r.valid_exceptions
            ,c.category_name
            ,rs.risk_code
            ,rs.risk_name
            ,rsev.rule_severity_key
        into l_rule_name
            ,l_info
            ,l_fix
            ,l_valid_exceptions
            ,l_category_name
            ,l_risk_code
            ,l_risk_name
            ,l_severity_key
        from rules              r
        join categories         c    on c.category_id        = r.category_id
        left join risks         rs   on rs.risk_id           = r.risk_id
        join rule_severity      rsev on rsev.rule_severity_id = r.rule_severity_id
       where r.rule_id = p_rule_id;

      -- skip when there is no security context to evaluate against
      if l_info is not null or l_valid_exceptions is not null then
         -- build context block; metadata header always included
         l_rule_context := '## Security Rule Context' || chr(10)
            || 'Rule: ' || l_rule_name || '  |  Category: ' || l_category_name || chr(10)
            || case when l_risk_code is not null
                    then 'OWASP: ' || l_risk_code || ' - ' || l_risk_name || '  |  '
               end
            || 'Severity: ' || l_severity_key || chr(10);

         if l_info is not null then
            l_rule_context := l_rule_context || chr(10)
               || '### What This Rule Checks' || chr(10)
               || l_info || chr(10);
         end if;

         if l_fix is not null then
            l_rule_context := l_rule_context || chr(10)
               || '### Recommended Remediation' || chr(10)
               || l_fix || chr(10);
         end if;

         if l_valid_exceptions is not null then
            l_rule_context := l_rule_context || chr(10)
               || '### Example Acceptable Exceptions' || chr(10)
               || l_valid_exceptions || chr(10);
         end if;

         -- substitute rule context block into system prompt template
         l_system_prompt := replace(
            to_clob(reports_pkg.get_pref_value(p_pref_key => 'AI_EXCEPTION_PROMPT')),
            '{RULE_CONTEXT}',
            l_rule_context
         );

         -- call AI service
         l_summary := apex_ai.generate(
            p_prompt             => 'Evaluate the quality of the following exception justification: ' || p_exception
            ,p_system_prompt     => l_system_prompt
            ,p_service_static_id => reports_pkg.get_pref_value(p_pref_key => 'AI_STATIC_ID')
         );

         -- log the results
         apex_debug.message(l_summary);

         -- parse the AI response to get the score and reason
         select json_value(l_summary, '$.score')  as score
               ,json_value(l_summary, '$.reason') as reason
           into p_exception_score
               ,p_exception_score_reason
           from dual;
      end if;
   end if;
end get_exception_score;
```

- [ ] **Step 2: Verify the package compiles cleanly**

Connect via SQLcl and check for compilation errors:

```sql
select object_name, object_type, status, last_ddl_time
  from all_objects
 where owner       = 'SERT_CORE'
   and object_name = 'EXCEPTIONS_API'
   and status      = 'INVALID';
```

Expected: zero rows returned. If any row appears, run:

```sql
select line, position, text
  from all_errors
 where owner       = 'SERT_CORE'
   and name        = 'EXCEPTIONS_API'
   and type        = 'PACKAGE BODY'
 order by line;
```

Fix any reported errors before continuing.

- [ ] **Step 3: Commit**

```bash
git add product/sert/sert_core/package_body/exceptions_api.pkb.sql
git commit -m "rewrite get_exception_score to score from rule info, category, OWASP risk and severity"
```

---

### Task 3: Functional Verification

**Files:** none — read-only queries and procedure invocation

- [ ] **Step 1: Confirm scoring gate — both null case skips**

Find a rule with both `info` and `valid_exceptions` empty:

```sql
select rule_id, rule_name, info, valid_exceptions
  from sert_core.rules
 where (info is null or dbms_lob.getlength(info) = 0)
   and (valid_exceptions is null or valid_exceptions = '')
 fetch first 1 rows only;
```

Note the `rule_id`. Then invoke in a SERT_CORE session (AI_ENABLED must be 'Y' in prefs — temporarily set if needed for testing):

```sql
declare
  l_score  number;
  l_reason varchar2(4000);
begin
  sert_core.exceptions_api.get_exception_score(
     p_rule_id                => <rule_id_from_above>
    ,p_exception              => 'This is a test justification'
    ,p_exception_score        => l_score
    ,p_exception_score_reason => l_reason
  );
  dbms_output.put_line('Score:  ' || nvl(to_char(l_score), 'NULL'));
  dbms_output.put_line('Reason: ' || nvl(l_reason, 'NULL'));
end;
/
```

Expected: `Score: NULL` and `Reason: NULL` — the AI call was skipped.

- [ ] **Step 2: Confirm scoring fires for rule with info only**

Find a rule where `info` is populated but `valid_exceptions` is null/empty:

```sql
select rule_id, rule_name
  from sert_core.rules
 where dbms_lob.getlength(info) > 0
   and (valid_exceptions is null or valid_exceptions = '')
 fetch first 1 rows only;
```

Invoke `get_exception_score` with the returned `rule_id` and a vague justification (e.g., `'Not applicable to our environment'`). Expected: `Score` is a number 1–5 and `Reason` is non-null. The score should be low (1–2) for a vague justification on a HIGH severity rule.

- [ ] **Step 3: Confirm scoring fires for rule with valid_exceptions only (legacy path)**

```sql
select rule_id, rule_name
  from sert_core.rules
 where (info is null or dbms_lob.getlength(info) = 0)
   and valid_exceptions is not null
   and valid_exceptions != ''
 fetch first 1 rows only;
```

Invoke `get_exception_score`. Expected: score and reason are non-null.

- [ ] **Step 4: Confirm `{RULE_CONTEXT}` placeholder is gone from pref**

```sql
select instr(pref_value, '{RULE_CONTEXT}') as placeholder_pos
      ,instr(pref_value, '{VALID_EXCEPTIONS}') as old_placeholder_pos
  from sert_core.prefs
 where pref_key = 'AI_EXCEPTION_PROMPT';
```

Expected: `PLACEHOLDER_POS = 0` (placeholder was substituted out at runtime — this just confirms the pref text contains the literal string `{RULE_CONTEXT}` as a template, which is correct) and `OLD_PLACEHOLDER_POS = 0` (old `{VALID_EXCEPTIONS}` placeholder is gone).

Correction — expected result: `PLACEHOLDER_POS > 0` (the pref still contains `{RULE_CONTEXT}` as the template placeholder — that is correct) and `OLD_PLACEHOLDER_POS = 0` (old placeholder removed).

- [ ] **Step 5: Commit verification notes (if any fixes were made)**

```bash
git add product/sert/sert_core/package_body/exceptions_api.pkb.sql
git commit -m "fix: <describe any corrections found during verification>"
```

Skip this step if no fixes were needed.
