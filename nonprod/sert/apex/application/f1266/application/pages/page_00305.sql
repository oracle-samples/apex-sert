-- file_checksum: 724880207DD1519659CD11111A52FA92413121DF0B4E108531B3908925D7640D
prompt --application/pages/page_00305
begin
--   Manifest
--     PAGE: 00305
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>305
,p_name=>'Dynamic Actions'
,p_step_title=>'Dynamic Actions'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(43629650661237418)
,p_name=>'PL/SQL'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(43629609040237417)
,p_event_id=>wwv_flow_imp.id(43629650661237418)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FOR x IN (SELECT 1 FROM dual WHERE 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'')',
'LOOP',
'  NULL;',
'END LOOP;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
