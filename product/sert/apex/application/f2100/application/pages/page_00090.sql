-- file_checksum: AA8954B4D947A2B470A6288541E0FC66A51F483006CE9CC2D9BC224F74DA9960
prompt --application/pages/page_00090
begin
--   Manifest
--     PAGE: 00090
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>90
,p_name=>'Bulk Result Details'
,p_alias=>'RESULT-DETAILS1'
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
 p_id=>wwv_flow_imp.id(484757208253187624)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468201967560671224)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_plug_source=>'<input type="hidden" name="p_builder_instance" value="&P1_BUILDER_SESSION_ID." id="pBuilderInstance" />'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(484803207853687804)
,p_plug_name=>'&P90_RULE_NAME.'
,p_icon_css_classes=>'&P90_ICON.'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--noPadding:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(468232507438671254)
,p_plug_display_sequence=>20
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P90_SELECTED_RULE'
,p_plug_header=>'&P90_CATEGORY_NAME.'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(495327201822574721)
,p_plug_name=>'Details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468199188089671222)
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P90_SELECTED_RULE'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(495327252765574722)
,p_plug_name=>'RDS'
,p_parent_plug_id=>wwv_flow_imp.id(495327201822574721)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468199188089671222)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(484754050931187593)
,p_name=>'About this Rule'
,p_parent_plug_id=>wwv_flow_imp.id(495327252765574722)
,p_template=>wwv_flow_imp.id(468199188089671222)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   rule_id',
'  ,info',
'from ',
'  rules_pub_v',
'where ',
'  rule_id = :P90_SELECTED_RULE'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(468503940864671309)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59260693300220341)
,p_query_column_id=>1
,p_column_alias=>'RULE_ID'
,p_column_display_sequence=>10
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59261058947220342)
,p_query_column_id=>2
,p_column_alias=>'INFO'
,p_column_display_sequence=>20
,p_column_heading=>'Info'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'MARKDOWN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(484804682787687819)
,p_name=>'How to Fix'
,p_parent_plug_id=>wwv_flow_imp.id(495327252765574722)
,p_template=>wwv_flow_imp.id(468199188089671222)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   rule_id',
'  ,fix',
'from ',
'  rules_pub_v',
'where ',
'  rule_id = :P90_SELECTED_RULE'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(468503940864671309)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59261912657220343)
,p_query_column_id=>1
,p_column_alias=>'RULE_ID'
,p_column_display_sequence=>10
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(59262258132220343)
,p_query_column_id=>2
,p_column_alias=>'FIX'
,p_column_display_sequence=>20
,p_column_heading=>'Fix'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(59249712854220308)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(484757208253187624)
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
 p_id=>wwv_flow_imp.id(59250117390220310)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(484757208253187624)
,p_button_name=>'EDIT_IN_APEX'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(468538323570671354)
,p_button_image_alt=>'Edit in APEX'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'edit-button'
,p_icon_css_classes=>'fa-apex'
,p_button_cattributes=>'&G_BUTTON_LINK.'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(59250430141220311)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(484757208253187624)
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
 p_id=>wwv_flow_imp.id(59250916681220311)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(484757208253187624)
,p_button_name=>'COMMENTS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
,p_button_image_alt=>'Comments'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:80:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-comments-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(59251296328220313)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(484757208253187624)
,p_button_name=>'EXCEPTION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
,p_button_image_alt=>'Exception'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:30::'
,p_icon_css_classes=>'fa-workflow'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57297291378481910)
,p_name=>'P90_SELECTED_RULE'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59299697793322665)
,p_name=>'P90_RULE_NAME'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59299724747322666)
,p_name=>'P90_CATEGORY_NAME'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59300213740322670)
,p_name=>'P90_ICON'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60443548277242893)
,p_name=>'P90_SELECT_RULE'
,p_item_sequence=>10
,p_prompt=>'Select Rule'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'RULES_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct category_name ||'' - ''|| rule_name d, rule_id r ',
'from eval_results_pub_v ',
'where application_id = :G_APPLICATION_ID',
'  and workspace_id = :G_WORKSPACE_ID',
'  and RESULT not in (''PASS'',''APPROVED'')',
'order by 1 '))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(468537787206671352)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(59263584046220375)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(59249712854220308)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(59264025188220378)
,p_event_id=>wwv_flow_imp.id(59263584046220375)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(59299589973322664)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Selected Rule'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' IF :P70_BULK_ACTION = ''RAISE'' THEN',
'   :P90_SELECTED_RULE := :P70_SELECT_RULE_RAISE;',
'   :P90_ICON := ''fa-remove u-danger'';',
' ELSIF :P70_BULK_ACTION = ''AR'' THEN',
'   :P90_SELECTED_RULE := :P70_SELECT_RULE_AR;',
'   :P90_ICON := ''fa-warning u-warning'';',
' END IF;',
' begin',
' select distinct rule_name, category_name ',
'           into :P90_RULE_NAME, :P90_CATEGORY_NAME',
' from rules_pub_v ',
'   where rule_id = :P90_SELECTED_RULE;',
'  exception when others then',
'   null;',
'  end;',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>15578172112044401
);
wwv_flow_imp.component_end;
end;
/
