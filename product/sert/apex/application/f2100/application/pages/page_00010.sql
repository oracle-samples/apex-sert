-- file_checksum: 8C676DDB2CF021330B76F9DA1BD706EE1980FC14CCD654CECF2741F9C0A929A3
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>10
,p_name=>'Evaluation Details'
,p_alias=>'EVALUATION-DETAILS'
,p_step_title=>'Evaluation Details'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// set the smart filters based on clicks from the chart',
'function setCategory(pCategoryName)',
'{ ',
'  apex.item("P10_RESULT").value = ''FAIL'';',
'  apex.item("P10_CATEGORY_NAME").value = pCategoryName;',
'  // wait .75 sec and refresh, else data is stale',
'  setTimeout(function() {',
'    apex.region("evaluationResults").refresh();',
'  }, 750);',
'}',
'',
'function setResult(pResultName)',
'{ ',
'  apex.item("P10_SEARCH").value = "";',
'  apex.item("P10_CATEGORY_NAME").value = "";',
'  apex.item("P10_RULE_NAME").value = "";',
'  apex.item("P10_FULL_PAGE_NAME").value = "";',
'  apex.item("P10_RESULT").value = pResultName;',
'  // wait .75 sec and refresh, else data is stale',
'  setTimeout(function() {',
'    apex.region("evaluationResults").refresh();',
'  }, 750);',
'}',
''))
,p_step_template=>wwv_flow_imp.id(511887609222949442)
,p_page_template_options=>'t-PageBody--noContentPadding'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24101677047690201)
,p_plug_name=>'Filter and Order By'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>30
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24101755491690202)
,p_plug_name=>'Order By'
,p_parent_plug_id=>wwv_flow_imp.id(24101677047690201)
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(539514060141541836)
,p_plug_name=>'Smart Filters'
,p_parent_plug_id=>wwv_flow_imp.id(24101677047690201)
,p_region_template_options=>'#DEFAULT#:margin-top-lg:margin-bottom-lg:margin-left-lg:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(512844835096907747)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(135704395201854055)
,p_plug_name=>'Exceptions'
,p_region_name=>'exceptions'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511921980148949486)
,p_plug_display_sequence=>80
,p_location=>null
,p_list_id=>wwv_flow_imp.id(136301758012484256)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(512247215948949598)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(136308553988728207)
,p_plug_name=>'Reports'
,p_region_name=>'reports'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511921980148949486)
,p_plug_display_sequence=>90
,p_location=>null
,p_list_id=>wwv_flow_imp.id(136314465783723109)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(512247215948949598)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206306377894400075)
,p_plug_name=>'Score'
,p_region_css_classes=>'refreshMe'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511921980148949486)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_02'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with ',
'   low_score  as (select eval_pkg.get_score_range(p_range_key => ''LOW_SCORE_VALUE'') as val from dual)',
'  ,high_score as (select eval_pkg.get_score_range(p_range_key => ''HIGH_SCORE_VALUE'') as val from dual)',
'select',
'  a.title',
'  ,a.val',
'  ,case ',
'    when a.val < low_score.val then ''danger''    ',
'    when a.val between low_score.val and high_score.val then ''warning''                   ',
'    else ''success''  ',
'   end as score_css',
'  ,case ',
'    when a.val < low_score.val then ''fa-remove'' ',
'    when a.val between low_score.val and high_score.val then ''fa-exclamation-triangle-o'' ',
'    else ''fa-check'' ',
'   end as score_icon',
'from',
'  (',
'  select',
'    ''Raw'' as title',
'    ,score as val',
'    ,3 as seq',
'  from ',
'    evals_pub_v ',
'  where ',
'    eval_id = :P10_EVAL_ID',
'  ',
'  union',
'  ',
'  select',
'    ''Pending'' as title',
'    ,pending_score as val',
'    ,2 as seq',
'  from ',
'    evals_pub_v ',
'  where ',
'    eval_id = :P10_EVAL_ID',
'  ',
'  union',
'  ',
'  select',
'    ''Approved'' as title',
'    ,approved_score as val',
'    ,1 as seq',
'  from ',
'    evals_pub_v ',
'  where ',
'    eval_id = :P10_EVAL_ID',
'  ) a',
'  ,low_score',
'  ,high_score',
'order by',
'  seq'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$MEDIA_LIST'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'N',
  'AVATAR_ICON', 'fa-user',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_TYPE', 'icon',
  'BADGE_ICON', '&SCORE_ICON.',
  'BADGE_LABEL', '&TITLE.',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_SHAPE', 't-Badge--rounded',
  'BADGE_STATE', 'SCORE_CSS',
  'BADGE_VALUE', 'VAL',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'Y',
  'TITLE', 'TITLE')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206686687647208767)
