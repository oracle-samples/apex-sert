-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: E617569B1FE376F5908F222125ECF01717D1CFD85D7168B02EA64312089B60BE
-- file_checksum: 352FB3F639668A6B187632B05D2CCD383BA7B0C008B1E01D840270AA48E0A77D
prompt --application/pages/page_06030
begin
--   Manifest
--     PAGE: 06030
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>6030
,p_name=>'Schedule Evaluation'
,p_alias=>'SCHEDULE-EVALUATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Schedule Evaluation'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(394386952125759954)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(119623047158710502)
,p_plug_name=>'Schedule Evaluation'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  1 ',
'from ',
'  user_scheduler_jobs ',
'where ',
'  job_name = ''SERT_SCHEDULED_EVAL_'' || :P6030_APP_ID || ''_'' || :P6030_RULE_SET_KEY'))
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(119623681702710508)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394425593983760058)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(120725063584915195)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>50
,p_location=>null
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  1 ',
'from ',
'  user_scheduler_jobs ',
'where ',
'  job_name = ''SERT_SCHEDULED_EVAL_'' || :P6030_APP_ID || ''_'' || :P6030_RULE_SET_KEY'))
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(120711780356988964)
,p_name=>'Scheduled Evaluation'
,p_parent_plug_id=>wwv_flow_imp.id(120725063584915195)
,p_template=>wwv_flow_imp.id(394422849849760056)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--horizontalBorders'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  case',
'    when instr(j.repeat_interval, ''FREQ=DAILY'') > 0 then',
'      ''Daily at '' || to_char(to_timestamp_tz(to_char(j.next_run_date, ''YYYY-MM-DD HH24:MI:SS TZH:TZM''),''YYYY-MM-DD HH24:MI:SS TZH:TZM'') at time zone sessiontimezone, ''HH24:MI'')',
'    when instr(j.repeat_interval, ''FREQ=WEEKLY'') > 0 then',
'      ''Weekly on '' ||',
'      substr',
'      (',
'         j.repeat_interval',
'        ,instr(j.repeat_interval, ''BYDAY='') + length(''BYDAY='')',
'        ,instr(j.repeat_interval || '';'', '';'', instr(j.repeat_interval, ''BYDAY='')) - (instr(j.repeat_interval, ''BYDAY='') + length(''BYDAY=''))',
'      )',
'      || '' at '' || to_char(to_timestamp_tz(to_char(j.next_run_date, ''YYYY-MM-DD HH24:MI:SS TZH:TZM''),''YYYY-MM-DD HH24:MI:SS TZH:TZM'') at time zone sessiontimezone, ''HH24:MI'')',
'    else',
'      substr',
'      (',
'         j.repeat_interval',
'        ,instr(j.repeat_interval, ''BYDAY='') + length(''BYDAY='')',
'        ,instr(j.repeat_interval || '';'', '';'', instr(j.repeat_interval, ''BYDAY='')) - (instr(j.repeat_interval, ''BYDAY='') + length(''BYDAY=''))',
'      )',
'      || '' at '' || to_char(to_timestamp_tz(to_char(j.next_run_date, ''YYYY-MM-DD HH24:MI:SS TZH:TZM''),''YYYY-MM-DD HH24:MI:SS TZH:TZM'') at time zone sessiontimezone, ''HH24:MI'')',
'  end as schedule',
'FROM ',
'  user_scheduler_jobs j',
'where ',
'  job_name = ''SERT_SCHEDULED_EVAL_'' || :P6030_APP_ID || ''_'' || :P6030_RULE_SET_KEY ',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(394527652631760130)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(69652700495378434)
,p_query_column_id=>1
,p_column_alias=>'SCHEDULE'
,p_column_display_sequence=>10
,p_column_heading=>'Schedule'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(120724967177915194)
,p_plug_name=>'Scheduled Evaluation'
,p_parent_plug_id=>wwv_flow_imp.id(120725063584915195)
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark'
,p_plug_template=>wwv_flow_imp.id(394417639951760031)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>'There is a scheduled evaluation for this application & rule set'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(69650668540378420)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(119623681702710508)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(69651130595378425)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(119623681702710508)
,p_button_name=>'SCHEDULE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Schedule'
,p_button_position=>'CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  1 ',
'from ',
'  user_scheduler_jobs ',
'where ',
'  job_name = ''SERT_SCHEDULED_EVAL_'' || :P6030_APP_ID || ''_'' || :P6030_RULE_SET_KEY'))
,p_button_condition_type=>'NOT_EXISTS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(69651524417378426)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(119623681702710508)
,p_button_name=>'REMOVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
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
'  job_name = ''SERT_SCHEDULED_EVAL_'' || :P6030_APP_ID || ''_'' || :P6030_RULE_SET_KEY'))
,p_button_condition_type=>'EXISTS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70050283263108344)
,p_name=>'P6030_SYSTEM_TS'
,p_item_sequence=>5
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(SYSTIMESTAMP ,''DD-MON-YYYY HH24:MI:SS'')  ',
'from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(119623707960710535)
,p_name=>'P6030_FREQUENCY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(119623047158710502)
,p_prompt=>'Days of week'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'STATIC2:Mon;MON,Tue;TUE,Wed;WED,Thu;THU,Fri;FRI,Sat;SAT,Sun;SUN'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(119623919520710537)
,p_name=>'P6030_HOUR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(119623047158710502)
,p_prompt=>'Hour'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:1;01,2;02,3;03,4;04,5;05,6;06,7;07,8;08,9;09,10;10,11;11,12;12'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(119624078634710538)
,p_name=>'P6030_MIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(119623047158710502)
,p_prompt=>'Min'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:00;00,15;15,30;30,45;45'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(119624115157710539)
,p_name=>'P6030_AMPM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(119623047158710502)
,p_prompt=>'AM/PM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:AM;AM,PM;PM'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(120729367752915279)
,p_name=>'P6030_APP_ID'
,p_item_sequence=>10
,p_prompt=>'Application'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  application_id || '' - '' || application_name as a',
' ,application_id',
'from',
'  apex_applications',
'where workspace not in(''INTERNAL'',''COM.ORACLE.CUST.REPOSITORY'')  ',
'and application_name not in (''APEX-SERT'',''APEX-SERT Administration'')  ',
'union all',
'select',
'  ''All'' as a',
' ,0',
'from dual',
'order by 2'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(120729455353915280)
,p_name=>'P6030_RULE_SET_KEY'
,p_item_sequence=>20
,p_prompt=>'Rule Set'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  rule_set_name || '' ('' || apex_version || '')'' as a',
' ,rule_set_key ',
'from',
'  rule_sets_pub_v',
'where',
'  cnt > 0',
'order by',
'  rule_set_name'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(970603000000000001)
,p_name=>'P6030_SCHEDULE_MODE'
,p_item_sequence=>5
,p_item_plug_id=>wwv_flow_imp.id(119623047158710502)
,p_prompt=>'Schedule Mode'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Daily;DAILY,Weekly;WEEKLY'
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(970603000000000002)
,p_name=>'P6030_HOUR24'
,p_item_sequence=>15
,p_item_plug_id=>wwv_flow_imp.id(119623047158710502)
,p_prompt=>'Hour (24hr)'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:00;0,01;1,02;2,03;3,04;4,05;5,06;6,07;7,08;8,09;9,10;10,11;11,12;12,13;13,14;14,15;15,16;16,17;17,18;18,19;19,20;20,21;21,22;22,23;23'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Random -'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(970603000000000003)
,p_name=>'P6030_MINUTE'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_imp.id(119623047158710502)
,p_prompt=>'Minute'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:00;0,05;5,10;10,15;15,20;20,25;25,30;30,35;35,40;40,45;45,50;50,55;55'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Random -'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(69667456510499044)
,p_validation_name=>'Application is Not Null'
,p_validation_sequence=>5
,p_validation=>'P6030_APP_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select an application to evaluate'
,p_when_button_pressed=>wwv_flow_imp.id(69651130595378425)
,p_associated_item=>wwv_flow_imp.id(120729367752915279)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(69667356499499043)
,p_validation_name=>'Rule Set is not null'
,p_validation_sequence=>10
,p_validation=>'P6030_RULE_SET_KEY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select a Rule Set'
,p_when_button_pressed=>wwv_flow_imp.id(69651130595378425)
,p_associated_item=>wwv_flow_imp.id(120729455353915280)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(69660249254378489)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(69650668540378420)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(69660838995378491)
,p_event_id=>wwv_flow_imp.id(69660249254378489)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(69661174079378492)
,p_name=>'Remove Schedule'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(69651524417378426)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(69661716441378493)
,p_event_id=>wwv_flow_imp.id(69661174079378492)
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
 p_id=>wwv_flow_imp.id(69662158133378494)
