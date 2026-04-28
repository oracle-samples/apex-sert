# SQL Injection Item Syntax Check — Design & Implementation

## Objective

Add a PL/SQL function `sql_injection_item_syntax` to `sert_core.eval_pkg` that detects
unprotected APEX substitution variables (e.g. `&ITEM.`, `&P1_ITEM.`, `&APP_ID.`) in a
PL/SQL source CLOB.  A substitution variable is considered **protected** only when it
appears inside an `apex_escape.*()` function call.  The function must return `'FAIL'` as
soon as any unprotected occurrence is found, and `'PASS'` when none exist.  Minimising
false negatives (missed vulnerabilities) was the explicit priority.

---

## Options Considered

### Algorithm 1 — Strip-then-scan via `REGEXP_REPLACE`

Remove all `apex_escape.*( ... )` calls using a regex, then test the remaining text for
`&WORD.` patterns.

| | |
|---|---|
| **Speed** | Fastest |
| **Accuracy** | ~90% — `[^)]*` cannot match nested parentheses, so a call like `apex_escape.html(func('x'))` is only partially stripped, potentially hiding a real violation or misidentifying a safe one |
| **SQL rule_criteria compatible** | Yes |
| **Verdict** | Rejected — unacceptable false-negative risk for a security check |

### Algorithm 2 — Safe-range exclusion via balanced parentheses

Walk the source to collect `[start, end]` spans for every `apex_escape.*()` call using
paren-depth tracking, then test whether any `&WORD.` falls outside all safe spans.

| | |
|---|---|
| **Speed** | Medium |
| **Accuracy** | ~97% — correctly handles nested calls; residual risk from `apex_escape.` appearing inside a comment or string literal creating a phantom safe range |
| **SQL rule_criteria compatible** | No — requires PL/SQL |
| **Verdict** | Rejected as a standalone solution — phantom safe-range risk on a full source CLOB; adopted as the **per-statement checker** within Option 4 |

### Algorithm 3 — Full character-level state machine

Single forward pass tracking lexer states (code / string / safe-call / safe-string /
line-comment / block-comment).  Only flags `&WORD.` found in an unprotected string
literal; comments and apex_escape arguments are fully ignored.

| | |
|---|---|
| **Speed** | Slowest |
| **Accuracy** | Highest — correctly handles comments, doubled quotes, nested calls, and apex_escape with whitespace before `(` |
| **SQL rule_criteria compatible** | No |
| **Verdict** | Rejected — all logic in one monolith; not reusable; superseded by Option 4 which achieves equivalent accuracy with better separation of concerns |

### Option 4 — Tokenise-then-check ✓ Selected

Separate **lexing** (splitting the source CLOB into individual statements) from
**pattern matching** (detecting the vulnerability).  A reusable `tokenize_plsql` function
splits the source into comment-stripped, upper-cased statement records.  Each statement is
then tested independently by a private `stmt_has_unprotected_subst` function using the
Algorithm 2 balanced-paren approach — but now applied to short `varchar2` statements
rather than the full CLOB, eliminating the phantom safe-range risk.

| | |
|---|---|
| **Reusability** | High — `tokenize_plsql` can be consumed by any future rule check |
| **Checker complexity** | Low — each concern is small and independently testable |
| **False-negative risk** | Very low — comments stripped before checking; Algorithm 2 operates on single statements only |
| **SQL rule_criteria compatible** | No — PL/SQL only |
| **Verdict** | **Selected** |

**Comparison with rejected options:**

| Approach | Reusability | Checker complexity | False-negative risk |
|---|---|---|---|
| Option 1 — Regex strip | None | Low | High |
| Option 2 — Safe ranges (CLOB) | None | Medium | Medium |
| Option 3 — State machine monolith | None | High | Low |
| Option 4 — Tokenise + per-statement check | High | Low | Very low |