,p_name=>'TITLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TITLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>420
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206690667965234140)
,p_name=>'VAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>450
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206691407636234147)
,p_name=>'SCORE_CSS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCORE_CSS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>460
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(206691489209234148)
,p_name=>'SCORE_ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCORE_ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>470
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(512520232812424476)
,p_name=>'Context'
,p_template=>wwv_flow_imp.id(511920605950949485)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:margin-left-lg'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked'
,p_display_point=>'REGION_POSITION_01'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   eval_id',
'  ,job_status',
'  ,rule_set_name',
'  ,apex_version',
'  ,eval_on',
'  ,eval_by',
'  ,job_status_css',
'  ,application_id',
'  ,(',
'   select ',
'     substr',
'      (',
'       j.repeat_interval',
'      ,instr(j.repeat_interval, ''BYDAY='') + length(''BYDAY='')',
'      ,instr(j.repeat_interval || '';'', '';'', instr(j.repeat_interval, ''BYDAY='')) - (instr(j.repeat_interval, ''BYDAY='') + length(''BYDAY=''))',
'      ) ',
'      || '' at '' || TO_CHAR(TO_TIMESTAMP_TZ(TO_CHAR(j.next_run_date, ''YYYY-MM-DD HHPM:MI:SS TZH:TZM''),''YYYY-MM-DD HHPM:MI:SS TZH:TZM'') at time zone sessiontimezone, ''HH:MIPM'') ',
'    FROM ',
'      user_scheduler_jobs j',
'    where ',
'      job_name = ''SERT_SCHEDULED_EVAL_'' || application_id || ''_'' || rule_set_key ',
'    ) as schedule',
'from ',
'  evals_pub_v',
'where ',
'  eval_id = :P10_EVAL_ID'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(512221217471949568)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(138520689401093355)
,p_query_column_id=>1
,p_column_alias=>'EVAL_ID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512540177902529939)
,p_query_column_id=>2
,p_column_alias=>'JOB_STATUS'
,p_column_display_sequence=>10
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
' {with/}',
'        LABEL:=JOB_STATUS',
'        VALUE:=#JOB_STATUS#',
'        STATE:=#JOB_STATUS_CSS#',
'        ICON:=#BADGE_ICON#',
'        LABEL_DISPLAY:=N',
'    {apply THEME$BADGE/}'))
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512520862002424483)
,p_query_column_id=>3
,p_column_alias=>'RULE_SET_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Rule Set'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(130837507152746431)
,p_query_column_id=>4
,p_column_alias=>'APEX_VERSION'
,p_column_display_sequence=>30
,p_column_heading=>'Rules APEX Version'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512539777708529935)
,p_query_column_id=>5
,p_column_alias=>'EVAL_ON'
,p_column_display_sequence=>50
,p_column_heading=>'Evaluated on'
,p_column_format=>'DD-MON-YYYY HH:MIPM'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512539893611529936)
,p_query_column_id=>6
,p_column_alias=>'EVAL_BY'
,p_column_display_sequence=>40
,p_column_heading=>'Evaluated by'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(138602106186977720)
,p_query_column_id=>7
,p_column_alias=>'JOB_STATUS_CSS'
,p_column_display_sequence=>220
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(138600901248977708)
,p_query_column_id=>8
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(138603959907977739)
,p_query_column_id=>9
,p_column_alias=>'SCHEDULE'
,p_column_display_sequence=>60
,p_column_heading=>'Schedule'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if SCHEDULE/}',
'  #SCHEDULE#',
'{else/}',
'  None',
'{endif/}'))
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(512541624528529953)
,p_plug_name=>'Select Page'
,p_region_name=>'selectPageRegion'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(511962801151949524)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_04'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(512542316016529960)
,p_plug_name=>'Failures by Category'
,p_region_css_classes=>'refreshMe'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(511987240355949540)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_02'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(512542407412529961)
,p_region_id=>wwv_flow_imp.id(512542316016529960)
,p_chart_type=>'bar'
,p_height=>'250'
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
 p_id=>wwv_flow_imp.id(512542523497529962)
