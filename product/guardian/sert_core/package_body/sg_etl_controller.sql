--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_package_body_sert_core.sg_etl_controller endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
create or replace package body sert_core.sg_etl_controller as
--
-- Type definitions that are internal to the package body
--
type r_parameter_metadata is record (
    parameter_name  varchar2(128),
    data_type       varchar2(20),
    format_mask     varchar2(100) );
type t_parameter_metadata is table of r_parameter_metadata index by varchar2(128);

--
-- Helper procedure: fetches parameter types from metadata
--
procedure fetch_parameter_metadata(
    p_task_id       in number,
    p_metadata      out t_parameter_metadata )
is
begin
    -- Fetches parameter types from metadata
    for r in (
        select j.parameter_name,
               j.data_type,
               j.format_mask
          from sert_core.sg_etl_pipeline_parameters j
          join sert_core.sg_etl_tasks t
            on t.pipeline_id = j.pipeline_id
         where t.task_id = p_task_id )
    loop
        p_metadata(upper(r.parameter_name)) := r;
    end loop;
exception
    when no_data_found then
        null;
end fetch_parameter_metadata;

--
-- Procedure to acquire the single-instance lock using the lock table (autonomous transaction).
--
function acquire_lock(
    p_log_id        in number )
return boolean
is
    pragma autonomous_transaction;
    l_lock_row_name sg_etl_controller_lock.lock_name%type;
    l_locked_by     number;
begin
    -- 1. Attempt to acquire transactional lock to prevent race condition.
    select lock_name,
           locked_by
      into l_lock_row_name,
           l_locked_by
      from sert_core.sg_etl_controller_lock
     where lock_name = 'MAIN_ETL_LOCK'
       for update nowait;

    -- 2. Check committed status.
    if l_locked_by is not null then
        rollback;
        return false;
    end if;

    -- 3. Claim the lock.
    update sert_core.sg_etl_controller_lock
       set locked_by = p_log_id,
           lock_time = systimestamp
     where lock_name = 'MAIN_ETL_LOCK';

    commit; -- permanent claim (autonomous).
    return true;

exception
    when others then
        if sqlcode = -54 then -- resource busy
            rollback;
            return false;
        else
            raise;
        end if;
end acquire_lock;

--
-- Procedure to release the lock.
--
procedure release_lock
is
    pragma autonomous_transaction;
begin
    update sert_core.sg_etl_controller_lock
       set locked_by = null,
           lock_time = null
     where lock_name = 'MAIN_ETL_LOCK';

    commit;
end release_lock;

--
-- Procedure to perform parameter validation.
--
procedure validate_parameters(
    p_pipeline_id   in number,
    p_parameters    in sg_parameters )
is
    l_required_params_count number;
begin
    select count(*)
      into l_required_params_count
      from sert_core.sg_etl_pipeline_parameters j
     where j.pipeline_id = p_pipeline_id
       and j.is_required = 'Y'
       and j.parameter_name not in (select t.parameter_name from table(p_parameters) t );

    if l_required_params_count > 0 then
        raise_application_error(-20004, 'missing required ETL parameters.');
    end if;
end validate_parameters;

--
-- Public procedure for ETL tasks to report success metrics.
--
procedure set_task_completed(
    p_task_log_id    in number,
    p_rows_changed   in number   default null,
    p_status_message in varchar2 default null )
is
begin
    update sert_core.sg_etl_task_log
       set end_timestamp   = systimestamp,
           status          = gc_status_completed,
           rows_changed    = p_rows_changed,
           status_message  = p_status_message
     where task_log_id = p_task_log_id;
end set_task_completed;

--
-- Private procedure for ETL tasks to report failure.
--
procedure set_task_failed(
    p_task_log_id       in number,
    p_status_message    in varchar2 default null )
is
begin
    update sert_core.sg_etl_task_log
       set end_timestamp   = systimestamp,
           status          = gc_status_failed,
           status_message  = p_status_message
     where task_log_id = p_task_log_id;
end set_task_failed;

