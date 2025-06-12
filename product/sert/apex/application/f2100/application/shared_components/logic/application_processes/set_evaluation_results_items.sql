-- file_checksum: 48E8E7E3F1649D9A3B294671C53A1946B3DE47DE07F467B714D644B7C6413B3E
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
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(480018738384584860)
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
