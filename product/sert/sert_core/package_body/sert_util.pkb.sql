--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.sert_util stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.sert_util
as

  procedure set_build_option(
    p_application_id    in number,
    p_build_option_name in varchar2,
    p_build_status      in varchar2 default apex_application_admin.c_build_option_status_include
    )
  is
    l_build_option_id   number;
  begin

    -- identify the build option id
    select build_option_id
    into l_build_option_id
    from APEX_APPLICATION_BUILD_OPTIONS
    where application_id = p_application_id
    and build_option_name = p_build_option_name;
    -- make the change

    apex_application_admin.set_build_option_status (
      p_application_id   => p_application_id,
      p_id               => l_build_option_id,
      p_build_status     => p_build_status );

  exception when others then
    raise;
  end set_build_option;
----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: S E T _ B U I L D _ O P T I O N
-- signature 2
----------------------------------------------------------------------------------------------------------------------------
-- set build status, default is INCLUDE, options are
-- apex_application_admin.c_build_option_status_include
-- apex_application_admin.c_build_option_status_exclude
----------------------------------------------------------------------------------------------------------------------------

  procedure set_build_option(
    p_workspace      in varchar2,
    p_application_alias in varchar2,
    p_build_option_name in varchar2,
    p_build_status in varchar2 default apex_application_admin.c_build_option_status_include
    )
  is
    l_application_id    number;
    l_workspace_id      number;
  begin
    -- identify the application_id
    l_workspace_id := apex_util.find_security_group_id (p_workspace => p_workspace);
    apex_util.set_security_group_id (p_security_group_id => l_workspace_id);

    select application_id
    into l_application_id
    from apex_applications
    where alias = p_application_alias
    and workspace = p_workspace;

    -- make the change
    set_build_option(
      p_application_id => l_application_id,
      p_build_option_name => p_build_option_name,
      p_build_status => p_build_status );

  end set_build_option;


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end sert_util;
/
--rollback not required
