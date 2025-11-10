-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: F68ED36DE537103304D7B07BE0258A77E178025F466A064BECAE055D87780B7F
prompt --application/pages/page_00200
begin
--   Manifest
--     PAGE: 00200
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>200
,p_name=>'Score Trend'
,p_alias=>'SCORE-TREND'
,p_page_mode=>'MODAL'
,p_step_title=>'Score Trend'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(511884707145949411)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--xl'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(119223994922943056)
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
 p_id=>wwv_flow_imp.id(136308785684728209)
,p_plug_name=>'Score Trend'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(136310230728728223)
,p_region_id=>wwv_flow_imp.id(136308785684728209)
,p_chart_type=>'line'
,p_height=>'600'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_fill_multi_series_gaps=>false
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
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_time_axis_type=>'skipGaps'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(136310318924728224)
,p_chart_id=>wwv_flow_imp.id(136310230728728223)
,p_seq=>10
,p_name=>'Raw Score'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   to_date(to_char(eh.eval_on_date, ''DD-MON-YYYY''),''DD-MON-YYYY'') as eval_on_date',
'  ,eh.rule_set_key',
'  ,eh.application_id',
'  ,round(avg(eh.score)) as score',
'from ',
'   eval_history_pub_v eh',
'  ,evals_pub_v e',
'where',
'  e.application_id = eh.application_id',
'  and e.workspace_id = eh.workspace_id',
'  and e.rule_set_key = eh.rule_set_key',
'  and e.eval_id = :P10_EVAL_ID',
'group by',
'   to_char(eh.eval_on_date, ''DD-MON-YYYY'')',
'  ,eh.rule_set_key',
'  ,eh.application_id',
'order by',
'   eval_on_date ',
''))
,p_items_value_column_name=>'SCORE'
,p_items_label_column_name=>'EVAL_ON_DATE'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'circle'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(136311964104728241)
,p_chart_id=>wwv_flow_imp.id(136310230728728223)
,p_seq=>20
,p_name=>'Pending Score'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   to_date(to_char(eh.eval_on_date, ''DD-MON-YYYY''),''DD-MON-YYYY'') as eval_on_date',
'  ,round(avg(eh.pending_score)) as score',
'from ',
'   eval_history_pub_v eh',
'  ,evals_pub_v e',
'where',
'  e.application_id = eh.application_id',
'  and e.workspace_id = eh.workspace_id',
'  and e.rule_set_key = eh.rule_set_key',
'  and e.eval_id = :P10_EVAL_ID',
'group by',
'  to_char(eh.eval_on_date, ''DD-MON-YYYY'')',
'order by',
'  eval_on_date '))
,p_items_value_column_name=>'SCORE'
,p_items_label_column_name=>'EVAL_ON_DATE'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'circle'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(136312104827728242)
,p_chart_id=>wwv_flow_imp.id(136310230728728223)
,p_seq=>30
,p_name=>'Approved Score'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   to_date(to_char(eh.eval_on_date, ''DD-MON-YYYY''),''DD-MON-YYYY'') as eval_on_date',
'  ,eh.rule_set_key',
'  ,eh.application_id as eval_application_id',
'  ,eh.workspace_id as eval_workspace_id',
'  ,round(avg(eh.approved_score)) as score',
'from ',
'   eval_history_pub_v eh',
'  ,evals_pub_v e',
'where',
'  e.application_id = eh.application_id',
'  and e.workspace_id = eh.workspace_id',
'  and e.rule_set_key = eh.rule_set_key',
'  and e.eval_id = :P10_EVAL_ID',
'group by',
'   to_char(eh.eval_on_date, ''DD-MON-YYYY'')',
'  ,eh.rule_set_key',
'  ,eh.application_id',
'  ,eh.workspace_id',
'order by',
'   eval_on_date ',
''))
,p_items_value_column_name=>'SCORE'
,p_items_label_column_name=>'EVAL_ON_DATE'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'circle'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(136310350297728225)
,p_chart_id=>wwv_flow_imp.id(136310230728728223)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Evaluation Date'
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
 p_id=>wwv_flow_imp.id(136310523890728226)
,p_chart_id=>wwv_flow_imp.id(136310230728728223)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Score'
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(119224128414943057)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(119223994922943056)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(119224167056943058)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(119224128414943057)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(119224248269943059)
,p_event_id=>wwv_flow_imp.id(119224167056943058)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
