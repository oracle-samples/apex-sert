--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset SERT:add-parse-schema stripComments:false runOnChange:true endDelimiter:/
--preconditions onFail:MARK_RAN onError:HALT
---------------------------------------------------------------------
--  Workspace schema
---------------------------------------------------------------------
-- For platform SDK where APEX workspace is already created (sert_apex_workspace must match tower)
-- need to add schema HERE for when the workspace already exists but we need to
-- ensure the parsing schema is added!
--
-- This ws to schema assignment must be in place before applications are installed, so
-- that correct parsing schema is set during the app install.
-- Othwerwise, for existing schema eg Tower, GBU_CORE is set as parsing schema.
-- App parsing schema must be set to SV_SERT_APEX.
--
DECLARE
  l_schemas       varchar2(1000);
  l_count         number := 0;
  l_workspace     varchar2(255) := upper('${sert_apex_workspace}');
  l_script_parse_as_user  varchar2(255) := upper('sert_pub');
  l_script_base_schema  varchar2(255) := upper('sert_core');
begin
  l_schemas := APEX_INSTANCE_ADMIN.GET_SCHEMAS(l_workspace);

  select count(*)
  into l_count
  from table( apex_string.split(l_schemas ,',') )
  where column_value = l_script_parse_as_user;

  if ( l_count = 0 ) then
    APEX_INSTANCE_ADMIN.ADD_SCHEMA(
    p_workspace => l_workspace
    , p_schema  => l_script_parse_as_user);
  end if;

  select count(*)
  into l_count
  from table( apex_string.split(l_schemas ,',') )
  where column_value = l_script_base_schema;

  if ( l_count = 0 ) then
    APEX_INSTANCE_ADMIN.ADD_SCHEMA(
    p_workspace => l_workspace
    , p_schema  => l_script_base_schema);
  end if;
exception
  when others then
    -- dbms_output.put_line('SCHEMA MAPPING '||l_script_parse_as_user||' ALREADY IN PLACE');
    null;
end;
/
--rollback not required
