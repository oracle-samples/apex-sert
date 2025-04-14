-- file_checksum: EB63B21F0CD603BE6F6B657464B979A0E252C0F1AC6A925EEEBD9E7B7AB47207
prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 1266
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
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
