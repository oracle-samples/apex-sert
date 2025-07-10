-- file_checksum: 5AAB98D83148B65E37422B8EAE659B32F4E1EE3A0E1F2D95F3DA51F20B2005FA
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
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
