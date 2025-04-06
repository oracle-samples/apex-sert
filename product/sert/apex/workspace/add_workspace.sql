--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset SERT:create-apex-workspace stripComments:false runOnChange:true endDelimiter:/
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from APEX_WORKSPACES where workspace = upper('${sert_apex_workspace}');
---------------------------------------------------------------------
--  Workspace
---------------------------------------------------------------------
--  VERSION 020100
--
--    NAME
--      _install_workspace.sql
--
--    DESCRIPTION
--      Intended to install the Workspace and default ADMIN user
--
--    NOTES
--      Assumes the SYS user is connected.
--
--    Arguments:
--      ^1 = Password for ADMIN user
--      sv_sert_apex = Schema assigned
--
--    MODIFIED   (MM/DD/YYYY)
--      tsthilaire   16-FEB-2014  - Created
--
--

DECLARE
  l_workspace   varchar2(255)  := upper('${sert_apex_workspace}');
  l_workspace_id  number;
BEGIN
null;
  -- Run the creation steps
  -- dbms_output.put_line('== Creating Workspace: '|| l_workspace);

  -- Set the APEX session
  wwv_flow_api.set_security_group_id(10);

  -- Create the workspace
  APEX_INSTANCE_ADMIN.ADD_WORKSPACE(
      p_workspace_id        => 32049826282261068,
      p_workspace           => l_workspace,
      p_primary_schema      => 'sert_pub'
      );
--
-- Add the base schema for convenience
  APEX_INSTANCE_ADMIN.ADD_SCHEMA(
       p_workspace => 'SERT'
     , p_schema  => 'sert_core');

  -- remove line to not enable the workspace
  apex_instance_admin.enable_workspace(l_workspace);

  -- Save the new workspace

  -- dbms_output.put_line('== Workspace Created');

exception
   when others then
      if SQLCODE not in (-20987) then
         raise;
      end if;
end;
/
-- rollback not required

