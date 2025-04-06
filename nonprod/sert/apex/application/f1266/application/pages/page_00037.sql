-- file_checksum: CE49463C564096C9ED17021597F27F3FA8A87E23FA83259C81B4D84C4CA524C3
prompt --application/pages/page_00037
begin
--   Manifest
--     PAGE: 00037
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
 p_id=>37
,p_name=>'New 23'
,p_alias=>'NEW-23'
,p_step_title=>'New 23'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(34134617511976845)
,p_plug_name=>'Region_37'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34135309323976859)
,p_name=>'P37_ITEM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(34134617511976845)
,p_prompt=>'Item'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26555799352986347)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_EXECUTION_CHAIN'
,p_process_name=>'Exec Chain1'
,p_attribute_01=>'N'
,p_attribute_08=>'WAIT'
,p_attribute_09=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>7615135394036088
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26556248523986348)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CREATE_TASK'
,p_process_name=>'H_task_create'
,p_attribute_01=>wwv_flow_imp.id(26549619526954916)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>7615584565036089
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26523659583940796)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'H_task_manage'
,p_attribute_01=>'APPROVE_TASK'
,p_attribute_02=>'P37_ITEM'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>7582995624990537
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26554030333986345)
,p_process_sequence=>10
,p_parent_process_id=>wwv_flow_imp.id(26555799352986347)
,p_process_type=>'NATIVE_SEND_PUSH_NOTIFICATION'
,p_process_name=>'Push Notifications'
,p_attribute_01=>'milosz.zimon@oracle.com'
,p_attribute_02=>'Welcome'
,p_attribute_03=>'&P37_ITEM.'
,p_internal_uid=>7613366375036086
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26554377955986346)
,p_process_sequence=>20
,p_parent_process_id=>wwv_flow_imp.id(26555799352986347)
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Call API'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_APPROVAL'
,p_attribute_04=>'APPROVE_TASK'
,p_internal_uid=>7613713997036087
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(26554882230986347)
,p_page_process_id=>wwv_flow_imp.id(26554377955986346)
,p_page_id=>37
,p_name=>'p_task_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P37_ITEM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(26555402765986347)
,p_page_process_id=>wwv_flow_imp.id(26554377955986346)
,p_page_id=>37
,p_name=>'p_autoclaim'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>30
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp.component_end;
end;
/
