-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 5032D42FC2F833ED8CF5D7CBC9602EC04A7017A4C06C4181F7F5F8C2D7CCCBF2
prompt --application/pages/page_00100
begin
--   Manifest
--     PAGE: 00100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>100
,p_name=>'Result Details'
,p_alias=>'RESULT-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'Result Details'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// change a href to use _blank; markdown does not work for this',
'$("a").attr("target", "_blank");',
''))
,p_inline_css=>'.t-AVPList-label { font-weight: bold; text-align:right; }'
,p_step_template=>wwv_flow_imp.id(511884707145949411)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--md'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(512951017291523879)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511923385421949487)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_plug_source=>'<input type="hidden" name="p_builder_instance" value="&P1_BUILDER_SESSION_ID." id="pBuilderInstance" />'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(512997016892024059)
,p_plug_name=>'&G_RULE_NAME.'
,p_icon_css_classes=>'&G_ICON.'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--noPadding:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(511953925299949517)
,p_plug_display_sequence=>0
,p_plug_header=>'&G_CATEGORY_NAME.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(523521010860910976)
,p_plug_name=>'Details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(512900043234999350)
,p_name=>'Details Report'
,p_parent_plug_id=>wwv_flow_imp.id(523521010860910976)
,p_template=>wwv_flow_imp.id(511920605950949485)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#:t-AVPList--fixedLabelSmall:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  result',
'  ,category_name',
'  ,page',
'  ,region_name',
'  ,component_name',
'  ,column_name',
'  ,item_name',
'  ,result_color',
'  ,description',
'  ,current_value',
'  ,exception_value',
'  ,valid_values',
'  ,rule_criteria_type_name',
'  ,reason',
'  ,:P100_HELP_URL || :P100_HELP_VERSION ||''/''|| help_url  help_url',
'  ,risk',
'from',
'  eval_results_pub_v',
'where ',
'  eval_result_id = :G_EVAL_RESULT_ID'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(512228448038949576)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'n/a'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512901422100999364)
,p_query_column_id=>1
,p_column_alias=>'RESULT'
,p_column_display_sequence=>60
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{with/}',
'        LABEL:=RESULT',
'        VALUE:=#RESULT#',
'        STATE:=#RESULT_COLOR#',
'        ICON:=#BADGE_ICON#',
'        LABEL_DISPLAY:=N',
'{apply THEME$BADGE/}'))
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(511883277556949400)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512901042469999360)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512996626706024055)
,p_query_column_id=>3
,p_column_alias=>'PAGE'
,p_column_display_sequence=>70
,p_column_heading=>'Page'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512900551430999356)
,p_query_column_id=>4
,p_column_alias=>'REGION_NAME'
,p_column_display_sequence=>90
,p_column_heading=>'Region'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'NOT_EXISTS'
,p_display_when_condition=>'select 1 from eval_results_pub_v where eval_result_id = :G_EVAL_RESULT_ID and impact = ''SC'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(524439830239721482)
,p_query_column_id=>5
,p_column_alias=>'COMPONENT_NAME'
,p_column_display_sequence=>100
,p_column_heading=>'Component'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select 1 from eval_results_pub_v where eval_result_id = :G_EVAL_RESULT_ID and component_name is not null'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512900784274999358)
,p_query_column_id=>6
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>110
,p_column_heading=>'Column'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'NOT_EXISTS'
,p_display_when_condition=>'select 1 from eval_results_pub_v where eval_result_id = :G_EVAL_RESULT_ID and impact = ''SC'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512900853947999359)
,p_query_column_id=>7
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>120
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'NOT_EXISTS'
,p_display_when_condition=>'select 1 from eval_results_pub_v where eval_result_id = :G_EVAL_RESULT_ID and impact = ''SC'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512996727145024056)
,p_query_column_id=>8
,p_column_alias=>'RESULT_COLOR'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(522757898485735252)
,p_query_column_id=>9
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>140
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select 1 from eval_results_pub_v where eval_result_id = :G_EVAL_RESULT_ID and impact = ''SC'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(523518378044910950)
,p_query_column_id=>10
,p_column_alias=>'CURRENT_VALUE'
,p_column_display_sequence=>150
,p_column_heading=>'Current Value'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(524438324657721467)
,p_query_column_id=>11
,p_column_alias=>'EXCEPTION_VALUE'
,p_column_display_sequence=>160
,p_column_heading=>'Exception Value'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select 1 from eval_results_pub_v where result = ''STALE'' and eval_result_id = :G_EVAL_RESULT_ID'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(523518530222910951)
,p_query_column_id=>12
,p_column_alias=>'VALID_VALUES'
,p_column_display_sequence=>170
,p_column_heading=>'Valid Values'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(523518549917910952)
,p_query_column_id=>13
,p_column_alias=>'RULE_CRITERIA_TYPE_NAME'
,p_column_display_sequence=>180
,p_column_heading=>'Criteria Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(523518723468910953)
,p_query_column_id=>14
,p_column_alias=>'REASON'
,p_column_display_sequence=>190
,p_column_heading=>'Reason'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(108914423228750144)
,p_query_column_id=>15
,p_column_alias=>'HELP_URL'
,p_column_display_sequence=>210
,p_column_heading=>'Help URL'
,p_column_link=>'#HELP_URL#'
,p_column_linktext=>'Visit URL'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  1',
'from ',
'  eval_results_pub_v er',
'  ,rules_pub_v r',
'where ',
'  er.eval_result_id = :G_EVAL_RESULT_ID',
'  and er.rule_id = r.rule_id',
'  and r.help_url is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(523518930650910955)
,p_query_column_id=>16
,p_column_alias=>'RISK'
,p_column_display_sequence=>200
,p_column_heading=>'Risk'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(523521061803910977)
,p_plug_name=>'RDS'
,p_parent_plug_id=>wwv_flow_imp.id(523521010860910976)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(512947859969523848)
,p_name=>'About this Rule'
,p_parent_plug_id=>wwv_flow_imp.id(523521061803910977)
,p_template=>wwv_flow_imp.id(511920605950949485)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   rule_id',
'  ,info',
'from ',
'  rules_pub_v',
'where ',
'  rule_id = (select rule_id from eval_results_pub_v where eval_result_id = :G_EVAL_RESULT_ID)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512950565551523875)
,p_query_column_id=>1
,p_column_alias=>'RULE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512950218571523871)
,p_query_column_id=>2
,p_column_alias=>'INFO'
,p_column_display_sequence=>20
,p_column_heading=>'Info'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'MARKDOWN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(512998491826024074)
,p_name=>'How to Fix'
,p_parent_plug_id=>wwv_flow_imp.id(523521061803910977)
,p_template=>wwv_flow_imp.id(511920605950949485)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   rule_id',
'  ,fix',
'from ',
'  rules_pub_v',
'where ',
'  rule_id = (select rule_id from eval_results_pub_v where eval_result_id = :G_EVAL_RESULT_ID)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(512998625355024075)
,p_query_column_id=>1
,p_column_alias=>'RULE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(513068554620313859)
,p_query_column_id=>2
,p_column_alias=>'FIX'
,p_column_display_sequence=>20
,p_column_heading=>'Fix'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'MARKDOWN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523518994303910956)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(512951017291523879)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-times-circle-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(438318387533387604)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(512951017291523879)
,p_button_name=>'EDIT_IN_APEX'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(512259741431949617)
,p_button_image_alt=>'Edit in APEX'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'edit-button'
,p_icon_css_classes=>'fa-apex'
,p_button_cattributes=>'&G_BUTTON_LINK.'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523683191337218537)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(512951017291523879)
,p_button_name=>'RESULT_DETAILS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Result Details'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-info-circle-o'
,p_button_cattributes=>'style="font-weight:bold; border-top: 4px green solid;"'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523682928234218534)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(512951017291523879)
,p_button_name=>'COMMENTS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Comments'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-comments-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523684537447218550)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(512951017291523879)
,p_button_name=>'EXCEPTION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Exception'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:30::'
,p_button_condition=>'return exceptions_api.show_exception(p_eval_result_id => :G_EVAL_RESULT_ID);'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-workflow'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(108914043499750141)
,p_name=>'P100_HELP_VERSION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(512900043234999350)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(108914178003750142)
,p_name=>'P100_HELP_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(512900043234999350)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(438318656475387607)
,p_computation_sequence=>10
,p_computation_item=>'G_BUTTON_LINK'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return eval_pkg.apex_link',
'  (',
'   p_eval_result_id     => :G_EVAL_RESULT_ID',
'  ,p_builder_session_id => :P1_BUILDER_SESSION_ID',
'  ); '))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(523519084212910957)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(523518994303910956)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(523519232203910958)
,p_event_id=>wwv_flow_imp.id(523519084212910957)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(108913997367750140)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Help Items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select APEX_VERSION into :P100_HELP_VERSION from sert_core.rules ',
'where rule_id = (select rule_id from ',
'  eval_results_pub_v',
'where ',
'  eval_result_id = :G_EVAL_RESULT_ID);',
'',
'select pref_value into :P100_HELP_URL',
'from sert_core.prefs where pref_key = ''SERT_HELP_URL'';'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>10788062372778921
);
wwv_flow_imp.component_end;
end;
/
