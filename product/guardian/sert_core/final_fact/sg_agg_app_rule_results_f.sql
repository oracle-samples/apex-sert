--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_agg_app_rule_results_f endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_agg_app_rule_results_f');
create table sert_core.sg_agg_app_rule_results_f (
    application_wid number not null,
    rule_wid        number not null,
    eval_id         number not null,
    result_wid      number not null,
    --
    ct_findings     number not null
);
--rollback drop table sert_core.sg_agg_app_rule_results_f cascade constraints purge;

--changeset mlancast:create_index_sert_core.sg_agg_app_rule_results_f_idx1 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedresult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_agg_app_rule_results_f') and index_name = upper('sg_agg_app_rule_results_f_idx1');
create unique index sert_core.sg_agg_app_rule_results_f_idx1
    on sert_core.sg_agg_app_rule_results_f (application_wid, rule_wid, eval_id, result_wid)
    compress 1;

alter table sert_core.sg_agg_app_rule_results_f
add constraint sg_agg_app_rule_results_f_pk primary key (application_wid, rule_wid, eval_id, result_wid)
    using index sert_core.sg_agg_app_rule_results_f_idx1;
--rollback not required

--changeset mlancast:add_fk_sert_core.sg_agg_app_rule_results_f_app_fk endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_constraints where owner = upper('sert_core') and table_name = upper('sg_agg_app_rule_results_f') and constraint_name = upper('sg_agg_app_rule_results_f_app_fk');
alter table sert_core.sg_agg_app_rule_results_f
add constraint sg_agg_app_rule_results_f_app_fk foreign key (application_wid) references sert_core.sg_applications_d(application_wid) rely disable novalidate;
--rollback alter table sert_core.sg_agg_app_rule_results_f drop constraint sg_agg_app_rule_results_f_app_fk;

--changeset mlancast:add_fk_sert_core.sg_agg_app_rule_results_f_rule_fk endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_constraints where owner = upper('sert_core') and table_name = upper('sg_agg_app_rule_results_f') and constraint_name = upper('sg_agg_app_rule_results_f_rule_fk');
alter table sert_core.sg_agg_app_rule_results_f
add constraint sg_agg_app_rule_results_f_rule_fk foreign key (rule_wid) references sert_core.sg_rules_d(rule_wid) rely disable novalidate;
--rollback alter table sert_core.sg_agg_app_rule_results_f drop constraint sg_agg_app_rule_results_f_rule_fk;

--changeset mlancast:add_fk_sert_core.sg_agg_app_rule_results_f_result_fk endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_constraints where owner = upper('sert_core') and table_name = upper('sg_agg_app_rule_results_f') and constraint_name = upper('sg_agg_app_rule_results_f_result_fk');
alter table sert_core.sg_agg_app_rule_results_f
add constraint sg_agg_app_rule_results_f_result_fk foreign key (result_wid) references sert_core.sg_results_d(result_wid) rely disable novalidate;
--rollback alter table sert_core.sg_agg_app_rule_results_f drop constraint sg_agg_app_rule_results_f_result_fk;

--changeset mlancast:create_index_sert_core.sg_agg_app_rule_results_f_idx2 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_agg_app_rule_results_f') and index_name = upper('sg_agg_app_rule_results_f_idx2');
create bitmap index sert_core.sg_agg_app_rule_results_f_idx2 on sert_core.sg_agg_app_rule_results_f (eval_id);
--rollback not required

--changeset mlancast:create_index_sert_core.sg_agg_app_rule_results_f_idx3 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_agg_app_rule_results_f') and index_name = upper('sg_agg_app_rule_results_f_idx3');
create bitmap index sert_core.sg_agg_app_rule_results_f_idx3 on sert_core.sg_agg_app_rule_results_f (result_wid);
--rollback not required

