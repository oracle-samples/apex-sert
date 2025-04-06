-- file_checksum: F4393E976370651F17F2E5907F5E479516D0A5EF4669D43067457280D47B5A5D
prompt --application/shared_components/logic/application_computations/g_aop_url
begin
--   Manifest
--     APPLICATION COMPUTATION: G_AOP_URL
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
 p_id=>wwv_flow_imp.id(68127221559323146)
,p_computation_sequence=>10
,p_computation_item=>'G_AOP_URL'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pref_value',
'from sert_core.prefs',
'where pref_key = ''AOP_URL'';'))
,p_version_scn=>41905342983349
);
wwv_flow_imp.component_end;
end;
/
