-- file_checksum: FE7ED0BB8C9EEC570433CE01572D3CD7B0D0EEAEE9F7B9135C94D2A95DACD72A
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00250
begin
--   Manifest
--     PAGE: 00250
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>250
,p_name=>'Evaluation Summary'
,p_alias=>'EVALUATION-SUMMARY'
,p_step_title=>'Evaluation Summary'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(468166191361671179)
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(56752079131860347)
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(26932296655272213)
,p_plug_name=>'Results'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(468265822494671277)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'              ca1.category_id, ',
'              ca1.category_name,',
'              er1.eval_result_id,',
'              er1.rule_id,',
'              er1.rule_name,',
'              er1.description,',
'              er1.application_id,',
'              er1.eval_id,               ',
'              er1.result, ',
'              er1.page_id, ',
'              er1.component_id,',
'              er1.component_name,',
'              er1.item_name,',
'              er1.current_value,',
'              decode(er1.result,''FAIL'',NULL,er1.result) approved_flag',
'            from',
'               sert_core.eval_results_pub_v er1,',
'               sert_core.categories ca1',
'            where 1=1',
'            and er1.eval_id = :P250_EVAL_ID  --SYS_CONTEXT(''SV_SERT_CTX'', ''COLLECTION_ID'')',
'            --and er1.result not like ''%PASS%''',
'            and er1.category_key = ca1.category_key',
'            and (:P250_CATEGORY_NAME is null or er1.category_name = :P250_CATEGORY_NAME)',
'            order by ca1.category_id, er1.rule_id'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P250_EVAL_ID'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(26932376931272214)
,p_region_id=>wwv_flow_imp.id(26932296655272213)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
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
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(26932432242272215)
,p_chart_id=>wwv_flow_imp.id(26932376931272214)
,p_seq=>10
,p_name=>'Series'
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'EVAL_RESULT_ID'
,p_items_label_column_name=>'CATEGORY_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(26932524625272216)
,p_chart_id=>wwv_flow_imp.id(26932376931272214)
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
 p_id=>wwv_flow_imp.id(26932662675272217)
,p_chart_id=>wwv_flow_imp.id(26932376931272214)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(48959625137237159)
,p_name=>'Search Results'
,p_template=>wwv_flow_imp.id(468265822494671277)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'              ca1.category_id, ',
'              ca1.category_name,',
'              er1.eval_result_id,',
'              er1.rule_id,',
'              er1.rule_name,',
'              er1.description,',
'              er1.application_id,',
'              er1.eval_id,               ',
'              er1.result, ',
'              er1.page_id, ',
'              er1.component_id,',
'              er1.component_name,',
'              er1.item_name,',
'              er1.current_value,',
'              decode(er1.result,''FAIL'',NULL,er1.result) approved_flag',
'            from',
'               sert_core.eval_results_pub_v er1,',
'               sert_core.categories ca1',
'            where 1=1',
'            and er1.eval_id = :P250_EVAL_ID  --SYS_CONTEXT(''SV_SERT_CTX'', ''COLLECTION_ID'')',
'            --and er1.result not like ''%PASS%''',
'            and er1.category_key = ca1.category_key',
'            order by ca1.category_id, er1.rule_id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P250_EVAL_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(468503940864671309)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>100000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(468161859695671137)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48963544784237120)
,p_query_column_id=>1
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Category Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48963979788237115)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Category Name'
,p_heading_alignment=>'LEFT'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48964393544237115)
,p_query_column_id=>3
,p_column_alias=>'EVAL_RESULT_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Eval Result Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48964756269237114)
,p_query_column_id=>4
,p_column_alias=>'RULE_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Rule Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48965199466237112)
,p_query_column_id=>5
,p_column_alias=>'RULE_NAME'
,p_column_display_sequence=>5
,p_column_heading=>'Rule Name'
,p_heading_alignment=>'LEFT'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48965537526237112)
,p_query_column_id=>6
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>6
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48965911168237112)
,p_query_column_id=>7
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>7
,p_column_heading=>'Application Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48966384919237111)
,p_query_column_id=>8
,p_column_alias=>'EVAL_ID'
,p_column_display_sequence=>8
,p_column_heading=>'Eval Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48966739169237111)
,p_query_column_id=>9
,p_column_alias=>'RESULT'
,p_column_display_sequence=>9
,p_column_heading=>'Result'
,p_heading_alignment=>'LEFT'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48967172363237110)
,p_query_column_id=>10
,p_column_alias=>'PAGE_ID'
,p_column_display_sequence=>10
,p_column_heading=>'Page Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48967596019237110)
,p_query_column_id=>11
,p_column_alias=>'COMPONENT_ID'
,p_column_display_sequence=>11
,p_column_heading=>'Component Id'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48967958350237110)
,p_query_column_id=>12
,p_column_alias=>'COMPONENT_NAME'
,p_column_display_sequence=>12
,p_column_heading=>'Component Name'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48968353301237109)
,p_query_column_id=>13
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>13
,p_column_heading=>'Item Name'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48968733439237109)
,p_query_column_id=>14
,p_column_alias=>'CURRENT_VALUE'
,p_column_display_sequence=>14
,p_column_heading=>'Current Value'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(48969177177237108)
,p_query_column_id=>15
,p_column_alias=>'APPROVED_FLAG'
,p_column_display_sequence=>15
,p_column_heading=>'Approved Flag'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(48959711048237159)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(468265822494671277)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(48959625137237159)
,p_landmark_label=>'Filters'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'current_facets_selector', '#active_facets',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'E',
  'show_total_row_count', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(48962406011237140)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(468201967560671224)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>'<div id="active_facets"></div>'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(48962977851237136)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(48962406011237140)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:250:&APP_SESSION.::&DEBUG.:RR,250::'
,p_icon_css_classes=>'fa-undo'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26932110705272212)
,p_name=>'P250_EVAL_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(48959711048237159)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48960154543237144)
,p_name=>'P250_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(48959711048237159)
,p_prompt=>'Search'
,p_source=>'CATEGORY_NAME,RULE_NAME,DESCRIPTION,RESULT,COMPONENT_ID,COMPONENT_NAME,ITEM_NAME,CURRENT_VALUE,APPROVED_FLAG'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48960545587237141)
,p_name=>'P250_CATEGORY_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(48959711048237159)
,p_prompt=>'Category Name'
,p_source=>'CATEGORY_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_css_classes=>'category'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>false
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48960921643237141)
,p_name=>'P250_RULE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(48959711048237159)
,p_prompt=>'Rule Name'
,p_source=>'RULE_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>false
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48961307309237140)
,p_name=>'P250_RESULT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(48959711048237159)
,p_prompt=>'Result'
,p_source=>'RESULT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>false
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48961774848237140)
,p_name=>'P250_COMPONENT_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(48959711048237159)
,p_prompt=>'Component Name'
,p_source=>'COMPONENT_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>false
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48962170631237140)
,p_name=>'P250_APPROVED_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(48959711048237159)
,p_prompt=>'Approved Flag'
,p_source=>'APPROVED_FLAG'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>false
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(26932714448272218)
,p_name=>'Refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(48959711048237159)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26932885124272219)
,p_event_id=>wwv_flow_imp.id(26932714448272218)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(26932296655272213)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
