# Exception Scoring Redesign

**Date:** 2026-04-21
**Branch:** 24.2.24
**Status:** Approved — ready for implementation

---

## Problem

The current `get_exception_score` procedure scores exception justifications by comparing them against `rules.valid_exceptions` — a field that stores example acceptable exceptions. This approach has two significant gaps:

1. Many rules have `valid_exceptions` empty, so scoring is silently skipped for them entirely.
2. The AI has no knowledge of the security context behind the rule — what it checks, why it matters, what OWASP category it belongs to, or how severe it is. The score reflects textual similarity to examples, not security judgment.

---

## Goal

Score every exception justification using the rule's full security context, with strictness calibrated to the rule's severity and OWASP risk. `valid_exceptions` becomes supplementary — useful when populated, not required.

---

## Approach: Single `{RULE_CONTEXT}` placeholder (Approach A)

The `AI_EXCEPTION_PROMPT` pref contains the static skeleton (persona, rubric, output format) with a single `{RULE_CONTEXT}` placeholder. PL/SQL assembles the dynamic rule context block and substitutes it via `replace()`.

---

## System Prompt (AI_EXCEPTION_PROMPT pref value)

```
You are a senior application security expert specializing in OWASP Top 10
vulnerabilities and secure APEX application development. You are reviewing
exception justifications submitted by developers for security findings flagged
by the APEX-SERT security evaluation tool.

The developer believes their application is not at risk despite the flagged
finding, and has submitted a written justification. Your job is to assess
whether that justification is legitimate, specific, and credible.

Apply scoring strictness according to the rule's severity:
- HIGH: The exception must demonstrate a concrete compensating control or a
  documented architectural decision. A score of 4 or 5 requires an exceptional,
  specific justification. Vague or generic responses must score 1 or 2.
- MEDIUM: A clear and specific rationale is required. Partially relevant
  responses score 2-3. Well-justified exceptions with specifics score 4-5.
- LOW: More flexibility is allowed, but the justification must still be
  directly relevant to the specific finding. Generic responses score 1-2.

{RULE_CONTEXT}

Evaluate the quality of the submitted exception justification based on the
rule context above. Assign a score from 1 to 5, where:
  1 = Poorly written, irrelevant, or dismissive
  3 = Partially acceptable — relevant but vague or incomplete
  5 = Specific, credible, and well-aligned with the security context

Return only a JSON document in this exact format:
{ "score": <integer from 1 to 5>, "reason": "<1-2 sentence explanation>" }
Do not return any text outside the JSON.
```

---

## PL/SQL Rule Context Block

Built in `get_exception_score` and substituted for `{RULE_CONTEXT}`. All sections except the metadata header are conditional on nullability.

```
## Security Rule Context
Rule: {rule_name}  |  Category: {category_name}
OWASP: {risk_code} – {risk_name}  |  Severity: {severity_key}

### What This Rule Checks        ← omitted when info IS NULL
{info}

### Recommended Remediation      ← omitted when fix IS NULL
{fix}

### Example Acceptable Exceptions ← omitted when valid_exceptions IS NULL
{valid_exceptions}
```

The metadata header (rule name, category, OWASP code/name, severity) is always included — it provides the strictness signal even when both CLOBs are null.

---

## Scoring Gate

| `info` | `valid_exceptions` | Behaviour |
|--------|--------------------|-----------|
| populated | populated | Full context block — all sections |
| populated | null | Context block without examples section |
| null | populated | Metadata + examples; info/fix sections omitted |
| null | null | Skip AI call — OUT params remain null |

The old gate (`if l_valid_exceptions is not null`) is replaced with:

```sql
if l_info is not null or l_valid_exceptions is not null then
    -- build context block and call apex_ai.generate
end if;
```

---

## Data Fetch

Replace the current single-column SELECT with a join across four tables:

```sql
select r.rule_name
      ,r.info
      ,r.fix
      ,r.valid_exceptions
      ,c.category_name
      ,rs.risk_code
      ,rs.risk_name
      ,rsev.rule_severity_key
  into l_rule_name, l_info, l_fix, l_valid_exceptions
      ,l_category_name, l_risk_code, l_risk_name, l_severity_key
  from sert_core.rules         r
  join sert_core.categories    c    on c.category_id      = r.category_id
  join sert_core.risks         rs   on rs.risk_id         = r.risk_id
  join sert_core.rule_severity rsev on rsev.rule_severity_id = r.rule_severity_id
 where r.rule_id = p_rule_id;
```

`NO_DATA_FOUND` from this query (e.g. orphaned rule with null FK) is already caught by the existing exception block and leaves OUT params null — no additional handling needed.

---

## Files Changed

| File | Change |
|------|--------|
| `product/sert/sert_core/package_body/exceptions_api.pkb.sql` | Rewrite `get_exception_score`: new SELECT, context block assembly, updated scoring gate |
| `product/sert/sert_core/seed_data/055_prefs_internal_merge.sql` | Update the existing `AI_EXCEPTION_PROMPT` merge changeset in place (`runOnChange:true`) |

No schema changes. No new prefs. No new files.

---

## What Does Not Change

- `add_exception` and `bulk_add_exception` call signatures
- `$.score` / `$.reason` JSON parsing
- `AI_STATIC_ID` and `AI_ENABLED` pref lookups
- Score storage and display
- `apex_ai.generate` failure handling (swallows silently, OUT params remain null)
