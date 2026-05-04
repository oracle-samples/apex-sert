--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset mipotter:create_package_spec_sert_core.extension_xapi stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/

-- ---------------------------------------------------------------------------
--
-- ---------------------------------------------------------------------------
create or replace package sert_core.extension_xapi
AUTHID CURRENT_USER
as

-- ---------------------------------------------------------------------------
-- extension_xapi.allow_hosting( 'SERT');
-- ---------------------------------------------------------------------------
  procedure allow_hosting ( p_workspace in varchar2);

-- ---------------------------------------------------------------------------
--
-- ---------------------------------------------------------------------------
  procedure add_menu_entry (
    p_url in varchar2,
    p_workspace in varchar2,
    p_label in varchar2 default 'APEX SERT',
    p_description in varchar2 default 'APEX SERT Security and standards scanner'
  );

-- ---------------------------------------------------------------------------
--
-- ---------------------------------------------------------------------------
  procedure revoke_extension_workspace(
    p_to_workspace in varchar2 default 'SERT',
    p_from_workspace in varchar2 default null
  );

-- ---------------------------------------------------------------------------
--
-- ---------------------------------------------------------------------------
  procedure grant_extension_workspace (
    p_to_workspace in varchar2 default 'SERT'
  );

  procedure grant_extension_workspace (
    p_to_workspace in varchar2 default 'SERT',
    p_from_workspace in varchar2
  );

-- ---------------------------------------------------------------------------
-- Creates a DBMS_SCHEDULER job that runs every 10 minutes to grant APEX
-- builder extension workspace access to p_to_workspace from all other
-- workspaces. Idempotent: drops and recreates the job if it already exists.
-- Must be called as the APEX instance administrator schema.
-- ---------------------------------------------------------------------------
  procedure create_extension_grant_job(
    p_to_workspace in varchar2
  );

-- ---------------------------------------------------------------------------
-- Drops the SERT_EXTENSION_GRANT_JOB scheduler job if it exists.
-- Succeeds silently when the job is not present.
-- ---------------------------------------------------------------------------
  procedure remove_extension_grant_job;

end extension_xapi;
/
--rollback not required
