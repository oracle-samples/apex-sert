-- file_checksum: 1951869037FD3DEF28BE2B369DA4F6500A6A8E070C2754F61B55C049057957E3
prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>2
,p_name=>'Activity Log'
,p_alias=>'ACTIVITY-LOG'
,p_step_title=>'Activity Log'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(30658409527755022737)
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32681451191150989922)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(30658404260306022718)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(32681451855388989930)
,p_name=>'Search Results'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_show_most_active_day_only boolean := (:P2_MOST_ACTIVE_ONLY = ''Y'');',
'begin',
'    if l_show_most_active_day_only then',
'return q''~',
'select t.workspace, t.log_day, t.workspace_id, t.application_id, t.application_name, t.app_size, t.pages,',
'       case when a.application_id is null then ''N'' else ''Y'' end sert_evaluation,',
'       -- metrics',
'       dense_rank() over (order by t.page_events desc, t.application_name) rank, ',
'       t.page_events, t.page_views, t.page_accepts, t.partial_page_views, t.rows_fetched, t.ir_searches,',
'       t.distinct_pages, t.distinct_users, t.distinct_sessions, ',
'       t.average_render_time, t.median_render_time, t.maximum_render_time, t.total_render_time, ',
'       t.error_count',
'  from SG_MOST_4WK_APP_ACTIVITY_F t',
'  left join SG_APPLICATIONS_D a on (t.workspace_id = a.workspace_id and t.application_id = a.application_id)',
'~'';',
'    else',
'return q''~',
'select t.workspace, t.log_day, t.workspace_id, t.application_id, t.application_name, t.app_size, t.pages,',
'       case when a.application_id is null then ''N'' else ''Y'' end sert_evaluation,',
'       -- metrics',
'       dense_rank() over (order by t.page_events desc, t.application_name) rank, ',
'       t.page_events, t.page_views, t.page_accepts, t.partial_page_views, t.rows_fetched, t.ir_searches,',
'       t.distinct_pages, t.distinct_users, t.distinct_sessions, ',
'       t.average_render_time, t.median_render_time, t.maximum_render_time, t.total_render_time, ',
'       t.error_count',
'  from SG_DAILY_APP_ACTIVITY_F t',
'  left join SG_APPLICATIONS_D a on (t.workspace_id = a.workspace_id and t.application_id = a.application_id)',
' where t.log_day >= (',
'            select trunc(cast(max(start_timestamp) as date)) - 28',
'              from sg_etl_execution_log',
'             where pipeline_id = 1',
'               and status = ''COMPLETED'' )',
'',
'~'';',
'    end if;',
'end;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2_MOST_ACTIVE_ONLY'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>100000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681455497620989938)
,p_query_column_id=>1
,p_column_alias=>'WORKSPACE'
,p_column_display_sequence=>1
,p_column_heading=>'Workspace'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681455932272989938)
,p_query_column_id=>2
,p_column_alias=>'LOG_DAY'
,p_column_display_sequence=>2
,p_column_heading=>'Log Day'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681456249515989939)
,p_query_column_id=>3
,p_column_alias=>'WORKSPACE_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Workspace Id'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''WORKSPACE_ID'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681456673109989939)
,p_query_column_id=>4
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Application Id'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''APPLICATION_ID'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681457064566989940)
,p_query_column_id=>5
,p_column_alias=>'APPLICATION_NAME'
,p_column_display_sequence=>5
,p_column_heading=>'Application Name'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_APPLICATION_ID,P6_WORKSPACE_ID:#APPLICATION_ID#,#WORKSPACE_ID#'
,p_column_linktext=>'#APPLICATION_NAME#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681457931587989940)
,p_query_column_id=>6
,p_column_alias=>'APP_SIZE'
,p_column_display_sequence=>7
,p_column_heading=>'App Size'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32429706432590839850)
,p_query_column_id=>7
,p_column_alias=>'PAGES'
,p_column_display_sequence=>17
,p_column_heading=>'Pages'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681460276098989944)
,p_query_column_id=>8
,p_column_alias=>'SERT_EVALUATION'
,p_column_display_sequence=>37
,p_column_heading=>'SERT Eval'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681457513152989940)
,p_query_column_id=>9
,p_column_alias=>'RANK'
,p_column_display_sequence=>27
,p_column_heading=>'Rank'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681458289240989941)
,p_query_column_id=>10
,p_column_alias=>'PAGE_EVENTS'
,p_column_display_sequence=>47
,p_column_heading=>'Page Events'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''PAGE_EVENTS'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681458730918989941)
,p_query_column_id=>11
,p_column_alias=>'PAGE_VIEWS'
,p_column_display_sequence=>57
,p_column_heading=>'Page Views'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''PAGE_VIEWS'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681459072994989942)
,p_query_column_id=>12
,p_column_alias=>'PAGE_ACCEPTS'
,p_column_display_sequence=>67
,p_column_heading=>'Page Accepts'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''PAGE_ACCEPTS'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681459521273989943)
,p_query_column_id=>13
,p_column_alias=>'PARTIAL_PAGE_VIEWS'
,p_column_display_sequence=>77
,p_column_heading=>'Partial Page Views'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''PARTIAL_PAGE_VIEWS'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681459932679989943)
,p_query_column_id=>14
,p_column_alias=>'ROWS_FETCHED'
,p_column_display_sequence=>87
,p_column_heading=>'Rows Fetched'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''ROWS_FETCHED'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32429706497393839851)
,p_query_column_id=>15
,p_column_alias=>'IR_SEARCHES'
,p_column_display_sequence=>97
,p_column_heading=>'IR Searches'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''IR_SEARCHES'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32429706622335839852)
,p_query_column_id=>16
,p_column_alias=>'DISTINCT_PAGES'
,p_column_display_sequence=>107
,p_column_heading=>'Distinct Pages'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''DISTINCT_PAGES'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32429706692390839853)
,p_query_column_id=>17
,p_column_alias=>'DISTINCT_USERS'
,p_column_display_sequence=>117
,p_column_heading=>'Distinct Users'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''DISTINCT_USERS'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32429706758927839854)
,p_query_column_id=>18
,p_column_alias=>'DISTINCT_SESSIONS'
,p_column_display_sequence=>127
,p_column_heading=>'Distinct Sessions'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''DISTINCT_SESSIONS'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32429706903413839855)
,p_query_column_id=>19
,p_column_alias=>'AVERAGE_RENDER_TIME'
,p_column_display_sequence=>137
,p_column_heading=>'Avg Render Time'
,p_column_format=>'999G999G999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''AVERAGE_RENDER_TIME'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32429706953508839856)
,p_query_column_id=>20
,p_column_alias=>'MEDIAN_RENDER_TIME'
,p_column_display_sequence=>147
,p_column_heading=>'Med Render Time'
,p_column_format=>'999G999G999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''MEDIAN_RENDER_TIME'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32429707078938839857)
,p_query_column_id=>21
,p_column_alias=>'MAXIMUM_RENDER_TIME'
,p_column_display_sequence=>157
,p_column_heading=>'Max Render Time'
,p_column_format=>'999G999G999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''MAXIMUM_RENDER_TIME'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32429707195577839858)
,p_query_column_id=>22
,p_column_alias=>'TOTAL_RENDER_TIME'
,p_column_display_sequence=>167
,p_column_heading=>'Total Render Time'
,p_column_format=>'999G999G999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''TOTAL_RENDER_TIME'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32681967899133105210)
,p_query_column_id=>23
,p_column_alias=>'ERROR_COUNT'
,p_column_display_sequence=>177
,p_column_heading=>'Error Count'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P2_SHOW_COLUMNS,''ERROR_COUNT'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32681452014996989930)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(32681451855388989930)
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
 p_id=>wwv_flow_imp.id(32681454389812989934)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>'<div id="active_facets"></div>'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32681968020240105211)
