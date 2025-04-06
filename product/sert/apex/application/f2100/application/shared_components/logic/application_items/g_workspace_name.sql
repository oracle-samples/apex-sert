-- file_checksum: 390D894A608ED505BCDFAAF08BE4F0DA32E2C48B9F05421CF72DCCE097EB0977
prompt --application/shared_components/logic/application_items/g_workspace_name
begin
--   Manifest
--     APPLICATION ITEM: G_WORKSPACE_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(76586497076982527)
,p_name=>'G_WORKSPACE_NAME'
,p_protection_level=>'I'
,p_version_scn=>41836058302431
);
wwv_flow_imp.component_end;
end;
/
