-- file_checksum: B103B5945353E09161840EBF9C98F48EED10EA83767255A75AEEF9BE838BC1BF
prompt --application/pages/page_00200
begin
--   Manifest
--     PAGE: 00200
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
 p_id=>200
,p_name=>'Page Settings'
,p_step_title=>'Page Settings'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_browser_cache=>'Y'
,p_deep_linking=>'Y'
,p_rejoin_existing_sessions=>'Y'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45883142912982334)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(97047513090735535)
,p_plug_name=>'Menu_List'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_list_id=>wwv_flow_imp.id(43746963146394161)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(43710855372394085)
,p_plug_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SERT test case for:',
'URL Tampering: Authorization Inconsistencies: List Entry Inconsistencies'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(97047625406735536)
,p_plug_name=>'Navigation_bar'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_list_id=>wwv_flow_imp.id(43694911054394022)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(43710855372394085)
,p_plug_required_role=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(98647829480227836)
,p_plug_name=>'New1'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>'htp.print (''ABC'');'
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(98648296440227841)
,p_name=>'P200_REPORT'
,p_template=>wwv_flow_imp.id(43728368363394113)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  1 ID,',
'  SYSDATE START_DATE,',
'  SYSDATE END_DATE,',
'  ''x'' TASK_NAME',
'from ',
'  DUAL',
'WHERE',
'  1 = ''&P1_ITEM.''',
'  AND ''DBMS_SQL'' = ''EXECUTE IMMEDIATE'''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(43718414101394098)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(98648358271227842)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'Id'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(98648507050227843)
,p_query_column_id=>2
,p_column_alias=>'START_DATE'
,p_column_display_sequence=>20
,p_column_heading=>'Start Date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(98648560973227844)
,p_query_column_id=>3
,p_column_alias=>'END_DATE'
,p_column_display_sequence=>30
,p_column_heading=>'End Date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(98648741868227845)
,p_query_column_id=>4
,p_column_alias=>'TASK_NAME'
,p_column_display_sequence=>40
,p_column_heading=>'Task Name'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(98648811513227846)
,p_plug_name=>'P200_REGION_PLSQL'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select 1 ',
'  from dual ',
'  where 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'''))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(97047917759735539)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(45883142912982334)
,p_button_name=>'PROCESS_1_BTN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(43705559437394070)
,p_button_image_alt=>'Run Process 1 '
,p_button_alignment=>'RIGHT'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(43624685667213658)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45883254532982335)
,p_name=>'P200_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(45883142912982334)
,p_prompt=>'New'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45883262207982336)
,p_name=>'P0_NEW_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(45883142912982334)
,p_prompt=>'New'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45883515760982338)
,p_name=>'P200_NEW_2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(45883142912982334)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45883559239982339)
,p_name=>'P201_NEW_3'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(45883142912982334)
,p_prompt=>'New'
,p_display_as=>'NATIVE_COLOR_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(97047381309735534)
,p_name=>'P200_NEW_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(45883142912982334)
,p_prompt=>'New'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Display1;Return1,Display2;Return2'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(98648219828227840)
,p_name=>'P200_ITEM_1'
,p_item_sequence=>50
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select 1 ',
'  from dual ',
'  where 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'';'))
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'New'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy number;',
'begin',
'',
'  select 1 ',
'  into l_dummy',
'  from dual ',
'  where 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'';',
'',
'  return l_dummy;',
'',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(98648060938227839)
,p_validation_name=>'validation 1'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy number;',
'begin',
'',
'  select 1 ',
'  into l_dummy',
'  from dual ',
'  where 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'';',
'',
'end;'))
,p_validation_type=>'PLSQL_ERROR'
,p_error_message=>'bad data'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(97047293811735533)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'URL tampering_ajax callback'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy number;',
'begin',
'  select 1 ',
'  into l_dummy',
'  from dual;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>78106629852785274
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SERT test case for:',
'URL Tampering: Authorization Inconsistencies: Ajax Callbacks'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(97047755179735538)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process 1'
,p_process_sql_clob=>'htp.print (HTF.eScApE_SC(''PASS''));'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(97047917759735539)
,p_internal_uid=>78107091220785279
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SERT test case for:',
'URL Tampering: Authorization Inconsistencies: Processes Button Inconsistencies'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22506564797661906)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process 1_1'
,p_process_sql_clob=>'htp.print (''ABC FAIL'');'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(97047917759735539)
,p_internal_uid=>11183779434647823
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SERT test case for:',
'URL Tampering: Authorization Inconsistencies: Processes Button Inconsistencies'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22506626526661907)
,p_process_sequence=>30
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process 1_2'
,p_process_sql_clob=>'htp.print (HTF.ESCAPE_SC(''PASS''));'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(97047917759735539)
,p_internal_uid=>11183841163647824
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SERT test case for:',
'URL Tampering: Authorization Inconsistencies: Processes Button Inconsistencies'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22506764694661908)
,p_process_sequence=>40
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process 1_3'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy NUMBER(1);',
'  l_dummy2 VARCHAR2(100);',
'begin',
'  select HTF.ESCAPE_SC(''PASS'') into l_dummy2 from dual;',
'  ',
'  select 1 into l_dummy from dual;',
'',
'  htp.print (''ABC FAIL'');',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(97047917759735539)
,p_internal_uid=>11183979331647825
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SERT test case for:',
'URL Tampering: Authorization Inconsistencies: Processes Button Inconsistencies'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22506872476661909)
,p_process_sequence=>50
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process 1_4'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.print (''ABC FAIL'');',
'htp.print (HTF.ESCAPE_SC(''PASS''));'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(97047917759735539)
,p_internal_uid=>11184087113647826
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SERT test case for:',
'URL Tampering: Authorization Inconsistencies: Processes Button Inconsistencies'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22506892933661910)
,p_process_sequence=>60
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process 1_5'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--HTF.ESCAPE_SC(''PASS'');',
' htp.print (''ABC FAIL'');',
' htp.print (HTF.ESCAPE_SC(''PASS''));'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(97047917759735539)
,p_internal_uid=>11184107570647827
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SERT test case for:',
'URL Tampering: Authorization Inconsistencies: Processes Button Inconsistencies'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(98647994532227838)
,p_process_sequence=>70
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process 2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy number;',
'begin',
'',
'  select 1 ',
'  into l_dummy',
'  from dual ',
'  where 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'';',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>79707330573277579
);
wwv_flow_imp.component_end;
end;
/
