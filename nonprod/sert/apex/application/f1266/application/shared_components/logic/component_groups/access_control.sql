-- file_checksum: 28395FCD0CDAC7D67A80CBE4AC31FBC15FEA1DDB64EDCB5C3F68B3FC868F0182
prompt --application/shared_components/logic/component_groups/access_control
begin
--   Manifest
--     COMPONENT GROUP: access_control
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
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