,p_chart_id=>wwv_flow_imp.id(512542407412529961)
,p_seq=>10
,p_name=>'Result Details'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   category_name',
'  ,count(*) as val',
'from ',
'  EVAL_RESULTS_PUB_V',
'where ',
'  eval_id = :P10_EVAL_ID',
'  and result = ''FAIL''',
'group by',
'  category_name',
'order by',
'  2 desc   '))
,p_items_value_column_name=>'VAL'
,p_items_label_column_name=>'CATEGORY_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:setCategory("&CATEGORY_NAME.");'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(512542597334529963)
,p_chart_id=>wwv_flow_imp.id(512542407412529961)
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
 p_id=>wwv_flow_imp.id(512542689483529964)
,p_chart_id=>wwv_flow_imp.id(512542407412529961)
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
 p_id=>wwv_flow_imp.id(512844835096907747)
,p_plug_name=>'Evaluation Results'
,p_region_name=>'evaluationResults'
,p_region_css_classes=>'refreshMe'
,p_region_template_options=>'#DEFAULT#:margin-bottom-lg:margin-left-lg:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(511921980148949486)
,p_plug_display_sequence=>60
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  eval_result_id,',
'        eval_id,',
'        rule_set_id,',
'        workspace_id,',
'        application_id,',
'        page_id,',
'        page_name,',
'        page,',
'        full_page_name,',
'        description,',
'        region_name,',
'        component_id,',
'        component_name,',
'        column_name,',
'        item_name,',
'        shared_comp_name,',
'        shared_comp_type,',
'        category_name,',
'        category_key,',
'        current_value,',
'        exception_value,',
'        valid_values,',
'        result,',
'        result_color,',
'        reason,',
'        rule_id,',
'        rule_name,',
'        risk_name,',
'        risk_url,',
'        risk,',
'        help_url,',
'        impact,',
'        rule_criteria_type_name,',
'        comment_cnt,',
'        comment_icon,',
'        created_by,',
'        created_on,',
'        updated_by,',
'        updated_on,',
'        exception_id,',
'        exception_created_by,',
'        exception_key,',
'        exception_justification,',
'        pending_icon,',
'        exception_description,',
'        rule_severity_id,',
'        rule_severity_name',
'        -- case when exception_id is not null and result=''PENDING''',
'        --        then ''Raised by ''||exception_created_by',
'        --      when exception_id is not null and result=''APPROVED''',
'        --        then  ''Approved by ''||exception_actioned_by',
'        --      else null',
'        -- end as exception_description',
'from eval_results_exc_pub_v',
'where eval_id = :P10_EVAL_ID',
'--  order by page_id, rule_name, description'))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"category_name","expr":"category_name"},{"key":"page_id","expr":"page_id asc nulls last, category_name,rule_name"},{"key":"risk_name","expr":"risk_name,page_id asc nulls first"},{"key":"rule_name","expr":"rule_name,page_id asc nul'
||'ls first"},{"key":"rule_criteria_type_name","expr":"rule_criteria_type_name,rule_name,page_id asc nulls first"}],"itemName":"P10_ORDER_BY"}'
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_ajax_items_to_submit=>'P10_CATEGORY_NAME,P10_RESULT'
,p_plug_query_num_rows=>30
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>true
,p_plug_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--lg',
  'BADGE_LABEL', '&RESULT.',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_STATE', 'RESULT_COLOR',
  'BADGE_VALUE', 'RESULT',
  'DESCRIPTION', wwv_flow_string.join(wwv_flow_t_varchar2(
    '&DESCRIPTION.',
    '<div class="t-ContentRow-overline">&EXCEPTION_DESCRIPTION.</div>')),
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'Y',
  'HIDE_BORDERS', 'N',
  'MISC', '<span class="&COMMENT_ICON."</span>&nbsp;&COMMENT_CNT.',
  'OVERLINE', '&CATEGORY_NAME.',
  'REMOVE_PADDING', 'Y',
  'TITLE', '&RULE_NAME.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(64682146006726668)
,p_name=>'RULE_SEVERITY_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_SEVERITY_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>460
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(64682235889726669)
,p_name=>'RULE_SEVERITY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_SEVERITY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>470
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111282485281396130)
,p_name=>'PAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>300
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111282608446396131)
,p_name=>'COMPONENT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPONENT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>310
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111282675576396132)
,p_name=>'SHARED_COMP_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHARED_COMP_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>320
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111282809698396133)
,p_name=>'EXCEPTION_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXCEPTION_VALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>330
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111282886405396134)
,p_name=>'RISK_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RISK_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>340
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111282970551396135)
,p_name=>'RISK_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RISK_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>350
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111283040984396136)
,p_name=>'RISK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RISK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>360
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111283193326396137)
,p_name=>'HELP_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HELP_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>370
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111283298149396138)
,p_name=>'IMPACT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPACT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>380
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111283336918396139)
,p_name=>'RULE_CRITERIA_TYPE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_CRITERIA_TYPE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>390
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111283521697396140)
,p_name=>'EXCEPTION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXCEPTION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>400
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111283548607396141)
,p_name=>'EXCEPTION_CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXCEPTION_CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>410
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111283681196396142)
,p_name=>'EXCEPTION_KEY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXCEPTION_KEY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>420
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111283755176396143)
,p_name=>'EXCEPTION_JUSTIFICATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXCEPTION_JUSTIFICATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>430
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111630294777737320)
,p_name=>'PENDING_ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PENDING_ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>440
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(111630510428737322)
,p_name=>'EXCEPTION_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXCEPTION_DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>450
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512847065209907770)
,p_name=>'EVAL_RESULT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVAL_RESULT_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512847232973907771)
,p_name=>'EVAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVAL_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512847301746907772)
,p_name=>'APPLICATION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512847434282907773)
,p_name=>'PAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512847464148907774)
,p_name=>'PAGE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512847561318907775)
,p_name=>'REGION_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REGION_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>60
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512847653090907776)
,p_name=>'COMPONENT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPONENT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>70
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512847757186907777)
,p_name=>'COLUMN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COLUMN_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>80
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512847863319907778)
,p_name=>'ITEM_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>90
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512848001738907779)
,p_name=>'CATEGORY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CATEGORY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>100
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512848060375907780)
,p_name=>'CATEGORY_KEY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CATEGORY_KEY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>110
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512848195023907781)
,p_name=>'CURRENT_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CURRENT_VALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>120
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512848306151907782)
,p_name=>'VALID_VALUES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALID_VALUES'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>130
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512848380317907783)
,p_name=>'RESULT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESULT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>140
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512898421814999334)
,p_name=>'RESULT_COLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESULT_COLOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>150
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512898537515999335)
,p_name=>'REASON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REASON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>160
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512898587796999336)
,p_name=>'RULE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>170
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512898708212999337)
,p_name=>'RULE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>180
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512898759448999338)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>200
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512898892269999339)
,p_name=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>210
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512898970445999340)
,p_name=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>220
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(512899082436999341)
,p_name=>'UPDATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>230
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(513471033233831059)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>190
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(517558350681243074)
,p_name=>'RULE_SET_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_SET_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>240
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(517558499320243075)
,p_name=>'WORKSPACE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WORKSPACE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>250
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(517558614602243076)
,p_name=>'COMMENT_CNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENT_CNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>260
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(517558716957243077)
,p_name=>'COMMENT_ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENT_ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>270
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518750686410790134)
,p_name=>'FULL_PAGE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FULL_PAGE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>280
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(522756761961735241)
,p_name=>'SHARED_COMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHARED_COMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>290
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(513569743333255060)
,p_plug_name=>'Actions'
,p_region_name=>'actions'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511921980148949486)
,p_plug_display_sequence=>70
,p_location=>null
,p_list_id=>wwv_flow_imp.id(513596220020445673)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(512247215948949598)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(524437418623721458)
,p_plug_name=>'Results by Status'
,p_region_css_classes=>'refreshMe'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(511987240355949540)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_02'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(524437516996721459)
,p_region_id=>wwv_flow_imp.id(524437418623721458)
,p_chart_type=>'bar'
,p_height=>'250'
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
 p_id=>wwv_flow_imp.id(524437643482721460)
