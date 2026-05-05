--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_spec_unit_test.test_bulk_add_comment stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package unit_test.test_bulk_add_comment
as

   --%suite(bulk_add_comment)
   --%suitepath(sert_core)

   --%test(inserts one comment per eval_result when no status filter)
   procedure inserts_all_when_no_filter;

   --%test(inserts only matching comments when status filter is FAIL)
   procedure inserts_only_fail_when_filter_fail;

   --%test(inserts only matching comments when status filter is PASS)
   procedure inserts_only_pass_when_filter_pass;

   --%test(inserts no comments when filter matches no results)
   procedure inserts_none_when_filter_no_match;

end test_bulk_add_comment;
/
--rollback not required