,p_plug_name=>'Hide/Show Columns'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400:t-Form--leftLabels:t-Form--labelsAbove:margin-top-none'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_04'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(32681968352235105215)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(32681968020240105211)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(32681968324496105214)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(32681968020240105211)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(32681970311622105234)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(32681454389812989934)
,p_button_name=>'MOST_ACTIVE_DAY_ONLY'
,p_button_static_id=>'MOST_ACTIVE_DAY_ONLY'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Most active day only'
,p_button_position=>'NEXT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-fw fa-lg fa-toggle-off'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(32681968738448105218)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(32681454389812989934)
,p_button_name=>'SELECT_COLUMNS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Select Columns'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-table-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(32681454849297989936)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(32681454389812989934)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:RR,2::'
,p_icon_css_classes=>'fa-undo'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32681452477498989931)
,p_name=>'P2_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(32681452014996989930)
,p_prompt=>'Search'
,p_source=>'WORKSPACE,APPLICATION_NAME,APP_SIZE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_collapsible=>false
,p_fc_initial_collapsed=>false
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32681452885109989932)
,p_name=>'P2_WORKSPACE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(32681452014996989930)
,p_prompt=>'Workspace'
,p_source=>'WORKSPACE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_fc_collapsible=>false
,p_fc_initial_collapsed=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32681453700552989933)
,p_name=>'P2_APP_SIZE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(32681452014996989930)
,p_prompt=>'App Size'
,p_source=>'APP_SIZE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>true
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
,p_multi_value_trim_space=>false
,p_fc_filter_combination=>'OR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32681454127728989934)
,p_name=>'P2_SERT_EVALUATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(32681452014996989930)
,p_prompt=>'SERT Evaluation'
,p_source=>'SERT_EVALUATION'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'D'
,p_fc_show_more_count=>2
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32681968148874105213)
,p_name=>'P2_SHOW_COLUMNS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(32681968020240105211)
,p_item_default=>'SPARKLINE_DATA:RANK:LOG_DAY:PAGE_EVENTS:PAGE_VIEWS:PAGE_ACCEPTS:PARTIAL_PAGE_VIEWS:ROWS_FETCHED'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>'STATIC2:Workspace Id;WORKSPACE_ID,Application Id;APPLICATION_ID,Pages;PAGES,Page Events;PAGE_EVENTS,Page Views;PAGE_VIEWS,Page Accepts;PAGE_ACCEPTS,Partial Page Views;PARTIAL_PAGE_VIEWS,Rows Fetched;ROWS_FETCHED,IR Searches;IR_SEARCHES,Distinct Pages'
||';DISTINCT_PAGES,Distinct Users;DISTINCT_USERS,Distinct Sessions;DISTINCT_SESSIONS,Avg Render Time;AVERAGE_RENDER_TIME,Med Render Time;MEDIAN_RENDER_TIME,Max Render Time;MAXIMUM_RENDER_TIME,Total Render Time;TOTAL_RENDER_TIME,Error Count;ERROR_COUNT'
,p_cHeight=>15
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-none'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_protection_level=>'P'
,p_inline_help_text=>'Column order is fixed, and not determined by order shown here.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_controls', 'MOVE')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32681969854617105230)
,p_name=>'P2_APPLICATION_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(32681452014996989930)
,p_prompt=>'Application'
,p_source=>'APPLICATION_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_depending_on_id=>wwv_flow_imp.id(32681452885109989932)
,p_depending_on_condition_type=>'NOT_NULL'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>false
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32681970211778105233)
,p_name=>'P2_MOST_ACTIVE_ONLY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(32681454389812989934)
,p_item_display_point=>'CHANGE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'U'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(32681968463924105216)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(32681968352235105215)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(32681968636437105217)
,p_event_id=>wwv_flow_imp.id(32681968463924105216)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(32681968020240105211)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(32681968779750105219)
,p_name=>'Open Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(32681968738448105218)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(32681968884659105220)
,p_event_id=>wwv_flow_imp.id(32681968779750105219)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(32681968020240105211)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(32681970350713105235)
,p_name=>'Toggle State'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_MOST_ACTIVE_ONLY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(32681971015842105241)
,p_event_id=>wwv_flow_imp.id(32681970350713105235)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Toggle Icon'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Get the value of the page item',
'var itemValue = $v(''P2_MOST_ACTIVE_ONLY'');',
'var $icon = $(''#MOST_ACTIVE_DAY_ONLY .t-Icon'');',
'',
'// Check the item value and set the appropriate class',
'if (itemValue === ''Y'') {',
'    // If the value is ''Y'', show the ''on'' icon',
'    $icon.removeClass(''fa-toggle-off'').addClass(''fa-toggle-on'');',
'} else {',
'    // otherwise, show the ''off'' icon',
'    $icon.removeClass(''fa-toggle-on'').addClass(''fa-toggle-off'');',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(32681970683247105238)
,p_name=>'New'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(32681970311622105234)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(32681970774080105239)
,p_event_id=>wwv_flow_imp.id(32681970683247105238)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Toggle, Persist, and Return Most Active Only'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P2_MOST_ACTIVE_ONLY := case',
'    when :P2_MOST_ACTIVE_ONLY = ''Y''',
'    then ''N''',
'    else ''Y''',
'end;'))
,p_attribute_02=>'P2_MOST_ACTIVE_ONLY'
,p_attribute_03=>'P2_MOST_ACTIVE_ONLY'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(32681971121116105242)
,p_event_id=>wwv_flow_imp.id(32681970683247105238)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Search'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(32681452014996989930)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(32681971334944105244)
,p_event_id=>wwv_flow_imp.id(32681970683247105238)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Search Results'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(32681451855388989930)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(69403616256420325)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Default Show Columns'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P2_SHOW_COLUMNS is null then',
'    :P2_SHOW_COLUMNS := ''SPARKLINE_DATA:RANK:LOG_DAY:PAGE_EVENTS:PAGE_VIEWS:PAGE_ACCEPTS:PARTIAL_PAGE_VIEWS:ROWS_FETCHED'';',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>69403616256420325
);
wwv_flow_imp.component_end;
end;
/
