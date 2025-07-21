-- file_checksum: F0FB75ABD15F85D2FBC3EAC47699F605BFD00252361F889C74EDE2691F86D89A
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00260
begin
--   Manifest
--     PAGE: 00260
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>260
,p_name=>'Evaluation Summary'
,p_alias=>'EVALUATION-SUMMARY1'
,p_page_mode=>'MODAL'
,p_step_title=>'Evaluation Summary'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(511884707145949411)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--xl'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70655244866550492)
,p_plug_name=>'Summary'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(92915069039269076)
,p_region_id=>wwv_flow_imp.id(70655244866550492)
,p_chart_type=>'combo'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92915196800269077)
,p_chart_id=>wwv_flow_imp.id(92915069039269076)
,p_seq=>10
,p_name=>'FAIL'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  er.rule_id,',
'  er.rule_name,',
'  er.description,',
'  cat.category_name,',
'  er.application_id,',
'  decode(er.result,''FAIL'',1,0) eval_fail',
'from',
'  sert_core.eval_results_pub_v er',
'  inner join sert_core.rules rl on (rl.rule_id = er.rule_id)',
'  inner join sert_core.categories cat on (cat.category_key = er.category_key and cat.category_id = rl.category_id)',
'where',
'  er.eval_id = :P260_EVAL_ID'))
,p_ajax_items_to_submit=>'P260_EVAL_ID'
,p_series_type=>'bar'
,p_items_value_column_name=>'EVAL_FAIL'
,p_items_label_column_name=>'CATEGORY_NAME'
,p_line_style=>'solid'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92915434146269080)
,p_chart_id=>wwv_flow_imp.id(92915069039269076)
,p_seq=>20
,p_name=>'PASS'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  er.rule_id,',
'  er.rule_name,',
'  er.description,',
'  cat.category_name,',
'  er.application_id,',
'  decode(er.result,''PASS'',1,0) eval_pass',
'from',
'  sert_core.eval_results_pub_v er',
'  inner join sert_core.rules rl on (rl.rule_id = er.rule_id)',
'  inner join sert_core.categories cat on (cat.category_key = er.category_key and cat.category_id = rl.category_id)',
'where',
'  er.eval_id = :P260_EVAL_ID'))
,p_ajax_items_to_submit=>'P260_EVAL_ID'
,p_series_type=>'bar'
,p_items_value_column_name=>'EVAL_PASS'
,p_items_label_column_name=>'CATEGORY_NAME'
,p_line_style=>'solid'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92915615356269081)
,p_chart_id=>wwv_flow_imp.id(92915069039269076)
,p_seq=>30
,p_name=>'APPROVED'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  er.rule_id,',
'  er.rule_name,',
'  er.description,',
'  cat.category_name,',
'  er.application_id,',
'  decode(er.result,''APPROVED'',1,0) eval_approved',
'from',
'  sert_core.eval_results_pub_v er',
'  inner join sert_core.rules rl on (rl.rule_id = er.rule_id)',
'  inner join sert_core.categories cat on (cat.category_key = er.category_key and cat.category_id = rl.category_id)',
'where',
'  er.eval_id = :P260_EVAL_ID'))
,p_ajax_items_to_submit=>'P260_EVAL_ID'
,p_series_type=>'bar'
,p_items_value_column_name=>'EVAL_APPROVED'
,p_items_label_column_name=>'CATEGORY_NAME'
,p_line_style=>'solid'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(92915695156269082)
,p_chart_id=>wwv_flow_imp.id(92915069039269076)
,p_seq=>40
,p_name=>'Exceptions Approved'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  er.rule_id,',
'  er.rule_name,',
'  er.description,',
'  cat.category_name,',
'  er.application_id,',
'  exp.exception_id,',
'  exp.exception,',
'  exp.item_name,',
'  decode(exp.result,''APPROVED'',1,0) exp_approved',
'from',
'  sert_core.eval_results_pub_v er',
'  inner join sert_core.rules rl on (rl.rule_id = er.rule_id)',
'  inner join sert_core.categories cat on (cat.category_key = er.category_key and cat.category_id = rl.category_id)',
'  inner join sert_core.exceptions_pub_v exp on (rl.rule_id = exp.rule_id and er.application_id = exp.application_id and er.workspace_id = exp.workspace_id)',
'where',
'  er.eval_id = :P260_EVAL_ID'))
,p_ajax_items_to_submit=>'P260_EVAL_ID'
,p_series_type=>'line'
,p_items_value_column_name=>'EXP_APPROVED'
,p_items_label_column_name=>'CATEGORY_NAME'
,p_line_style=>'solid'
,p_line_type=>'straight'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'on'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92915736605269083)
,p_chart_id=>wwv_flow_imp.id(92915069039269076)
,p_axis=>'y2'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_split_dual_y=>'auto'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92915219189269078)
,p_chart_id=>wwv_flow_imp.id(92915069039269076)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(92915321864269079)
,p_chart_id=>wwv_flow_imp.id(92915069039269076)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(561522854807549862)
,p_plug_name=>'Select Page'
,p_region_name=>'selectPageRegion'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(511962801151949524)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_04'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92710078975298125)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(561522854807549862)
,p_button_name=>'RE-EVALUATE_PAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(92754061395298003)
,p_branch_name=>'Stay on Evaluation Summary'
,p_branch_action=>'f?p=&APP_ID.:260:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'RE-EVALUATE,RE-EVALUATE_PAGE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(92753696362298003)
,p_branch_name=>'Return to Home Page'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'DELETE_EVALUATION,RE-EVALUATE_BACKGROUND'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(561530579101549812)
,p_name=>'P260_PAGE_ID'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(561522854807549862)
,p_prompt=>'Page'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  page_id || '' - '' || page_name a',
'  ,page_id',
'from',
'  apex_application_pages',
'where',
'  application_id = (select application_id from evals_pub_v where eval_id = :P260_EVAL_ID)',
'  and page_id > 0',
'order by',
'  page_id'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(512259205067949615)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(561865651481927523)
,p_name=>'P260_EVAL_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92746582774298022)
,p_name=>'reEvaluate'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'reEvaluate'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92747080317298019)
,p_event_id=>wwv_flow_imp.id(92746582774298022)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RE-EVALUATE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92747435518298017)
,p_name=>'reEvaluateBackground'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'reEvaluateBackground'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92748006637298016)
,p_event_id=>wwv_flow_imp.id(92747435518298017)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RE-EVALUATE_BACKGROUND'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92748379847298016)
,p_name=>'reEvaluatePage'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'reEvaluatePage'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92748890447298013)
,p_event_id=>wwv_flow_imp.id(92748379847298016)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(561522854807549862)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92749314799298011)
,p_name=>'deleteEvaluation'
,p_event_sequence=>70
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'deleteEvaluation'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92749760180298010)
,p_event_id=>wwv_flow_imp.id(92749314799298011)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to delete this evaluation?  All notes and exceptions will also be deleted.'
,p_attribute_02=>'Confirm Deletion'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92750230379298009)
,p_event_id=>wwv_flow_imp.id(92749314799298011)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DELETE_EVALUATION'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92750657955298009)
,p_name=>'Refresh page'
,p_event_sequence=>100
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92745052256298026)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate Application'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P260_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P260_EVAL_ID',
'    ,p_rule_set_key      => x.rule_set_key',
'    ,p_run_in_background => ''N''',
'    ,p_eval_id_out       => l_eval_id',
'    );',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RE-EVALUATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>49023634395019763
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92745914469298025)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate in the Background'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P260_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P260_EVAL_ID',
'    ,p_rule_set_key      => x.rule_set_key',
'    ,p_run_in_background => ''Y''',
'    ,p_eval_id_out       => l_eval_id',
'    );',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RE-EVALUATE_BACKGROUND'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>49024496608019762
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92745497646298025)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate for a Page'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P260_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P260_EVAL_ID',
'    ,p_page_id           => :P260_PAGE_ID',
'    ,p_rule_set_key      => x.rule_set_key',
'    ,p_run_in_background => ''N''',
'    ,p_eval_id_out       => l_eval_id',
'    );',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RE-EVALUATE_PAGE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>49024079785019762
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92746163210298024)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Evaluation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P260_EVAL_ID)',
'loop',
'  eval_pkg.delete_eval',
'    (',
'    p_eval_id           => :P260_EVAL_ID',
'    );',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_EVALUATION'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Evaluation Deleted'
,p_internal_uid=>49024745349019761
);
wwv_flow_imp.component_end;
end;
/
