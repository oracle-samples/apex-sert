--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.schedule_api_1721803536845 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.schedule_api
as


----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: S C H E D U L E R _ J O B _ N A M E
----------------------------------------------------------------------------------------------------------------------------
-- Builds the scheduler job name for one application and rule set key
----------------------------------------------------------------------------------------------------------------------------
-- scheduler_job_name
-- purpose: generate the fully qualified scheduler job name used by SERT scheduled evaluations.
-- behavior: concatenates application id and rule set key into the SERT naming convention and normalizes dashes.
-- parameters:
--   p_app_id       - application id included in the scheduler job name.
--   p_rule_set_key - rule set business key included in the scheduler job name.
-- returns:
--   varchar2 - fully qualified scheduler job name.
-- usage:
--   l_job_name := scheduler_job_name(
--      p_app_id       => 100,
--      p_rule_set_key => 'INTERNAL'
--   );
----------------------------------------------------------------------------------------------------------------------------
function scheduler_job_name (
   p_app_id       in number
  ,p_rule_set_key in varchar2 )
   return varchar2
as
begin
   return 'SERT_CORE.SERT_SCHEDULED_EVAL_' || p_app_id || '_' || replace(p_rule_set_key,'-','_');
end scheduler_job_name;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: N O R M A L I Z E _ W E E K D A Y S
----------------------------------------------------------------------------------------------------------------------------
-- Normalizes DBMS_SCHEDULER weekday token strings into canonical comma-separated form
----------------------------------------------------------------------------------------------------------------------------
-- normalize_weekdays
-- purpose: sanitize weekday token input before it is embedded in scheduler repeat interval expressions.
-- behavior: trims whitespace, uppercases tokens, replaces semicolons, collapses duplicate commas, and trims edge commas.
-- parameters:
--   p_weekdays - weekday token string (for example MON,WED,FRI).
-- returns:
--   varchar2 - normalized weekday token string or null when input is null.
-- usage:
--   l_weekdays := normalize_weekdays(p_weekdays => ' mon ; wed, fri ');
----------------------------------------------------------------------------------------------------------------------------
function normalize_weekdays (
   p_weekdays in varchar2 )
   return varchar2
as
   l_weekdays varchar2(100);
begin
   if p_weekdays is null then
      return null;
   end if;

   l_weekdays := upper(replace(replace(trim(p_weekdays), ' ', null), ';', ','));

   while instr(l_weekdays, ',,') > 0 loop
      l_weekdays := replace(l_weekdays, ',,', ',');
   end loop;

   l_weekdays := trim(both ',' from l_weekdays);

   return l_weekdays;
end normalize_weekdays;

procedure resolve_schedule_time (
   p_hour24  in  number
  ,p_minute  in  number
  ,p_hour_out   out number
  ,p_minute_out out number )
as
begin
   p_hour_out   := coalesce(p_hour24, trunc(dbms_random.value(0, 24)));
   p_minute_out := coalesce(p_minute, trunc(dbms_random.value(0, 60)));

   if p_hour_out not between 0 and 23 then
      raise_application_error(-20001, 'Hour must be between 0 and 23.');
   end if;

   if p_minute_out not between 0 and 59 then
      raise_application_error(-20002, 'Minute must be between 0 and 59.');
   end if;
end resolve_schedule_time;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: B U I L D _ R E P E A T _ I N T E R V A L
----------------------------------------------------------------------------------------------------------------------------
-- Builds the DBMS_SCHEDULER repeat interval expression for daily or weekly recurrence
----------------------------------------------------------------------------------------------------------------------------
-- build_repeat_interval
-- purpose: construct a valid scheduler repeat interval string from schedule mode, weekdays, and execution time.
-- behavior: validates mode and weekday requirements, then returns DAILY or WEEKLY interval text with BYHOUR/BYMINUTE.
-- parameters:
--   p_schedule_mode - recurrence mode; supported values are DAILY and WEEKLY.
--   p_weekdays      - weekday token list required for WEEKLY mode.
--   p_hour24        - execution hour in 24-hour format.
--   p_minute        - execution minute.
-- returns:
--   varchar2 - DBMS_SCHEDULER repeat interval expression.
-- usage:
--   l_repeat_interval := build_repeat_interval(
--      p_schedule_mode => 'WEEKLY',
--      p_weekdays      => 'MON,WED,FRI',
--      p_hour24        => 14,
--      p_minute        => 30
--   );
----------------------------------------------------------------------------------------------------------------------------
function build_repeat_interval (
   p_schedule_mode in varchar2
  ,p_weekdays      in varchar2
  ,p_hour24        in number
  ,p_minute        in number )
   return varchar2
