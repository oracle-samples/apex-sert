-- file_checksum: 8A40BF732D767CB6D4CFE31C2897FB3E792816C9F2122348A8B4711CD40C22E8
prompt --application/pages/page_06000
begin
--   Manifest
--     PAGE: 06000
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
 p_id=>6000
,p_name=>'Scheduled Evaluations'
,p_alias=>'SCHEDULED-EVALUATIONS'
,p_step_title=>'Scheduled Evaluations'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(73850259993346152)
,p_name=>'Scheduled Evaluations'
,p_template=>wwv_flow_imp.id(394422849849760056)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--horizontalBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   job_name',
'  ,     substr',
'      (',
'       repeat_interval',
'      ,instr(repeat_interval, ''BYDAY='') + length(''BYDAY='')',
'      ,instr(repeat_interval || '';'', '';'', instr(repeat_interval, ''BYDAY='')) - (instr(repeat_interval, ''BYDAY='') + length(''BYDAY=''))',
'      ) ',
'      || '' at '' || TO_CHAR(TO_TIMESTAMP_TZ(TO_CHAR(next_run_date, ''YYYY-MM-DD HHPM:MI:SS TZH:TZM''),''YYYY-MM-DD HHPM:MI:SS TZH:TZM'') at time zone sessiontimezone, ''HH:MIPM'') ',
'    as repeat_interval',
'',
'  ,state',
'  ,run_count',
'  ,failure_count',
'  ,retry_count',
'  ,last_start_date',
'  ,TO_TIMESTAMP_TZ(TO_CHAR(next_run_date, ''YYYY-MM-DD HHPM:MI:SS TZH:TZM''),''YYYY-MM-DD HHPM:MI:SS TZH:TZM'') at time zone sessiontimezone as next_run_date',
'  ,null as remove',
'  ,null as view_details',
'  ,null as run_job',
'from ',
'  all_scheduler_jobs'))
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
 p_id=>wwv_flow_imp.id(73850482122346154)
