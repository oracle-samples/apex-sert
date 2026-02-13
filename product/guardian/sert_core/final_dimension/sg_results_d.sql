--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_results_d endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_results_d');
create table sert_core.sg_results_d (
    result_wid         number        not null,
    eval_result        varchar2(250) not null,
    eval_status        varchar2(250) not null,
    final_result       varchar2(250) not null,
    final_status       varchar2(250) not null,
    final_pass_or_fail varchar2(250) not null,
    --
    constraint sg_results_d_pk primary key (result_wid) rely
);
--rollback drop table sert_core.sg_results_d cascade constraints purge;

