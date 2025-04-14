-- file_checksum: 287041CECC8B7878C82DC034DC687A4F05FCBE58CA93BCF0B9CFCD21AD38BC3D
prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
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
 p_id=>7
,p_name=>'SV_URL_ITEM_PROTECT'
,p_alias=>'SV-URL-ITEM-PROTECT'
,p_step_title=>'SV_URL_ITEM_PROTECT > URL Tampering: Item Protection'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19034669577561616)
,p_plug_name=>'Form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(19035475778561624)
,p_name=>'Report with Items To Submit'
,p_template=>wwv_flow_imp.id(43728368363394113)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    :P7_UNRESTRICTED_REGION_ITEM_TO_SUBMIT_DEPTNO deptno,',
'    (',
'        select c002 ',
'        from apex_collections ',
'        where collection_name = ''P7_EMP_DATA''',
'        and n002 = :P7_UNRESTRICTED_REGION_ITEM_TO_SUBMIT_DEPTNO',
'    ) deptname',
'from dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P7_UNRESTRICTED_REGION_ITEM_TO_SUBMIT_DEPTNO'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(43718414101394098)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19035776160561627)
,p_query_column_id=>1
,p_column_alias=>'DEPTNO'
,p_column_display_sequence=>10
,p_column_heading=>'Deptno'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19035802832561628)
,p_query_column_id=>2
,p_column_alias=>'DEPTNAME'
,p_column_display_sequence=>20
,p_column_heading=>'Deptname'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19035903436561629)
,p_plug_name=>'Chart with Items to Submit'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select c002 lbl, count(1) value',
'from apex_collections ',
'where collection_name = ''P7_EMP_DATA''',
'and n002 = :P7_UNRESTRICTED_CHART_ITEM_TO_SUBMIT_DEPTNO',
'group by c002'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P7_UNRESTRICTED_CHART_ITEM_TO_SUBMIT_DEPTNO'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(19036047674561630)
,p_region_id=>wwv_flow_imp.id(19035903436561629)
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
 p_id=>wwv_flow_imp.id(19036142880561631)
,p_chart_id=>wwv_flow_imp.id(19036047674561630)
,p_seq=>10
,p_name=>'Series A'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select c002 lbl, count(1) value',
'from apex_collections ',
'where collection_name = ''P7_EMP_DATA''',
'and n002 = :P7_UNRESTRICTED_CHART_SERIES_ITEM_TO_SUBMIT_DEPTNO',
'group by c002'))
,p_ajax_items_to_submit=>'P7_UNRESTRICTED_CHART_SERIES_ITEM_TO_SUBMIT_DEPTNO'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LBL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(19036206864561632)
,p_chart_id=>wwv_flow_imp.id(19036047674561630)
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
 p_id=>wwv_flow_imp.id(19036294552561633)
,p_chart_id=>wwv_flow_imp.id(19036047674561630)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19034739030561617)
,p_name=>'P7_UNRESTRICTED_PARENT_CASC_LOV_DEPTNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19034669577561616)
,p_prompt=>'Unrestricted and defined as parent LOV'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct c002 d, n002 r',
'from apex_collections',
'where collection_name = ''P7_EMP_DATA''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_item_comment=>'This item is unrestricted but is specified as a parent cascading LOV item. It should PASS as it needs to be this way.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19034976841561619)
,p_name=>'P7_UNRESTRICTED_EMPNO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(19034669577561616)
,p_prompt=>'Unrestricted LOV'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c001 d, n001 r',
'from apex_collections',
'where collection_name = ''P7_EMP_DATA''',
'and n002 = :P7_UNRESTRICTED_PARENT_CASC_LOV_DEPTNO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P7_UNRESTRICTED_PARENT_CASC_LOV_DEPTNO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_item_comment=>'This item is unrestricted. It should FAIL.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19035170936561621)
,p_name=>'P7_SSP_SESSION_DEPTNO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(19034669577561616)
,p_prompt=>'SSP Session'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct c002 d, n002 r',
'from apex_collections',
'where collection_name = ''P7_EMP_DATA''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'NONE'
,p_item_comment=>'This item is has SSP enabled (session). It should PASS.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19035233194561622)
,p_name=>'P7_SSP_USER_DEPTNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(19034669577561616)
,p_prompt=>'SSP User'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct c002 d, n002 r',
'from apex_collections',
'where collection_name = ''P7_EMP_DATA''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'NONE'
,p_item_comment=>'This item is has SSP enabled (user). It should PASS.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19035359794561623)
,p_name=>'P7_SSP_APP_DEPTNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(19034669577561616)
,p_prompt=>'SSP APP'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct c002 d, n002 r',
'from apex_collections',
'where collection_name = ''P7_EMP_DATA''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'NONE'
,p_item_comment=>'This item is has SSP enabled (app). It should PASS.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19035540437561625)
,p_name=>'P7_UNRESTRICTED_REGION_ITEM_TO_SUBMIT_DEPTNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19035475778561624)
,p_item_default=>'10'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20956729833528484)
,p_name=>'P7_UNRESTRICTED_CHART_ITEM_TO_SUBMIT_DEPTNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19035903436561629)
,p_item_default=>'10'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20956869286528485)
,p_name=>'P7_UNRESTRICTED_CHART_SERIES_ITEM_TO_SUBMIT_DEPTNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19035903436561629)
,p_item_default=>'20'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20956936339528486)
,p_name=>'P7_UNRESTRICTED_DA_SUBMIT_ITEM_DEPTNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19034669577561616)
,p_item_default=>'20'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30893660039948084)
,p_name=>'P7_PERCENT_GRAPH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(19034669577561616)
,p_prompt=>'Percent Graph'
,p_display_as=>'NATIVE_PCT_GRAPH'
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20957014834528487)
,p_name=>'onLoad: Submit item'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20957136791528488)
,p_event_id=>wwv_flow_imp.id(20957014834528487)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_UNRESTRICTED_DA_SUBMIT_ITEM_DEPTNO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19035064276561620)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Populate Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_collection_name varchar2(200) := ''P7_EMP_DATA'';',
'begin',
'',
'    apex_collection.create_or_truncate_collection(l_collection_name);',
'',
'    apex_collection.add_member(',
'       p_collection_name => l_collection_name,',
'       p_c001 => ''KING'',',
'       p_c002 => ''ADMIN'',',
'       --emp_id',
'       p_n001 => 1,',
'       --dept_no',
'       p_n002 => 10',
'    );',
'',
'    apex_collection.add_member(',
'       p_collection_name => l_collection_name,',
'       p_c001 => ''SULLIVAN'',',
'       p_c002 => ''ACCOUNTING'',',
'       --emp_id',
'       p_n001 => 1,',
'       --dept_no',
'       p_n002 => 20',
'    );',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>7712278913547537
);
wwv_flow_imp.component_end;
end;
/
