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
-- FUNCTION: c o m p a r e _ s t r i n g.
----------------------------------------------------------------------------------------------------------------------------
-- strips whitespace, and compares if string 1 matches string 2
-- is string 1 is SHORTER than string 2, match up to length of string 1
-- returns TRUE if matched
----------------------------------------------------------------------------------------------------------------------------
  function compare_string (
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
    -- else
    --   l_string1 := substr(l_string1,1,length(l_string2));
    end if;
    -- return (coalesce(l_string1,'N/A') = coalesce(l_string2,'N/A');
    return ( l_string1 = l_string2 or (l_string1 is null and l_string2 is null) );
  end compare_string;

----------------------------------------------------------------------------------------------------------------------------
-- c o m p a r e _ s t r i n g _ y n
-- returns Y is strings match excluding whitespace
-- is string 1 is SHORTER than string 2, match up to length of string 1
-- returns N otherwise
----------------------------------------------------------------------------------------------------------------------------
  function compare_string_yn (
    p_string1 in varchar2,
    p_string2 in varchar2
  ) return varchar2
  is
  begin
    if ( compare_string(p_string1,p_string2) ) then
      return 'Y';
    else
      return 'N';
    end if;
  end compare_string_yn;
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end sert_util;
/
--rollback not required
