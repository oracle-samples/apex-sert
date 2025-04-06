-- file_checksum: AEFBE97ADFFAF4AA5BDEAD2D18AA53581960613D7B43754A2C5A59C43ADFBEC4
prompt --application/shared_components/logic/application_computations/g_release_version
begin
--   Manifest
--     APPLICATION COMPUTATION: G_RELEASE_VERSION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(61971325496382740)
,p_computation_sequence=>10
,p_computation_item=>'G_RELEASE_VERSION'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'  pref_value',
'FROM ',
'  prefs',
'where pref_key = ''RELEASE_VERSION'''))
,p_version_scn=>41974833767539
);
wwv_flow_imp.component_end;
end;
/
