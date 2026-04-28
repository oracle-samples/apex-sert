-- file_checksum: 016E785B899A3A3B7D765EDF5942C3C729EA02FD3CE0BEB628C28C7749A242FB
prompt --application/shared_components/logic/application_items/a_good_name
begin
--   Manifest
--     APPLICATION ITEM: A_GOOD_NAME
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
 p_id=>wwv_flow_imp.id(45090431427805530)
,p_name=>'A_GOOD_NAME'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