--
-- Public procedure to execute a single task (called by dbms_scheduler).
-- Note: This implementation filters pipeline parameters and only passes
--       those that are declared by the callee's formal arguments (ALL_ARGUMENTS).
--       This prevents extraneous parameters (e.g. p_cutoff_date) from being
--       forwarded to procedures that do not declare them. p_task_log_id is
--       included only if present in the callee's signature.
--
procedure run_task(
    p_log_id         in number,
    p_task_id        in number,
    p_procedure_name in varchar2,
    p_param_values   in sys.anydata )
is
    l_task_log_id       number;
    l_error_message     varchar2(4000);
    l_log_status        varchar2(20);
    l_procedure_name    varchar2(256);
    t_param_metadata    t_parameter_metadata;
    l_task_param_list   varchar2(32000);
    l_sg_params         sg_parameters;
    l_dummy_res         pls_integer;

    -- variables for dbms_sql execution
    l_cursor_handle     integer;
    l_rows_processed    integer;
    l_full_sql          varchar2(32000);

    c_task_log_param    constant varchar2(15) := 'p_task_log_id';
    -- Formal argument filtering for dynamic calls
    type t_name_set is table of pls_integer index by varchar2(128);
    l_arg_names      t_name_set;
    l_parts          apex_t_varchar2;
    l_owner          varchar2(128);
    l_package        varchar2(128);
    l_object         varchar2(128);
