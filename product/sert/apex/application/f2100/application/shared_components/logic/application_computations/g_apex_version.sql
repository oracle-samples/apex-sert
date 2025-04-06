-- file_checksum: 5D585BDFD2F0780E7DEC5C9DAB3ACFBE8E5F08F803B81BB9FA225CC6FC00AF6B
prompt --application/shared_components/logic/application_computations/g_apex_version
begin
--   Manifest
--     APPLICATION COMPUTATION: G_APEX_VERSION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(96725529822048562)
,p_computation_sequence=>10
,p_computation_item=>'G_APEX_VERSION'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'   substr(VERSION_NO, 1, instr(version_no,''.'',1)+1)',
'FROM ',
'  APEX_RELEASE'))
,p_version_scn=>39194546778966
);
wwv_flow_imp.component_end;
end;
/
