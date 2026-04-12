-- file_checksum: CF35AC9FBC7E2490F2493B5FC397D2A6226A501C01F892CBA9C64A9220745340
prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 1266
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(21548711573636577)
,p_group_name=>'ACCESS_CONTROL'
,p_group_desc=>'Access Control based findings'
);
wwv_flow_imp.component_end;
end;
/
