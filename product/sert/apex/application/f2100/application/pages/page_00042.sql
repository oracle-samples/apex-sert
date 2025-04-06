-- file_checksum: F0D7A830E7AA40EF2A79F27119385C20F75550F929B08BB0239D0710632E47BA
prompt --application/pages/page_00042
begin
--   Manifest
--     PAGE: 00042
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>42
,p_name=>'Preview Exceptions'
,p_alias=>'PREVIEW-EXCEPTIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Preview Exceptions'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(468192478777671210)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_height=>'1000'
,p_dialog_width=>'1400'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(51389790588281027)
,p_name=>'Exceptions'
,p_template=>wwv_flow_imp.id(468265822494671277)
,p_display_sequence=>120
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'     rule_set_key',
'    ,rule_key',
'    ,apex_version',
'    ,exception',
'    ,workspace_id',
'    ,application_id',
'    ,page_id',
'    ,component_id',
'    ,column_name',
'    ,item_name',
'    ,shared_comp_name',
'    ,result',
'    ,reason',
'    ,current_value',
'    ,component_name',
'    ,checksum',
'from ',
'  sert_core.exceptions_json_to_relational_v',
'where ',
'  name = :P42_NAME',
'  '))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(468503940864671309)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_LEFT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51389885493281028)
,p_query_column_id=>1
,p_column_alias=>'RULE_SET_KEY'
,p_column_display_sequence=>10
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51389974192281029)
,p_query_column_id=>2
,p_column_alias=>'RULE_KEY'
,p_column_display_sequence=>20
,p_column_heading=>'Rule Key'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51390064271281030)
,p_query_column_id=>3
,p_column_alias=>'APEX_VERSION'
,p_column_display_sequence=>30
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51390171051281031)
,p_query_column_id=>4
,p_column_alias=>'EXCEPTION'
,p_column_display_sequence=>40
,p_column_heading=>'Justification'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51390288902281032)
,p_query_column_id=>5
,p_column_alias=>'WORKSPACE_ID'
,p_column_display_sequence=>50
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51390360188281033)
,p_query_column_id=>6
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>60
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51390449875281034)
,p_query_column_id=>7
,p_column_alias=>'PAGE_ID'
,p_column_display_sequence=>70
,p_column_heading=>'Page Id'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51390551248281035)
,p_query_column_id=>8
,p_column_alias=>'COMPONENT_ID'
,p_column_display_sequence=>170
,p_column_heading=>'Component Id'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51390686427281036)
,p_query_column_id=>9
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>110
,p_column_heading=>'Column Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51390740625281037)
,p_query_column_id=>10
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>100
,p_column_heading=>'Item Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51390869512281038)
,p_query_column_id=>11
,p_column_alias=>'SHARED_COMP_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Shared Component Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51390903164281039)
,p_query_column_id=>12
,p_column_alias=>'RESULT'
,p_column_display_sequence=>130
,p_column_heading=>'Result'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51391098853281040)
,p_query_column_id=>13
,p_column_alias=>'REASON'
,p_column_display_sequence=>160
,p_column_heading=>'Reject Reason'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51391126787281041)
,p_query_column_id=>14
,p_column_alias=>'CURRENT_VALUE'
,p_column_display_sequence=>140
,p_column_heading=>'Current Value'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51391234943281042)
,p_query_column_id=>15
,p_column_alias=>'COMPONENT_NAME'
,p_column_display_sequence=>90
,p_column_heading=>'Component Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51391311375281043)
,p_query_column_id=>16
,p_column_alias=>'CHECKSUM'
,p_column_display_sequence=>150
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(448483424863342329)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468201967560671224)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(448483718568342332)
,p_plug_name=>'Steps'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_imp.id(468199188089671222)
,p_plug_display_sequence=>10
,p_location=>null
,p_list_id=>wwv_flow_imp.id(51368190628558261)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(468534782685671345)
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51359172216619717)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(448483424863342329)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51359577128619714)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(448483424863342329)
,p_button_name=>'UPLOAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P42_RULESET_KEY = :P42_RULESET_KEY_I then',
'  return TRUE;',
'else',
'  return FALSE;',
'end if;'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51359994665619714)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(448483424863342329)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(51362880535619631)
,p_branch_name=>'Goto Confirmation Page'
,p_branch_action=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(51359577128619714)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51387111522281001)
,p_name=>'P42_NAME'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51391485781281044)
,p_name=>'P42_WS_NAME'
,p_item_sequence=>55
,p_prompt=>'Workspace details'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51391589705281045)
,p_name=>'P42_APP_NAME'
,p_item_sequence=>60
,p_prompt=>'Application details'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51391760942281047)
,p_name=>'P42_APEX_VERSION'
,p_item_sequence=>52
,p_prompt=>'APEX version'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51391842575281048)
,p_name=>'P42_EXCEPTION_IMPORT_MESSAGE'
,p_item_sequence=>90
,p_prompt=>'Warning'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51391941253281049)
,p_name=>'P42_RULESET_KEY'
,p_item_sequence=>70
,p_prompt=>'Ruleset key'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51392031484281050)
,p_name=>'P42_RULESET_KEY_I'
,p_item_sequence=>110
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52390999226323201)
,p_name=>'P42_EXCEPTION_IMPORT_MESSAGE_2'
,p_item_sequence=>100
,p_prompt=>'Info'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P42_RULESET_KEY = :P42_RULESET_KEY_I then',
'  return TRUE;',
'else',
'  return FALSE;',
'end if;'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51361890458619649)
,p_name=>'Cancel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(51359172216619717)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51362313179619640)
,p_event_id=>wwv_flow_imp.id(51361890458619649)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51372160876455996)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Upload Exceptions'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'EXCEPTIONS_API'
,p_attribute_04=>'UPLOAD_EXCEPTIONS_WIZARD'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(51359577128619714)
,p_process_success_message=>'&P42_MSG.'
,p_internal_uid=>51372160876455996
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(51372508522455994)
,p_page_process_id=>wwv_flow_imp.id(51372160876455996)
,p_page_id=>42
,p_name=>'p_eval_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P10_EVAL_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(51373019905455994)
,p_page_process_id=>wwv_flow_imp.id(51372160876455996)
,p_page_id=>42
,p_name=>'p_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P42_NAME'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51391606748281046)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Current workspace and application evaluation details'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_apex_version VARCHAR2(100);',
'  l_workspace_id VARCHAR2(100);  ',
'  l_workspace VARCHAR2(100);',
'  l_application_id VARCHAR2(100);',
'  l_application_name VARCHAR2(100);',
'  l_rule_set_key VARCHAR2(100);',
'',
'  l_info_message VARCHAR2(1000);',
'',
'  l_apex_version_i VARCHAR2(100);',
'  l_workspace_id_i VARCHAR2(100);',
'  l_application_id_i VARCHAR2(100);',
'  l_rule_set_key_i VARCHAR2(100);',
'',
'  cursor c_eval is',
'    select ',
'      apex_version,',
'      workspace_id, ',
'      workspace,',
'      application_id,',
'      application_name,',
'      rule_set_key',
'    from sert_pub.evals_pub_v',
'    where eval_id = :P10_EVAL_ID;',
'',
'',
'  cursor c_import is',
'    select ',
'      apex_version,',
'      workspace_id,',
'      application_id,',
'      rule_set_key',
'    from sert_core.exceptions_json_to_relational_v',
'    where name = :P42_NAME',
'    and rownum < 2;',
'  ',
'begin',
'',
'  --evaluation details',
'  open c_eval;',
'  fetch c_eval into l_apex_version,',
'                    l_workspace_id, ',
'                    l_workspace,',
'                    l_application_id,',
'                    l_application_name,',
'                    l_rule_set_key;',
'  close c_eval;',
'',
'  :P42_APEX_VERSION := l_apex_version;',
'  :P42_WS_NAME := l_workspace_id || ''-'' || l_workspace;  ',
'  :P42_APP_NAME := l_application_id|| ''-'' || l_application_name;',
'  :P42_RULESET_KEY := l_rule_set_key;',
'',
'  --exception import details',
'  open c_import;',
'  fetch c_import into l_apex_version_i, ',
'                      l_workspace_id_i, ',
'                      l_application_id_i, ',
'                      l_rule_set_key_i;',
'  close c_import;',
'',
'  :P42_RULESET_KEY_I := l_rule_set_key_i;   --disables the UPLOAD button if different',
'',
'  if l_apex_version = l_apex_version_i and',
'     l_workspace_id = l_workspace_id_i and',
'     l_application_id = l_application_id_i and',
'     l_rule_set_key = l_rule_set_key_i then',
'',
'    l_info_message := ''APEX version, workspace id, application id and ruleset key match. '';',
'',
'  else',
'   ',
'    if l_apex_version != l_apex_version_i then',
'      l_info_message := ''Uploaded APEX version is different. '';',
'    end if;',
'',
'    if l_workspace_id != l_workspace_id_i then',
'      l_info_message := l_info_message || '' Uploaded workspace id is different. '';',
'    end if;',
'',
'    if l_application_id != l_application_id_i then',
'      l_info_message := l_info_message || '' Uploaded application id is different. '';',
'    end if;',
'',
'    if l_rule_set_key != l_rule_set_key_i then',
'      l_info_message := l_info_message || '' Uploaded ruleset key is different. This file cannot be uploaded. '';',
'    end if;',
'',
'  end if;',
'',
'  :P42_EXCEPTION_IMPORT_MESSAGE := l_info_message;',
'  :P42_EXCEPTION_IMPORT_MESSAGE_2 := ''Duplicate exceptions will be ignored.'';',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>51391606748281046
);
wwv_flow_imp.component_end;
end;
/
