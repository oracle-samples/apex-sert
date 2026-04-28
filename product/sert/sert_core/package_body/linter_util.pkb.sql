--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.linter_util_1776211201000 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.linter_util as

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: S T M T _ H A S _ U N P R O T E C T E D _ S U B S T
----------------------------------------------------------------------------------------------------------------------------
-- Returns true when a single statement contains an unprotected APEX substitution variable
----------------------------------------------------------------------------------------------------------------------------
-- stmt_has_unprotected_subst
-- purpose: determine whether one comment-stripped, upper-cased PL/SQL statement contains any
--   APEX substitution variable (&WORD. or &WORD) that is not enclosed by an apex_escape.* call.
-- behavior: pass 1 locates every apex_escape.* call in the statement using balanced-paren
--   tracking and records [start, end] safe ranges.  Pass 2 finds every &WORD. or &WORD pattern
--   via regexp_instr and tests whether each position falls inside a safe range.  Returns true
--   on the first unprotected occurrence; false when all occurrences are protected or none exist.
--   The caller (tokenize_plsql) strips comments, so p_stmt contains only code and string literals.
-- parameters:
--   p_stmt - single PL/SQL statement, comment-stripped and upper-cased by tokenize_plsql.
-- returns:
--   boolean - true when an unprotected substitution variable is found, false otherwise.
----------------------------------------------------------------------------------------------------------------------------
function stmt_has_unprotected_subst(
    p_stmt in varchar2 )
    return boolean
  as
    l_len      pls_integer := nvl(length(p_stmt), 0);
    l_pos      pls_integer;
    l_match    pls_integer;
    l_depth    pls_integer;
    l_ch       varchar2(1);

    -- parallel arrays: start and end position of each apex_escape.* safe range
    type t_int_tab is table of pls_integer index by pls_integer;
    l_safe_s   t_int_tab;
    l_safe_e   t_int_tab;
    l_safe_cnt pls_integer := 0;

    l_in_safe  boolean;
  begin
    if l_len = 0 then
      return false;
    end if;

    -- pass 1: record [open-paren .. close-paren] for every apex_escape.* call
    l_pos := 1;
    loop
      -- find the next apex_escape. occurrence
      l_match := instr(p_stmt, 'APEX_ESCAPE.', l_pos);
      exit when l_match = 0;

      -- find the opening paren of this specific function call
      l_match := instr(p_stmt, '(', l_match + 12); -- +12 skips past 'APEX_ESCAPE.'
      exit when l_match = 0;

      -- walk forward with paren-depth tracking to find the matching close paren
      l_depth := 1;
      l_pos   := l_match + 1;
      while l_depth > 0 and l_pos <= l_len loop
        l_ch := substr(p_stmt, l_pos, 1);
        if    l_ch = '(' then l_depth := l_depth + 1;
        elsif l_ch = ')' then l_depth := l_depth - 1;
        end if;
        l_pos := l_pos + 1;
      end loop; -- paren-depth walk

      l_safe_cnt           := l_safe_cnt + 1;
      l_safe_s(l_safe_cnt) := l_match;     -- position of the opening '('
      l_safe_e(l_safe_cnt) := l_pos - 1;   -- position of the matching ')'
    end loop; -- apex_escape range collection

    -- pass 2: find every &WORD. or &WORD and check whether it falls inside a safe range
    l_pos := 1;
    loop
      l_match := regexp_instr(p_stmt, '&[A-Z][A-Z0-9_]*\.?', l_pos);
      exit when l_match = 0;

      -- test against each safe range
      l_in_safe := false;
      for i in 1 .. l_safe_cnt loop
        if l_match between l_safe_s(i) and l_safe_e(i) then
          l_in_safe := true;
          exit;
        end if;
      end loop; -- safe-range check

      if not l_in_safe then
        return true; -- unprotected substitution variable found
      end if;

      l_pos := l_match + 1;
    end loop; -- substitution pattern scan

    return false;
  end stmt_has_unprotected_subst;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: T O K E N I Z E _ P L S Q L
