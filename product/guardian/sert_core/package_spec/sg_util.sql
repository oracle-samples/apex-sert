--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_package_sert_core.sg_util endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
create or replace package sert_core.sg_util as

--==============================================================================
-- Use the `exists_4wk_app_activity` function to detect any activity for
-- an application in the past 4 weeks.
--
-- Parameters:
-- * p_workspace_id:    The unique identifier of the application workspace.
-- * p_application_id:  The unique identifier of the application id.
--
-- Example:
--
-- The following example displays a message confirming activity detected or not.
--
--      if sg_util.exists_4wk_app_activity (
--          p_workspace_id   => :P6_WORKSPACE_ID,
--          p_application_id => :P6_APPLICATION_ID )
--      then
--          htp.p('Activity detected');
--      else
--          htp.p('No activity');
--      end if;
--
--==============================================================================
function exists_4wk_app_activity (
    p_workspace_id   in number,
    p_application_id in number )
    return boolean;

--==============================================================================
-- Run the main ETL for Guardian as an incremental ETL.
-- Determines the cutoff date based on the execution log and the existance of
-- application data. No application data results in a full ETL.
--==============================================================================
procedure run_main_etl;

end sg_util;
/
--rollback not required