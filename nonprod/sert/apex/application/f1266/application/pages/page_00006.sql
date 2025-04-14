-- file_checksum: 5D830E24A4E8568776D94854ADFC034E3654A0E69DA6D8C70ED6EFD0EADDB70B
prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>6
,p_name=>'Conditions Never'
,p_alias=>'CONDITIONS-NEVER'
,p_step_title=>'Conditions Never'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19033791217561608)
,p_plug_name=>'Region A: No Conditions'
,p_region_name=>'no_conditions'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19033975851561609)
,p_plug_name=>'Region B: Condition Expression'
,p_region_name=>'conditions_expression'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>30
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19034021307561610)
,p_plug_name=>'Region C: Conditions Never'
,p_region_name=>'conditions_never'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>40
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19034235015561612)
,p_plug_name=>'Info'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    Page to validate standards check for when components have condition never. ',
'    Evaluates the following attributes:',
'</p>',
'<ul>',
'    <li>SV_CHK_RGN_COND_NEVER</li>',
'    <li>SV_CHK_PAGE_ITEM_COND_NEVER</li>',
'    <li>SV_CHK_PRC_COND_NEVER</li>',
'</ul>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19034309951561613)
,p_name=>'P6_ITEM_NO_CONDITIONS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19033791217561608)
,p_prompt=>'Item No Conditions'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19034464618561614)
,p_name=>'P6_ITEM_CONDITION_EXPR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19033975851561609)
,p_prompt=>'Item Condition Expr'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'1=1'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19034559597561615)
,p_name=>'P6_ITEM_CONDITION_NEVER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19034021307561610)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20909833015862602)
,p_name=>'P6_COMP_NO_CONDITIONS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19033791217561608)
,p_prompt=>'Computation No Conditions'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'For SV_CHK_COMP_COND_NEVER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20909992316862604)
,p_name=>'P6_COMP_CONDITIONS_EXPRESSION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(19033791217561608)
,p_prompt=>'Computation Conditions Expression'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'For SV_CHK_COMP_COND_NEVER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20910116760862605)
,p_name=>'P6_COMP_CONDITIONS_NEVER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(19033791217561608)
,p_prompt=>'Computation Conditions Never'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'For SV_CHK_COMP_COND_NEVER'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20909947903862603)
,p_computation_sequence=>10
,p_computation_item=>'P6_COMP_NO_CONDITIONS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'foo'
,p_computation_comment=>'For SV_CHK_COMP_COND_NEVER'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20910228804862606)
,p_computation_sequence=>20
,p_computation_item=>'P6_COMP_CONDITIONS_EXPRESSION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'foo'
,p_computation_comment=>'For SV_CHK_COMP_COND_NEVER'
,p_compute_when=>'1=2'
,p_compute_when_text=>'PLSQL'
,p_compute_when_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20910333939862607)
,p_computation_sequence=>30
,p_computation_item=>'P6_COMP_CONDITIONS_NEVER'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'foo'
,p_computation_comment=>'For SV_CHK_COMP_COND_NEVER'
,p_compute_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20909526284862599)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process A: No Conditions'
,p_process_sql_clob=>'null;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9586740921848516
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20909586402862600)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process B: Conditions Expression'
,p_process_sql_clob=>'null;'
,p_process_clob_language=>'PLSQL'
,p_process_when=>'1=2'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>9586801039848517
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20909766147862601)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process C: Conditions Never'
,p_process_sql_clob=>'null;'
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>9586980784848518
);
wwv_flow_imp.component_end;
end;
/