,p_event_id=>wwv_flow_imp.id(69661174079378492)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'REMOVE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(69654697269378474)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Add Schedule Job'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'SCHEDULE_API'
,p_attribute_04=>'ADD_SCHEDULE_JOB_FLEX'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(69651130595378425)
,p_process_success_message=>'Scheduled evaluation added'
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
,p_internal_uid=>25929854852107732
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(69655235561378479)
,p_page_process_id=>wwv_flow_imp.id(69654697269378474)
,p_page_id=>6030
,p_name=>'p_schedule_mode'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P6030_SCHEDULE_MODE'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(69655681787378482)
,p_page_process_id=>wwv_flow_imp.id(69654697269378474)
,p_page_id=>6030
,p_name=>'p_weekdays'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P6030_FREQUENCY'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(69656229068378483)
,p_page_process_id=>wwv_flow_imp.id(69654697269378474)
,p_page_id=>6030
,p_name=>'p_hour24'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P6030_HOUR24'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(69656726181378484)
,p_page_process_id=>wwv_flow_imp.id(69654697269378474)
,p_page_id=>6030
,p_name=>'p_minute'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>40
,p_value_type=>'ITEM'
,p_value=>'P6030_MINUTE'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(69657150305378484)
,p_page_process_id=>wwv_flow_imp.id(69654697269378474)
,p_page_id=>6030
,p_name=>'p_eval_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'P10_EVAL_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(69657722534378485)
,p_page_process_id=>wwv_flow_imp.id(69654697269378474)
,p_page_id=>6030
,p_name=>'p_app_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>60
,p_value_type=>'ITEM'
,p_value=>'P6030_APP_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(69658182406378486)
,p_page_process_id=>wwv_flow_imp.id(69654697269378474)
,p_page_id=>6030
,p_name=>'p_rule_set_key'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>70
,p_value_type=>'ITEM'
,p_value=>'P6030_RULE_SET_KEY'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(69659042374378487)
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
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
,p_internal_uid=>25934199957107745
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(69659417558378487)
,p_page_process_id=>wwv_flow_imp.id(69659042374378487)
,p_page_id=>6030
,p_name=>'p_app_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P6030_APP_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(69659912052378487)
,p_page_process_id=>wwv_flow_imp.id(69659042374378487)
,p_page_id=>6030
,p_name=>'p_rule_set_key'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P6030_RULE_SET_KEY'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(69676043881828243)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Schedule scans'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_collection_name VARCHAR2(20) := ''SERT_SCANS'';',
'begin',
'',
'  apex_collection.create_or_truncate_collection(p_collection_name => l_collection_name);',
'',
'  if :P6030_APP_ID <> 0 then',
'    -- create scan for 1 app',
'    apex_collection.add_member(p_collection_name => l_collection_name,',
'                                 p_n001 => :P6030_APP_ID',
'                                 );',
'',
'  else',
'    -- create scans for all apps listed',
'    for l_rec in (select application_id',
'                  from apex_applications',
'                  where workspace not in(''INTERNAL'',''TOWER'',''COM.ORACLE.CUST.REPOSITORY'')  ',
'                  and application_name not in (''APEX-SERT'',''APEX-SERT Administration'')  ',
'                 )',
'    loop',
'      apex_collection.add_member(p_collection_name => l_collection_name,',
'                                 p_n001 => l_rec.application_id',
'                                 );',
'    end loop;',
'',
'  end if;',
'',
'  sert_core.schedule_api.schedule_jobs_flex (',
'    p_schedule_mode => :P6030_SCHEDULE_MODE,',
'    p_weekdays      => :P6030_FREQUENCY,',
'    p_hour24        => :P6030_HOUR24,',
'    p_minute        => :P6030_MINUTE,',
'    p_rule_set_key  => :P6030_RULE_SET_KEY',
'  );',
'',
'',
'/*',
'  sert_core.schedule_api.add_schedule_job (',
'    p_frequency => :P6030_FREQUENCY,',
'    p_hour      => :P6030_HOUR,',
'    p_min       => :P6030_MIN,',
'    p_ampm      => :P6030_AMPM,',
'    p_eval_id   => 0,    -----<<<',
'    p_app_id    => :P6030_APP_ID,',
'    p_rule_set_key => :P6030_RULE_SET_KEY',
'  );',
'*/',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(69651130595378425)
,p_internal_uid=>25951201464557501
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(69654255429378474)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25929413012107732
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(69658620925378486)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Items'
,p_process_sql_clob=>'select application_id, rule_set_key into :P6030_APP_ID, :P6030_RULE_SET_KEY from evals_pub_v where eval_id = :P10_EVAL_ID;'
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
,p_internal_uid=>25933778508107744
);
wwv_flow_imp.component_end;
end;
/
