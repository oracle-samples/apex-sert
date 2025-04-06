-- file_checksum: 4964C40811663FAA08279CF5777F03B481D4A07C2BE9AA6FD800114C23340772
prompt --application/shared_components/logic/application_processes/apex_session
begin
--   Manifest
--     APPLICATION PROCESS: apex_session
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
 p_id=>wwv_flow_imp.id(98178264918959806)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'apex_session'
,p_process_sql_clob=>'sv_sec_util.print_apex_session;'
,p_process_clob_language=>'PLSQL'
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SERT test case for:',
'URL Tampering: Authorization Inconsistencies: On-Demand App Process Inconsistencies'))
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
