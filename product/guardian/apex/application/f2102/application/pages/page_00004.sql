-- file_checksum: 16849513B4D79C06A2C250C60CC8FD404A10B66B557C18408736F0654C9E069A
prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
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
 p_id=>4
,p_name=>'SERT Applications'
,p_alias=>'SERT-APPLICATIONS'
,p_step_title=>'SERT Applications'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//',
'// John Snyders - workaraound for report refresh to render spark charts',
'// https://forums.oracle.com/ords/apexds/post/spark-chart-in-cr-faceted-search-doesnot-show-on-facets-sel-3170',
'//',
'$( "body" ).attr( "data-oj-binding-provider", "none" );'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Fix the sparkline cell to minimum width needed */',
'td[headers="SPARKLINE_DATA"] {',
'    width: 156px;',
'}',
''))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(30658409527755022737)
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32751388532211787050)
,p_plug_name=>'Hide/Show Columns'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400:t-Form--leftLabels:t-Form--labelsAbove:margin-top-none'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_04'
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33524679243845220687)
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
 p_id=>wwv_flow_imp.id(33524680091440220693)
,p_name=>'Search Results'
,p_region_name=>'search-results'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with rating as (',
'    -- overall score per application across 1 or more rulesets',
'    select rr.application_wid, floor(100*sum(case when r.final_pass_or_fail = ''Pass'' then rr.ct_findings else 0 end)/sum(rr.ct_findings)) score',
'      from sg_agg_app_rule_results_f rr',
'      join sg_results_d r on rr.result_wid = r.result_wid',
'      group by rr.application_wid',
'),',
'spark_activity as (',
'    select t.workspace_id, t.application_id, t.sparkline_data,',
'           dense_rank() over (order by t.page_events desc, t.application_name) rank, ',
'           t.log_day, ',
'           t.page_events, t.page_views, t.page_accepts, t.partial_page_views, t.rows_fetched',
'      from sg_most_4wk_app_activity_f t',
')',
'select a.workspace_id, a.workspace, a.application_id, a.application_name, a.pages, a.app_size, a.avg_page_complexity, r.score, a.eval_on,',
'       s.sparkline_data, s.rank, s.log_day, s.page_events, s.page_views, s.page_accepts, s.partial_page_views, s.rows_fetched',
'  from sg_applications_d a',
'  join rating r on (a.application_wid = r.application_wid)',
'  left join spark_activity s on (s.workspace_id = a.workspace_id and s.application_id = a.application_id)',
''))
,p_ajax_enabled=>'Y'
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
 p_id=>wwv_flow_imp.id(33524683329466220702)
,p_query_column_id=>1
,p_column_alias=>'WORKSPACE_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Workspace Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33524683713299220702)
,p_query_column_id=>2
,p_column_alias=>'WORKSPACE'
,p_column_display_sequence=>2
,p_column_heading=>'Workspace'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(34814343254059673722)
,p_query_column_id=>3
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>12
,p_column_heading=>'Application Id'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33524684067493220703)
,p_query_column_id=>4
,p_column_alias=>'APPLICATION_NAME'
,p_column_display_sequence=>22
,p_column_heading=>'Application Name'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_WORKSPACE_ID,P6_APPLICATION_ID:#WORKSPACE_ID#,#APPLICATION_ID#'
,p_column_linktext=>'#APPLICATION_NAME#'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>2
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33524684532835220703)
,p_query_column_id=>5
,p_column_alias=>'PAGES'
,p_column_display_sequence=>42
,p_column_heading=>'Pages'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33524684936011220704)
,p_query_column_id=>6
,p_column_alias=>'APP_SIZE'
,p_column_display_sequence=>52
,p_column_heading=>'Size'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33524685274074220704)
,p_query_column_id=>7
,p_column_alias=>'AVG_PAGE_COMPLEXITY'
,p_column_display_sequence=>62
,p_column_heading=>'Avg Page Complexity'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(34814342234191673711)
,p_query_column_id=>8
,p_column_alias=>'SCORE'
,p_column_display_sequence=>32
,p_column_heading=>'Compliance'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33524685709866220704)
,p_query_column_id=>9
,p_column_alias=>'EVAL_ON'
,p_column_display_sequence=>72
,p_column_heading=>'Eval On'
,p_column_format=>'YYYY-MM-DD'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:P3_WORKSPACE,P3_APPLICATION_NAME:#WORKSPACE#,#APPLICATION_NAME#'
,p_column_linktext=>'#EVAL_ON#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(139308790096438188)
,p_query_column_id=>10
,p_column_alias=>'SPARKLINE_DATA'
,p_column_display_sequence=>82
,p_column_heading=>'Activity'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<oj-spark-chart ',
'    type="bar" ',
'    items="[#SPARKLINE_DATA#]" ',
'    color="var(--u-color-5)"',
'    style="width:140px; height:19px; vertical-align:middle;">',
'</oj-spark-chart>'))
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P4_SHOW_COLUMNS,''SPARKLINE_DATA'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(139308705446438187)
,p_query_column_id=>11
,p_column_alias=>'RANK'
,p_column_display_sequence=>92
,p_column_heading=>'Rank'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P4_SHOW_COLUMNS,''RANK'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(139308930081438189)
,p_query_column_id=>12
,p_column_alias=>'LOG_DAY'
,p_column_display_sequence=>112
,p_column_heading=>'Log Day'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P4_SHOW_COLUMNS,''LOG_DAY'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(139308994891438190)
,p_query_column_id=>13
,p_column_alias=>'PAGE_EVENTS'
,p_column_display_sequence=>122
,p_column_heading=>'Page Events'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P4_SHOW_COLUMNS,''PAGE_EVENTS'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(139309148343438191)
,p_query_column_id=>14
,p_column_alias=>'PAGE_VIEWS'
,p_column_display_sequence=>132
,p_column_heading=>'Page Views'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P4_SHOW_COLUMNS,''PAGE_VIEWS'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(139309232732438192)
,p_query_column_id=>15
,p_column_alias=>'PAGE_ACCEPTS'
,p_column_display_sequence=>142
,p_column_heading=>'Page Accepts'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P4_SHOW_COLUMNS,''PAGE_ACCEPTS'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(139309334665438193)
,p_query_column_id=>16
,p_column_alias=>'PARTIAL_PAGE_VIEWS'
,p_column_display_sequence=>152
,p_column_heading=>'Partial Page Views'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P4_SHOW_COLUMNS,''PARTIAL_PAGE_VIEWS'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(139309434295438194)
,p_query_column_id=>17
,p_column_alias=>'ROWS_FETCHED'
,p_column_display_sequence=>162
,p_column_heading=>'Rows Fetched'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P4_SHOW_COLUMNS,''ROWS_FETCHED'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33524680177383220693)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(33524680091440220693)
,p_landmark_label=>'Filters'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'charts_selector', '#dashboard',
  'compact_numbers_threshold', '10000',
  'current_facets_selector', '#active_facets',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'E',
  'show_current_facets', 'E',
  'show_total_row_count', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33524682193545220697)
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
 p_id=>wwv_flow_imp.id(67565848360285256038)
