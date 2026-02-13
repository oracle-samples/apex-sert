--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_app_rule_fails_fs endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_app_rule_fails_fs');
create table sert_core.sg_app_rule_fails_fs (
    application_id      number,
    workspace_id        number,
    page_id             number,             -- can be null
    rule_key            varchar2(250),
    eval_id             number,
    eval_result_id      number,
    exception_id        number,
    final_result        varchar2(30),
    exception_reason    varchar2(4000)
)
nologging;
--rollback drop table sert_core.sg_app_rule_fails_fs cascade constraints purge;
