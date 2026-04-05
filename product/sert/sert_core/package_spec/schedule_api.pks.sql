--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_spec_sert_core.schedule_api_1721803479481 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.schedule_api
authid definer
as

procedure add_schedule_job
  (
   p_frequency    in varchar2
  ,p_hour         in varchar2
  ,p_min          in number
  ,p_ampm         in varchar2
  ,p_eval_id      in number
  ,p_app_id       in number
  ,p_rule_set_key in varchar2
  );

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: A D D _ S C H E D U L E _ J O B _ F L E X
----------------------------------------------------------------------------------------------------------------------------
-- Adds a new scheduled job using explicit schedule mode and 24-hour time input
----------------------------------------------------------------------------------------------------------------------------
-- add_schedule_job_flex
-- purpose: create one scheduled evaluation job without changing legacy scheduling callers.
-- behavior: validates schedule mode and weekday selection, resolves omitted hour/minute with random values,
--   and creates a dbms_scheduler job with a mode-appropriate repeat interval.
-- parameters:
--   p_schedule_mode - recurrence mode; supported values are DAILY and WEEKLY.
--   p_weekdays      - comma-separated DBMS_SCHEDULER weekday tokens for weekly schedules.
--   p_hour24        - optional hour in 24-hour time, range 0..23; randomized when null.
--   p_minute        - optional minute, range 0..59; randomized when null.
--   p_eval_id       - retained for parity with the legacy API; not used in job creation.
--   p_app_id        - target application id.
--   p_rule_set_key  - rule set business key.
-- usage:
--   sert_core.schedule_api.add_schedule_job_flex(
--      p_schedule_mode => 'WEEKLY',
--      p_weekdays      => 'MON,WED,FRI',
--      p_hour24        => 14,
--      p_minute        => 30,
--      p_eval_id       => 0,
--      p_app_id        => 100,
--      p_rule_set_key  => 'INTERNAL'
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure add_schedule_job_flex
  (
   p_schedule_mode in varchar2
  ,p_weekdays      in varchar2 default null
  ,p_hour24        in number   default null
  ,p_minute        in number   default null
  ,p_eval_id       in number
  ,p_app_id        in number
  ,p_rule_set_key  in varchar2
  );

procedure remove_schedule_job
  (
   p_app_id       in number
  ,p_rule_set_key in varchar2
  );


procedure remove_schedule_job(
   p_job_name     in varchar2
  );

procedure run_schedule_job(
   p_job_name     in varchar2
  );


procedure schedule_jobs (
   p_frequency    in varchar2
  ,p_hour         in varchar2
  ,p_min          in number
  ,p_ampm         in varchar2
  ,p_rule_set_key in varchar2
  );

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: S C H E D U L E _ J O B S _ F L E X
----------------------------------------------------------------------------------------------------------------------------
-- Schedules evaluations for collected applications using explicit schedule mode and 24-hour time input
----------------------------------------------------------------------------------------------------------------------------
-- schedule_jobs_flex
-- purpose: batch-create scheduled evaluation jobs for applications loaded into the SERT_SCANS collection.
-- behavior: iterates the application collection and delegates job creation to add_schedule_job_flex while
--   preserving the legacy batch scheduling API for existing callers.
-- parameters:
--   p_schedule_mode - recurrence mode; supported values are DAILY and WEEKLY.
--   p_weekdays      - comma-separated DBMS_SCHEDULER weekday tokens for weekly schedules.
--   p_hour24        - optional hour in 24-hour time, range 0..23; randomized when null.
--   p_minute        - optional minute, range 0..59; randomized when null.
--   p_rule_set_key  - rule set business key.
-- usage:
--   sert_core.schedule_api.schedule_jobs_flex(
--      p_schedule_mode => 'DAILY',
--      p_weekdays      => null,
--      p_hour24        => null,
--      p_minute        => null,
--      p_rule_set_key  => 'INTERNAL'
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure schedule_jobs_flex (
   p_schedule_mode in varchar2
  ,p_weekdays      in varchar2 default null
  ,p_hour24        in number   default null
  ,p_minute        in number   default null
  ,p_rule_set_key  in varchar2
  );

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: G E T _ S C H E D U L E D _ J O B S
----------------------------------------------------------------------------------------------------------------------------
-- Returns scheduler job metadata for one application id as a pipelined rowset
----------------------------------------------------------------------------------------------------------------------------
-- get_scheduled_jobs
-- purpose: expose scheduled job metadata from user_scheduler_jobs for one application id.
-- behavior: filters scheduler rows by the SERT scheduled-evaluation job naming convention and pipes matching rows.
-- parameters:
--   p_application_id - application id embedded in the scheduled job name.
-- returns:
--   schedule_job_nt - pipelined collection of scheduler job metadata rows.
-- usage:
--   select *
--     from table(sert_core.schedule_api.get_scheduled_jobs(p_application_id => 100));
----------------------------------------------------------------------------------------------------------------------------
function get_scheduled_jobs (
   p_application_id in number )
   return sert_core.schedule_job_nt
   pipelined;

procedure process_eval_summary_results (
  p_application_id_list in varchar2,
  p_result out clob);

end schedule_api;
/
--rollback not required