as
   l_schedule_mode varchar2(20) := upper(trim(p_schedule_mode));
   l_weekdays      varchar2(100);
begin
   l_weekdays := normalize_weekdays(p_weekdays);

   if l_schedule_mode not in ('DAILY', 'WEEKLY') then
      raise_application_error(-20003, 'Schedule mode must be DAILY or WEEKLY.');
   end if;

   if l_schedule_mode = 'WEEKLY' and l_weekdays is null then
      raise_application_error(-20004, 'Weekdays are required for WEEKLY schedules.');
   end if;

   if l_schedule_mode = 'DAILY' then
      return 'FREQ=DAILY;BYHOUR=' || p_hour24 || ';BYMINUTE=' || p_minute || ';BYSECOND=0;';
   end if;

   return 'FREQ=WEEKLY;BYDAY=' || l_weekdays || ';BYHOUR=' || p_hour24 || ';BYMINUTE=' || p_minute || ';BYSECOND=0;';
end build_repeat_interval;

procedure create_schedule_job_core (
   p_repeat_interval in varchar2
  ,p_app_id          in number
  ,p_rule_set_key    in varchar2 )
as
   l_job_name varchar2(261);
begin
   l_job_name := scheduler_job_name(
      p_app_id       => p_app_id
     ,p_rule_set_key => p_rule_set_key );

   dbms_scheduler.create_job(
      job_name        => l_job_name
     ,job_type        => 'PLSQL_BLOCK'
     ,start_date      => systimestamp
     ,job_action      => 'declare l_eval_id number; begin eval_pkg.eval(p_application_id => ' || p_app_id || ', p_rule_set_key => ''' || p_rule_set_key || ''', p_eval_id_out => l_eval_id); end;'
     ,repeat_interval => p_repeat_interval
     ,enabled         => true
     ,auto_drop       => false
   );

   -- execute immediate 'grant alter on ' || replace(l_job_name, 'SERT_CORE.', 'sert_core.') || ' to sert_core';
end create_schedule_job_core;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: A D D _ S C H E D U L E _ J O B
----------------------------------------------------------------------------------------------------------------------------
-- Adds a new scheduled job for a specific app / rule set combination
----------------------------------------------------------------------------------------------------------------------------
-- add_schedule_job
-- purpose: create one scheduler job using legacy 12-hour time inputs for backward-compatible callers.
-- behavior: converts hour/minute/ampm into 24-hour format, composes the repeat interval, and creates the job.
-- parameters:
--   p_frequency    - recurrence day expression used in the interval string.
--   p_hour         - hour component in 12-hour format.
--   p_min          - minute component.
--   p_ampm         - meridian indicator (AM/PM).
--   p_eval_id      - retained for API parity; not used by this routine.
--   p_app_id       - target application id.
--   p_rule_set_key - rule set business key.
-- usage:
--   sert_core.schedule_api.add_schedule_job(
--      p_frequency    => 'MON,TUE,WED,THU,FRI',
--      p_hour         => '09',
--      p_min          => 30,
--      p_ampm         => 'AM',
--      p_eval_id      => 0,
--      p_app_id       => 100,
--      p_rule_set_key => 'INTERNAL'
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure add_schedule_job (
   p_frequency    in varchar2
  ,p_hour         in varchar2
  ,p_min          in number
  ,p_ampm         in varchar2
  ,p_eval_id      in number
  ,p_app_id       in number
  ,p_rule_set_key in varchar2 )
is
   l_hour number;
begin

   select to_char(cast(to_timestamp(p_hour || '.' || p_min || ' ' || p_ampm, 'HH:MI PM') at time zone 'gmt' as date), 'HH24')
     into l_hour
     from dual;

   create_schedule_job_core(
      p_repeat_interval => 'FREQ=daily;BYDAY=' || p_frequency || ';BYHOUR=' || l_hour || ';BYMINUTE=' || p_min || '; bysecond=0;'
      ,p_app_id          => p_app_id
      ,p_rule_set_key    => p_rule_set_key );

exception
   when others then
      log_pkg.log(p_log => 'Error in add_schedule_job:' || sqlerrm, p_log_type => 'UNHANDLED');
      -- do not abort, continue creating other scan jobs
end add_schedule_job;

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
  )
is
   l_hour24         number;
   l_minute         number;
   l_repeat_interval varchar2(4000);
begin
   -- resolve explicit or randomized execution time before creating the scheduler job
   resolve_schedule_time(
      p_hour24     => p_hour24
     ,p_minute     => p_minute
     ,p_hour_out   => l_hour24
     ,p_minute_out => l_minute );

   -- build the recurrence string from the normalized mode and weekday selection
   l_repeat_interval := build_repeat_interval(
      p_schedule_mode => p_schedule_mode
     ,p_weekdays      => p_weekdays
     ,p_hour24        => l_hour24
     ,p_minute        => l_minute );

   create_schedule_job_core(
      p_repeat_interval => l_repeat_interval
     ,p_app_id          => p_app_id
     ,p_rule_set_key    => p_rule_set_key );
exception
   when others then
      log_pkg.log(p_log => 'Error in add_schedule_job_flex:' || sqlerrm, p_log_type => 'UNHANDLED');
      -- do not abort, continue creating other scan jobs
end add_schedule_job_flex;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: R E M O V E _ S C H E D U L E _ J O B
----------------------------------------------------------------------------------------------------------------------------
-- Removes an existing scheduled evaluation
----------------------------------------------------------------------------------------------------------------------------
-- remove_schedule_job
-- purpose: remove a scheduled evaluation job using application id and rule set key inputs.
-- behavior: derives the scheduler job name from input keys and calls dbms_scheduler.drop_job.
-- parameters:
--   p_app_id       - application id segment of the scheduler job name.
--   p_rule_set_key - rule set key segment of the scheduler job name.
-- usage:
--   sert_core.schedule_api.remove_schedule_job(
--      p_app_id       => 100,
--      p_rule_set_key => 'INTERNAL'
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure remove_schedule_job (
   p_app_id       in number
  ,p_rule_set_key in varchar2 )
is
begin
   dbms_scheduler.drop_job(job_name => 'SERT_CORE.SERT_SCHEDULED_EVAL_' || p_app_id || '_' || replace(p_rule_set_key, '-', '_'));
end remove_schedule_job;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: R E M O V E _ S C H E D U L E _ J O B
----------------------------------------------------------------------------------------------------------------------------
-- Removes an existing scheduled evaluation job
----------------------------------------------------------------------------------------------------------------------------
-- remove_schedule_job
-- purpose: remove a scheduled evaluation job using an explicit scheduler job name.
-- behavior: passes the supplied job name directly to dbms_scheduler.drop_job.
-- parameters:
--   p_job_name - fully qualified scheduler job name.
-- usage:
--   sert_core.schedule_api.remove_schedule_job(
--      p_job_name => 'SERT_CORE.SERT_SCHEDULED_EVAL_100_INTERNAL'
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure remove_schedule_job (
   p_job_name in varchar2 )
is
begin
   dbms_scheduler.drop_job(job_name => p_job_name);
end remove_schedule_job;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: R U N _ S C H E D U L E _ J O B
----------------------------------------------------------------------------------------------------------------------------
-- Runs an existing scheduled evaluation job
----------------------------------------------------------------------------------------------------------------------------
-- run_schedule_job
-- purpose: execute a scheduler job immediately by name.
-- behavior: calls dbms_scheduler.run_job for the supplied scheduler job identifier.
-- parameters:
--   p_job_name - fully qualified scheduler job name.
-- usage:
--   sert_core.schedule_api.run_schedule_job(
--      p_job_name => 'SERT_CORE.SERT_SCHEDULED_EVAL_100_INTERNAL'
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure run_schedule_job (
   p_job_name in varchar2 )
is
begin
   dbms_scheduler.run_job(job_name => p_job_name);
end run_schedule_job;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: S C H E D U L E _ J O B S
----------------------------------------------------------------------------------------------------------------------------
-- Schedules evaluations scans assigned via APEX_COLLECTIONS in SERT ADMIN app
----------------------------------------------------------------------------------------------------------------------------
-- schedule_jobs
-- purpose: schedule scan jobs for all application ids currently staged in the SERT_SCANS collection.
-- behavior: iterates collection rows and delegates each job creation to add_schedule_job.
-- parameters:
--   p_frequency    - recurrence day expression used in the interval string.
--   p_hour         - hour component in 12-hour format.
--   p_min          - minute component.
--   p_ampm         - meridian indicator (AM/PM).
--   p_rule_set_key - rule set business key applied to each scheduled job.
-- usage:
--   sert_core.schedule_api.schedule_jobs(
--      p_frequency    => 'MON,TUE,WED,THU,FRI',
--      p_hour         => '09',
--      p_min          => 30,
--      p_ampm         => 'AM',
--      p_rule_set_key => 'INTERNAL'
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure schedule_jobs (
   p_frequency    in varchar2
  ,p_hour         in varchar2
  ,p_min          in number
  ,p_ampm         in varchar2
  ,p_rule_set_key in varchar2 )
is
   l_count number(4) := 0;

begin

   -- schedule a SERT scan job for every app in a collection
   for l_rec in (
      select n001
        from apex_collections
       where collection_name = 'SERT_SCANS'
       order by seq_id)
   loop
      log_pkg.log(p_log => 'Scheduling scan of app: ' || l_rec.n001);
      sert_core.schedule_api.add_schedule_job (
         p_frequency    => p_frequency,
         p_hour         => p_hour,
         p_min          => p_min,
         p_ampm         => p_ampm,
         p_eval_id      => 0,
         p_app_id       => l_rec.n001,
         p_rule_set_key => p_rule_set_key
      );

      l_count := l_count + 1;
   end loop;

   log_pkg.log(p_log => 'END: rules_pkg.schedule_jobs. Schedule ' || l_count || ' scan jobs');

exception
   when others then
      log_pkg.log(p_log => 'An unhandled error has occured:' || sqlerrm, p_log_type => 'UNHANDLED');
      raise;
end schedule_jobs;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: S C H E D U L E _ J O B S _ F L E X
----------------------------------------------------------------------------------------------------------------------------
-- Schedules evaluation scans assigned via APEX_COLLECTIONS using schedule mode and 24-hour time input
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
  ,p_rule_set_key  in varchar2 )
is

   l_count number(4) := 0;

begin

   -- schedule a SERT scan job for every app in the collection using the new flexible API
   for l_rec in (
      select n001
        from apex_collections
       where collection_name = 'SERT_SCANS'
       order by seq_id)
   loop

      log_pkg.log(p_log => 'Scheduling flexible scan of app: ' || l_rec.n001);
      sert_core.schedule_api.add_schedule_job_flex (
         p_schedule_mode => p_schedule_mode,
         p_weekdays      => p_weekdays,
         p_hour24        => p_hour24,
         p_minute        => p_minute,
         p_eval_id       => 0,
         p_app_id        => l_rec.n001,
         p_rule_set_key  => p_rule_set_key
      );

      l_count := l_count + 1;

   end loop;

   log_pkg.log(p_log => 'END: rules_pkg.schedule_jobs_flex. Schedule ' || l_count || ' scan jobs');

exception
   when others then
      log_pkg.log(p_log => 'An unhandled error has occured:' || sqlerrm, p_log_type => 'UNHANDLED');
      raise;
end schedule_jobs_flex;

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
   pipelined
as
begin
   -- pipe scheduler rows that match the application-specific SERT scheduled evaluation naming convention
   for l_rec in (
      select job_name,
             client_id,
             start_date,
             repeat_interval,
             enabled,
             state,
             run_count,
             failure_count,
             last_start_date,
             last_run_duration,
             next_run_date
        from user_scheduler_jobs
       where job_name = 'SERT_SCHEDULED_EVAL_' || p_application_id || '_SERT_SECURITY')
   loop
      pipe row (
         sert_core.schedule_job_ot(
            l_rec.job_name,
            l_rec.client_id,
            l_rec.start_date,
            l_rec.repeat_interval,
            l_rec.enabled,
            l_rec.state,
            l_rec.run_count,
            l_rec.failure_count,
            l_rec.last_start_date,
            l_rec.last_run_duration,
            l_rec.next_run_date
         )
      );
   end loop;

   return;
exception
   when others then
      log_pkg.log(p_log => 'Error in get_scheduled_jobs:' || sqlerrm, p_log_type => 'UNHANDLED');
      raise;
end get_scheduled_jobs;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: P R O C E S S _ E V A L _ S U M M A R Y _ R E S U L T S
----------------------------------------------------------------------------------------------------------------------------
-- Runs on-demand evaluations for selected applications and returns a JSON summary payload
----------------------------------------------------------------------------------------------------------------------------
-- process_eval_summary_results
-- purpose: execute evaluation scans for eligible applications and return aggregated pass/fail summary JSON.
-- behavior: validates candidate applications, runs evals for pending apps, and merges summary metadata into output JSON.
-- parameters:
--   p_application_id_list - comma-separated list of application ids requested for evaluation.
--   p_result              - output CLOB containing the generated evaluation summary JSON.
-- usage:
--   sert_core.schedule_api.process_eval_summary_results(
--      p_application_id_list => '100,101,102',
--      p_result              => l_result
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure process_eval_summary_results (
   p_application_id_list in varchar2
  ,p_result              out clob )
--------------------------------------------------------------------------------
is
   l_proc_name      varchar2(100) := 'process_eval_summary_results';
   l_application_id varchar2(1000);
   l_eval_id        evals.eval_id%type;
   l_rule_set_key   rule_sets.rule_set_key%type;
   l_app_found      varchar2(1) := 'N';
   l_eval_completed varchar2(1) := 'N';
   l_apps_scanned   varchar2(4000);
   l_clob           clob;

   cursor c_apps (p_application_id number)
   is
      select 'Y'
        from apex_applications
       where workspace not in ('INTERNAL', 'TOWER', 'COM.ORACLE.CUST.REPOSITORY')
         and application_name not in ('APEX-SERT', 'APEX-SERT Administration')
         and application_id = p_application_id;

   cursor c_app_eval_completed (p_application_id number)
   is
      select 'Y'
        from sert_core.evals_pub_v
       where application_id = p_application_id
         and upper(job_status) = 'COMPLETED';

--------------------------------------------------------------------------------
begin
   log_pkg.log(p_log => 'START: ' || l_proc_name);
   log_pkg.log(p_log => 'p_application_id_list:' || p_application_id_list);

   if p_application_id_list is not null then
      -- only 1 active rule set at a time
      select rule_set_key
        into l_rule_set_key
        from sert_core.rule_sets
       where active_yn = 'Y'
         and apex_version = (select apex_version from sert_core.apex_version_v);

      -- for every application id passed as a parameter
      for r_app_id in (
         select trim(column_value) app_id
           from table(apex_string.split(p_application_id_list, ','))
          order by 1)
      loop
         l_application_id := r_app_id.app_id;

         -- validate if application needs to be scanned
         l_app_found := 'N';
         open c_apps(l_application_id);
         fetch c_apps into l_app_found;
         close c_apps;

         if l_app_found = 'Y' then
            l_eval_completed := 'N';
            open c_app_eval_completed(l_application_id);
            fetch c_app_eval_completed into l_eval_completed;
            close c_app_eval_completed;

            if l_eval_completed = 'N' then
               log_pkg.log(p_log => 'Eval application_id: ' || l_application_id);

               eval_pkg.eval(
                  p_application_id    => l_application_id
                 ,p_rule_set_key      => l_rule_set_key
                 ,p_run_in_background => 'N'
                 ,p_eval_id_out       => l_eval_id);

               l_apps_scanned := l_apps_scanned || l_application_id || ',';
            end if; -- l_eval_completed check
         end if; -- valid app to scan check
      end loop;

      -- return evaluations summary results into a JSON array
      with json_v as (
            select json_object('applications' value json_arrayagg(json_doc returning clob) returning clob) as json_doc
                  ,sum(json_value(json_doc, '$.failed_count')) as count_fail
              from sert_core.eval_results_summary_json_v
             where application_id in (
                      select trim(column_value)
                        from table(apex_string.split(p_application_id_list, ','))
                   )
         )
         ,apps_failed as (
            select listagg(application_id, ',') within group (order by application_id) as app_fail_list
              from sert_core.eval_results_summary_json_v
             where json_value(json_doc, '$.result') = 'fail'
               and application_id in (
                      select trim(column_value)
                        from table(apex_string.split(p_application_id_list, ','))
                   )
         )
      select json_mergepatch(
                json_v.json_doc
               ,json_object(
                   'result' value case
                                 when json_v.count_fail > 0 then 'fail'
                                 else 'pass'
                              end
                  ,'applications_failed' value apps_failed.app_fail_list
                ) returning clob
                pretty
             )
        into l_clob
        from json_v
            ,apps_failed;
   else
      log_pkg.log(p_log => 'p_application_id_list null, no scan.');
   end if; -- p_application_id not null

   p_result := l_clob;

   log_pkg.log(p_log => 'Applications scanned: ' || substr(l_apps_scanned, 1, length(l_apps_scanned) - 1));
   log_pkg.log(p_log => 'END: ' || l_proc_name);

exception
   when others then
      log_pkg.log(p_log => 'Error in:' || l_proc_name || ' ' || sqlerrm, p_log_type => 'UNHANDLED');
      raise_application_error(-20000, dbms_utility.format_error_backtrace);
end process_eval_summary_results;


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end schedule_api;
/
--rollback not required
