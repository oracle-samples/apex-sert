--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_etl_controller_lock endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_etl_controller_lock');
-- Single-row table used for autonomous transaction locking to enforce single-instance execution.
create table sert_core.sg_etl_controller_lock (
    lock_name                   varchar2(30) not null,
    locked_by                   number,
    lock_time                   timestamp with local time zone,
    constraint sg_etl_controller_lock_pk
        primary key (lock_name)
);
--rollback drop table sert_core.sg_etl_controller_lock cascade constraints purge;
