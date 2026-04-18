-- file_checksum: D789842E5AB831B4CBA4E432348195C1951A3D0FF0E25B03231A0CE71BCFF96F
prompt --application/shared_components/logic/application_items/a_very_bad_name
begin
--   Manifest
--     APPLICATION ITEM: A_VERY_BAD_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(100547111712887571)
,p_name=>'A_VERY_BAD_NAME'
,p_scope=>'GLOBAL'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
