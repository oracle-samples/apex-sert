--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_type_sert_core.schedule_job_ot_1775000000001 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace type sert_core.schedule_job_ot as object (
   job_name          varchar2(128),
   client_id         varchar2(65),
   start_date        timestamp with time zone,
   repeat_interval   varchar2(4000),
   enabled           varchar2(5),
   state             varchar2(15),
   run_count         number,
   failure_count     number,
   last_start_date   timestamp with time zone,
   last_run_duration interval day to second,
   next_run_date     timestamp with time zone
);
/
--rollback not required
