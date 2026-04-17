prompt app_checksum: F24062FCE39D7AC19F9EA2292B88008E6F55784EDB74E6D62BAD565878490F78
-- file_checksum: A1516E283A8F6D46D6EEE79887D1BF982DC871A8ABB49CCBA7EC9B19908135BC
prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>10
,p_name=>'ETL Schedule'
,p_alias=>'ETL-SCHEDULE'
,p_page_mode=>'MODAL'
,p_step_title=>'ETL Schedule'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(30658409527755022737)
,p_protection_level=>'C'
,p_page_component_map=>'22'
,p_last_updated_on=>wwv_flow_imp.dz('20260416213335Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(55260645777814403841)
,p_plug_name=>'ETL_Schedule'
,p_title=>'ETL SCHEDULE'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20260416201348Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(43974104161675117043)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(55260645777814403841)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_updated_on=>wwv_flow_imp.dz('20260416201349Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(82649399585431426476)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(55260645777814403841)
,p_button_name=>'SAVE_SCHEDULE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Schedule'
,p_button_position=>'CREATE'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
,p_updated_on=>wwv_flow_imp.dz('20260416204416Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(47256639301142828250)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(55260645777814403841)
,p_button_name=>'REMOVE_SCHEDULE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Remove Schedule'
,p_button_position=>'CREATE'
,p_button_condition=>'P10_JOB_EXISTS'
,p_button_condition2=>'Y'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
,p_updated_on=>wwv_flow_imp.dz('20260416201349Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18566837565806053586)
,p_name=>'P10_FREQUENCY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(55260645777814403841)
,p_item_default=>'DAILY'
,p_prompt=>'Frequency'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Daily;DAILY,Weekly;WEEKLY,Every N Hours;HOURLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20260416211924Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18775622004029199417)
,p_name=>'P10_MINUTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(55260645777814403841)
,p_prompt=>'Minute'
,p_placeholder=>unistr('0 \2013 59  (blank to randomise)')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'LEFT',
  'virtual_keyboard', 'DECIMAL')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20260416202946Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24143584059543050074)
,p_name=>'P10_HOUR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(55260645777814403841)
,p_prompt=>'Hour'
,p_placeholder=>unistr('0 \2013 23  (blank to randomise)')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'LEFT',
  'virtual_keyboard', 'DECIMAL')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20260416202946Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(58115785167254349744)
,p_name=>'P10_DAYS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(55260645777814403841)
,p_prompt=>'Select Days'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'STATIC2:Monday;MON,Tuesday;TUE,Wednesday;WED,Thursday;THU,Friday;FRI,Saturday;SAT,Sunday;SUN'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
,p_updated_on=>wwv_flow_imp.dz('20260416203422Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(71119269678222572049)
,p_name=>'P10_SCHEDULE_INFO'
,p_item_sequence=>5
,p_item_plug_id=>wwv_flow_imp.id(55260645777814403841)
,p_prompt=>'Current Schedule'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20260416201348Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(85450340476377146977)
,p_name=>'P10_JOB_EXISTS'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(55260645777814403841)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20260416201348Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99491257759452434143)
,p_name=>'P10_INTERVAL_N'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(55260645777814403841)
,p_item_default=>'1'
,p_prompt=>'Every N Hours'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'LEFT',
  'virtual_keyboard', 'DECIMAL')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20260416202946Z')
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(88833722461148405176)
,p_computation_sequence=>10
,p_computation_item=>'P10_JOB_EXISTS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if sert_core.sg_scheduler.job_exists then',
'    return ''Y'';',
'else',
'    return ''N'';',
'end if;'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(66635665739952585097)
,p_computation_sequence=>20
,p_computation_item=>'P10_SCHEDULE_INFO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'return sert_core.sg_scheduler.get_schedule_info;'
,p_updated_on=>wwv_flow_imp.dz('20260416200044Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(33913448355333728987)
,p_name=>'Manage Item Visibility'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_FREQUENCY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_updated_on=>wwv_flow_imp.dz('20260416213335Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(57903638248006549053)
,p_event_id=>wwv_flow_imp.id(33913448355333728987)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P10_DAYS,P10_INTERVAL_N,P10_HOUR,P10_MINUTE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var freq = $v("P10_FREQUENCY");',
'',
'if (freq === "WEEKLY") {',
'    apex.item("P10_DAYS").show();',
'} else {',
'    apex.item("P10_DAYS").hide();',
'}',
'',
'if (freq === "HOURLY") {',
'    apex.item("P10_INTERVAL_N").show();',
'} else {',
'    apex.item("P10_INTERVAL_N").hide();',
'}',
'',
'if (freq === "DAILY" || freq === "WEEKLY") {',
'    apex.item("P10_HOUR").show();',
'} else {',
'    apex.item("P10_HOUR").hide();',
'}'))
,p_updated_on=>wwv_flow_imp.dz('20260416213335Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(47970643564144074722)
,p_name=>'Close Drawer'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(43974104161675117043)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(66693340157334837341)
,p_event_id=>wwv_flow_imp.id(47970643564144074722)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(55260645777814403841)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(55905167117483294258)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Schedule'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sert_core.sg_scheduler.create_schedule(',
'    p_frequency  => :P10_FREQUENCY,',
'    p_interval_n => to_number(:P10_INTERVAL_N),',
'    p_days       => :P10_DAYS,',
'    p_hour       => to_number(:P10_HOUR),',
'    p_minute     => to_number(:P10_MINUTE)',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(82649399585431426476)
,p_internal_uid=>55905167117483294258
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(14032934819433653234)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Schedule'
,p_process_sql_clob=>'sert_core.sg_scheduler.remove_schedule;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(47256639301142828250)
,p_internal_uid=>14032934819433653234
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(97496606028969915941)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>97496606028969915941
,p_updated_on=>wwv_flow_imp.dz('20260416204241Z')
);
wwv_flow_imp.component_end;
end;
/
