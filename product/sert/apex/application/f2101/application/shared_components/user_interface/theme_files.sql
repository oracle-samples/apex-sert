-- file_checksum: DDB7A14EA68483E3A783BC6D8EBEE08B5D9C5EE4F6FFB693B9658E3E67C434CE
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/user_interface/theme_files
begin
--   Manifest
--     THEME FILES: 2101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A210D0A20436F707972696768742028632920323032302C20323032342C204F7261636C6520616E642F6F722069747320616666696C69617465732E0D0A202A2F0D0A';
wwv_flow_imp_shared.create_theme_file(
 p_id=>wwv_flow_imp.id(75308797451353945)
,p_theme_id=>42
,p_file_name=>'329620525179879700.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
