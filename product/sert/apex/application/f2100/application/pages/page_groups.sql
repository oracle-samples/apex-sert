-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 6115AD171109ACA37532AF31D1DA69646F2D3A3C87BD43F0D60F384B50E5A8AC
prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(512377116090950069)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