begin

    -- Task start logging
    insert into sert_core.sg_etl_task_log(
        log_id,
        task_id,
        start_timestamp,
        status )
    values(
        p_log_id,
        p_task_id,
        systimestamp,
        gc_status_running )
    returning task_log_id into l_task_log_id;

    commit; -- commit start status immediately. log id is now guaranteed.

    -- 0. Security validation
    if p_procedure_name is not null then
        l_procedure_name := dbms_assert.sql_object_name(p_procedure_name);
    else
        raise_application_error(-20008, 'task procedure name cannot be null.');
    end if;

    -- Unwrap anydata to get the sg_parameters collection
    if p_param_values is not null then
        l_dummy_res := p_param_values.getcollection(l_sg_params);
        if l_dummy_res != dbms_types.success then
             raise_application_error(-20011, 'failed to deserialize parameter collection in run_task.');
        end if;
    end if;

    -- 1b. Build parameter string for dbms_sql binding
    fetch_parameter_metadata(p_task_id => p_task_id, p_metadata => t_param_metadata);

    -- Determine callee signature components and load formal argument names
    l_parts := apex_string.split(l_procedure_name, '.');

    if l_parts.count = 3 then
        l_owner   := upper(l_parts(1));
        l_package := upper(l_parts(2));
        l_object  := upper(l_parts(3));
    elsif l_parts.count = 2 then
        l_owner   := upper(sys_context('userenv', 'current_schema'));
        l_package := upper(l_parts(1));
        l_object  := upper(l_parts(2));
    elsif l_parts.count = 1 then
        l_owner   := upper(sys_context('userenv', 'current_schema'));
        l_package := null;
        l_object  := upper(l_parts(1));
    else
        raise_application_error(-20012, 'invalid procedure name: ' || l_procedure_name);
    end if;

    for r in (
        select upper(argument_name) arg_name
          from all_arguments
         where owner = l_owner
           and object_name = l_object
           and (package_name = l_package or (l_package is null and package_name is null))
           and argument_name is not null
           and in_out in ('IN', 'IN/OUT')
    ) loop
        l_arg_names(r.arg_name) := 1;
    end loop;

    -- Include p_task_log_id only if the callee declares it
    if l_arg_names.exists(upper(c_task_log_param)) then
        l_task_param_list := c_task_log_param || ' => ' || l_task_log_id;
    else
        l_task_param_list := null;
    end if;

    -- Append only parameters declared by the callee
    if l_sg_params is not null and l_sg_params.count > 0 then
        for i in l_sg_params.first .. l_sg_params.last loop
            if l_arg_names.exists(upper(l_sg_params(i).parameter_name)) then
                if l_task_param_list is not null then
                    l_task_param_list := l_task_param_list || ', ' || l_sg_params(i).parameter_name || ' => ';
                else
                    l_task_param_list := l_sg_params(i).parameter_name || ' => ';
                end if;

                -- Determine the proper conversion and binding method based on metadata
                case upper(t_param_metadata(upper(l_sg_params(i).parameter_name)).data_type)
                    when 'DATE' then
                        l_task_param_list := l_task_param_list || 'to_date(:' || l_sg_params(i).parameter_name ||
                                             ', ' || dbms_assert.enquote_literal(t_param_metadata(upper(l_sg_params(i).parameter_name)).format_mask) || ')';

                    when 'TIMESTAMP' then
                        l_task_param_list := l_task_param_list || 'to_timestamp(:' || l_sg_params(i).parameter_name ||
                                             ', ' || dbms_assert.enquote_literal(t_param_metadata(upper(l_sg_params(i).parameter_name)).format_mask) || ')';

                    when 'NUMBER' then
                        if t_param_metadata(upper(l_sg_params(i).parameter_name)).format_mask is not null then
                            l_task_param_list := l_task_param_list ||
                                                 'to_number(:' || l_sg_params(i).parameter_name ||
                                                 ', ' || dbms_assert.enquote_literal(t_param_metadata(upper(l_sg_params(i).parameter_name)).format_mask) || ')';
                        else
                            l_task_param_list := l_task_param_list || 'to_number(:' || l_sg_params(i).parameter_name || ')';
                        end if;

                    when 'VARCHAR2' then
                        l_task_param_list := l_task_param_list || ':' || l_sg_params(i).parameter_name;

                    else
                        raise_application_error(-20009, 'unsupported data type in metadata for parameter ' || l_sg_params(i).parameter_name);
                end case;
            end if;
        end loop;
    end if;

    if l_task_param_list is null then
        l_task_param_list := '';
    end if;

    -- 2. Execute task using dbms_sql for dynamic execution and binding
    l_cursor_handle := dbms_sql.open_cursor;

    l_full_sql := 'begin ' || l_procedure_name || '(' || l_task_param_list || '); end;';

    dbms_sql.parse(c => l_cursor_handle, statement => l_full_sql, language_flag => dbms_sql.native);

    if l_sg_params is not null and l_sg_params.count > 0 then
        -- Bind only parameters that are declared by the callee
        for i in l_sg_params.first .. l_sg_params.last loop
            if l_arg_names.exists(upper(l_sg_params(i).parameter_name)) then
                dbms_sql.bind_variable(
                    c     => l_cursor_handle,
                    name  => ':' || l_sg_params(i).parameter_name,
                    value => l_sg_params(i).parameter_value );
            end if;
        end loop;
    end if;

    l_rows_processed := dbms_sql.execute(c => l_cursor_handle);

    dbms_sql.close_cursor(c => l_cursor_handle);

    -- 3. Success check: if the task procedure didn't call set_task_completed, update it here.
    select status
      into l_log_status
      from sert_core.sg_etl_task_log
     where task_log_id = l_task_log_id;

    if l_log_status = gc_status_running then
        sert_core.sg_etl_controller.set_task_completed(
            p_task_log_id    => l_task_log_id,
            p_rows_changed   => null,
            p_status_message => 'Task completed, but metrics were not reported by the task procedure.' );
    end if;

    commit; -- final commit for successful execution

exception
    when others then
        l_error_message := substr(sqlerrm, 1, 4000);

        -- Ensure task changes are not committed.
        rollback;

        -- Always ensure the cursor is closed on error
        if dbms_sql.is_open(l_cursor_handle) then
            dbms_sql.close_cursor(c => l_cursor_handle);
        end if;

        set_task_failed(p_task_log_id => l_task_log_id, p_status_message => l_error_message );
        commit; -- final commit for failure logging

        raise;
end run_task;

--
-- Public procedure to abort the currently running ETL.
--
procedure abort_etl
is
    l_running_log_id    number;
    l_job_name_prefix   varchar2(64);
    l_running_jobs_count number := 0;
