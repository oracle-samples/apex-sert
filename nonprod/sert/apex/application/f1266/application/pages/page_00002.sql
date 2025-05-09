-- file_checksum: DDF515F57C05904BD908442AD057D7DAF07E2AD826A820B850DF0B126AAE95D9
prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'Modal Form'
,p_alias=>'MODAL-FORM'
,p_page_mode=>'MODAL'
,p_step_title=>'Modal Form'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45095387226812035)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(43737941448394124)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45097194324812045)
,p_plug_name=>'Modal Form'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(43738368551394125)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''Name'' firstname, ''lastname'' lastname',
'from dual'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45095020062812035)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(45095387226812035)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(43705559437394070)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45093164341812029)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(45095387226812035)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(43705559437394070)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P2_FIRSTNAME'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45092758155812029)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(45095387226812035)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(43705559437394070)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2_FIRSTNAME'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45092371634812029)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(45095387226812035)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(43705559437394070)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2_FIRSTNAME'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31417555959716305)
,p_name=>'P2_NEW_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(45097194324812045)
,p_prompt=>'New 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31417663536716306)
,p_name=>'P2_NEW'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(45097194324812045)
,p_prompt=>'New'
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
 p_id=>wwv_flow_imp.id(45096407303812041)
,p_name=>'P2_LASTNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(45097194324812045)
,p_item_source_plug_id=>wwv_flow_imp.id(45097194324812045)
,p_prompt=>'Lastname'
,p_source=>'LASTNAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>8
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45096846861812044)
,p_name=>'P2_FIRSTNAME'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(45097194324812045)
,p_item_source_plug_id=>wwv_flow_imp.id(45097194324812045)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Firstname'
,p_source=>'FIRSTNAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53980166780704326)
,p_name=>'P2_NEW_1_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(45097194324812045)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'B'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45094961433812035)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(45095020062812035)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45094135377812032)
,p_event_id=>wwv_flow_imp.id(45094961433812035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45006264239028869)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_LASTNAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45005660605028863)
,p_name=>'New_2'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_LASTNAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45005920448028866)
,p_name=>'New_1'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_LASTNAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45005883499028865)
,p_event_id=>wwv_flow_imp.id(45005920448028866)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_FIRSTNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45005741874028864)
,p_event_id=>wwv_flow_imp.id(45005920448028866)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_FIRSTNAME'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45091560442812028)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(45097194324812045)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Modal Form'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>26150896483861769
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45091148645812027)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>26150484686861768
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45091920761812028)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(45097194324812045)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Modal Form'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>26151256802861769
);
wwv_flow_imp.component_end;
end;
/
