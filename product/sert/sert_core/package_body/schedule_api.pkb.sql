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
-- PROCEDURE: A D D _ S C H E D U L E _ J O B
----------------------------------------------------------------------------------------------------------------------------
-- Adds a new scheduled job for a specific app / rule set combination
----------------------------------------------------------------------------------------------------------------------------
procedure add_schedule_job
  (
   p_frequency    in varchar2
  ,p_hour         in varchar2
  ,p_min          in number
  ,p_ampm         in varchar2
  ,p_eval_id      in number
  ,p_app_id       in number
  ,p_rule_set_key in varchar2
  )
is
  l_hour number;
begin

  select to_char(cast(to_timestamp(p_hour || '.' || p_min || ' ' || p_ampm,'HH:MI PM') at time zone 'gmt' as date),'HH24') into l_hour from dual;

  dbms_scheduler.create_job(
     job_name        => 'SERT_CORE.SERT_SCHEDULED_EVAL_' || p_app_id || '_' || replace(p_rule_set_key,'-','_')
    ,job_type        => 'PLSQL_BLOCK'
    ,start_date      => systimestamp
    ,job_action      => 'declare l_eval_id number; begin eval_pkg.eval(p_application_id => ' || p_app_id || ', p_rule_set_key => ''' || p_rule_set_key || ''', p_eval_id_out => l_eval_id); end;'
    ,repeat_interval => 'FREQ=daily;BYDAY=' || p_frequency || ';BYHOUR=' || l_hour || ';BYMINUTE=' || p_min || '; bysecond=0;'
    ,enabled         => true
    ,auto_drop       => false
    );

  execute immediate 'grant alter on sert_core.sert_scheduled_eval_' || p_app_id || '_' || replace(p_rule_set_key,'-','_') || ' to sert_core';

exception
  when others then
    log_pkg.log(p_log => 'Error in add_schedule_job:' || SQLERRM, p_log_type => 'UNHANDLED');
    --do not abort, continue creating other scan jobs
end add_schedule_job;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: R E M O V E _ S C H E D U L E _ J O B
----------------------------------------------------------------------------------------------------------------------------
-- Removes an existing scheduled evaluation
----------------------------------------------------------------------------------------------------------------------------
procedure remove_schedule_job
  (
   p_app_id       in number
  ,p_rule_set_key in varchar2
  )
is
begin

  dbms_scheduler.drop_job(job_name => 'SERT_CORE.SERT_SCHEDULED_EVAL_' || p_app_id || '_' || replace(p_rule_set_key,'-','_'));

end remove_schedule_job;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: R E M O V E _ S C H E D U L E _ J O B
----------------------------------------------------------------------------------------------------------------------------
-- Removes an existing scheduled evaluation job
----------------------------------------------------------------------------------------------------------------------------
procedure remove_schedule_job(
   p_job_name     in varchar2
  ) is
begin

  dbms_scheduler.drop_job(job_name => p_job_name);

end remove_schedule_job;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: R U N _ S C H E D U L E _ J O B
----------------------------------------------------------------------------------------------------------------------------
-- Runs an existing scheduled evaluation job
----------------------------------------------------------------------------------------------------------------------------
procedure run_schedule_job(
   p_job_name     in varchar2
  ) is
begin

  dbms_scheduler.run_job(job_name => p_job_name);
end run_schedule_job;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: S C H E D U L E _ J O B S
----------------------------------------------------------------------------------------------------------------------------
-- Schedules evaluations scans assigned via APEX_COLLECTIONS in SERT ADMIN app
----------------------------------------------------------------------------------------------------------------------------
procedure schedule_jobs (
   p_frequency    in varchar2
  ,p_hour         in varchar2
  ,p_min          in number
  ,p_ampm         in varchar2
  ,p_rule_set_key in varchar2
  ) is

  l_count NUMBER(4) := 0;

begin

  --schedule a SERT scan job for every app in a collection
  for l_rec in (select n001 from apex_collections
                where collection_name = 'SERT_SCANS'
                order by seq_id)
  loop

    log_pkg.log(p_log => 'Scheduling scan of app: ' || l_rec.n001);
      sert_core.schedule_api.add_schedule_job (
        p_frequency => p_frequency,
        p_hour      => p_hour,
        p_min       => p_min,
        p_ampm      => p_ampm,
        p_eval_id   => 0,
        p_app_id    => l_rec.n001,
        p_rule_set_key => p_rule_set_key
        );

      l_count := l_count + 1;

  end loop;

  log_pkg.log(p_log => 'END: rules_pkg.schedule_jobs. Schedule ' || l_count || ' scan jobs');

exception
  when OTHERS then
    log_pkg.log(p_log => 'An unhandled error has occured:' || SQLERRM, p_log_type => 'UNHANDLED');
    raise;
end schedule_jobs;

--------------------------------------------------------------------------------
-- This procedure runs application SERT scan against all attribute sets.
-- Output is returned in JSON format.
-- Procedure is run as part of the PIPELINE integration process.
--
-- Parameters:
-- p_application_id : string with valid application ids, comma separated.
-- p_result : results of the evaluations in JSON format
--
-- Applications in the INTERNAL workspace will be excluded from all evaluations.
--
--------------------------------------------------------------------------------
procedure process_eval_summary_results (
  p_application_id_list in varchar2,
  p_result out clob)
--------------------------------------------------------------------------------
IS
  l_proc_name                varchar2(100) := 'process_eval_summary_results';
  l_application_id           varchar2(1000);
  l_eval_id                  EVALS.EVAL_ID%TYPE;
  l_rule_set_key             RULE_SETS.RULE_SET_KEY%TYPE;
  l_app_found                varchar2(1) := 'N';
  l_eval_completed           varchar2(1) := 'N';
  l_apps_scanned             varchar2(4000);
  l_clob CLOB;


  cursor c_apps (p_application_id number) is
    select 'Y'
    from apex_applications
    where workspace not in('INTERNAL','TOWER','COM.ORACLE.CUST.REPOSITORY')
    and application_name not in ('APEX-SERT','APEX-SERT Administration')
    and application_id = p_application_id;


  cursor c_app_eval_completed (p_application_id number) is
    select 'Y'
    from  sert_core.evals_pub_v
    where application_id = p_application_id
    and upper(job_status) = 'COMPLETED';

--------------------------------------------------------------------------------
BEGIN

  log_pkg.log(p_log => 'START: ' || l_proc_name);
  log_pkg.log(p_log => 'p_application_id_list:' || p_application_id_list);

  if p_application_id_list is not null then

    --only 1 active rule set at a time
    select rule_set_key into l_rule_set_key from sert_core.rule_sets where active_yn = 'Y';

    --for every application id passed as a parameter
    for r_app_id in (
      select trim(column_value) app_id
      from table(apex_string.split(p_application_id_list, ','))
      order by 1
    )
    loop
      l_application_id := r_app_id.app_id;

      --validate if application needs to be scanned
      l_app_found := 'N';
      open c_apps (l_application_id);
      fetch c_apps into l_app_found;
      close c_apps;


      if l_app_found = 'Y' then

        l_eval_completed := 'N';
        open c_app_eval_completed(l_application_id);
        fetch c_app_eval_completed into l_eval_completed;
        close c_app_eval_completed;

        if l_eval_completed = 'N' then
          log_pkg.log(p_log => 'Eval application_id: '||l_application_id);

          eval_pkg.eval (
            p_application_id => l_application_id,
            p_rule_set_key => l_rule_set_key,
            p_run_in_background => 'N',
            p_eval_id_out => l_eval_id);

          l_apps_scanned := l_apps_scanned || l_application_id || ',';

        end if; --l_eval_completed check

      end if;  --valid app to scan check

    end loop;

    --return evaluations summary results into a JSON array
    with json_v as (
      select json_object ('applications' value json_arrayagg(json_doc)) json_doc,
             sum(json_value(json_doc, '$.failed_count')) as count_fail
      from sert_core.eval_results_summary_json_v
      where application_id in (
                              select trim(column_value)
                              from table(apex_string.split(p_application_id_list, ','))
                              )
      ),
      apps_failed as (
      select listagg(application_id, ',') within group (order by application_id) app_fail_list
      from sert_core.eval_results_summary_json_v
      where json_value(json_doc, '$.result') = 'fail'
      and application_id in (
                            select trim(column_value)
                            from table(apex_string.split(p_application_id_list, ','))
                            )
      )
     select json_mergepatch(json_v.json_doc,
                            json_object('result' value case when json_v.count_fail > 0 then 'fail' else 'pass' end,
                                        'applications_failed' value apps_failed.app_fail_list)
                            pretty
                            )
    into l_clob
    from json_v,apps_failed;

  else
    log_pkg.log(p_log => 'p_application_id_list null, no scan.');

  end if;   --p_application_id not null

  p_result := l_clob;

  log_pkg.log(p_log => 'Applications scanned: '||substr(l_apps_scanned,1,length(l_apps_scanned)-1));
  log_pkg.log(p_log => 'END: '||l_proc_name);

EXCEPTION
  WHEN OTHERS THEN
    log_pkg.log(p_log => 'Error in:' || l_proc_name || ' ' || SQLERRM, p_log_type => 'UNHANDLED');
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
END process_eval_summary_results;


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end schedule_api;
/
--rollback not required
