-- file_checksum: 8F27A245A91C5DD93E2980FB6CA158A96AC56F694ADF4B4840416D4722E21F20
prompt --application/pages/page_06010
begin
--   Manifest
--     PAGE: 06010
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>6010
,p_name=>'Scheduled Evaluation Runs'
,p_alias=>'SCHEDULED-EVALUATION-RUNS'
,p_step_title=>'Scheduled Evaluation Runs'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(74224174854688297)
,p_plug_name=>'Smart Filter'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md:margin-left-lg:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(376015411437172134)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(376015411437172134)
,p_name=>'Scheduler Job Logs'
,p_template=>wwv_flow_imp.id(394479640660760093)
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
'  all_scheduler_job_log',
'where',
'  job_name = :P6010_JOB_NAME'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(394527652631760130)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74222344270688279)
,p_query_column_id=>1
,p_column_alias=>'LOG_ID'
,p_column_display_sequence=>20
,p_column_heading=>'Log Id'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74222526062688280)
,p_query_column_id=>2
,p_column_alias=>'LOG_DATE'
,p_column_display_sequence=>30
,p_column_heading=>'Log Date'
,p_use_as_row_header=>'N'
,p_column_format=>'DD-MON-YYYY HH:MIPM'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74222583285688281)
,p_query_column_id=>3
,p_column_alias=>'OWNER'
,p_column_display_sequence=>40
,p_column_heading=>'Owner'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74222702427688282)
,p_query_column_id=>4
,p_column_alias=>'JOB_NAME'
,p_column_display_sequence=>50
,p_column_heading=>'Job Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74222753120688283)
,p_query_column_id=>5
,p_column_alias=>'JOB_SUBNAME'
,p_column_display_sequence=>60
,p_column_heading=>'Job Subname'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74222848997688284)
,p_query_column_id=>6
,p_column_alias=>'JOB_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Job Class'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74222950144688285)
,p_query_column_id=>7
,p_column_alias=>'OPERATION'
,p_column_display_sequence=>80
,p_column_heading=>'Operation'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74223093373688286)
,p_query_column_id=>8
,p_column_alias=>'STATUS'
,p_column_display_sequence=>10
,p_column_heading=>'Status'
,p_use_as_row_header=>'N'
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
 p_id=>wwv_flow_imp.id(74223167426688287)
,p_query_column_id=>9
,p_column_alias=>'STATUS_COLOR'
,p_column_display_sequence=>100
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74223274611688288)
,p_query_column_id=>10
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>110
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74223371295688289)
,p_query_column_id=>11
,p_column_alias=>'CLIENT_ID'
,p_column_display_sequence=>120
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74223507162688290)
,p_query_column_id=>12
,p_column_alias=>'GLOBAL_UID'
,p_column_display_sequence=>130
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74223596100688291)
,p_query_column_id=>13
,p_column_alias=>'CREDENTIAL_OWNER'
,p_column_display_sequence=>140
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74223729593688292)
,p_query_column_id=>14
,p_column_alias=>'CREDENTIAL_NAME'
,p_column_display_sequence=>150
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74223764645688293)
,p_query_column_id=>15
,p_column_alias=>'DESTINATION_OWNER'
,p_column_display_sequence=>160
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74223847005688294)
,p_query_column_id=>16
,p_column_alias=>'DESTINATION'
,p_column_display_sequence=>170
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74223956843688295)
,p_query_column_id=>17
,p_column_alias=>'ADDITIONAL_INFO'
,p_column_display_sequence=>180
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74224047993688296)
,p_query_column_id=>18
,p_column_alias=>'VIEW_DETAILS'
,p_column_display_sequence=>190
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:3110:&SESSION.::&DEBUG.::P3110_LOG_ID:#LOG_ID#'
,p_column_linktext=>'<button type="button" class="t-Button t-Button--tiny">View Details</button>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(74222296447688278)
,p_name=>'P6010_JOB_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(376015411437172134)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(74224233376688298)
,p_name=>'P6010_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(74224174854688297)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'ROW'
,p_attribute_04=>'N'
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(74224370404688299)
,p_name=>'P6010_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(74224174854688297)
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
,p_fc_toggleable=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp.component_end;
end;
/
