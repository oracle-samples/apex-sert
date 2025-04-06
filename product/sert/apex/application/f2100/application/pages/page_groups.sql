-- file_checksum: FD2D1B3E6687C91229ABE2846CAABFA863E4F26AD9A37210ABE779563FCEF5EC
prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(468655698229671806)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