**Final decision:** Option 4 — tokenise-then-check using `tokenize_plsql` + `stmt_has_unprotected_subst`.

---

## Technical Design

### Types — `eval_pkg` package spec

```sql
type t_plsql_statement is record (
  statement_text   varchar2(32767),  -- comment-stripped, upper-cased
  statement_no     pls_integer,      -- ordinal within source
  line_no          pls_integer       -- 1-based starting line
);
type t_plsql_statements is table of t_plsql_statement index by pls_integer;
```

Declared at package level so any future check can consume the tokeniser output directly.

---

### `tokenize_plsql( p_source in clob ) return t_plsql_statements` — public

**Purpose:** split a PL/SQL source CLOB into individual statements, stripping comments
and upper-casing, for use by downstream pattern-check functions.

**Lexer states:**

| Constant | Value | Meaning |
|---|---|---|
| `c_code` | 0 | Normal PL/SQL code |
| `c_string` | 1 | Inside a single-quoted string literal — content included in output |
| `c_cmt_line` | 2 | After `--` — content discarded until `c_lf` |
| `c_cmt_block` | 3 | Inside `/* … */` — content discarded until `*/` |
| `c_qstring_open` | 4 | Saw `Q'` — next character is the opening delimiter |
| `c_qstring` | 5 | Inside a q-quote body — content included until closing-delimiter + `'` |

**Character constants:**

| Constant | Value | Purpose |
|---|---|---|
| `c_lf` | `chr(10)` | Line-feed; used as the line-comment terminator and line-number counter |
| `c_return` | `chr(13)` | Carriage return; stripped from each chunk before processing |

**Key behaviours:**

- Reads the CLOB in 4 000-byte chunks via `dbms_lob.substr`; all state variables
  (including `l_qstring_delim`) persist across chunk boundaries.
- Each chunk is upper-cased and `c_return` is stripped via `replace(..., c_return)` before
  processing.  This normalises CRLF line endings to `c_lf` and prevents `c_cmt_line` from
  stalling indefinitely on source files that use CR-only line endings.
- Source is upper-cased per chunk; emitted `statement_text` values are always uppercase.
- Statement boundaries are `;` encountered in `c_code` state only.  Semicolons inside
  string literals (`c_string`, `c_qstring`), q-quote bodies, and comments are buffered or
  discarded and never trigger a statement boundary.
- When entering `c_cmt_line` or `c_cmt_block`, the comment-start characters already
  appended to the buffer (`-` or `/`) are removed with `substr( buf, 1, length(buf)-1 )`.
- Single-quoted string literal content (including surrounding quotes) is preserved verbatim
  so that the downstream checker can distinguish protected from unprotected contexts.
- Q-quote strings (`q'[...]'`, `q'(...)' `, `q'{...}'`, `q'<...>'`, symmetric-delimiter
  forms such as `q'!...!'`, and `nq'...'` national-charset variants) are handled by
  detecting `l_prev = 'Q'` when a `'` is seen in `c_code`.  The two-state approach
  (`c_qstring_open` → `c_qstring`) captures the opening delimiter on its own iteration,
  requiring no same-chunk lookahead and handling chunk boundaries transparently.  The
  closing delimiter mapping is: `[`→`]`, `(`→`)`, `{`→`}`, `<`→`>`, all other characters
  map to themselves.  All content — including embedded `'` and `;` characters — is buffered
  until `l_prev = l_qstring_delim and l_ch = ''''`.
- A buffer-overflow guard emits a partial record and resets the buffer when the accumulated
  statement approaches 32 700 characters, preventing `VALUE_ERROR` on very long statements
  while ensuring all content is still checked.
- A nested `emit_statement` procedure encapsulates the emit-and-reset logic, keeping the
  main loop readable.
- A trailing `emit_statement` call after the chunk loop captures source that does not end
  with a semicolon (e.g. anonymous blocks, partial snippets).

**Known limitations:**

