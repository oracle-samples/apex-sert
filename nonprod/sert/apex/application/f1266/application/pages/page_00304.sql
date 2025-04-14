-- file_checksum: 2BD140A396A666110F6DD5B5FC947C41418981F49EFC3C7A3759B95EE012D8FB
prompt --application/pages/page_00304
begin
--   Manifest
--     PAGE: 00304
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
 p_id=>304
,p_name=>'Computations'
,p_step_title=>'Computations'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(43630902537237430)
,p_plug_name=>'New region - computations'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43630003748237421)
,p_name=>'P304_PLSQL_FUNCTION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(43630902537237430)
,p_prompt=>'Plsql expression'
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
 p_id=>wwv_flow_imp.id(43630090971237422)
,p_name=>'P304_PLSQL_EXPRESSION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(43630902537237430)
,p_prompt=>'Plsql expression'
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
 p_id=>wwv_flow_imp.id(43630347746237425)
,p_name=>'P304_SQL_EXPRESSION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(43630902537237430)
,p_prompt=>'Sql expression'
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
 p_id=>wwv_flow_imp.id(43630435219237426)
,p_name=>'P304_SQL_QUERY_COLON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(43630902537237430)
,p_prompt=>'Sql query colon'
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
 p_id=>wwv_flow_imp.id(43630728443237429)
,p_name=>'P304_SQL_QUERY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(43630902537237430)
,p_prompt=>'Sql query'
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
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(43630630352237428)
,p_computation_sequence=>10
,p_computation_item=>'P304_SQL_QUERY'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'SELECT 1 FROM dual WHERE 1 = ''&P1_ITEM.'' || ''DBMS_SQQL'' || ''EXECUTE IMMEDIATE'''
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(43630568063237427)
,p_computation_sequence=>20
,p_computation_item=>'P304_SQL_QUERY_COLON'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY_COLON'
,p_computation=>'SELECT 1 FROM dual WHERE 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'''
,p_computation_comment=>'SELECT 1 FROM dual WHERE 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'''
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(43630240120237424)
,p_computation_sequence=>30
,p_computation_item=>'P304_SQL_EXPRESSION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'SELECT 1 FROM dual WHERE 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'''
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(43629894100237420)
,p_computation_sequence=>40
,p_computation_item=>'P304_PLSQL_EXPRESSION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'SELECT 1 FROM dual WHERE 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'''
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(43629761626237419)
,p_computation_sequence=>50
,p_computation_item=>'P304_PLSQL_FUNCTION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'RETURN ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'';'
);
wwv_flow_imp.component_end;
end;
/