,p_chart_id=>wwv_flow_imp.id(524437516996721459)
,p_seq=>10
,p_name=>'Result Details'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  result,',
'        case',
'          when result in (''FAIL'',''REJECTED'') then ''#D63B25'' ',
'          when result in (''APPROVED'',''PASS'') then ''#508223'' ',
'          when result = ''PENDING''            then ''#AC630C''',
'          else null ',
'        end as color,',
'        count(*) as val',
'from EVAL_RESULTS_PUB_V',
'where eval_id = :P10_EVAL_ID',
'group by result',
'order by val desc'))
,p_items_value_column_name=>'VAL'
,p_items_label_column_name=>'RESULT'
,p_custom_column_name=>'COLOR'
,p_color=>'&COLOR.'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:setResult("&RESULT.");'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(528554153467478457)
,p_chart_id=>wwv_flow_imp.id(524437516996721459)
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
 p_id=>wwv_flow_imp.id(524437702298721461)
,p_chart_id=>wwv_flow_imp.id(524437516996721459)
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
 p_id=>wwv_flow_imp.id(524437831379721462)
,p_chart_id=>wwv_flow_imp.id(524437516996721459)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(512542173885529959)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(512541624528529953)
,p_button_name=>'RE-EVALUATE_PAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(136308457693728206)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(533511275641804087)
,p_button_name=>'REPORTS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Reports'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-down'
,p_button_cattributes=>'data-menu="reports_menu"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(135704296203854054)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(533511275641804087)
,p_button_name=>'EXCEPTIONS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Exceptions'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'10'
,p_button_condition_type=>'CURRENT_PAGE_IN_CONDITION'
,p_icon_css_classes=>'fa-angle-down'
,p_button_cattributes=>'data-menu="exceptions_menu"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(513569783871255061)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(533511275641804087)
,p_button_name=>'EVALUATION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Evaluation'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-down'
,p_button_cattributes=>'data-menu="actions_menu"'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(518921818436197842)
,p_branch_name=>'Stay on Evaluation Summary'
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'RE-EVALUATE,RE-EVALUATE_PAGE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(518921733524197841)
,p_branch_name=>'Return to Home Page'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'DELETE_EVALUATION,RE-EVALUATE_BACKGROUND'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64681966834726666)
,p_name=>'P10_RULE_SEVERITY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(539514060141541836)
,p_prompt=>'Severity'
,p_source=>'RULE_SEVERITY_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'RULE_SEVERITY_V'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rule_severity_name d, rule_severity_id r',
'from sert_core.rule_severity_v',
'order by seq'))
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_compute_counts=>false
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(72263835662958370)
,p_name=>'P10_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(24101755491690202)
,p_item_default=>'category_name'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Order by Category;category_name,Order by Page #;page_id,Order by Risk Type;risk_name,Order by Rule;rule_name,Order by Rule Criteria;rule_criteria_type_name'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(512257796880949612)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(111630619028737323)
,p_name=>'P10_RAISED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(539514060141541836)
,p_prompt=>'Raised By'
,p_source=>'EXCEPTION_CREATED_BY'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_compute_counts=>false
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_display_as=>'INLINE'
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(512541672860529954)
,p_name=>'P10_PAGE_ID'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(512541624528529953)
,p_prompt=>'Page'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  page_id || '' - '' || page_name a',
'  ,page_id',
'from',
'  apex_application_pages',
'where',
'  application_id = (select application_id from evals_pub_v where eval_id = :P10_EVAL_ID)',
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
 p_id=>wwv_flow_imp.id(512844568573907745)