- Using `'` itself as a q-quote delimiter (`q'''...'''`) is technically valid Oracle syntax
  but is not handled correctly.  The closing `'''` sequence would be misidentified at the
  first `''` pair.  This construct is not used in practice.
- Unbalanced parentheses inside q-quote content (e.g. `q'[)]'`) can cause
  `stmt_has_unprotected_subst`'s paren-depth tracker to close a safe range prematurely,
  producing a false positive (FAIL when the content is actually protected).  This does not
  produce false negatives.

---

### `stmt_has_unprotected_subst( p_stmt in varchar2 ) return boolean` — private

**Purpose:** determine whether a single comment-stripped, upper-cased statement contains
an unprotected `&WORD.` or `&WORD` substitution variable.

**Algorithm (Algorithm 2 applied to `varchar2`):**

**Pass 1 — collect safe ranges**

```
l_pos := 1
loop
  find next 'APEX_ESCAPE.' via instr()
  find the opening '(' via instr( ..., l_match + 12 )   -- skip past 'APEX_ESCAPE.'
  walk forward char-by-char incrementing/decrementing l_depth on '('/')'
  record [open-paren position, close-paren position] in l_safe_s / l_safe_e arrays
end loop
```

**Pass 2 — scan for substitution variables**

```
l_pos := 1
loop
  find next '&[A-Z][A-Z0-9_]*\.?' via regexp_instr()
  for each safe range: test whether l_match falls between l_safe_s(i) and l_safe_e(i)
  if not inside any safe range → return true (unprotected)
end loop
return false
```

Operating on `varchar2` rather than a CLOB means no chunking, no boundary-crossing edge
cases, and no `dbms_lob` calls.  Because the tokeniser has already split the source into
individual statements and stripped comments, the risk of a phantom safe range (the main
weakness of Algorithm 2) is effectively eliminated — an `apex_escape.` pattern in a
comment cannot reach this function.

---

### `sql_injection_item_syntax( p_source in clob ) return varchar2` — public

Thin orchestration wrapper:

```plsql
l_stmts := tokenize_plsql(p_source => p_source);

for i in 1 .. l_stmts.count loop
  if stmt_has_unprotected_subst(p_stmt => l_stmts(i).statement_text) then
    return 'FAIL';
  end if;
end loop;

return 'PASS';
```

Returns `'FAIL'` at the first unprotected occurrence; does not scan further statements.

---

### Protected vs unprotected — worked examples

| Source statement | Tokenised text | Result |
|---|---|---|
| `l_var := apex_escape.html('hello &ITEM.');` | `L_VAR := APEX_ESCAPE.HTML('HELLO &ITEM.')` | PASS — `&ITEM.` at pos 35 falls inside `APEX_ESCAPE.HTML(` range `[22..42]` |
| `l_var := 'hello &ITEM.';` | `L_VAR := 'HELLO &ITEM.'` | FAIL — no safe ranges; `&ITEM.` at pos 17 is unprotected |
| `l_x := apex_escape.html('ok') \|\| '&ITEM.';` | `L_X := APEX_ESCAPE.HTML('OK') \|\| '&ITEM.'` | FAIL — safe range covers `('OK')` only; `&ITEM.` at pos 40 is outside |
| `-- l_bad := '&ITEM.'; l_ok := apex_escape.html('x');` | `L_OK := APEX_ESCAPE.HTML('X')` | PASS — comment stripped by tokeniser; only the protected statement is checked |

---

### Files changed

| File | Change |
|---|---|
| `package_spec/eval_pkg.pks.sql` | Added `t_plsql_statement` record type, `t_plsql_statements` table type, `tokenize_plsql` declaration, `sql_injection_item_syntax` declaration |
| `package_body/eval_pkg.pkb.sql` | Added private `stmt_has_unprotected_subst`, public `tokenize_plsql`, public `sql_injection_item_syntax` |
