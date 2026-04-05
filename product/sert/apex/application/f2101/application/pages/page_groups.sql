-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: D0CCCD84EA50D48913FE53185F70F44A8F92713041F90CF28AFBA8413CBB713B
prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 2101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
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
