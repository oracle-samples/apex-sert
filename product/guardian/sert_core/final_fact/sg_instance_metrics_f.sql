--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_instance_metrics_f endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_instance_metrics_f');
create table sert_core.sg_instance_metrics_f (
    date_wid            date
                        default on null trunc(sysdate)
                        not null,
    workspaces          number not null,
    applications        number not null,
    pages               number not null,
    sert_workspaces     number not null,
    sert_applications   number not null,
    sert_pages          number not null,
    evaluations         number not null,
    avg_score           number not null,
    app_coverage        number not null,
    etl_load_ts         timestamp with local time zone
                        default on null systimestamp
                        not null,
    --
    constraint sg_instance_metrics_f_pk primary key (date_wid) rely,
    constraint sg_instance_metrics_f_date_chk check (date_wid = trunc(date_wid) )
);
--rollback drop table sert_core.sg_instance_metrics_f cascade constraints purge;
