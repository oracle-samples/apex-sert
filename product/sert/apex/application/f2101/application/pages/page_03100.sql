-- file_checksum: 75B8BDC1245C84F46F1BF5E0AF6A1CBFD5CB64ED80ABF91EA09F5C678F251454
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_03100
begin
--   Manifest
--     PAGE: 03100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>3100
,p_name=>'Scheduler Job Logs'
,p_alias=>'SCHEDULER-JOB-LOGS'
,p_step_title=>'Scheduler Job Logs'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(74424454040971560)
,p_name=>'Scheduler Job Logs'
,p_template=>wwv_flow_imp.id(394422849849760056)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--horizontalBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   log_id',
'  ,log_date',
'  ,owner',
'  ,job_name',
'  ,job_subname',
'  ,job_class',
'  ,operation',
'  ,initcap(status) as status',
'  ,case ',
'     when status = ''SUCCEEDED'' then ''success''',
'     when status = ''FAILED'' then ''danger''',
'     else null',
'   end status_color',
'  ,user_name',
'  ,client_id',
'  ,global_uid',
'  ,credential_owner',
'  ,credential_name',
'  ,destination_owner',
'  ,destination',
'  ,additional_info',
'  ,log_id as view_details',
'from ',
'  all_scheduler_job_log'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(394527652631760130)
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
 p_id=>wwv_flow_imp.id(74424533857971561)
,p_query_column_id=>1
,p_column_alias=>'LOG_ID'
,p_column_display_sequence=>20
,p_column_heading=>'Log Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74424714789971562)
,p_query_column_id=>2
,p_column_alias=>'LOG_DATE'
,p_column_display_sequence=>30
,p_column_heading=>'Log Date'
,p_column_format=>'DD-MON-YYYY HH:MIPM'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74424798003971563)
,p_query_column_id=>3
,p_column_alias=>'OWNER'
,p_column_display_sequence=>40
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74424912681971564)
,p_query_column_id=>4
,p_column_alias=>'JOB_NAME'
,p_column_display_sequence=>50
,p_column_heading=>'Job Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74425004983971565)
,p_query_column_id=>5
,p_column_alias=>'JOB_SUBNAME'
,p_column_display_sequence=>60
,p_column_heading=>'Job Subname'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74425088232971566)
,p_query_column_id=>6
,p_column_alias=>'JOB_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Job Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74425140553971567)
,p_query_column_id=>7
,p_column_alias=>'OPERATION'
,p_column_display_sequence=>80
,p_column_heading=>'Operation'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74425229902971568)
,p_query_column_id=>8
,p_column_alias=>'STATUS'
,p_column_display_sequence=>10
,p_column_heading=>'Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
' {with/}',
'        LABEL:=STATUS',
'        VALUE:=#STATUS#',
'        STATE:=#STATUS_COLOR#',
'        ICON:=#BADGE_ICON#',
'        LABEL_DISPLAY:=N',
'    {apply THEME$BADGE/}'))
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74425395802971569)
,p_query_column_id=>9
,p_column_alias=>'STATUS_COLOR'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74425492364971570)
,p_query_column_id=>10
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74425544656971571)
,p_query_column_id=>11
,p_column_alias=>'CLIENT_ID'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74425686450971572)
,p_query_column_id=>12
,p_column_alias=>'GLOBAL_UID'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74425813510971573)
,p_query_column_id=>13
,p_column_alias=>'CREDENTIAL_OWNER'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74425846088971574)
,p_query_column_id=>14
,p_column_alias=>'CREDENTIAL_NAME'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74425961352971575)
,p_query_column_id=>15
,p_column_alias=>'DESTINATION_OWNER'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74426113043971576)
,p_query_column_id=>16
,p_column_alias=>'DESTINATION'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74426137829971577)
,p_query_column_id=>17
,p_column_alias=>'ADDITIONAL_INFO'
,p_column_display_sequence=>180
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74426239182971578)
,p_query_column_id=>18
,p_column_alias=>'VIEW_DETAILS'
,p_column_display_sequence=>190
,p_column_link=>'f?p=&APP_ID.:3110:&SESSION.::&DEBUG.:Y,:P3110_LOG_ID:#LOG_ID#'
,p_column_linktext=>'<button type="button" class="t-Button t-Button--tiny">View Details</button>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(74426346969971579)
,p_plug_name=>'Smart Filter'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md:margin-left-lg:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(74424454040971560)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(74426446062971580)
,p_name=>'P3100_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(74426346969971579)
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
 p_id=>wwv_flow_imp.id(74426589216971581)
,p_name=>'P3100_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(74426346969971579)
,p_prompt=>'Status'
,p_source=>'STATUS'
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
wwv_flow_imp.component_end;
end;
/