----------------------------------------------------------------------------------------------------------------------------
-- Splits a PL/SQL or SQL source CLOB into individual statements, stripping comments
----------------------------------------------------------------------------------------------------------------------------
-- tokenize_plsql
-- purpose: parse a PL/SQL or SQL source CLOB and return one record per logical statement,
--   with comments stripped and text upper-cased, for use by downstream pattern-check functions.
-- behavior: walks the source in 4000-byte chunks using a six-state lexer (code, string-literal,
--   q-quote-open, q-quote-body, line-comment, block-comment).  Statements are delimited by
--   semicolons found in code state only; semicolons inside string literals, q-quote bodies,
--   and comments are buffered or discarded without triggering a statement boundary.
--   Comment text is excluded from the emitted statement_text to simplify downstream checks.
--   String literal content (including the surrounding quotes) is preserved unchanged so that
--   checkers can distinguish protected from unprotected contexts.  Q-quote strings (q'[...]',
--   q'(...)' etc., including nq'...' national-charset variants) are handled by detecting the
--   Q preceding the opening quote, capturing the opening delimiter on the next character, and
--   buffering all content until the matching close-delimiter + quote pair is seen; no same-chunk
--   peek is required so chunk boundaries are handled transparently.  Blank statements are not
--   emitted.  When the accumulated statement buffer approaches 32767 characters a partial
--   record is emitted and accumulation continues to prevent data loss.
-- parameters:
--   p_source - PL/SQL or SQL source text to tokenize.
-- returns:
--   t_plsql_statements - indexed collection; each entry contains:
--     statement_text  varchar2(32767), comment-stripped and upper-cased statement text.
--     statement_no    pls_integer, ordinal position of this statement within the source.
--     line_no         pls_integer, 1-based source line where this statement begins.
-- usage:
--   l_stmts := linter_util.tokenize_plsql(p_source => :column_to_evaluate);
--   for i in 1 .. l_stmts.count loop
--     -- inspect l_stmts(i).statement_text, .statement_no, .line_no
--   end loop;
----------------------------------------------------------------------------------------------------------------------------
function tokenize_plsql(
    p_source in clob )
    return t_plsql_statements
  as
    c_code         constant pls_integer := 0; -- normal code
    c_string       constant pls_integer := 1; -- inside a single-quoted string literal
    c_cmt_line     constant pls_integer := 2; -- after -- until end of line
    c_cmt_block    constant pls_integer := 3; -- inside /* ... */
    c_qstring_open constant pls_integer := 4; -- saw Q', next char is the opening delimiter
    c_qstring      constant pls_integer := 5; -- inside q-quote body; l_qstring_delim holds closing char

    c_lf         constant varchar2(1)  := chr(10);
    c_return     constant varchar2(1)  := chr(13);
    c_chunk_size constant pls_integer  := 4000;
    c_buf_limit  constant pls_integer  := 32700; -- headroom below varchar2 max

    l_result          t_plsql_statements;
    l_len             pls_integer;
    l_offset          pls_integer := 1;
    l_chunk           varchar2(4000);
    l_chunk_len       pls_integer;
    l_i               pls_integer;

    l_state           pls_integer := c_code;
    l_ch              varchar2(1);
    l_prev            varchar2(1) := chr(0);
    l_qstring_delim   varchar2(1);           -- closing delimiter for the current q-quote

    l_stmt_buf        varchar2(32767);
    l_stmt_no         pls_integer := 1;
    l_stmt_start_line pls_integer := 1;
    l_line_no         pls_integer := 1;
    l_cnt             pls_integer := 0;

    -- nested helper: emit the current buffer as one result record then reset
    procedure emit_statement
    as
      l_text varchar2(32767) := trim(l_stmt_buf);
    begin
      if l_text is not null then
        l_cnt                          := l_cnt + 1;
        l_result(l_cnt).statement_text := l_text;
        l_result(l_cnt).statement_no   := l_stmt_no;
        l_result(l_cnt).line_no        := l_stmt_start_line;
        l_stmt_no                      := l_stmt_no + 1;
      end if;
      l_stmt_buf        := null;
      l_stmt_start_line := l_line_no;
    end emit_statement;
  begin
    l_len := dbms_lob.getlength(p_source);

    if l_len is null or l_len = 0 then
      return l_result;
    end if;

    while l_offset <= l_len loop
      -- strip c_return before processing: normalises CRLF to c_lf and removes bare CR,
      -- preventing c_cmt_line from stalling on CR-only line endings
      l_chunk     := replace(upper(dbms_lob.substr(p_source, c_chunk_size, l_offset)), c_return);
      l_chunk_len := nvl(length(l_chunk), 0);
      l_i         := 1;

      while l_i <= l_chunk_len loop
        l_ch := substr(l_chunk, l_i, 1);

        -- track line numbers across all states
        if l_ch = c_lf then
          l_line_no := l_line_no + 1;
        end if;

        case l_state

        -- line comment: skip characters until newline, then return to code
        when c_cmt_line then
          if l_ch = c_lf then
            l_state := c_code;
          end if; -- c_lf

        -- block comment: skip characters until closing */
        when c_cmt_block then
          if l_prev = '*' and l_ch = '/' then
            l_state := c_code;
          end if; -- */

        -- string literal: include content in the statement buffer
        when c_string then
          if l_ch = '''' then
            if substr(l_chunk, l_i + 1, 1) = '''' then
              -- escaped (doubled) quote: include both characters and stay in string
              l_stmt_buf := l_stmt_buf || l_ch;
              l_i        := l_i + 1;
              l_stmt_buf := l_stmt_buf || '''';
            else
              -- closing quote: include it and return to code
              l_stmt_buf := l_stmt_buf || l_ch;
              l_state    := c_code;
            end if; -- doubled-quote check
          else
            l_stmt_buf := l_stmt_buf || l_ch;
          end if; -- string character dispatch

        -- q-quote opening: first character after q' is the opening delimiter;
        -- derive the expected closing delimiter and enter the q-quote body
        when c_qstring_open then
          l_stmt_buf      := l_stmt_buf || l_ch;
          l_qstring_delim := case l_ch
                               when '[' then ']'
                               when '(' then ')'
                               when '{' then '}'
                               when '<' then '>'
                               else l_ch  -- symmetric delimiter: !, |, #, etc.
                             end;
          l_state := c_qstring;

        -- q-quote body: buffer all content including single quotes and semicolons;
        -- exit when the closing delimiter is immediately followed by a single quote
        when c_qstring then
          l_stmt_buf := l_stmt_buf || l_ch;
          if l_prev = l_qstring_delim and l_ch = '''' then
            l_state := c_code; -- closing delimiter + quote ends the q-quote string
          end if; -- q-quote exit check

        -- normal code
        when c_code then
          if l_prev = '-' and l_ch = '-' then
            -- line comment start: remove the leading '-' that was already buffered
            l_stmt_buf := substr(l_stmt_buf, 1, length(l_stmt_buf) - 1);
            l_state    := c_cmt_line;

          elsif l_prev = '/' and l_ch = '*' then
            -- block comment start: remove the leading '/' that was already buffered
            l_stmt_buf := substr(l_stmt_buf, 1, length(l_stmt_buf) - 1);
            l_state    := c_cmt_block;

          elsif l_ch = '''' then
            -- opening quote: q-quote if immediately preceded by Q (handles q'...' and nq'...')
            l_stmt_buf := l_stmt_buf || l_ch;
            if l_prev = 'Q' then
              l_state := c_qstring_open; -- next character reveals the opening delimiter
            else
              l_state := c_string;
            end if; -- q-quote check

          elsif l_ch = ';' then
            -- statement boundary: emit the accumulated statement and reset
            emit_statement;

          else
            -- regular code character: guard against buffer overflow before appending
            if length(l_stmt_buf) >= c_buf_limit then
              emit_statement; -- emit partial statement; accumulation continues in fresh buffer
            end if;
            l_stmt_buf := l_stmt_buf || l_ch;

          end if; -- code character dispatch

        end case; -- state machine

        l_prev := l_ch;
        l_i    := l_i + 1;
      end loop; -- l_i: chunk character loop

      l_offset := l_offset + c_chunk_size;
    end loop; -- l_offset: chunk loop

    -- emit any trailing content (handles source that does not end with a semicolon)
    emit_statement;

    return l_result;
  end tokenize_plsql;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: S Q L _ I N J E C T I O N _ I T E M _ S Y N T A X
----------------------------------------------------------------------------------------------------------------------------
-- Detects unprotected APEX substitution variables in a PL/SQL or SQL source CLOB
----------------------------------------------------------------------------------------------------------------------------
-- sql_injection_item_syntax
-- purpose: return 'FAIL' when any APEX substitution variable (&WORD. or &WORD) exists in a
--   statement not wrapped by an apex_escape package call; return 'PASS' otherwise.
-- behavior: delegates tokenization to tokenize_plsql, which splits the source into individual
--   comment-stripped statements.  Each statement is tested by stmt_has_unprotected_subst
--   using balanced-paren safe-range exclusion (Algorithm 2).
--   Returns 'FAIL' at the first unprotected substitution variable found across all statements.
--   Separating tokenization from detection makes both functions independently reusable and
--   keeps each concern small enough to reason about independently.
-- parameters:
--   p_source - PL/SQL or SQL source text to inspect for unprotected substitution variables.
-- returns:
--   varchar2 - 'FAIL' when an unprotected substitution variable is detected,
--              'PASS' when no unprotected substitution variables are found.
-- usage:
--   l_result := linter_util.sql_injection_item_syntax(p_source => :column_to_evaluate);
----------------------------------------------------------------------------------------------------------------------------
function sql_injection_item_syntax(
    p_source in clob )
    return varchar2
  as
    l_stmts t_plsql_statements;
  begin
    l_stmts := tokenize_plsql(p_source => p_source);

    for i in 1 .. l_stmts.count loop
      -- statement_text is already upper-cased by tokenize_plsql
      if stmt_has_unprotected_subst(p_stmt => l_stmts(i).statement_text) then
        return 'FAIL';
      end if;
    end loop; -- per-statement check

    return 'PASS';
  end sql_injection_item_syntax;

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end linter_util;
/
--rollback not required
