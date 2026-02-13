--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_agg_app_rule_results_fs endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_agg_app_rule_results_fs');
create table sert_core.sg_agg_app_rule_results_fs (
    application_id number,
    workspace_id   number,
    rule_key       varchar2(250),
    eval_id        number,
    eval_result    varchar2(30),
    final_result   varchar2(30),
    ct_findings    number
)
nologging;
--rollback drop table sert_core.sg_agg_app_rule_results_fs cascade constraints purge;
