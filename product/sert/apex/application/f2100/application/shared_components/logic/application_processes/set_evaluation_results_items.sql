-- file_checksum: 501502EEF55EC2FDF3376E304750C9196FE18B432F575437E111201339BB0784
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_processes/set_evaluation_results_items
begin
--   Manifest
--     APPLICATION PROCESS: Set Evaluation Results Items
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(523740156245863123)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Evaluation Results Items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  case ',
'    when result in (''PASS'', ''APPROVED'') then ''fa-check u-success'' ',
'    when result in (''FAIL'', ''REJECTED'') then ''fa-remove u-danger''',
'    when result in (''STALE'') then ''fa-warning u-danger''',
'    when result = ''PENDING'' then ''fa-warning u-warning''',
'  end',
'  ,rule_name ',
'  ,category_name',
'into',
'   :G_ICON',
'  ,:G_RULE_NAME',
'  ,:G_CATEGORY_NAME',
'from',
'  eval_results_pub_v',
'where',
'  eval_result_id = :G_EVAL_RESULT_ID;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'20,30,100'
,p_process_when_type=>'CURRENT_PAGE_IN_CONDITION'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>41007592602178
);
wwv_flow_imp.component_end;
end;
/
