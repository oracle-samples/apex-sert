-- file_checksum: 549D95697B7AA7E407E94F0C67C8D56E16EC23CACC3927E5513559AC8E0AB5AD
prompt --application/shared_components/logic/application_items/a_bad_name
begin
--   Manifest
--     APPLICATION ITEM: A_BAD_NAME
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
 p_id=>wwv_flow_imp.id(100546905771885799)
,p_name=>'A_BAD_NAME'
,p_scope=>'GLOBAL'
,p_protection_level=>'N'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
