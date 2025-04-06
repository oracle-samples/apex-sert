-- file_checksum: 25B16356CE058DC2299CD69E650A31D44B47C2793922E511ACADD9E706D0F512
prompt --application/pages/page_02012
begin
--   Manifest
--     PAGE: 02012
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
 p_id=>2012
,p_name=>'Copy Rule'
,p_alias=>'COPY-RULE'
,p_page_mode=>'MODAL'
,p_step_title=>'Copy Rule'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(394386952125759954)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--md'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(354709411839380651)
,p_plug_name=>'Copy Rule'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(354709668699380654)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394425593983760058)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(354709852154380656)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(354709668699380654)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(354709807981380655)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(354709668699380654)
,p_button_name=>'COPY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Copy'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(354710546158380663)
,p_branch_name=>'Edit the copied Rule'
,p_branch_action=>'f?p=&APP_ID.:2010:&SESSION.::&DEBUG.::P2010_RULE_ID:&P2012_RULE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(354709807981380655)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(354709509895380652)
,p_name=>'P2012_RULE_NAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(354709411839380651)
,p_prompt=>'Rule Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(354709601944380653)
,p_name=>'P2012_RULE_KEY'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(354709411839380651)
,p_prompt=>'Rule Key'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(354710631104380664)
,p_name=>'P2012_RULE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(354709411839380651)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(354711079783380668)
,p_name=>'P2012_RULE_SETS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(354709411839380651)
,p_prompt=>'Add to Rule Sets'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  rule_set_name',
' ,rule_set_id',
'from',
'  rule_sets',
'order by',
'  1'))
,p_cHeight=>10
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'ALL'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(354710402080380661)
,p_validation_name=>'Ensure that the Rule Key in unique'
,p_validation_sequence=>10
,p_validation=>'select 1 from rules_v where rule_key = :P2012_RULE_KEY'
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'That Rule Key is already in use.  Please choose another.'
,p_when_button_pressed=>wwv_flow_imp.id(354709807981380655)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(354709953975380657)
,p_name=>'Close Region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(354709852154380656)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(354710086356380658)
,p_event_id=>wwv_flow_imp.id(354709953975380657)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(354710220083380659)
,p_name=>'Copy to Key'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2012_RULE_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(354710253494380660)
,p_event_id=>wwv_flow_imp.id(354710220083380659)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2012_RULE_KEY'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item("P2012_RULE_NAME").getValue().toUpperCase().replace(/ /g,"_");',
''))
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(354710430870380662)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Copy Rule'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'RULES_PKG'
,p_attribute_04=>'COPY_RULE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(354709807981380655)
,p_internal_uid=>19948604751500118
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(354605980276160485)
,p_page_process_id=>wwv_flow_imp.id(354710430870380662)
,p_page_id=>2012
,p_name=>'p_rule_sets'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>40
,p_value_type=>'ITEM'
,p_value=>'P2012_RULE_SETS'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(354710756359380665)
,p_page_process_id=>wwv_flow_imp.id(354710430870380662)
,p_page_id=>2012
,p_name=>'p_rule_id'
,p_direction=>'IN_OUT'
,p_data_type=>'NUMBER'
,p_ignore_output=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P2012_RULE_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(354710923960380666)
,p_page_process_id=>wwv_flow_imp.id(354710430870380662)
,p_page_id=>2012
,p_name=>'p_rule_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P2012_RULE_NAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(354710973401380667)
,p_page_process_id=>wwv_flow_imp.id(354710430870380662)
,p_page_id=>2012
,p_name=>'p_rule_key'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P2012_RULE_KEY'
);
wwv_flow_imp.component_end;
end;
/
