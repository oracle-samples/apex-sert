-- file_checksum: 334FAE09754D33540EFE92597D33C6C8AABEEFCABAE6EE31951F4ED869F1DB95
prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'SERT Guardian'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Remove box-shadow from Standard region (default) */',
'.t-Region {',
'    box-shadow: none;',
'}',
'',
'/* Ensure the table header is sticky for the ''top-apps'' region */',
'#top-apps .t-Report-report thead {',
'    position: sticky;',
'    top: 0;',
'    z-index: 10; /* Ensure it''s high enough */',
'    /* Add a solid border to the entire header area */',
'    border-bottom: 1px solid var(--ut-border-color, #D0D0D0);',
'}',
'',
'/* Make the header cells opaque with a solid background color */',
'#top-apps .t-Report-report thead th {',
'    background-color: var(--ut-body-bg, #F7F7F7);',
'    background: #F7F7F7; ',
'    /* Remove individual th borders if the thead border is used */',
'    border-bottom: none; ',
'}',
'',
'/* Align app size region with Context region elements */',
'.app-size-col {',
'    padding-left: 4px;',
'    padding-right: 4px;',
'}',
'',
'/* Adjust dialog width for synchronization confirmation message */',
'.ui-dialog--notification {',
'    width: 400px !important;',
'}',
'',
'/* Fix the sparkline cell to minimum width needed */',
'td[headers="SPARKLINE_DATA"] {',
'    width: 156px;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(30658409527755022737)
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30658411073534022746)
,p_plug_name=>'SERT Guardian'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2674017834225413037
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_query_num_rows=>15
,p_plug_header=>'<p class="u-text-body-xs">Last Synchronized: &P1_LAST_SYNC.</p>'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(30658838445810046993)
,p_name=>'Context'
,p_template=>4072358936313175081
,p_display_sequence=>21
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--medium:t-BadgeList--dash:t-BadgeList--fixed:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.workspaces, f.applications, f.pages, f.sert_workspaces, f.sert_applications, f.sert_pages, f.evaluations, f.avg_score, f.app_coverage',
'  from sert_core.sg_instance_metrics_f f',
' order by date_wid desc',
' fetch first 1 rows only'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2104643962563030528
,p_query_num_rows=>20
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(30658838490922046994)
,p_query_column_id=>1
,p_column_alias=>'WORKSPACES'
,p_column_display_sequence=>10
,p_column_heading=>'Workspaces'
,p_column_format=>'999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(30658838637451046995)
,p_query_column_id=>2
,p_column_alias=>'APPLICATIONS'
,p_column_display_sequence=>20
,p_column_heading=>'Applications'
,p_column_format=>'999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(30658838724752046996)
,p_query_column_id=>3
,p_column_alias=>'PAGES'
,p_column_display_sequence=>30
,p_column_heading=>'Pages'
,p_column_format=>'999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(30658838785250046997)
,p_query_column_id=>4
,p_column_alias=>'SERT_WORKSPACES'
,p_column_display_sequence=>40
,p_column_heading=>'SERT Workspaces'
,p_column_format=>'999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(30658838967842046998)
,p_query_column_id=>5
,p_column_alias=>'SERT_APPLICATIONS'
,p_column_display_sequence=>50
,p_column_heading=>'SERT Applications'
,p_column_format=>'999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(30658839033992046999)
,p_query_column_id=>6
,p_column_alias=>'SERT_PAGES'
,p_column_display_sequence=>60
,p_column_heading=>'SERT Pages'
,p_column_format=>'999G999G999G999G990'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(192566973409966509)
,p_query_column_id=>7
,p_column_alias=>'EVALUATIONS'
,p_column_display_sequence=>70
,p_column_heading=>'Evaluations'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(30658839268527047001)
,p_query_column_id=>8
,p_column_alias=>'AVG_SCORE'
,p_column_display_sequence=>80
,p_column_heading=>'Avg Score'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(30658839300004047002)
,p_query_column_id=>9
,p_column_alias=>'APP_COVERAGE'
,p_column_display_sequence=>90
,p_column_heading=>'App Coverage'
,p_column_format=>'999G999G999G999G990D00'
,p_column_html_expression=>'#APP_COVERAGE#%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(31263056581297046093)
,p_name=>'Top applications'
,p_title=>'Top applications by daily activity for past 4 weeks'
,p_region_name=>'top-apps'
,p_template=>4072358936313175081
,p_display_sequence=>61
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody:margin-top-md'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.workspace, t.workspace_id, t.application_id, t.application_name, t.app_size,',
'       t.sparkline_data,',
'       nvl2(a.application_id, ''var(--u-color-5)'', ''var(--u-color-9)'') bar_color,',
'       dense_rank() over (order by t.page_events desc, t.application_name) rank, ',
'       t.log_day, ',
'       t.page_events, t.page_views, t.page_accepts, t.partial_page_views, t.rows_fetched,',
'       case when a.application_id is null then ''N'' else ''Y'' end sert_evaluation',
'  from SG_MOST_4WK_APP_ACTIVITY_F t',
'  left join SG_APPLICATIONS_D a on (t.workspace_id = a.workspace_id and t.application_id = a.application_id)',
' order by t.page_events desc, t.application_name',
' fetch first 30 rows only'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>30
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31263056723298046094)
,p_query_column_id=>1
,p_column_alias=>'WORKSPACE'
,p_column_display_sequence=>10
,p_column_heading=>'Workspace'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31263056947107046096)
,p_query_column_id=>2
,p_column_alias=>'WORKSPACE_ID'
,p_column_display_sequence=>30
,p_column_heading=>'Workspace Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31263056984205046097)
,p_query_column_id=>3
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>40
,p_column_heading=>'Application Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31263057124391046098)
,p_query_column_id=>4
,p_column_alias=>'APPLICATION_NAME'
,p_column_display_sequence=>50
,p_column_heading=>'Application Name'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_WORKSPACE_ID,P6_APPLICATION_ID:#WORKSPACE_ID#,#APPLICATION_ID#'
,p_column_linktext=>'#APPLICATION_NAME#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32429706162896839848)
,p_query_column_id=>5
,p_column_alias=>'APP_SIZE'
,p_column_display_sequence=>60
,p_column_heading=>'Size'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(34814341977581673709)
,p_query_column_id=>6
,p_column_alias=>'SPARKLINE_DATA'
,p_column_display_sequence=>70
,p_column_heading=>'Daily Activity'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<oj-spark-chart ',
'    type="bar" ',
'    items="[#SPARKLINE_DATA#]" ',
'    color="#BAR_COLOR#"',
'    style="width:140px; height:19px; vertical-align:middle;">',
'</oj-spark-chart>'))
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(34814342133783673710)
,p_query_column_id=>7
,p_column_alias=>'BAR_COLOR'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32429703376692839820)
,p_query_column_id=>8
,p_column_alias=>'RANK'
,p_column_display_sequence=>80
,p_column_heading=>'Rank'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31263056785368046095)
,p_query_column_id=>9
,p_column_alias=>'LOG_DAY'
,p_column_display_sequence=>90
,p_column_heading=>'Log Day'
,p_column_format=>'YYYY-MM-DD'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31263057232721046099)
,p_query_column_id=>10
,p_column_alias=>'PAGE_EVENTS'
,p_column_display_sequence=>100
,p_column_heading=>'Page Events'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31263057361072046100)
,p_query_column_id=>11
,p_column_alias=>'PAGE_VIEWS'
,p_column_display_sequence=>110
,p_column_heading=>'Page Views'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31263057465620046101)
,p_query_column_id=>12
,p_column_alias=>'PAGE_ACCEPTS'
,p_column_display_sequence=>120
,p_column_heading=>'Page Accepts'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31263057535653046102)
,p_query_column_id=>13
,p_column_alias=>'PARTIAL_PAGE_VIEWS'
,p_column_display_sequence=>130
,p_column_heading=>'Partial Page Views'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31263057644634046103)
,p_query_column_id=>14
,p_column_alias=>'ROWS_FETCHED'
,p_column_display_sequence=>140
,p_column_heading=>'Rows Fetched'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31263057762058046104)
,p_query_column_id=>15
,p_column_alias=>'SERT_EVALUATION'
,p_column_display_sequence=>150
,p_column_heading=>'SERT Evaluation'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32323601715162227909)
,p_plug_name=>'SERT applications by size'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>41
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'app-size-col'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(32323601825515227910)
,p_region_id=>wwv_flow_imp.id(32323601715162227909)
,p_chart_type=>'pie'
,p_height=>'480'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
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
,p_legend_title=>'App Size'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ){',
'    options.valueFormats.series = { tooltipLabel: ''Size'' };',
'    $.extend( options.valueFormats.value, { tooltipLabel: ''Apps'' }); ',
'    ',
'    return options;',
'}',
''))
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(32323601904533227911)
,p_chart_id=>wwv_flow_imp.id(32323601825515227910)
,p_seq=>10
,p_name=>'SERT Apps by Size'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with data as (',
'    select app_size, max(pages) max_pages, count(*) n',
'      from sg_applications_d',
'     group by app_size',
')',
'select app_size,',
'       case app_size',
'       when ''XS'' then ''XS (0-5 pages)''',
'       when ''S''  then ''S (6-15 pages)''',
'       when ''M''  then ''M (16-30 pages)''',
'       when ''L''  then ''L (31-50 pages)''',
'       when ''XL'' then ''XL (51-''||to_char(max_pages)||'' pages)''',
'       end label,',
'       n',
'  from data',
' order by max_pages'))
,p_items_value_column_name=>'N'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LBL_PCT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:4:P4_APP_SIZE:&APP_SIZE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32323602006853227912)
,p_plug_name=>'Top applications chart'
,p_title=>'Top applications by daily activity for past 4 weeks'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>31
,p_plug_grid_column_span=>4
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(32323602110653227913)
,p_region_id=>wwv_flow_imp.id(32323602006853227912)
,p_chart_type=>'bar'
,p_height=>'480'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'value-desc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>false
,p_show_value=>false
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    // combine with gap ratio to ensure bars fill the allocated space',
'    options.styleDefaults.barGapRatio = 0.4;',
'    options.styleDefaults.maxBarWidth = 20;',
'',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(32323602173346227914)
,p_chart_id=>wwv_flow_imp.id(32323602110653227913)
,p_seq=>10
,p_name=>'Page Events'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(t.workspace_id)||''.''||to_char(t.application_id)||'' ''||t.application_name as series_name,',
'       to_char(t.application_id)||'' ''||t.application_name as series_label,',
'       t.workspace_id, t.application_id, t.application_name, t.page_events,',
'       ''SERT Evaluation: '' || nvl2(a.application_id, to_char(a.eval_on, ''YYYY-MM-DD''), ''n/a'') || chr(10) ||',
'            ''Application: '' || t.application_name || chr(10) ||',
'            ''Workspace: '' || t.workspace || chr(10) ||',
'            ''Application Id: '' || t.application_id || chr(10) ||',
'            ''Page Events: '' || to_char(t.page_events, ''FM999G999G999G990'' )',
'            as custom_tooltip_text,',
'       nvl2(a.application_id, ''var(--u-color-5)'', ''var(--u-color-9)'') bar_color,',
'       apex_page.get_url(',
'            p_page   => 6,',
'            p_items  => ''P6_WORKSPACE_ID,P6_APPLICATION_ID'',',
'            p_values => to_char(t.workspace_id)||'',''||to_char(t.application_id),',
'            p_clear_cache => ''6'' ) as chart_url',
'  from sg_most_4wk_app_activity_f t',
'  left join sg_applications_d a on (t.workspace_id = a.workspace_id and t.application_id = a.application_id)',
' order by t.page_events desc',
' fetch first 30 rows only',
''))
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'PAGE_EVENTS DESC'
,p_items_value_column_name=>'PAGE_EVENTS'
,p_items_label_column_name=>'SERIES_LABEL'
,p_items_short_desc_column_name=>'CUSTOM_TOOLTIP_TEXT'
,p_color=>'&BAR_COLOR.'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'#CHART_URL#'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(32323602389688227916)
,p_chart_id=>wwv_flow_imp.id(32323602110653227913)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'log'
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
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(32323602257157227915)
,p_chart_id=>wwv_flow_imp.id(32323602110653227913)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32429702270392839809)
,p_plug_name=>'Most common evaluation rule fails'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>51
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(32429702378298839810)
,p_region_id=>wwv_flow_imp.id(32429702270392839809)
,p_chart_type=>'bar'
,p_height=>'480'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'value-desc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>false
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ){',
'    options.valueFormats.group = { tooltipLabel: ''Rule'' };',
'    $.extend( options.valueFormats.value, { tooltipLabel: ''Fails'' }); ',
'    ',
'    return options;',
'}',
''))
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(32429702511598839811)
,p_chart_id=>wwv_flow_imp.id(32429702378298839810)
,p_seq=>10
,p_name=>'Rule fails'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rule.rule_wid,',
'       rule.rule_name,',
'       sum(f.ct_findings) fails',
'  from sg_agg_app_rule_results_f f',
'  join sg_results_d result on (f.result_wid = result.result_wid)',
'  join sg_rules_d rule on (f.rule_wid = rule.rule_wid)',
' where result.eval_result = ''FAIL''',
' group by rule.rule_wid, rule.rule_name',
' order by fails desc',
' fetch first 30 rows only'))
,p_items_value_column_name=>'FAILS'
,p_items_label_column_name=>'RULE_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_RULE_WID:&RULE_WID.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(32429702561079839812)
,p_chart_id=>wwv_flow_imp.id(32429702378298839810)
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
 p_id=>wwv_flow_imp.id(32429702661658839813)
