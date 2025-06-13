-- file_checksum: 01CD2527841BBE7B3444923F5E36597BA3394C690AA82FE2FB5A4A6934D2E815
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00100
begin
--   Manifest
--     PAGE: 00100
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
,p_step_template=>wwv_flow_imp.id(468163289284671148)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--md'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(469229599430245616)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468201967560671224)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_plug_source=>'<input type="hidden" name="p_builder_instance" value="&P1_BUILDER_SESSION_ID." id="pBuilderInstance" />'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(469275599030745796)
,p_plug_name=>'&G_RULE_NAME.'
,p_icon_css_classes=>'&G_ICON.'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--noPadding:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(468232507438671254)
,p_plug_display_sequence=>0
,p_plug_header=>'&G_CATEGORY_NAME.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(479799592999632713)
,p_plug_name=>'Details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468199188089671222)
,p_plug_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(469178625373721087)
,p_name=>'Details Report'
,p_parent_plug_id=>wwv_flow_imp.id(479799592999632713)
,p_template=>wwv_flow_imp.id(468199188089671222)
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
,p_query_row_template=>wwv_flow_imp.id(468507030177671313)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'n/a'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(469180004239721101)
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
,p_required_patch=>wwv_flow_imp.id(468161859695671137)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(469179624608721097)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(469275208844745792)
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
 p_id=>wwv_flow_imp.id(469179133569721093)
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
 p_id=>wwv_flow_imp.id(480718412378443219)
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
 p_id=>wwv_flow_imp.id(469179366413721095)
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
 p_id=>wwv_flow_imp.id(469179436086721096)
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
 p_id=>wwv_flow_imp.id(469275309283745793)
,p_query_column_id=>8
,p_column_alias=>'RESULT_COLOR'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(479036480624456989)
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
 p_id=>wwv_flow_imp.id(479796960183632687)
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
 p_id=>wwv_flow_imp.id(480716906796443204)
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
 p_id=>wwv_flow_imp.id(479797112361632688)
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
 p_id=>wwv_flow_imp.id(479797132056632689)
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
 p_id=>wwv_flow_imp.id(479797305607632690)
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
 p_id=>wwv_flow_imp.id(65193005367471881)
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
 p_id=>wwv_flow_imp.id(479797512789632692)
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
 p_id=>wwv_flow_imp.id(479799643942632714)
,p_plug_name=>'RDS'
,p_parent_plug_id=>wwv_flow_imp.id(479799592999632713)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468199188089671222)
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
 p_id=>wwv_flow_imp.id(469226442108245585)
,p_name=>'About this Rule'
,p_parent_plug_id=>wwv_flow_imp.id(479799643942632714)
,p_template=>wwv_flow_imp.id(468199188089671222)
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
 p_id=>wwv_flow_imp.id(469229147690245612)
,p_query_column_id=>1
,p_column_alias=>'RULE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(469228800710245608)
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
 p_id=>wwv_flow_imp.id(469277073964745811)
,p_name=>'How to Fix'
,p_parent_plug_id=>wwv_flow_imp.id(479799643942632714)
,p_template=>wwv_flow_imp.id(468199188089671222)
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
 p_id=>wwv_flow_imp.id(469277207493745812)
,p_query_column_id=>1
,p_column_alias=>'RULE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(469347136759035596)
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
 p_id=>wwv_flow_imp.id(479797576442632693)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(469229599430245616)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-times-circle-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(394596969672109341)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(469229599430245616)
,p_button_name=>'EDIT_IN_APEX'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(468538323570671354)
,p_button_image_alt=>'Edit in APEX'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'edit-button'
,p_icon_css_classes=>'fa-apex'
,p_button_cattributes=>'&G_BUTTON_LINK.'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(479961773475940274)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(469229599430245616)
,p_button_name=>'RESULT_DETAILS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
,p_button_image_alt=>'Result Details'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-info-circle-o'
,p_button_cattributes=>'style="font-weight:bold; border-top: 4px green solid;"'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(479961510372940271)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(469229599430245616)
,p_button_name=>'COMMENTS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
,p_button_image_alt=>'Comments'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-comments-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(479963119585940287)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(469229599430245616)
,p_button_name=>'EXCEPTION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
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
 p_id=>wwv_flow_imp.id(65192625638471878)
,p_name=>'P100_HELP_VERSION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(469178625373721087)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(65192760142471879)
,p_name=>'P100_HELP_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(469178625373721087)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(394597238614109344)
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
 p_id=>wwv_flow_imp.id(479797666351632694)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(479797576442632693)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(479797814342632695)
,p_event_id=>wwv_flow_imp.id(479797666351632694)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(65192579506471877)
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
