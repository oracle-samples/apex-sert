--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:seed_sert_core.sg_etl_controller_lock endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from sert_core.sg_etl_controller_lock where lock_name = 'MAIN_ETL_LOCK';
insert into sert_core.sg_etl_controller_lock (lock_name) values ('MAIN_ETL_LOCK');
--rollback not required
