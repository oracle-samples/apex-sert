-- file_checksum: 66904F222B3D548B5FF2E7369A4534D326218A9F66B6C7F11B25ED87A63CB4AC
prompt --application/shared_components/logic/application_items/a_bad_name
begin
--   Manifest
--     APPLICATION ITEM: A_BAD_NAME
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
 p_id=>wwv_flow_imp.id(100546905771885799)
,p_name=>'A_BAD_NAME'
,p_scope=>'GLOBAL'
,p_protection_level=>'N'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
