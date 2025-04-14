-- file_checksum: 4D3DDC4D0BED22FFCC0A0D626CADFDE58E6A06E9DE0D62050B37F18E61E33CF9
prompt --application/shared_components/automations/auto_1
begin
--   Manifest
--     AUTOMATION: AUTO_1
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_automation(
 p_id=>wwv_flow_imp.id(25124504370692862)
,p_name=>'AUTO_1'
,p_static_id=>'auto-1'
,p_trigger_type=>'API'
,p_polling_status=>'DISABLED'
,p_result_type=>'ROWS'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_type=>'SQL'
,p_query_source=>'SELECT 1 FROM dual WHERE 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'''
,p_include_rowid_column=>false
,p_commit_each_row=>false
,p_error_handling_type=>'IGNORE'
);
wwv_flow_imp_shared.create_automation_action(
 p_id=>wwv_flow_imp.id(25124836096692876)
,p_automation_id=>wwv_flow_imp.id(25124504370692862)
,p_name=>'auto_action_1'
,p_execution_sequence=>10
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy NUMBER;',
'begin',
'   SELECT 1 INTO l_dummy FROM dual WHERE 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'';',
'end;'))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_shared.create_automation_action(
 p_id=>wwv_flow_imp.id(25146069324234822)
,p_automation_id=>wwv_flow_imp.id(25124504370692862)
,p_name=>'auto_action_2'
,p_execution_sequence=>20
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  null;',
'end;'))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp.component_end;
end;
/
