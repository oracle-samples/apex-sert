-- file_checksum: B4C30F32DB79035F5805D9D6902728746E00C3D19C40561E592FCE86031030D0
prompt --application/shared_components/logic/application_computations/g_email_from
begin
--   Manifest
--     APPLICATION COMPUTATION: G_EMAIL_FROM
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
 p_id=>wwv_flow_imp.id(58289569732524031)
,p_computation_sequence=>10
,p_computation_item=>'G_EMAIL_FROM'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pref_value',
'from sert_core.prefs',
'where pref_key = ''EMAIL_FROM'';'))
,p_version_scn=>41916728598068
);
wwv_flow_imp.component_end;
end;
/
