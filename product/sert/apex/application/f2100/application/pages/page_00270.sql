-- file_checksum: 625C6A92A44164253DFFB3E115BBD9074314C56D17C292973BB7CC76049E2199
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00270
begin
--   Manifest
--     PAGE: 00270
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
 p_id=>270
,p_name=>'Exception Details'
,p_alias=>'EXCEPTION-DETAILS1'
,p_page_mode=>'MODAL'
,p_step_title=>'Exception Details'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(468163289284671148)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--xl:t-PageBody--noContentPadding'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(76324239256040719)
,p_plug_name=>'Exception Details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468199188089671222)
,p_plug_display_sequence=>40
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    application_id,',
'    category_name,',
'    page_id,',
'    item_name,',
'    component_name,',
'    current_value, ',
'    exception_justification,',
'    result,',
'    exception_reason,',
'    rule_name,',
'    risk_name,',
'    risk,',
'    created_by,',
'    created_on,',
'    updated_by,',
'    updated_on',
'from EVAL_RESULTS_EXC_PUB_V erp',
'where erp.eval_id = :P270_EVAL_ID',
'and result in (''STALE'',''PENDING'',''APPROVED'',''REJECTED'')',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P270_EVAL_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(76324462957040721)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'SUJITH.SASANKAN@ORACLE.COM'
,p_internal_uid=>76324462957040721
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76324606533040723)
,p_db_column_name=>'RULE_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Rule'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76324730317040724)
,p_db_column_name=>'CATEGORY_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76324878159040725)
,p_db_column_name=>'COMPONENT_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Component'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76325037655040727)
,p_db_column_name=>'APPLICATION_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Application ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76325168335040728)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Page ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76325277718040729)
,p_db_column_name=>'ITEM_NAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Item Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76325347982040730)
,p_db_column_name=>'RESULT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Result'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76325550294040732)
,p_db_column_name=>'CURRENT_VALUE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Current Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76325627012040733)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76325723095040734)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Created On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76325816917040735)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(76325912833040736)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Updated On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(50922001556290802)
,p_db_column_name=>'EXCEPTION_JUSTIFICATION'
,p_display_order=>160
,p_column_identifier=>'R'
,p_column_label=>'Justification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(50922134266290803)
,p_db_column_name=>'EXCEPTION_REASON'
,p_display_order=>170
,p_column_identifier=>'S'
,p_column_label=>'Approve/Reject Reason'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(50922250475290804)
,p_db_column_name=>'RISK_NAME'
,p_display_order=>180
,p_column_identifier=>'T'
,p_column_label=>'Risk Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(50922389034290805)
,p_db_column_name=>'RISK'
,p_display_order=>190
,p_column_identifier=>'U'
,p_column_label=>'Risk'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(98557622403784447)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'491674'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'APPLICATION_ID:CATEGORY_NAME:RULE_NAME:PAGE_ID:ITEM_NAME:COMPONENT_NAME:RESULT:CURRENT_VALUE:EXCEPTION_JUSTIFICATION:EXCEPTION_REASON:UPDATED_BY:UPDATED_ON:RISK:'
,p_sort_column_1=>'CATEGORY_NAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'RULE_NAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'APPLICATION_ID'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'PAGE_ID'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'APPLICATION_ID:CATEGORY_NAME:RULE_NAME'
,p_break_enabled_on=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APPLICATION_ID',
'CATEGORY_NAME:APPLICATION_ID:CATEGORY_NAME:RULE_NAME'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(104515190656194118)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468201967560671224)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(567191737003040088)
,p_plug_name=>'Select Page'
,p_region_name=>'selectPageRegion'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(468241383290671261)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_04'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(588215076614298236)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468278220136671284)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(468162448988671142)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(468540590841671359)
,p_plug_display_condition_type=>'CURRENT_PAGE_IN_CONDITION'
,p_plug_display_when_condition=>'270'
,p_required_patch=>wwv_flow_imp.id(468161859695671137)
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(567170345286934611)
,p_name=>'Context'
,p_parent_plug_id=>wwv_flow_imp.id(588215076614298236)
,p_template=>wwv_flow_imp.id(468199188089671222)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:margin-left-lg'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked'
,p_display_point=>'SMART_FILTERS'
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
'  eval_id = :P270_EVAL_ID'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(468499799610671305)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49392522414768374)
,p_query_column_id=>1
,p_column_alias=>'EVAL_ID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49392996311768370)
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
 p_id=>wwv_flow_imp.id(49393362609768369)
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
 p_id=>wwv_flow_imp.id(49393721264768369)
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
 p_id=>wwv_flow_imp.id(49394127234768368)
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
 p_id=>wwv_flow_imp.id(49394532117768368)
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
 p_id=>wwv_flow_imp.id(49394991243768367)
