--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset mipotter:create_package_body_sert_core.extension_xapi stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/

create or replace package body sert_core.extension_xapi
as

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: a l l o w _ h o s t i n g
-- allows an instance to have public hosted extensions
-- p_workspace must be a valid, existing workspace
-- Use of execute immediate is to avoid the issue presented when SERT_CORE does not have instance administrator rights
--
----------------------------------------------------------------------------------------------------------------------------
  procedure allow_hosting ( p_workspace in varchar2)
  is
    l_sql varchar2(4000);
    l_id number;
  begin
    -- validate p_workspace. this helps to make the execute immediate safe
    l_id := apex_util.find_security_group_id(p_workspace);
    if (l_id is not null) then
      l_sql := 'apex_instance_admin.set_workspace_parameter('''||upper(p_workspace)||''',''ALLOW_HOSTING_EXTENSIONS'', ''Y'');';
      execute immediate ('begin '||l_sql||' end;');
    else
      raise NO_DATA_FOUND;
    end if;
  exception
    when others then
      raise;
  end allow_hosting;

----------------------------------------------------------------------------------------------------------------------------
-- A D D _ M E N U _ E N T R Y
--  creates an extension menu entry in the SERT workspace. it checks if there is an extension with the same label first
--  p_url -> the URL you wish the extension to use
--  p_workspace -> specify the destination workspace
--  p_label -> specify the LABEL to use
--  p_description -> an optional short description
----------------------------------------------------------------------------------------------------------------------------

  procedure add_menu_entry (
    p_url in varchar2,
    p_workspace in varchar2,
    p_label in varchar2 default 'APEX SERT',
    p_description in varchar2 default 'APEX SERT Security and standards scanner'
  ) is
    l_count number := 0;
  begin
    -- check if the link already exists
    select count(*)
    into l_count
    from apex_workspace_extension_links
    where link_name = p_label
    and workspace_name = upper(p_workspace ) ;

    -- and URL = 'r/${sert_apex_workspace}/apex_sert/home?session='||chr(38)||'APP_SESSION_ID.'||chr(38)||'P1_BUILDER_SESSION_ID='||chr(38)||'APP_SESSION_ID.';
    if l_count > 0 then
      apex_extension.remove_menu_entry(p_label => p_label, p_workspace =>upper(p_workspace) );
    end if;

    -- now add it
    -- example form of URL
    --'r/${sert_apex_workspace}/apex_sert/home?session='||chr(38)||'APP_SESSION_ID.'||chr(38)||'P1_BUILDER_SESSION_ID='||chr(38)||'APP_SESSION_ID.',
    APEX_EXTENSION.ADD_MENU_ENTRY (
      p_label            => p_label,
      p_url              => p_url,

      p_display_sequence => 10,
      p_description      => p_description, --'APEX SERT Security and standards scanner',
      p_is_public        => true,
      p_workspace        =>p_workspace
    );

  exception
    when others then
      raise;
  end add_menu_entry;

  procedure revoke_extension_workspace(
    p_to_workspace in varchar2 default 'SERT',
    p_from_workspace in varchar2 default null)
  is
    l_sql varchar2(4000);
  begin
    -- if (apex_util.find_security_group_id(p_to_workspace) is null ) then
    --   raise NO_DATA_FOUND;
    -- end if;
    -- if ( p_from_workspace is not null and apex_util.find_security_group_id(p_from_workspace) is null ) then
    --   raise NO_DATA_FOUND;
    -- end if;

    for rec in (select grantor_workspace workspace
                from apex_workspace_extension_grant
                where grantee_workspace = upper(p_to_workspace )
                and grantor_workspace = coalesce(p_from_workspace,grantor_workspace)
    ) loop
      l_sql := 'begin apex_instance_admin.revoke_extension_workspace(p_from_workspace=>'''||rec.workspace||''',p_to_workspace => '''||p_to_workspace||'''); end;';
      execute immediate (l_sql);
    end loop;
  end revoke_extension_workspace;

  procedure grant_extension_workspace (
    p_to_workspace in varchar2 default 'SERT'
  ) is
    l_sql varchar2(4000);

  begin
    -- verify the to_workspace exists
    if (apex_util.find_security_group_id(p_to_workspace) is null ) then
      raise NO_DATA_FOUND;
    end if;

    for rec in
        (select workspace from apex_workspaces aw
          where aw.workspace <> upper(p_to_workspace)
          and   not exists ( select workspace_name from apex_workspace_schemas ws
                              where ws.workspace_name = aw.workspace and schema = apex_application.g_flow_schema_owner)
          minus
          select grantor_workspace workspace
          from apex_workspace_extension_grant
          where grantee_workspace = upper(p_to_workspace )
        )
      loop
        --
        -- apex_instance_admin.grant_extension_workspace ( p_from_workspace => rec.workspace,
        --   p_to_workspace => upper(p_to_workspace),p_read_access => true, p_menu_label => 'APEX SERT');
        l_sql:= 'apex_instance_admin.grant_extension_workspace( p_from_workspace => :from_workspace, p_to_workspace => upper(:to_workspace), p_read_access => true, p_menu_label => ''APEX SERT'');';
        execute immediate ( 'begin '||l_sql||' end;') using rec.workspace,p_to_workspace;

      end loop;

  exception
    when others then
      raise;
  end grant_extension_workspace;

  procedure grant_extension_workspace (
    p_to_workspace in varchar2 default 'SERT',
    p_from_workspace in varchar2
  ) is
    l_sql varchar2(4000);

  begin
    -- verify the to_workspace exists
    if (apex_util.find_security_group_id(p_to_workspace) is null) then
      raise NO_DATA_FOUND;
    end if;

    -- validate the FROM workspace
    if ( apex_util.find_security_group_id(p_from_workspace) is null) then
      raise NO_DATA_FOUND;
    end if;

    l_sql:= 'apex_instance_admin.grant_extension_workspace( p_from_workspace =>'''
      ||p_from_workspace||''', p_to_workspace => upper(''' ||p_to_workspace||''' ), p_read_access => true);';

    execute immediate ( 'begin '||l_sql||' end;');

  exception
    when others then
      raise;
  end grant_extension_workspace;
-- Adds a new scheduled job for a specific app / rule set combination
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end extension_xapi;
/
--rollback not required

--rollback not required