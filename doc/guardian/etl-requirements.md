# SERT Guardian ETL Controller

The SERT Guardian ETL controller orchestrates metadata-driven, phase-based execution with optional parallelization.

It enforces single-instance runs using a lock-table pattern, launches tasks either synchronously (serial mode) or as concurrent DBMS_SCHEDULER jobs (parallel mode), and records detailed execution and task logs. Dynamic parameters are passed to tasks via a typed collection serialized to sys.anydata.

## Key features

### 1. Orchestration and concurrency control

- **single-instance enforcement**
  - dedicated lock table **SG_ETL_CONTROLLER_LOCK** prevents overlapping logical ETL runs without dbms_lock privileges
  - procedure **acquire_lock** selects the single row for update nowait, persists locked_by and lock_time when free, and commits in an autonomous transaction
  - procedure **release_lock** clears locked_by and lock_time and commits in an autonomous transaction.

- **execution modes**
  - procedure **run_etl** supports two execution modes:
    - **PARALLEL** (default): fan-out per phase using dbms_scheduler jobs (plsql_block).
    -  **SERIAL**: tasks execute synchronously in-process.

- **phase-driven orchestration**
  - Tasks are defined in **SG_ETL_TASKS** and grouped by task_phase.
  - For each phase:
    - *serial mode* or single task in phase: the controller directly invokes procedure **run_task** for the task.
    - *parallel mode* with multiple tasks in phase:
      - a dbms_scheduler job is created per task with job_type 'PLSQL_BLOCK' and a unique job name:
        - pipeline_name = `'SG_ETL_' || <log_id> || '_PHASE_' || <phase> || '_' || <task_id>`
      - the controller constructs pl/sql block containing the sg_parameters collection literal, converts it to sys.anydata, and invokes procedure **run_task**
        - `run_task(p_log_id => <log_id>, p_task_id => <task_id>, p_procedure_name => '<proc>', p_param_values => <anydata>)`
      - a commit is issued after job creation to make the jobs visible to the scheduler coordinator
      - the controller polls user_scheduler_running_jobs with dbms_session.sleep(5) until all phase jobs finish
      - after jobs complete, failed tasks are detected via **SG_ETL_TASK_LOG**; if any failed, the run is marked failed and the controller exits.

- **abort handling**
  - procedure **abort_etl** determines the current running log_id via the lock table, stops any active scheduler jobs with the execution-specific prefix (gc_job_prefix || log_id || '_PHASE_%'), updates **SG_ETL_EXECUTION_LOG** to ABORTED, releases the lock, and outputs a status message.

### 2. Metadata-driven flexibility

- **metadata tables**
  - **SG_ETL_PIPELINES**: job metadata (pipeline_name, default load_type, is_active). Identity-generated numeric keys.
  - **SG_ETL_TASKS**: task_id (identity), pipeline_id, task_phase, task_name, plsql_procedure_name (up to 386 chars for fully qualified names), required_load_type (optional), is_active.
  - **SG_ETL_PIPELINE_PARAMETERS**: per-job parameter expectations with data_type in ('VARCHAR2','NUMBER','DATE','TIMESTAMP'), is_required flag, and format_mask rules (required for date/timestamp).

- **parameter validation and typing**
  - procedure **validate_parameters** verifies required parameters from metadata exist in the provided collection for the selected job.
  - procedure **fetch_parameter_metadata** reads expected types and format masks for a given task.
  - procedure **run_task** deserializes sys.anydata to the sg_parameters collection and builds a dynamic call string using dbms_sql with type-aware conversions:
    - date: `to_date(:param, '<supplied format mask>')`
    - timestamp: `to_timestamp(:param, '<supplied format mask>')`
    - number: `to_number(:param, '<supplied format mask>')` when a mask is provided, else `to_number(:param)`
    - varchar2: bind as is
  - The controller always injects p_task_log_id as the first argument for task procedures.
  - Security hardening is applied using dbms_assert (sql_object_name for procedure names and enquote_literal for embedded literals).

### 3. Logging and control

- **SG_ETL_EXECUTION_LOG** captures overall ETL execution details
  - A RUNNING row is inserted and committed at the start of a run for cross-session visibility.
  - On completion or failure, end_timestamp and status are updated (COMPLETED, FAILED, or ABORTED). Error messages are persisted when applicable.

- **SG_ETL_TASK_LOG** captures individualt task details
  - Each task write a RUNNING entry with start_timestamp and commits immediately.
  - Task procedures should call set_task_completed(p_task_log_id, p_rows_changed, p_status_message) on success.
  - If a task procedure returns without calling set_task_completed, the controller marks it as COMPLETED with a default message.
  - On errors within run_task, the controller logs FAILED with error_message and re-raises the exception so the orchestrator can take action.

### 4. Public API

The SG_ETL_CONTROLLER package includes the following procedures:

- **run_etl** resolves the job and load type, validates parameters when provided, acquires the single-instance lock, orchestrates phases according to p_execution_mode, and finalizes run status.
    ```sql
    run_etl(
        p_pipeline_name     in varchar2,
        p_load_type         in varchar2 default null,
        p_execution_mode    in varchar2 default gc_mode_parallel,
        p_parameters        in sg_parameters default null )
    ```

- **run_task** executes a single task as defined in metadata with type-aware binding, handling logging and success/failure transitions.
    ```sql
    run_task(
        p_log_id            in number,
        p_task_id           in number,
        p_procedure_name    in varchar2,
        p_param_values      in sys.anydata )
    ```

- **set_task_completed** is called within individual task procedures to finalize metrics and status.
    ```sql
    set_task_completed(
        p_task_log_id       in number,
        p_rows_changed      in number default null,
        p_status_message    in varchar2 default null )
    ```

- **abort_etl** stops active scheduler jobs for the current run, marks the execution as ABORTED, and releases the lock.
    ```sql
    abort_etl()
    ```


### 5. Task authoring guidelines

- signature and behavior
  - Each ETL task must be a procedure whose first parameter is p_task_log_id in number, followed by any business parameters declared in **SG_ETL_PIPELINE_PARAMETERS**.
  - Task procedures must not commit; transaction control is centralized in the controller.
  - On success, call set_task_completed to record rows_changed and an optional status message.

- minimal example
  ```sql
  create or replace procedure some_task (
      p_task_log_id in number )
  is
      l_rows number := 0;
  begin
      -- task DML logic here (insert/merge/delete etc.)

      l_rows := l_rows + sql%rowcount;

      sg_etl_controller.set_task_completed(
          p_task_log_id    => p_task_log_id,
          p_rows_changed   => l_rows,
          p_status_message => 'some_task finished' );
  end;
  ```

### 6. Design choices

- locking approach
  - Lock-table with autonomous transactions rather than dbms_lock, simplifying privileges and deployment.

- parallelism strategy
  - dbms_scheduler jobs per task within a phase using plsql_block; the controller monitors completion with simple polling and uses task logs to detect failures.

- chains
  - dbms_scheduler chains are not used in the current implementation. The phase fan-out model and dynamic parameter passing via sys.anydata are well served by per-task plsql_block jobs without the complexity of dynamic chain assembly and cleanup.

