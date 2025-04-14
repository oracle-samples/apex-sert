-- file_checksum: 53F0BBB9A91F1D7540A1046E97C0CBF66A7AC41E0B4D8637D312A6C40FF308D6
prompt --application/shared_components/logic/application_items/g_good_name
begin
--   Manifest
--     APPLICATION ITEM: G_GOOD_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(45089798392800265)
,p_name=>'G_GOOD_NAME'
,p_scope=>'GLOBAL'
,p_protection_level=>'B'
,p_escape_on_http_output=>'N'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
