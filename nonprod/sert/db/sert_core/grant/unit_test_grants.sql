--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:grant_execute_on_sert_core.linter_util_to_unit_test_1746144000000 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
grant execute on sert_core.linter_util to unit_test;
--rollback not required

--changeset mipotter:grant_execute_on_sert_core.comments_api_to_unit_test_1746144000001 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
grant execute on sert_core.comments_api to unit_test;
--rollback not required

--changeset mipotter:grant_select_on_sert_core.rules_to_unit_test_1746144000002 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
grant select on sert_core.rules to unit_test;
--rollback not required

--changeset mipotter:grant_select_on_sert_core.rule_sets_to_unit_test_1746144000003 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
grant select on sert_core.rule_sets to unit_test;
--rollback not required

--changeset mipotter:grant_insert_on_sert_core.evals_to_unit_test_1746144000004 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
grant insert,update,delete on sert_core.evals to unit_test;
grant select on sert_core.evals to unit_test;
--rollback not required

--changeset mipotter:grant_insert_on_sert_core.eval_results_to_unit_test_1746144000005 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
grant insert on sert_core.eval_results to unit_test;
--rollback not required

--changeset mipotter:grant_select_on_sert_core.comments_to_unit_test_1746144000006 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
grant select on sert_core.comments to unit_test;
--rollback not required
