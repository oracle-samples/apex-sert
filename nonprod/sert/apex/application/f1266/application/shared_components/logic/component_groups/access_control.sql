-- file_checksum: 99D520A6EFB08BF485D32B14DE08622247E59AAD9ADEE453B85B4F907EB9F0EC
prompt --application/shared_components/logic/component_groups/access_control
begin
--   Manifest
--     COMPONENT GROUP: access_control
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_component_group(
 p_id=>wwv_flow_imp.id(21548416685632274)
,p_name=>'access_control'
,p_version_scn=>42039616969757
);
wwv_flow_imp.component_end;
end;
/
