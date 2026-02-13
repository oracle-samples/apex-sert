--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_package_sert_core.sg_etl_controller endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
create or replace package sert_core.sg_etl_controller
authid definer -- Confirmed as the chosen AUTHID for this framework
as
--=========================================================================================================================
-- Package: sg_etl_controller
--=========================================================================================================================
-- Purpose: This package provides the core control logic for executing and managing structured ETL (Extract, Transform, Load)
-- processes. It orchestrates the execution of ETL jobs defined in metadata tables (e.g., sg_etl_pipelines, sg_etl_tasks).
--
-- Features:
-- - Single-Instance Control: Uses a Transactional Lock Table via autonomous transactions to ensure only one main ETL process
--   can run at a time, preventing conflicts without requiring DBMS_LOCK privileges.
-- - Phased Execution: Supports both PARALLEL (using DBMS_SCHEDULER) and SERIAL (synchronous) execution modes.
-- - Logging and Status: Manages overall ETL execution status (RUNNING, COMPLETED, FAILED, ABORTED) and individual task logging.
-- - Dynamic Parameter Handling: Passes complex parameters dynamically to individual tasks using type-specific conversion and binding.
-- - Abort Capability: Provides a mechanism to stop a currently running ETL instance and clean up associated scheduler jobs.
--
--=========================================================================================================================
-- Task Procedure Pattern:
--=========================================================================================================================
-- Every procedure called as an ETL task via run_task must adhere to the following signature and implementation rules:
-- 1. It must accept a mandatory p_task_log_id parameter (number).
-- 2. It must include any business parameters defined in sg_etl_job_parameter (optional).
-- 3. It must call sert_core.sg_etl_controller.set_task_completed() upon successful execution to log metrics and finalize status.
-- 4. Transaction control (COMMIT/ROLLBACK) is handled exclusively by the controller. Tasks must not issue COMMITs.
-- 5. Errors are handled externally by the controller, which sets the task status to FAILED.
--
-- Example Task Procedure (Assuming this procedure resides in another package, e.g., ETL_PROCEDURES):
--
-- procedure load_data_into_target(
--     p_task_log_id                  in number,
--     p_source_table_name            in varchar2,
--     p_max_load_date                in date )
-- is
--     l_rows_loaded number := 0;
-- begin
--     -- NOTE: Actual DML is often dynamic in ETL but shown statically here for simplicity.
--     -- 1. Main ETL logic goes here
--     update target_table t
--        set (col1, col2) = (
--             select s.col1, s.col2
--               from p_source_table_name s
--              where s.load_date <= p_max_load_date
--         )
--      where exists (
--             select 1
--               from p_source_table_name s
--              where s.pk_col = t.pk_col
--                and s.load_date <= p_max_load_date
--      );
--
--     l_rows_loaded := sql%rowcount;
--
--     -- 2. Finalize status and log metrics.
--     sert_core.sg_etl_controller.set_task_completed(
--         p_task_log_id    => p_task_log_id,
--         p_rows_changed   => l_rows_loaded,
--         p_status_message => 'Successfully loaded ' || l_rows_loaded || ' records up to ' || to_char(p_max_load_date, 'YYYY-MM-DD') );
--
--     -- DO NOT COMMIT HERE. The controller will commit all changes after this call returns.
-- end load_data_into_target;
--=========================================================================================================================

-- Custom types used for passing structured parameters to the ETL controller.
-- These types are assumed to be defined as SQL types (e.g., 'create type ...').
subtype sg_parameter is sert_core.sg_parameter;
subtype sg_parameters is sert_core.sg_parameters;


-- Global constants for job naming and status tracking.
gc_job_prefix           constant varchar2(10) := 'SG_ETL_';
--
gc_status_running       constant varchar2(20) := 'RUNNING';
gc_status_completed     constant varchar2(20) := 'COMPLETED';
gc_status_failed        constant varchar2(20) := 'FAILED';
gc_status_aborted       constant varchar2(20) := 'ABORTED';

-- Global constants for execution modes.
gc_mode_parallel        constant varchar2(20) := 'PARALLEL';
gc_mode_serial          constant varchar2(20) := 'SERIAL';

--------------------------------------------------------------------------------
-- PUBLIC PROCEDURES
--------------------------------------------------------------------------------

--
-- Main entry point to launch the multi-phase ETL job.
--
procedure run_etl(
    p_pipeline_name     in varchar2,
    p_load_type         in varchar2 default null,
    p_execution_mode    in varchar2 default gc_mode_parallel,
    p_parameters        in sg_parameters default null );

--
-- Procedure to execute a single scheduled task. This is the procedure called
-- directly by the dbms_scheduler job, receiving the full payload in anydata.
--
procedure run_task(
    p_log_id            in number,
    p_task_id           in number,
    p_procedure_name    in varchar2,
    p_param_values      in sys.anydata );

--
-- Used by individual ETL tasks to report success, rows changed, and final status message.
--
procedure set_task_completed(
    p_task_log_id       in number,
    p_rows_changed      in number default null,
    p_status_message    in varchar2 default null );

--
-- Aborts the currently running ETL process by stopping associated scheduler jobs
-- and clearing the control lock.
--
procedure abort_etl;

end sg_etl_controller;
/
--rollback not required
