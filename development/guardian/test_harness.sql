--
-- 1. REQUIRED METADATA
--

-- Create the Job
merge into sert_core.sg_etl_pipelines t
using (select 0 pipeline_id, 'MOCK' pipeline_name, 'Mock ETL' job_description
         from dual ) s
   on (t.pipeline_id = s.pipeline_id)
when not matched then
    insert (pipeline_id, pipeline_name, job_description)
    values (s.pipeline_id, s.pipeline_name, s.job_description);

-- Add parameters
merge into sert_core.sg_etl_pipeline_parameters t
using (
    select 0 pipeline_id, 'p_task_date'       parameter_name, 'DATE'   data_type, 'Y' is_required, 'yyyy-mm-dd hh24:mi:ss' format_mask from dual union all
    select 0 pipeline_id, 'p_threshold_value' parameter_name, 'NUMBER' data_type, 'Y' is_required, null                    format_mask from dual
) s
on (t.pipeline_id = s.pipeline_id and t.parameter_name = s.parameter_name)
when not matched then
    insert (pipeline_id, parameter_name, data_type, is_required, format_mask)
    values (s.pipeline_id, s.parameter_name, s.data_type, s.is_required, s.format_mask);

-- Add Mock task
merge into sert_core.sg_etl_tasks t
using (select 0 task_id, 0 pipeline_id, 1 task_phase, 'Load mock data' task_name,
              'sert_core.mock_task' plsql_procedure_name
         from dual ) s
   on (t.task_id = s.task_id)
when not matched then
    insert (task_id, pipeline_id, task_phase, task_name, plsql_procedure_name)
    values (s.task_id, s.pipeline_id, s.task_phase, s.task_name, s.plsql_procedure_name);

commit;

-- 2. MOCK TASK PROCEDURE
--    This mock procedure simulates a task run by the ETL controller.
--    It is created in the 'sert_core' schema.
--    It MUST accept 'p_task_log_id' as the first parameter.
create or replace procedure sert_core.mock_task (
    p_task_log_id                   in number,
    p_task_date                     in date,
    p_threshold_value               in number
)
as
    c_rows_processed constant number := 100;
    l_status_message varchar2(4000);
begin
    dbms_output.put_line('--- task execution started (sert_core.mock_task) ---');

    l_status_message := apex_string.format(
        'Completed successfully: p_task_log_id=%s, p_task_date=%s, p_threshold_value=%s',
        p_task_log_id,
        to_char(p_task_date, 'yyyy-mm-dd hh24:mi:ss'),
        p_threshold_value );

    -- Simulate work by reporting completion metrics back to the controller
    sert_core.sg_etl_controller.set_task_completed (
        p_task_log_id     => p_task_log_id,
        p_rows_changed    => c_rows_processed,
        p_status_message  => l_status_message  );

    dbms_output.put_line(l_status_message);
    dbms_output.put_line('--- task execution finished and reported metrics ---');
end mock_task;
/

--
-- 3. STAND-ALONE TEST HARNESS BLOCK
--
declare
    -- Configuration variables (update these)
    c_pipeline_id                   constant number       := 0; -- must be a valid task_id from sg_etl_pipelines
    c_test_task_id                  constant number       := 0; -- must be a valid task_id from sg_etl_tasks
    c_target_procedure_name         constant varchar2(64) := 'sert_core.mock_task';

    -- Simulation inputs for run_task
    l_log_id                        number; -- the run_etl execution log ID
    l_task_id                       number;
    l_procedure_name                varchar2(64);
    l_param_list_str                varchar2(1); -- the placeholder string used for argument 4
    l_anydata_params                sys.anydata;

    -- Parameter Collection construction
    l_parameters                    sert_core.sg_parameters := sert_core.sg_parameters();
begin
    dbms_output.put_line('--- starting run_task harness ---');

    -- 1. Initialize simulation inputs (mark COMPLETED for convenience)
    insert into sert_core.sg_etl_execution_log(
        pipeline_id, status, start_timestamp )
    values (
        c_pipeline_id, 'COMPLETED', systimestamp )
    returning log_id into l_log_id ;

    l_task_id          := c_test_task_id;
    l_procedure_name   := c_target_procedure_name;

    -- 2. Build parameter collection (sg_parameters)
    -- NOTE: Parameter names and their order must match the task's required parameters
    --       defined in sg_etl_pipeline_parameters for c_test_task_id (9999).
    l_parameters.extend(2);

    -- Parameter 1: DATE type (value stored as formatted string)
    l_parameters(1) := sert_core.sg_parameter(
        parameter_name  => 'p_task_date',
        parameter_value => to_char(systimestamp, 'yyyymmddhh24miss') -- date must be sent as string
    );

    -- Parameter 2: NUMBER type (value stored as string)
    l_parameters(2) := sert_core.sg_parameter(
        parameter_name  => 'p_threshold_value',
        parameter_value => '1000'
    );

    -- 3. Convert collection to SYS.ANYDATA for run_task argument 5
    l_anydata_params := sys.anydata.convertcollection(l_parameters);

    dbms_output.put_line('simulated log_id: ' || l_log_id);
    dbms_output.put_line('calling ' || l_procedure_name || '...');

    -- 4. Call run_task directly
    sert_core.sg_etl_controller.run_task (
        p_log_id           => l_log_id,
        p_task_id          => l_task_id,
        p_procedure_name   => l_procedure_name,
        p_param_values     => l_anydata_params
    );

    dbms_output.put_line('--- run_task call complete ---');

exception
    when others then
        dbms_output.put_line('error occurred: ' || sqlerrm);
        raise;
end;
/

select * from sert_core.sg_etl_pipeline_parameters;

--
-- 4. Run as ETL
--
declare
    l_task_date         date := cast(timestamp '2025-11-28 14:30:00' as date);
    l_parameters        sert_core.sg_parameters;
begin
    -- Parameter 1: DATE type (value stored as formatted string matching SG_ETL_PIPELINE_PARAMETERS expected format)
    l_parameters := sert_core.sg_parameters(
        sert_core.sg_parameter(parameter_name  => 'p_task_date',       parameter_value => to_char(l_task_date, 'yyyy-mm-dd hh24:mi:ss') ),
        sert_core.sg_parameter(parameter_name  => 'p_threshold_value', parameter_value => '1000' )
    );

    sert_core.sg_etl_controller.run_etl(
        p_pipeline_name  => 'MOCK',
        p_execution_mode => 'PARALLEL', -- PARALLEL or SERIAL
        p_parameters     => l_parameters );

    commit;
end;
/

--==============================================================================
-- Run as ETL via procedure
--==============================================================================

begin sert_core.sg_util.run_main_etl; end;
/

-- ETL Execution Log
select e.*,
       case when e.status = 'RUNNING' then systimestamp - start_timestamp end elapsed,
       case when e.status <> 'RUNNING' then end_timestamp - start_timestamp end duration
  from sert_core.sg_etl_execution_log e
 order by start_timestamp desc;

-- ETL Task Log for latest execution
select l.task_log_id, l.log_id, l.task_id, t.task_phase, t.task_name, l.status, l.rows_changed,
       --l.status_message,
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

-- Flush the Execution Log (cascade)
delete sert_core.sg_etl_execution_log;
commit;





