--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_spec_unit_test.test_sql_injection_item_syntax stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package unit_test.test_sql_injection_item_syntax
as

   --%suite(sql_injection_item_syntax)
   --%suitepath(sert_core)

   --%test(returns FAIL when substitution variable is unprotected in a string literal)
   procedure fail_unprotected_in_string;

   --%test(returns FAIL when substitution variable falls outside apex_escape in a concatenation)
   procedure fail_outside_apex_escape_concat;

   --%test(returns PASS when substitution variable is wrapped in apex_escape.html)
   procedure pass_wrapped_in_apex_escape;

   --%test(returns PASS when substitution variable appears only inside a line comment)
   procedure pass_in_line_comment_only;

end test_sql_injection_item_syntax;
/
--rollback not required