,p_query_column_id=>1
,p_column_alias=>'JOB_NAME'
,p_column_display_sequence=>10
,p_column_heading=>'Job Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(73852020814346169)
,p_query_column_id=>2
,p_column_alias=>'REPEAT_INTERVAL'
,p_column_display_sequence=>20
,p_column_heading=>'Repeat Interval'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(73853366983346183)
,p_query_column_id=>3
,p_column_alias=>'STATE'
,p_column_display_sequence=>30
,p_column_heading=>'State'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(73853618607346185)
,p_query_column_id=>4
,p_column_alias=>'RUN_COUNT'
,p_column_display_sequence=>40
,p_column_heading=>'Run Count'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(73853871720346188)
,p_query_column_id=>5
,p_column_alias=>'FAILURE_COUNT'
,p_column_display_sequence=>50
,p_column_heading=>'Failure Count'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(73854195551346191)
,p_query_column_id=>6
,p_column_alias=>'RETRY_COUNT'
,p_column_display_sequence=>60
,p_column_heading=>'Retry Count'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(73854255396346192)
,p_query_column_id=>7
,p_column_alias=>'LAST_START_DATE'
,p_column_display_sequence=>70
,p_column_heading=>'Last Start Date'
,p_use_as_row_header=>'N'
,p_column_format=>'DD-MON-YYYY HH:MIPM'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(73854456570346194)
,p_query_column_id=>8
,p_column_alias=>'NEXT_RUN_DATE'
,p_column_display_sequence=>80
,p_column_heading=>'Next Run Date'
,p_use_as_row_header=>'N'
,p_column_format=>'DD-MON-YYYY HH:MIPM'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74423607253971551)
,p_query_column_id=>9
,p_column_alias=>'REMOVE'
,p_column_display_sequence=>90
,p_use_as_row_header=>'N'
,p_column_link=>'#'
,p_column_linktext=>'<button type="button" class="t-Button t-Button--tiny">Remove Job</button>'
,p_column_link_attr=>'class="removeJob" id="#JOB_NAME#"'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(74222118980688276)
,p_query_column_id=>10
,p_column_alias=>'VIEW_DETAILS'
,p_column_display_sequence=>100
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:6010:&SESSION.::&DEBUG.::P6010_JOB_NAME:#JOB_NAME#'
,p_column_linktext=>'<button type="button" class="t-Button t-Button--tiny">View Details</button>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70050440994108345)
,p_query_column_id=>11
,p_column_alias=>'RUN_JOB'
,p_column_display_sequence=>110
,p_use_as_row_header=>'N'
,p_column_link=>'#'
,p_column_linktext=>'<button type="button" class="t-Button t-Button--tiny">Run Now</button>'
,p_column_link_attr=>'class="runJob" id="#JOB_NAME#"'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(74221862191688274)
,p_plug_name=>'Smart Filter'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md:margin-left-lg:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(73850259993346152)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(69450566234495417)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(414553966215499010)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:6030:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-angle-down'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(74221963959688275)
,p_name=>'P6000_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(74221862191688274)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'ROW'
,p_attribute_04=>'N'
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(74222182347688277)
,p_name=>'P6000_STATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(74221862191688274)
,p_prompt=>'State'
,p_source=>'STATE'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(74423712513971552)
,p_name=>'P6000_JOB_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(73850259993346152)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(74423751036971553)
,p_name=>'Remove Job'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.removeJob'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(74423924194971554)
,p_event_id=>wwv_flow_imp.id(74423751036971553)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to remove this job?'
,p_attribute_02=>'Remove Job'
,p_attribute_03=>'warning'
,p_attribute_06=>'Remove'
,p_attribute_07=>'Cancel'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(74424010861971555)
,p_event_id=>wwv_flow_imp.id(74423751036971553)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6000_JOB_NAME'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id;'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(74424115330971556)
,p_event_id=>wwv_flow_imp.id(74423751036971553)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'dbms_scheduler.drop_job(job_name => ''SERT_CORE.'' || :P6000_JOB_NAME);'
,p_attribute_02=>'P6000_JOB_NAME'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(394385489811759930)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(70050234148108343)
,p_event_id=>wwv_flow_imp.id(74423751036971553)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'sert_core.schedule_api.remove_schedule_job(p_job_name => ''SERT_CORE.'' || :P6000_JOB_NAME);'
,p_attribute_02=>'P6000_JOB_NAME'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(74424182367971557)
,p_event_id=>wwv_flow_imp.id(74423751036971553)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(73850259993346152)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(74424249734971558)
,p_event_id=>wwv_flow_imp.id(74423751036971553)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess("Job Removed");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(70050514556108346)
,p_name=>'Run Job'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.runJob'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(70050559871108347)
,p_event_id=>wwv_flow_imp.id(70050514556108346)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to execute this job immediately?'
,p_attribute_02=>'Run Job'
,p_attribute_03=>'warning'
,p_attribute_06=>'Run Now'
,p_attribute_07=>'Cancel'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(70050737456108348)
,p_event_id=>wwv_flow_imp.id(70050514556108346)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6000_JOB_NAME'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id;'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(70050816530108349)
,p_event_id=>wwv_flow_imp.id(70050514556108346)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'dbms_scheduler.drop_job(job_name => ''SERT_CORE.'' || :P6000_JOB_NAME);'
,p_attribute_02=>'P6000_JOB_NAME'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(394385489811759930)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(70050924795108350)
,p_event_id=>wwv_flow_imp.id(70050514556108346)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'sert_core.schedule_api.run_schedule_job(p_job_name => ''SERT_CORE.'' || :P6000_JOB_NAME);'
,p_attribute_02=>'P6000_JOB_NAME'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(70050975236108351)
,p_event_id=>wwv_flow_imp.id(70050514556108346)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(73850259993346152)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(70051044387108352)
,p_event_id=>wwv_flow_imp.id(70050514556108346)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess("Job executed");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(60661757152815883)
,p_name=>'Refresh schedules'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(69450566234495417)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60661910055815884)
,p_event_id=>wwv_flow_imp.id(60661757152815883)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(73850259993346152)
);
wwv_flow_imp.component_end;
end;
/
