--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_unit_test.test_sql_injection_item_syntax stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body unit_test.test_sql_injection_item_syntax
as

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: F A I L _ U N P R O T E C T E D _ I N _ S T R I N G
----------------------------------------------------------------------------------------------------------------------------
-- Expects FAIL: bare substitution variable inside an unprotected string literal
----------------------------------------------------------------------------------------------------------------------------
-- fail_unprotected_in_string
-- purpose: verify that sql_injection_item_syntax returns 'FAIL' when the source contains an
--   APEX substitution variable inside a plain string literal with no apex_escape protection.
-- behavior: source is a single assignment statement; &ITEM. is inside a string literal that
--   is not passed to any apex_escape function.  The tokeniser emits one statement;
--   stmt_has_unprotected_subst finds no safe ranges and detects &ITEM. as unprotected.
-- parameters: none
----------------------------------------------------------------------------------------------------------------------------
procedure fail_unprotected_in_string
as
   l_source clob   := to_clob(q'[l_var := 'hello &ITEM.';]');
   l_result varchar2(10);
begin
   -- Act
   l_result := sert_core.linter_util.sql_injection_item_syntax(p_source => l_source);

   -- Assert
   ut.expect(l_result).to_equal('FAIL');
end fail_unprotected_in_string;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: F A I L _ O U T S I D E _ A P E X _ E S C A P E _ C O N C A T
----------------------------------------------------------------------------------------------------------------------------
-- Expects FAIL: substitution variable in the unprotected half of a concatenation
----------------------------------------------------------------------------------------------------------------------------
-- fail_outside_apex_escape_concat
-- purpose: verify that sql_injection_item_syntax returns 'FAIL' when apex_escape protects
--   only part of an expression and &ITEM. appears in the unprotected concatenated fragment.
-- behavior: source contains apex_escape.html('safe') || '&ITEM.'.  The safe range covers
--   only the apex_escape.html( ... ) call; &ITEM. in the trailing string literal falls
--   outside that range and is detected as unprotected.
-- parameters: none
----------------------------------------------------------------------------------------------------------------------------
procedure fail_outside_apex_escape_concat
as
   l_source clob   := to_clob(q'[l_var := apex_escape.html('safe') || '&ITEM.';]');
   l_result varchar2(10);
begin
   -- Act
   l_result := sert_core.linter_util.sql_injection_item_syntax(p_source => l_source);

   -- Assert
   ut.expect(l_result).to_equal('FAIL');
end fail_outside_apex_escape_concat;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: P A S S _ W R A P P E D _ I N _ A P E X _ E S C A P E
----------------------------------------------------------------------------------------------------------------------------
-- Expects PASS: substitution variable is fully enclosed by apex_escape.html
----------------------------------------------------------------------------------------------------------------------------
-- pass_wrapped_in_apex_escape
-- purpose: verify that sql_injection_item_syntax returns 'PASS' when &ITEM. appears inside
--   a string literal that is the argument to apex_escape.html.
-- behavior: source is a single statement; the balanced-paren safe range covers the full
--   apex_escape.html( ... ) call, which encloses the string containing &ITEM.
--   stmt_has_unprotected_subst finds the variable inside the safe range and returns false.
-- parameters: none
----------------------------------------------------------------------------------------------------------------------------
procedure pass_wrapped_in_apex_escape
as
   l_source clob   := to_clob(q'[l_var := apex_escape.html('hello &ITEM.');]');
   l_result varchar2(10);
begin
   -- Act
   l_result := sert_core.linter_util.sql_injection_item_syntax(p_source => l_source);

   -- Assert
   ut.expect(l_result).to_equal('PASS');
end pass_wrapped_in_apex_escape;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: P A S S _ I N _ L I N E _ C O M M E N T _ O N L Y
----------------------------------------------------------------------------------------------------------------------------
-- Expects PASS: substitution variable appears only inside a line comment
----------------------------------------------------------------------------------------------------------------------------
-- pass_in_line_comment_only
-- purpose: verify that sql_injection_item_syntax returns 'PASS' when &ITEM. exists only
--   inside a -- line comment and the remaining executable code is clean.
-- behavior: the tokeniser discards comment content before emitting statements, so the
--   &ITEM. inside the comment never reaches stmt_has_unprotected_subst.  The only emitted
--   statement is the protected apex_escape.html call on the second line.
-- parameters: none
----------------------------------------------------------------------------------------------------------------------------
procedure pass_in_line_comment_only
as
   l_source clob   := to_clob(q'[-- do not use unprotected: l_bad := '&ITEM.';
l_var := apex_escape.html('clean');]');
   l_result varchar2(10);
begin
   -- Act
   l_result := sert_core.linter_util.sql_injection_item_syntax(p_source => l_source);

   -- Assert
   ut.expect(l_result).to_equal('PASS');
end pass_in_line_comment_only;

end test_sql_injection_item_syntax;
/
--rollback not required
