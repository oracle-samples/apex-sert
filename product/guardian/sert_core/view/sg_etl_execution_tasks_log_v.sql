--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_view_sert_core.sg_etl_execution_tasks_log_v endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
create or replace view sert_core.sg_etl_execution_tasks_log_v as
select l.task_log_id, l.log_id, l.task_id, t.task_phase, t.task_name, l.status, l.rows_changed,
       l.start_timestamp,
       l.end_timestamp,
       case when l.status = 'RUNNING' then systimestamp - l.start_timestamp end elapsed,
       case when l.status <> 'RUNNING' then l.end_timestamp - l.start_timestamp end duration,
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
        end as duration_in_seconds,
        l.status_message,
        l.error_message,
        t.plsql_procedure_name
  from sg_etl_task_log l
  join sg_etl_tasks t on (l.task_id = t.task_id)
/
--rollback not required
