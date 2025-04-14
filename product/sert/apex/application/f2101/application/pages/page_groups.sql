-- file_checksum: 9787CC1C08A2AAF305217FE192C756AF6AD30AA92E245046902CCDD814A25B24
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 2101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
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