begin
    select locked_by
      into l_running_log_id
      from sert_core.sg_etl_controller_lock
     where lock_name = 'MAIN_ETL_LOCK';

    if l_running_log_id is null then
        raise_application_error(-20006, 'No ETL job is currently running to abort.');
    end if;

    -- Use package constant gc_job_prefix
    l_job_name_prefix := gc_job_prefix || to_char(l_running_log_id) || '_PHASE_%';

    -- Stop all currently running parallel scheduler jobs.
    begin
        for r_job in (
            select job_name
              from user_scheduler_running_jobs
             where job_name like l_job_name_prefix )
        loop
            dbms_scheduler.stop_job(job_name => r_job.job_name, force => true);

            l_running_jobs_count := l_running_jobs_count + 1;
        end loop;
    exception
        when others then
            null;
    end;

    update sert_core.sg_etl_execution_log
       set end_timestamp   = systimestamp,
           status          = gc_status_aborted,
           error_message   = 'Aborted manually via sg_etl_controller.abort_etl (lock table model). Stopped ' || l_running_jobs_count || ' tasks.'
     where log_id = l_running_log_id;

    release_lock;

    dbms_output.put_line('ETL running with log id ' || l_running_log_id || ' marked aborted and lock released.');

exception
    when no_data_found then
        raise_application_error(-20006, 'No ETL job is currently running to abort.');
    when others then
        release_lock;
        raise;
end abort_etl;

--
-- Main procedure to execute the full ETL.
--
procedure run_etl(
    p_pipeline_name  in varchar2,
    p_load_type      in varchar2      default null,
    p_execution_mode in varchar2      default gc_mode_parallel,
    p_parameters     in sg_parameters default null )
