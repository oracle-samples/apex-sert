-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: CF04A1BC2EE28DA4299B6B8078766638454339673448558E39BB19574F356237
prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 2101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(394679259053760639)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
