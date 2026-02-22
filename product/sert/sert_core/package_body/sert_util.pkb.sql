--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.sert_util stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.sert_util
as
----------------------------------------------------------------------------------------------------------------------------
  -- set_build_option (by application_id)
  -- purpose: set the status of an APEX build option in the given application by numeric id.
  -- behavior: looks up build_option_id in apex_application_build_options and calls
  --   apex_application_admin.set_build_option_status with the resolved id and target status.
  -- parameters:
  --   p_application_id      - apex internal application id
  --   p_build_option_name   - build option name as defined in the application
  --   p_build_status        - target status; defaults to apex_application_admin.c_build_option_status_include
  -- notes: raises any exception (e.g. option not found). requires privileges to call apex_application_admin
  --   and session context that can access the target application's workspace.
----------------------------------------------------------------------------------------------------------------------------
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
  -- set_build_option (by workspace and alias)
  -- purpose: convenience overload to set a build option by APEX workspace name and application alias.
  -- behavior: resolves workspace id and sets session context via apex_util.set_security_group_id, queries
  --   apex_applications to find application_id for the alias in that workspace, then delegates to the
  --   application_id overload.
  -- parameters:
  --   p_workspace           - apex workspace name
  --   p_application_alias   - apex application alias
  --   p_build_option_name   - build option name as defined in the application
  --   p_build_status        - target status; defaults to apex_application_admin.c_build_option_status_include
  -- notes: sets the session's security group id; caller is responsible for broader context management.
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
  -- match_string
  -- purpose: compare two strings for equality after removing all whitespace. if p_string1 is shorter than p_string2,
  --   compare only the first length(p_string1) characters of p_string2 (prefix match).
  -- behavior: uses regexp_replace to strip whitespace; treats both nulls as equal; otherwise requires exact match
  --   after the optional prefix truncation.
  -- parameters:
  --   p_string1, p_string2  - strings to compare
  -- returns: boolean - true if matched, false otherwise
  -- edge cases: nulls considered equal; empty p_string1 matches when stripped p_string2 is also empty.
  ----------------------------------------------------------------------------------------------------------------------------
  function match_string (
    p_string1 in varchar2,
    p_string2 in varchar2
  ) return boolean
  is
    l_string1 varchar2(32767);
    l_string2 varchar2(32767);
  begin
    l_string1 := REGEXP_REPLACE(p_string1, '[[:space:]]', '');
    l_string2 := REGEXP_REPLACE(p_string2, '[[:space:]]', '');
    if length(l_string1) <= length(l_string2) then
      l_string2 := substr(l_string2,1,length(l_string1));
    end if; -- if length(l_string1) <= length(l_string2)

    return ( l_string1 = l_string2 or (l_string1 is null and l_string2 is null) );
  end match_string;

  ----------------------------------------------------------------------------------------------------------------------------
  -- match_string_yn
  -- purpose: varchar2 wrapper over match_string, returning 'Y' when strings match under the same rules,
  --   otherwise 'N'. useful for SQL contexts and simple flag semantics.
  -- parameters:
  --   p_string1, p_string2  - strings to compare
  -- returns: 'Y' or 'N'
  ----------------------------------------------------------------------------------------------------------------------------
  function match_string_yn (
    p_string1 in varchar2,
    p_string2 in varchar2
  ) return varchar2
  is
  begin
    if ( match_string(p_string1,p_string2) ) then
      return 'Y';
    else
      return 'N';
    end if; -- if match_string(p_string1,p_string2)

  end match_string_yn;
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

  procedure recompile_core_packages
  is
    l_sql varchar2(1024);
  begin
    -- in 19.28 ADB and 19.27 PDB we are seeing one package (exceptions_api)
    -- remain invalid, direct compilation then succeeds. this is a generic
    -- workaround to attempt a explicit compile

    -- Loop through all invalid packages and package bodies in the SERT_CORE schema
    for cur_rec in (
      -- Query dba_objects to find invalid packages and package bodies
      select object_name, object_type
      from user_objects
      where status = 'INVALID'
      and object_type in ('PACKAGE', 'PACKAGE BODY')
    ) loop
      if cur_rec.object_type = 'PACKAGE' then
        l_sql := 'alter package SERT_CORE.' || cur_rec.object_name || ' compile';
      else
        l_sql := 'alter package SERT_CORE.' || cur_rec.object_name || ' compile body';
      end if;

      -- Attempt to recompile the object
      begin
        execute immediate l_sql;
      exception
        -- Catch any exceptions that occur during recompilation
        when others then
          raise;
      end;
    end loop;
  end recompile_core_packages;

end sert_util;
/
--rollback not required
