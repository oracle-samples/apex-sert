--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_package_body_sert_core.sg_util endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
create or replace package body sert_core.sg_util as

function exists_4wk_app_activity (
    p_workspace_id   in number,
    p_application_id in number )
    return boolean
is
begin
    for r_check in (
        select 1 matched
          from sg_most_4wk_app_activity_f
         where workspace_id   = p_workspace_id
           and application_id = p_application_id
         fetch first 1 rows only )
    loop
        return true;
    end loop;

    return false;
end exists_4wk_app_activity;

procedure run_main_etl is
    l_cutoff_date date;
    l_parameters  sg_parameters;
begin
    -- Determine the cutoff date for the ETL (data must be modified >= cutoff)
    -- Only use the log cutoff date if we have data, otherwise assume the warehouse tables have been truncated.
    select trunc(cast(max(start_timestamp) as date))
      into l_cutoff_date
      from sg_etl_execution_log
     where pipeline_id = 1
       and status = 'COMPLETED'
       and exists (select null from sg_applications_d);

    if l_cutoff_date is null then
        l_cutoff_date := sg_etl_task.c_min_cutoff_date;
    end if;

    l_parameters := sg_parameters(
        sg_parameter(parameter_name  => 'p_cutoff_date', parameter_value => to_char(l_cutoff_date, 'yyyy-mm-dd') )
    );

    sg_etl_controller.run_etl(
        p_pipeline_name  => 'MAIN_ETL_INC',
        p_load_type      => 'INCREMENTAL',
        p_execution_mode => 'SERIAL',
        p_parameters     => l_parameters );

end run_main_etl;

end sg_util;
/
--rollback not required