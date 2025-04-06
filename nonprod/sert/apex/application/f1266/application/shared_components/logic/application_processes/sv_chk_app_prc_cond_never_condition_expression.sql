-- file_checksum: FA4AC8199312F3540A7CB0B37EE8E3D763CEAD656FA5E0F60839A06BED9E8D41
prompt --application/shared_components/logic/application_processes/sv_chk_app_prc_cond_never_condition_expression
begin
--   Manifest
--     APPLICATION PROCESS: SV_CHK_APP_PRC_COND_NEVER condition expression
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(22508183762715708)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SV_CHK_APP_PRC_COND_NEVER condition expression'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- just here for testing',
'null;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'1=2'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
