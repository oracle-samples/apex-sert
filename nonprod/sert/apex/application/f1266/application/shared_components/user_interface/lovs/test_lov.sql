-- file_checksum: 8828402C5EA3F3D3FBB883BA66685C6FE0BC36C159CE419D6ECA9BAA707E74B0
prompt --application/shared_components/user_interface/lovs/test_lov
begin
--   Manifest
--     TEST_LOV
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(98172420338711242)
,p_lov_name=>'TEST_LOV'
,p_lov_query=>'.'||wwv_flow_imp.id(98172420338711242)||'.'
,p_location=>'STATIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(98172720215711245)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'value A'
,p_lov_return_value=>'A'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(98173055006711247)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'value B'
,p_lov_return_value=>'B'
);
wwv_flow_imp.component_end;
end;
/