,p_chart_id=>wwv_flow_imp.id(32429702378298839810)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'log'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'off'
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
 p_id=>wwv_flow_imp.id(32429706293519839849)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(32323602006853227912)
,p_button_name=>'ACTIVITY_LOG'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Activity Log'
,p_button_position=>'COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RR,::'
,p_icon_css_classes=>'fa-table-search'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(32681971354914105245)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(32429702270392839809)
,p_button_name=>'RULE_FAILS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Rule Fails'
,p_button_position=>'COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RR,::'
,p_icon_css_classes=>'fa-table-search'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(33534426292260923517)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(32323601715162227909)
,p_button_name=>'SERT_APPLICATIONS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'SERT Applications'
,p_button_position=>'COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RR,4::'
,p_icon_css_classes=>'fa-table-search'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(34696168307661278009)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(30658411073534022746)
,p_button_name=>'Synchronize'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Synchronize'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-database-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32429705941548839846)
,p_name=>'P1_LAST_SYNC'
,p_item_sequence=>1
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34696168684177278013)
,p_name=>'P1_LAST_DURATION'
,p_item_sequence=>11
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(32429706080826839847)
,p_computation_sequence=>10
,p_computation_item=>'P1_LAST_SYNC'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select last_sync from sg_last_completed_main_etl_v'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(34696168588680278012)
,p_computation_sequence=>20
,p_computation_item=>'P1_LAST_DURATION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select duration_in_seconds from sg_last_completed_main_etl_v'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(34696168429661278010)
,p_name=>'Confirm background task'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(34696168307661278009)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(34696168455274278011)
,p_event_id=>wwv_flow_imp.id(34696168429661278010)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Data synchronization will be executed as a background task.<br>',
'Refresh the page manually to see updated data.</p>',
'<p>Estimated time: &P1_LAST_DURATION. seconds</p>'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(34696168774733278014)
,p_event_id=>wwv_flow_imp.id(34696168429661278010)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'sg_util.run_main_etl;'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(139308542571438185)
,p_event_id=>wwv_flow_imp.id(34696168429661278010)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.setDismissPreferences({dismissPageSuccess: true});',
'apex.message.showPageSuccess( "Synchronization started as a background task." );'))
);
wwv_flow_imp.component_end;
end;
/