,p_query_column_id=>7
,p_column_alias=>'JOB_STATUS_CSS'
,p_column_display_sequence=>220
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49395374434768367)
,p_query_column_id=>8
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(49395779973768366)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(104515264725194119)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(104515190656194118)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(49414569205768296)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(567191737003040088)
,p_button_name=>'RE-EVALUATE_PAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(49390957147768395)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(588215076614298236)
,p_button_name=>'REPORTS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
,p_button_image_alt=>'Reports'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-down'
,p_button_cattributes=>'data-menu="reports_menu"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(49391332493768391)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(588215076614298236)
,p_button_name=>'EXCEPTIONS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
,p_button_image_alt=>'Exceptions'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-down'
,p_button_cattributes=>'data-menu="exceptions_menu"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(49391728559768391)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(588215076614298236)
,p_button_name=>'EVALUATION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Evaluation'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-down'
,p_button_cattributes=>'data-menu="actions_menu"'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(49423163919768264)
,p_branch_name=>'Stay on Evaluation Summary'
,p_branch_action=>'f?p=&APP_ID.:270:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'RE-EVALUATE,RE-EVALUATE_PAGE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(49422714864768264)
,p_branch_name=>'Return to Home Page'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'DELETE_EVALUATION,RE-EVALUATE_BACKGROUND'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(567224087387039844)
,p_name=>'P270_PAGE_ID'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(567191737003040088)
,p_prompt=>'Page'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  page_id || '' - '' || page_name a',
'  ,page_id',
'from',
'  apex_application_pages',
'where',
'  application_id = (select application_id from evals_pub_v where eval_id = :P270_EVAL_ID)',
'  and page_id > 0',
'order by',
'  page_id'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(468537787206671352)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(567559926520417544)
,p_name=>'P270_EVAL_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49417614535768276)
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
 p_id=>wwv_flow_imp.id(49418139017768273)
,p_event_id=>wwv_flow_imp.id(49417614535768276)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RE-EVALUATE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49418543128768272)
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
 p_id=>wwv_flow_imp.id(49419086761768272)
,p_event_id=>wwv_flow_imp.id(49418543128768272)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RE-EVALUATE_BACKGROUND'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49419484683768271)
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
 p_id=>wwv_flow_imp.id(49419961232768269)
,p_event_id=>wwv_flow_imp.id(49419484683768271)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(567191737003040088)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49420341275768269)
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
 p_id=>wwv_flow_imp.id(49420810462768268)
,p_event_id=>wwv_flow_imp.id(49420341275768269)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to delete this evaluation?  All notes and exceptions will also be deleted.'
,p_attribute_02=>'Confirm Deletion'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49421356186768268)
,p_event_id=>wwv_flow_imp.id(49420341275768269)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DELETE_EVALUATION'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49421753759768267)
,p_name=>'Refresh page'
,p_event_sequence=>100
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49422233116768267)
,p_event_id=>wwv_flow_imp.id(49421753759768267)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(567170345286934611)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(104515336945194120)
,p_name=>'Close Dialog'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(104515264725194119)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(104515443545194121)
,p_event_id=>wwv_flow_imp.id(104515336945194120)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49416009406768282)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate Application'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P270_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P270_EVAL_ID',
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
,p_internal_uid=>49416009406768282
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49416806911768277)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate in the Background'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P270_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P270_EVAL_ID',
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
,p_internal_uid=>49416806911768277
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49416445995768278)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate for a Page'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P270_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P270_EVAL_ID',
'    ,p_page_id           => :P270_PAGE_ID',
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
,p_internal_uid=>49416445995768278
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49417278564768277)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Evaluation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P270_EVAL_ID)',
'loop',
'  eval_pkg.delete_eval',
'    (',
'    p_eval_id           => :P270_EVAL_ID',
'    );',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_EVALUATION'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Evaluation Deleted'
,p_internal_uid=>49417278564768277
);
wwv_flow_imp.component_end;
end;
/