is
    l_pipeline_id               number;
    l_job_load_type             varchar2(20);
    l_log_id                    number;
    l_task_phase                number;
    l_error_message             varchar2(4000);
    l_is_failed                 boolean := false;

    l_running_jobs_count        number;
    l_failed_jobs_count         number;
    l_job_name                  varchar2(128);
    l_scheduler_job_list        sys.odcivarchar2list := sys.odcivarchar2list();

    -- Used to hold the generated string for the sg_parameters constructor call
    l_param_constructor_list    varchar2(32000) := null;

    l_job_action                varchar2(32000);

    l_anydata_params            sys.anydata := null;
    l_empty_params              sert_core.sg_parameters;

    l_execution_mode            constant varchar2(20) := upper(p_execution_mode); -- Local mode variable

    -- Security: assert the job name against injection risks
    l_pipeline_name_asserted    varchar2(128) := dbms_assert.simple_sql_name(p_pipeline_name);

    --
    -- Local function to build the dynamically quoted constructor list for the plsql_block
    --
    function build_parameter_constructor(
        p_params in sg_parameters )
        return varchar2
    is
        l_list_str          varchar2(32000) := null;
        c_single_quote      constant char(1) := '''';
        -- The pl/sql block uses q'{...}', so we only need to escape single quotes within data values.
        c_escaped_quote     constant varchar2(2) := c_single_quote || c_single_quote;
    begin
        if p_params is not null and p_params.count > 0 then
            for i in p_params.first .. p_params.last loop
                l_list_str := l_list_str ||
                              '    sert_core.sg_parameter(' ||
                              'parameter_name => ' || c_single_quote || replace(p_params(i).parameter_name, c_single_quote, c_escaped_quote) || c_single_quote || ', ' ||
                              'parameter_value => ' || c_single_quote || replace(p_params(i).parameter_value, c_single_quote, c_escaped_quote) || c_single_quote ||
                              ')' ||
                              case when i < p_params.last then ',' else '' end || chr(10) || '    ';
            end loop;
        end if;

        -- If no parameters, return a simple empty collection call
        if l_list_str is null then
            return 'sert_core.sg_parameters()';
        else
            -- Otherwise, return the constructed collection call
            return 'sert_core.sg_parameters(' || chr(10) || '    ' || l_list_str || ')';
        end if;
    end build_parameter_constructor;
begin
    -- 1. Configuration
    dbms_output.put_line('INFO: Attempting to start ETL job "' || p_pipeline_name || '" in ' || l_execution_mode || ' mode.');

    -- Validate execution mode
    if l_execution_mode not in (gc_mode_parallel, gc_mode_serial) then
        raise_application_error(
            -20004,
            'Invalid execution mode specified: ' || p_execution_mode || '. Valid modes are ' || gc_mode_parallel || ' or ' || gc_mode_serial || '.' );
    end if;

    select pipeline_id,
           nvl(p_load_type, load_type)
      into l_pipeline_id,
           l_job_load_type
      from sert_core.sg_etl_pipelines
     where pipeline_name = l_pipeline_name_asserted
       and is_active = 'Y';

    -- 1b. Validation & parameter construction for plsql_block
    if p_parameters is not null and p_parameters.count > 0 then
        validate_parameters(p_pipeline_id => l_pipeline_id, p_parameters => p_parameters);

        -- Convert user-supplied collection to anydata
        l_anydata_params := sys.anydata.convertcollection(p_parameters);
    else
        -- Instantiate using the fully qualified constructor
        l_empty_params := sert_core.sg_parameters();

        l_anydata_params := sys.anydata.convertcollection(l_empty_params);
    end if;

    -- Generate the constructor string needed for the plsql_block
    l_param_constructor_list := build_parameter_constructor(p_parameters);

    -- 2. Start logging
    insert into sert_core.sg_etl_execution_log(
        pipeline_id,
        start_timestamp,
        status )
    values(
        l_pipeline_id,
        systimestamp,
        gc_status_running )
    returning log_id into l_log_id;

    commit;

    -- 2b. Acquire lock (autonomous)
    if not acquire_lock(p_log_id => l_log_id) then
        update sert_core.sg_etl_execution_log
           set status          = gc_status_failed,
               end_timestamp   = systimestamp,
               error_message   = 'Lock acquisition failed.'
         where log_id = l_log_id;
        commit;
        raise_application_error(-20001, 'another logical ETL process is currently running. job ' || p_pipeline_name || ' skipped.');
    end if;

    -- 3. Iterate through phases
    for r_phase in (
        select task_phase,
               count(*) tasks_in_phase
          from sert_core.sg_etl_tasks
         where pipeline_id = l_pipeline_id
           and is_active = 'Y'
         group by task_phase
         order by task_phase asc )
    loop
        l_task_phase := r_phase.task_phase;
        l_scheduler_job_list.delete;

        -- 3a. Launch parallel tasks
        for r_task in (
            select task_id,
                   plsql_procedure_name,
                   task_name
              from sert_core.sg_etl_tasks
             where pipeline_id = l_pipeline_id
               and task_phase = r_phase.task_phase
               and is_active = 'Y'
               and (required_load_type is null or required_load_type = l_job_load_type)
             order by task_id ) -- Ensures deterministic order for serial mode
        loop

            -- Serial vs Parallel Execution Switch
            if l_execution_mode = gc_mode_serial or r_phase.tasks_in_phase = 1 then
                ---------------------------------------------------
                -- Serial mode: direct synchronous call
                ---------------------------------------------------
                dbms_output.put_line(apex_string.format('INFO: Executing phase %s - task %s (%s) serially.', r_phase.task_phase, r_task.task_id, r_task.plsql_procedure_name) );
                begin
                    run_task(
                        p_log_id         => l_log_id,
                        p_task_id        => r_task.task_id,
                        p_procedure_name => r_task.plsql_procedure_name,
                        p_param_values   => l_anydata_params ); -- Use the converted ANYDATA object

                    -- RUN_TASK commits successful tasks and log entry.
                exception
                    when others then
                        -- RUN_TASK handles error logging and setting task status to FAILED.
                        -- Flag the failure to exit the task and phase loops.
                        l_is_failed := true;
                end;

            else -- Parallel mode
                ---------------------------------------------------
                -- Parallel mode: use DBMS_SCHEDULER
                ---------------------------------------------------
                dbms_output.put_line(apex_string.format('INFO: Executing phase %s - task %s (%s) in parallel.', r_phase.task_phase, r_task.task_id, r_task.plsql_procedure_name) );

                -- Use package constant gc_job_prefix for job name creation
                l_job_name := gc_job_prefix || to_char(l_log_id) || '_PHASE_' || r_phase.task_phase || '_' || r_task.task_id;

                l_scheduler_job_list.extend;
                l_scheduler_job_list(l_scheduler_job_list.last) := l_job_name;

                -- Construct the plsql_block dynamically using literalized variables.
                l_job_action := apex_string.join(apex_t_varchar2(
                    'declare',
                    '    l_params            sert_core.sg_parameters;',
                    '    l_anydata_wrap      sys.anydata;',
                    '    -- Arguments passed as literals within the block',
                    '    c_log_id            constant number := ' || l_log_id || ';',
                    '    c_task_id           constant number := ' || r_task.task_id || ';',
                    '    c_procedure_name    constant varchar2(256) := ' || dbms_assert.enquote_literal(r_task.plsql_procedure_name) || ';',
                    'begin',
                    '    -- 1. Construct the dynamic parameters collection from the serialized list',
                    '    l_params := ' || l_param_constructor_list || ';',
                    '',
                    '    -- 2. Convert collection to anydata',
                    '    l_anydata_wrap := sys.anydata.convertcollection(l_params);',
                    '',
                    '    -- 3. Call the processing procedure',
                    '    sert_core.sg_etl_controller.run_task(',
                    '        p_log_id         => c_log_id,',
                    '        p_task_id        => c_task_id,',
                    '        p_procedure_name => c_procedure_name,',
                    '        p_param_values   => l_anydata_wrap );',
                    'end;' ));


                -- Create the scheduler job
                dbms_scheduler.create_job(
                    job_name      => l_job_name,
                    job_type      => 'PLSQL_BLOCK',
                    job_action    => l_job_action,
                    enabled       => false,
                    auto_drop     => true );

                dbms_scheduler.enable(l_job_name);
            end if;
        end loop;

        -- b. Handle execution completion (required only for parallel mode)
        if l_execution_mode = gc_mode_parallel and r_phase.tasks_in_phase > 1 then

            -- Commit the scheduler job creations
            commit;

            -- 3b. Wait for completion
            loop
                -- Add delay to ensure jobs have been launched, since Job Coordinator (CJQ0) process wakes up at a set interval
                -- (usually every 5 seconds, but it can be less depending on internal checks and load).
                dbms_session.sleep(5);

                select count(*)
                  into l_running_jobs_count
                  from user_scheduler_running_jobs
                 where job_name in (select column_value from table(l_scheduler_job_list));

                exit when l_running_jobs_count = 0;
            end loop;

            -- 3c. Check for failures in phase
            select count(*)
              into l_failed_jobs_count
              from sert_core.sg_etl_task_log
             where log_id = l_log_id
               and task_id in (select task_id from sert_core.sg_etl_tasks where pipeline_id = l_pipeline_id and task_phase = r_phase.task_phase)
               and status = gc_status_failed;

            if l_failed_jobs_count > 0 then
                l_is_failed := true;
            end if;

        end if; -- End parallel check

        -- Exit phase loop once a failure detected
        exit when l_is_failed;
    end loop;

    -- 4. Final status handling
    if l_is_failed then
        update sert_core.sg_etl_execution_log
           set end_timestamp = systimestamp,
               status        = gc_status_failed,
               error_message = 'One or more tasks failed in phase ' || l_task_phase
         where log_id = l_log_id;

        release_lock;
        commit;
        raise_application_error(-20003, 'ETL pipeline ' || p_pipeline_name || ' failed during task execution.');
    else
        update sert_core.sg_etl_execution_log
           set end_timestamp   = systimestamp,
               status          = gc_status_completed
         where log_id = l_log_id;

        release_lock;
        commit;
    end if;

exception
    when no_data_found then
        release_lock;
        raise_application_error(-20002, 'ETL pipeline ' || p_pipeline_name || ' not found or is inactive.');

    when others then
        release_lock;
        raise;

end run_etl;

end sg_etl_controller;
/
--rollback not required
