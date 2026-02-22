--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_app_rule_fails_f endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_f');
create table sert_core.sg_app_rule_fails_f (
    application_wid     number not null,
    rule_wid            number not null,
    result_wid          number not null,
    --
    page_wid            number not null,    -- set to 0 for shared components (n/a). Allows filtering by workspace->app->page.
    eval_id             number not null,    -- used to easily delete stale evals
    eval_result_id      number not null,    -- UK, linkage
    exception_id        number,             -- linkage
    exception_reason    varchar2(4000)      -- convienience for small fact table
);
--rollback drop table sert_core.sg_app_rule_fails_f cascade constraints purge;

--changeset mlancast:create_index_sert_core.sg_app_rule_fails_f_idx1 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedresult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_f') and index_name = upper('sg_app_rule_fails_f_idx1');
create unique index sert_core.sg_app_rule_fails_f_idx1
    on sert_core.sg_app_rule_fails_f (eval_result_id);

alter table sert_core.sg_app_rule_fails_f
add constraint sg_app_rule_fails_f_pk primary key (eval_result_id)
    using index sert_core.sg_app_rule_fails_f_idx1;
--rollback not required

--changeset mlancast:add_fk_sert_core.sg_app_rule_fails_f_app_fk endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_constraints where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_f') and constraint_name = upper('sg_app_rule_fails_f_app_fk');
alter table sert_core.sg_app_rule_fails_f
add constraint sg_app_rule_fails_f_app_fk foreign key (application_wid) references sert_core.sg_applications_d(application_wid) rely disable novalidate;
--rollback alter table sert_core.sg_app_rule_fails_f drop constraint sg_app_rule_fails_f_app_fk;

--changeset mlancast:add_fk_sert_core.sg_app_rule_fails_f_rule_fk endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_constraints where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_f') and constraint_name = upper('sg_app_rule_fails_f_rule_fk');
alter table sert_core.sg_app_rule_fails_f
add constraint sg_app_rule_fails_f_rule_fk foreign key (rule_wid) references sert_core.sg_rules_d(rule_wid) rely disable novalidate;
--rollback alter table sert_core.sg_app_rule_fails_f drop constraint sg_app_rule_fails_f_rule_fk;

--changeset mlancast:add_fk_sert_core.sg_app_rule_fails_f_result_fk endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_constraints where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_f') and constraint_name = upper('sg_app_rule_fails_f_result_fk');
alter table sert_core.sg_app_rule_fails_f
add constraint sg_app_rule_fails_f_result_fk foreign key (result_wid) references sert_core.sg_results_d(result_wid) rely disable novalidate;
--rollback alter table sert_core.sg_app_rule_fails_f drop constraint sg_app_rule_fails_f_result_fk;

--changeset mlancast:add_fk_sert_core.sg_app_rule_fails_f_page_fk endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_constraints where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_f') and constraint_name = upper('sg_app_rule_fails_f_page_fk');
alter table sert_core.sg_app_rule_fails_f
add constraint sg_app_rule_fails_f_page_fk foreign key (page_wid) references sert_core.sg_application_pages_d(page_wid) rely disable novalidate;
--rollback alter table sert_core.sg_app_rule_fails_f drop constraint sg_app_rule_fails_f_page_fk;

--changeset mlancast:create_index_sert_core.sg_app_rule_fails_f_idx2 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_f') and index_name = upper('sg_app_rule_fails_f_idx2');
create bitmap index sert_core.sg_app_rule_fails_f_idx2 on sert_core.sg_app_rule_fails_f (application_wid);
--rollback not required

--changeset mlancast:create_index_sert_core.sg_app_rule_fails_f_idx3 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_f') and index_name = upper('sg_app_rule_fails_f_idx3');
create bitmap index sert_core.sg_app_rule_fails_f_idx3 on sert_core.sg_app_rule_fails_f (rule_wid);
--rollback not required

--changeset mlancast:create_index_sert_core.sg_app_rule_fails_f_idx4 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_f') and index_name = upper('sg_app_rule_fails_f_idx4');
create bitmap index sert_core.sg_app_rule_fails_f_idx4 on sert_core.sg_app_rule_fails_f (result_wid);
--rollback not required

--changeset mlancast:create_index_sert_core.sg_app_rule_fails_f_idx5 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_f') and index_name = upper('sg_app_rule_fails_f_idx5');
create bitmap index sert_core.sg_app_rule_fails_f_idx5 on sert_core.sg_app_rule_fails_f (page_wid);
--rollback not required

--changeset mlancast:create_index_sert_core.sg_app_rule_fails_f_idx6 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_f') and index_name = upper('sg_app_rule_fails_f_idx6');
create bitmap index sert_core.sg_app_rule_fails_f_idx6 on sert_core.sg_app_rule_fails_f (eval_id);
--rollback not required