,p_plug_name=>'Dashboard'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_plug_source=>'<div id="dashboard"></div>'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(139328025465699726)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(32751388532211787050)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(139328400372699727)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(32751388532211787050)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(139327430639695952)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(33524682193545220697)
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
 p_id=>wwv_flow_imp.id(33524682694707220699)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(33524682193545220697)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:RR,4::'
,p_icon_css_classes=>'fa-undo'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32751389814620787057)
,p_name=>'P4_SHOW_COLUMNS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(32751388532211787050)
,p_item_default=>'SPARKLINE_DATA:RANK:LOG_DAY:PAGE_EVENTS:PAGE_VIEWS:PAGE_ACCEPTS:PARTIAL_PAGE_VIEWS:ROWS_FETCHED'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>'STATIC2:Activity;SPARKLINE_DATA,Rank;RANK,Log Day;LOG_DAY,Page Events;PAGE_EVENTS,Page Views;PAGE_VIEWS,Page Accepts;PAGE_ACCEPTS,Partial Page Views;PARTIAL_PAGE_VIEWS,Rows Fetched;ROWS_FETCHED'
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
 p_id=>wwv_flow_imp.id(33524680709709220695)
,p_name=>'P4_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(33524680177383220693)
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
 p_id=>wwv_flow_imp.id(33524681091032220696)
,p_name=>'P4_WORKSPACE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(33524680177383220693)
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
 p_id=>wwv_flow_imp.id(33524681501709220697)
,p_name=>'P4_APPLICATION_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(33524680177383220693)
,p_prompt=>'Application Name'
,p_source=>'APPLICATION_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_depending_on_id=>wwv_flow_imp.id(33524681091032220696)
,p_depending_on_condition_type=>'NOT_NULL'
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
 p_id=>wwv_flow_imp.id(33524681906746220697)
,p_name=>'P4_APP_SIZE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(33524680177383220693)
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
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>true
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34814342280773673712)
,p_name=>'P4_SCORE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(33524680177383220693)
,p_prompt=>'Compliance'
,p_source=>'SCORE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_lov=>'STATIC2:95-100 Compliant;95|100,70-94 Okay;70|94,0-69 Bad;|69'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'N',
  'select_multiple', 'Y')).to_clob
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>true
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(139329398944702788)
,p_name=>'Open Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(139327430639695952)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(139329772139702792)
,p_event_id=>wwv_flow_imp.id(139329398944702788)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(32751388532211787050)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(139309635571438196)
,p_name=>'Close dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(139328025465699726)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(139309707464438197)
,p_event_id=>wwv_flow_imp.id(139309635571438196)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(32751388532211787050)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(69403455156420323)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Default Show Columns'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P4_SHOW_COLUMNS is null then',
'    :P4_SHOW_COLUMNS := ''SPARKLINE_DATA:RANK:LOG_DAY:PAGE_EVENTS:PAGE_VIEWS:PAGE_ACCEPTS:PARTIAL_PAGE_VIEWS:ROWS_FETCHED'';',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>69403455156420323
);
wwv_flow_imp.component_end;
end;
/
