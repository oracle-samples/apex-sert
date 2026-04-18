-- Run direct
begin
    sert_core.sg_util.run_main_etl;
end;
/



-- Optional: check last run details
select job_name, status, actual_start_date, run_duration, additional_info
  from ALL_scheduler_job_run_details
 where job_name like 'SG_ETL%'
 order by actual_start_date desc;


--
-- ETL Task Log for latest execution
--
select l.task_log_id, l.log_id, l.task_id, t.task_phase, t.task_name, l.status, l.rows_changed,
       --l.start_timestamp,
       --l.end_timestamp,
       --case when l.status = 'RUNNING' then systimestamp - l.start_timestamp end elapsed,
       --case when l.status <> 'RUNNING' then l.end_timestamp - l.start_timestamp end duration,
       case when l.status <> 'RUNNING' then
            to_char(
                round(
                    extract(day from (l.end_timestamp - l.start_timestamp)) * 86400 +
                    extract(hour from (l.end_timestamp - l.start_timestamp)) * 3600 +
                    extract(minute from (l.end_timestamp - l.start_timestamp)) * 60 +
                    extract(second from (l.end_timestamp - l.start_timestamp)),
                    3
                ),
                'fm999999999990.000')
        end as seconds,
        l.error_message,
        t.plsql_procedure_name
  from sert_core.sg_etl_task_log l
  join sert_core.sg_etl_tasks t on (l.task_id = t.task_id)
 where l.log_id = (select max(log_id) keep (dense_rank first order by start_timestamp desc) from sert_core.sg_etl_execution_log)
 order by l.start_timestamp;