,p_name=>'P10_EVAL_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(539514278534541838)
,p_name=>'P10_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(539514060141541836)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(539514378857541839)
,p_name=>'P10_RESULT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(539514060141541836)
,p_prompt=>'Result'
,p_source=>'RESULT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_display_as=>'INLINE'
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(539514506696541840)
,p_name=>'P10_FULL_PAGE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(539514060141541836)
,p_prompt=>'Page'
,p_source=>'FULL_PAGE_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_compute_counts=>false
,p_fc_filter_values=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_display_as=>'INLINE'
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(539514585999541841)
,p_name=>'P10_RULE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(539514060141541836)
,p_prompt=>'Rule'
,p_source=>'RULE_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_compute_counts=>false
,p_fc_filter_values=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_display_as=>'INLINE'
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(539514723772541842)
,p_name=>'P10_CATEGORY_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(539514060141541836)
,p_prompt=>'Category'
,p_source=>'CATEGORY_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_compute_counts=>false
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_display_as=>'INLINE'
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(512142573028448441)
,p_computation_sequence=>10
,p_computation_item=>'G_EVAL_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select '' for '' || application_name || '' (App '' || application_id || '')'' from evals_pub_v where eval_id = :P10_EVAL_ID'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(512543213603529969)
,p_computation_sequence=>30
,p_computation_item=>'P10_PAGE_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(513570124507255064)
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
 p_id=>wwv_flow_imp.id(513570152331255065)
