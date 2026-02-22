-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: D8B3846B39FCCA9E4683E23F80F4047836473A707669B025704D516177941B1F
prompt --application/pages/page_00050
begin
--   Manifest
--     PAGE: 00050
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>50
,p_name=>'Schedule'
,p_alias=>'SCHEDULE'
,p_page_mode=>'MODAL'
,p_step_title=>'Schedule'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(511884707145949411)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(137417363109888649)
,p_plug_name=>'Schedule Evaluation'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  1 ',
'from ',
'  user_scheduler_jobs ',
'where ',
'  job_name = ''SERT_SCHEDULED_EVAL_'' || :P50_APP_ID || ''_'' || :P50_RULE_SET_KEY'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(137417997653888655)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511923385421949487)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(138519379536093342)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>50
,p_location=>null
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  1 ',
'from ',
'  user_scheduler_jobs ',
'where ',
'  job_name = ''SERT_SCHEDULED_EVAL_'' || :P50_APP_ID || ''_'' || :P50_RULE_SET_KEY'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(138506096308167111)
,p_name=>'Scheduled Evaluation'
,p_parent_plug_id=>wwv_flow_imp.id(138519379536093342)
,p_template=>wwv_flow_imp.id(511920605950949485)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--horizontalBorders'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  substr',
'    (',
'     j.repeat_interval',
'    ,instr(j.repeat_interval, ''BYDAY='') + length(''BYDAY='')',
'    ,instr(j.repeat_interval || '';'', '';'', instr(j.repeat_interval, ''BYDAY='')) - (instr(j.repeat_interval, ''BYDAY='') + length(''BYDAY=''))',
'    ) ',
'    || '' at '' || TO_CHAR(TO_TIMESTAMP_TZ(TO_CHAR(j.next_run_date, ''YYYY-MM-DD HHPM:MI:SS TZH:TZM''),''YYYY-MM-DD HHPM:MI:SS TZH:TZM'') at time zone sessiontimezone, ''HH:MIPM'') ',
'  as schedule',
'FROM ',
'  user_scheduler_jobs j',
'where ',
'  job_name = ''SERT_SCHEDULED_EVAL_'' || :P50_APP_ID || ''_'' || :P50_RULE_SET_KEY ',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(512225358725949572)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(138604096002977740)
,p_query_column_id=>1
,p_column_alias=>'SCHEDULE'
,p_column_display_sequence=>10
,p_column_heading=>'Schedule'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(138519283129093341)
,p_plug_name=>'Scheduled Evaluation'
,p_parent_plug_id=>wwv_flow_imp.id(138519379536093342)
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark'
,p_plug_template=>wwv_flow_imp.id(511915446136949475)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>'There is a scheduled evaluation for this application & rule set'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(138505817335167108)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(137417997653888655)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(138505580979167106)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(137417997653888655)
,p_button_name=>'SCHEDULE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Schedule'
,p_button_position=>'CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  1 ',
'from ',
'  user_scheduler_jobs ',
'where ',
'  job_name = ''SERT_SCHEDULED_EVAL_'' || :P50_APP_ID || ''_'' || :P50_RULE_SET_KEY'))
,p_button_condition_type=>'NOT_EXISTS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(138519604295093344)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(137417997653888655)
,p_button_name=>'REMOVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Remove'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  1 ',
'from ',
'  user_scheduler_jobs ',
'where ',
'  job_name = ''SERT_SCHEDULED_EVAL_'' || :P50_APP_ID || ''_'' || :P50_RULE_SET_KEY'))
,p_button_condition_type=>'EXISTS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(137417442669888650)
,p_name=>'P50_FREQUENCY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(137417363109888649)
,p_prompt=>'Frequency'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:Mon;MON,Tue;TUE,Wed;WED,Thu;THU,Fri;FRI,Sat;SAT,Sun;SUN'
,p_field_template=>wwv_flow_imp.id(512259205067949615)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '7')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(137417654229888652)
,p_name=>'P50_HOUR'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(137417363109888649)
,p_prompt=>'Hour'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:1;01,2;02,3;03,4;04,5;05,6;06,7;07,8;08,9;09,10;10,11;11,12;12'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(512259205067949615)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(137417813343888653)
,p_name=>'P50_MIN'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(137417363109888649)
,p_prompt=>'Min'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:00;00,15;15,30;30,45;45'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(512259205067949615)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(137417849866888654)
,p_name=>'P50_AMPM'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(137417363109888649)
,p_prompt=>'AM/PM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:AM;AM,PM;PM'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(512259205067949615)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(138518601143093334)
,p_name=>'P50_APP_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(138518688744093335)
,p_name=>'P50_RULE_SET_KEY'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(138505865334167109)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(138505817335167108)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(138505960575167110)
,p_event_id=>wwv_flow_imp.id(138505865334167109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(138518970501093338)
,p_name=>'Remove Schedule'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(138519604295093344)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(138519486776093343)
,p_event_id=>wwv_flow_imp.id(138518970501093338)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you wish to remove this scheduled evaluation?'
,p_attribute_02=>'Remove Scheduled Evaluation'
,p_attribute_03=>'warning'
,p_attribute_06=>'Remove'
,p_attribute_07=>'Cancel'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(138519048350093339)
,p_event_id=>wwv_flow_imp.id(138518970501093338)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'REMOVE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(138518196069093330)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Add Schedule Job'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'SCHEDULE_API'
,p_attribute_04=>'ADD_SCHEDULE_JOB'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(138505580979167106)
,p_process_success_message=>'Scheduled evaluation added'
,p_internal_uid=>19026062529292725
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(138603193160977731)
,p_page_process_id=>wwv_flow_imp.id(138518196069093330)
,p_page_id=>50
,p_name=>'p_frequency'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P50_FREQUENCY'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(138603266435977732)
,p_page_process_id=>wwv_flow_imp.id(138518196069093330)
,p_page_id=>50
,p_name=>'p_hour'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P50_HOUR'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(138603336464977733)
,p_page_process_id=>wwv_flow_imp.id(138518196069093330)
,p_page_id=>50
,p_name=>'p_min'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P50_MIN'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(138603496683977734)
,p_page_process_id=>wwv_flow_imp.id(138518196069093330)
,p_page_id=>50
,p_name=>'p_ampm'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>40
,p_value_type=>'ITEM'
,p_value=>'P50_AMPM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(138603569137977735)
,p_page_process_id=>wwv_flow_imp.id(138518196069093330)
,p_page_id=>50
,p_name=>'p_eval_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'P10_EVAL_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(138603645923977736)
,p_page_process_id=>wwv_flow_imp.id(138518196069093330)
,p_page_id=>50
,p_name=>'p_app_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>60
,p_value_type=>'ITEM'
,p_value=>'P50_APP_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(138603824358977737)
,p_page_process_id=>wwv_flow_imp.id(138518196069093330)
,p_page_id=>50
,p_name=>'p_rule_set_key'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>70
,p_value_type=>'ITEM'
,p_value=>'P50_RULE_SET_KEY'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(138519177232093340)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Remove Scheduled Job'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'SCHEDULE_API'
,p_attribute_04=>'REMOVE_SCHEDULE_JOB'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'REMOVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Scheduled evaluation removed'
,p_internal_uid=>19027043692292735
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(138667709666464227)
,p_page_process_id=>wwv_flow_imp.id(138519177232093340)
,p_page_id=>50
,p_name=>'p_app_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P50_APP_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(138667740810464228)
,p_page_process_id=>wwv_flow_imp.id(138519177232093340)
,p_page_id=>50
,p_name=>'p_rule_set_key'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P50_RULE_SET_KEY'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(138505720427167107)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>19013586887366502
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(138518807492093336)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Items'
,p_process_sql_clob=>'select application_id, rule_set_key into :P50_APP_ID, :P50_RULE_SET_KEY from evals_pub_v where eval_id = :P10_EVAL_ID;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>19026673952292731
);
wwv_flow_imp.component_end;
end;
/
