--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset tschafer:set_checkin_props stripComments:false runOnChange:true endDelimiter:/
declare
  l_project_name      varchar2(100) := 'apex_sert_bom';
  l_project_api       varchar2(100) := 'SERT_CORE';
  l_project_core      varchar2(100) := 'SERT_CORE';
  l_project_code      varchar2(100) := '';
  l_project_pub       varchar2(100) := 'SERT_PUB';
  l_project_product   varchar2(100) := 'sert';
  l_project_workspace varchar2(100) := 'SERT';

  l_project_schemas   varchar2(100) := 'SERT_CORE:SERT_PUB';
begin
  -- project properties
  gbu_core.gbu_properties_api.set_property(p_property_name => 'PROJECT_NAME', p_property_value => l_project_name, p_property_group => 'PROJECT', p_description => 'Project Name (Cloudlab)');
  gbu_core.gbu_properties_api.set_property(p_property_name => 'PROJECT_USER', p_property_value => 'SERT', p_property_group => 'PROJECT', p_description => 'Project User');
  gbu_core.gbu_properties_api.set_property(p_property_name => 'PROJECT_API', p_property_value => l_project_api, p_property_group => 'PROJECT', p_description => 'Schemas Directly related to The Project');
  gbu_core.gbu_properties_api.set_property(p_property_name => 'PROJECT_CORE', p_property_value => l_project_core, p_property_group => 'PROJECT', p_description => 'Schemas Directly related to The Project');
  gbu_core.gbu_properties_api.set_property(p_property_name => 'PROJECT_PUB', p_property_value => l_project_pub, p_property_group => 'PROJECT', p_description => 'Schemas Directly related to The Project');
  gbu_core.gbu_properties_api.set_property(p_property_name => 'PROJECT_PRODUCT', p_property_value => l_project_product, p_property_group => 'PROJECT', p_description => 'Project Product(s)');
  gbu_core.gbu_properties_api.set_property(p_property_name => 'PROJECT_SCHEMAS', p_property_value => l_project_schemas, p_property_group => 'PROJECT', p_description => 'Schemas Associated with this Project colon(:) delimited list');
  gbu_core.gbu_properties_api.set_property(p_property_name => 'PROJECT_WORKSPACE', p_property_value => l_project_workspace, p_property_group => 'PROJECT', p_description => 'Project Workspace(s)');
end;
/