,p_event_id=>wwv_flow_imp.id(513570124507255064)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RE-EVALUATE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(518921017936197834)
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
 p_id=>wwv_flow_imp.id(518921105795197835)
,p_event_id=>wwv_flow_imp.id(518921017936197834)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RE-EVALUATE_BACKGROUND'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(513570340433255066)
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
 p_id=>wwv_flow_imp.id(513570369795255067)
,p_event_id=>wwv_flow_imp.id(513570340433255066)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(512541624528529953)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(518921266393197837)
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
 p_id=>wwv_flow_imp.id(518921383109197838)
,p_event_id=>wwv_flow_imp.id(518921266393197837)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to delete this evaluation?  All notes and exceptions will also be deleted.'
,p_attribute_02=>'Confirm Deletion'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(518921478896197839)
,p_event_id=>wwv_flow_imp.id(518921266393197837)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DELETE_EVALUATION'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(110673498088950661)
,p_name=>'Refresh page'
,p_event_sequence=>100
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(110673543633950662)
,p_event_id=>wwv_flow_imp.id(110673498088950661)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(512844835096907747)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111700854004174857)
,p_event_id=>wwv_flow_imp.id(110673498088950661)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(512520232812424476)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111700937709174858)
,p_event_id=>wwv_flow_imp.id(110673498088950661)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(524437418623721458)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111701037171174859)
,p_event_id=>wwv_flow_imp.id(110673498088950661)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(512542316016529960)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111701154198174860)
,p_event_id=>wwv_flow_imp.id(110673498088950661)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(206306377894400075)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(512541151472529949)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate Application'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P10_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P10_EVAL_ID',
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
,p_internal_uid=>21481602931857816
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(518921228297197836)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate in the Background'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P10_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P10_EVAL_ID',
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
,p_internal_uid=>27861679756525703
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(512542019892529957)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate for a Page'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P10_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P10_EVAL_ID',
'    ,p_page_id           => :P10_PAGE_ID',
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
,p_internal_uid=>21482471351857824
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(518921573684197840)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Evaluation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P10_EVAL_ID)',
'loop',
'  eval_pkg.delete_eval',
'    (',
'    p_eval_id           => :P10_EVAL_ID',
'    );',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_EVALUATION'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Evaluation Deleted'
,p_internal_uid=>27862025143525707
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(135701110174854022)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Download Exceptions'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'EXCEPTIONS_API'
,p_attribute_04=>'DOWNLOAD_EXCEPTIONS'
,p_process_when=>'DOWNLOAD_EXCEPTIONS'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>16208976635053417
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(135701240060854024)
,p_page_process_id=>wwv_flow_imp.id(135701110174854022)
,p_page_id=>10
,p_name=>'p_application_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'SQL_QUERY'
,p_value=>'select application_id from evals_pub_v where eval_id = :P10_EVAL_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(135701513253854026)
,p_page_process_id=>wwv_flow_imp.id(135701110174854022)
,p_page_id=>10
,p_name=>'p_eval_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P10_EVAL_ID'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(111630344146737321)
,p_region_id=>wwv_flow_imp.id(512844835096907747)
,p_position_id=>wwv_flow_imp.id(2320741672992811968)
,p_display_sequence=>10
,p_template_id=>wwv_flow_imp.id(2320742274669843097)
,p_label=>'Approve/Reject'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:30:G_EVAL_RESULT_ID:&EVAL_RESULT_ID.'
,p_button_display_type=>'TEXT'
,p_action_css_classes=>'t-Button t-Button--gapRight'
,p_is_hot=>false
,p_show_as_disabled=>false
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>':RESULT = ''PENDING'' and :EXCEPTION_CREATED_BY <> :APP_USER'
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(512899198816999342)
,p_region_id=>wwv_flow_imp.id(512844835096907747)
,p_position_id=>wwv_flow_imp.id(2320741672992811968)
,p_display_sequence=>20
,p_template_id=>wwv_flow_imp.id(2320743534189847245)
,p_label=>'Menu'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-navicon'
,p_is_hot=>false
,p_show_as_disabled=>false
,p_authorization_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(513471100974831060)
,p_region_id=>wwv_flow_imp.id(512844835096907747)
,p_position_id=>wwv_flow_imp.id(2307148645995436364)
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.::G_EVAL_RESULT_ID:&EVAL_RESULT_ID.'
,p_authorization_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(512899312259999343)
,p_component_action_id=>wwv_flow_imp.id(512899198816999342)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Result Details'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.::G_EVAL_RESULT_ID:&EVAL_RESULT_ID.'
,p_icon_css_classes=>'fa-info-circle-o'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(512899610501999346)
,p_component_action_id=>wwv_flow_imp.id(512899198816999342)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Exception'
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:30:G_EVAL_RESULT_ID:&EVAL_RESULT_ID.'
,p_icon_css_classes=>'fa-workflow'
,p_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_condition_expr1=>'RESULT'
,p_condition_expr2=>'PASS'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(512899725083999347)
,p_component_action_id=>wwv_flow_imp.id(512899198816999342)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Comments'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:20:G_EVAL_RESULT_ID:&EVAL_RESULT_ID.'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(512947822979523847)
,p_component_action_id=>wwv_flow_imp.id(512899198816999342)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit in APEX'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
,p_icon_css_classes=>'fa-apex'
,p_build_option_id=>wwv_flow_imp.id(511883277556949400)
);
wwv_flow_imp.component_end;
end;
/
