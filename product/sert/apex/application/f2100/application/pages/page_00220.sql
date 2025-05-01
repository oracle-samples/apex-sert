-- file_checksum: A2B6E827E8FEB3E95C11828EA7DFCA3A8C1ED77920015203C9C037585E2C96E2
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00220
begin
--   Manifest
--     PAGE: 00220
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
 p_id=>220
,p_name=>'Report: Evaluation Detail'
,p_alias=>'REPORT-EVALUATION-DETAIL'
,p_page_mode=>'MODAL'
,p_step_title=>'Report: Evaluation Detail'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(468163289284671148)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--lg'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(54925859627450308)
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(75503107098664798)
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
 p_id=>wwv_flow_imp.id(89625193184445304)
,p_plug_name=>'Generating Report'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info'
,p_plug_template=>wwv_flow_imp.id(468194028275671212)
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_source=>'Report is generating and will automatically download when completed.  Please check your inbox for the password.'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(75503211885664799)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(75503107098664798)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88689891288225583)
,p_name=>'P220_PDF_PASS'
,p_item_sequence=>10
,p_prompt=>'Generated Password'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88690140152225585)
,p_name=>'P220_EMAIL_FROM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(89625193184445304)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88690402937225588)
,p_name=>'P220_PDF_FILENAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(89625193184445304)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(77201923233429253)
,p_name=>'Evaluation Detail Report'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'REQUEST_EQUALS_CONDITION'
,p_display_when_cond=>'EVAL_DETAIL_REPORT'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(77202955672429250)
,p_event_id=>wwv_flow_imp.id(77201923233429253)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Generate password and send email'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'  :P220_PDF_PASS := dbms_random.string(''X'', 20);',
'  :P220_PDF_FILENAME := ''GIS_application_evaluation_detail_report_''|| to_char(SYSDATE,''DDMMYYYYHH24MISS'');',
'',
'  sert_core.reports_pkg.send_password_email (',
'    p_report_name  => ''Evaluation Detail Report'',',
'    p_from         => :G_EMAIL_FROM,',
'    p_filename     => :P220_PDF_FILENAME,',
'    p_password     => :P220_PDF_PASS,',
'    p_subj         => ''Report password'',',
'    p_ws           => :G_WORKSPACE_NAME',
'    );',
'    ',
'end;'))
,p_attribute_03=>'P220_PDF_PASS,P220_PDF_FILENAME'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(77202510728429251)
,p_event_id=>wwv_flow_imp.id(77201923233429253)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Report'
,p_action=>'PLUGIN_BE.APEXRND.AOP_DA'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sert_core.aop_api_pkg.g_output_read_password := v(''P220_PDF_PASS'');',
'sert_core.aop_api_pkg.g_output_filename := v(''P220_PDF_FILENAME'');'))
,p_attribute_04=>'pdf'
,p_attribute_05=>'SQL'
,p_attribute_06=>'SQL'
,p_attribute_09=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''docx'', blob_content ',
' from apex_application_files ',
' where filename = ''GIS_Evaluation_Detail_Report_Template.docx'' ',
' and flow_id = :APP_ID'))
,p_attribute_11=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  ''file1'' as "filename",',
'  cursor(',
'    select',
'      cursor (',
'        select',
'          ca.category_id,',
'          ca.category_name, ',
'          ru.rule_name,',
'          ru.info,',
'          ru.fix,          ',
'          (select application_id || '' '' || application_name ',
'           from apex_applications',
'           where application_id = (select application_id from sert_core.evals where eval_id = :P10_EVAL_ID) ',
'          ) application_name,  ',
'          cursor(',
'            select ',
'              er1.eval_result_id,',
'              er1.rule_id,',
'              er1.rule_name,',
'              er1.description,',
'              er1.component_name,',
'              er1.application_id,',
'              er1.eval_id, ',
'              er1.eval_result_id,                  ',
'              er1.result, ',
'              er1.page_id, ',
'              er1.component_id,',
'              er1.component_name,',
'              er1.item_name,',
'              er1.current_value',
'            from',
'               sert_core.eval_results_pub_v er1',
'            where er1.category_key = ca.category_key',
'            and er1.eval_id = :P10_EVAL_ID  --SYS_CONTEXT(''SV_SERT_CTX'', ''COLLECTION_ID'')',
'            and er1.rule_id = ru.rule_id',
'            and er1.result not like ''%PASS%''',
'            order by er1.rule_name',
'          ) as "rule"',
'        from ',
'          sert_core.categories ca,',
'          sert_core.rules ru',
'        where 1=1',
'        and ru.category_id = ca.category_id',
'        and exists',
'        (select 1 from sert_core.eval_results er',
'          where er.eval_id = :P10_EVAL_ID --SYS_CONTEXT(''SV_SERT_CTX'', ''COLLECTION_ID'') ',
'          and er.rule_id = ru.rule_id',
'          and er.result not like ''%PASS%'')',
'        order by ca.category_id, ru.rule_name',
'      ) as "category"',
'    from dual',
'  ) as "data"',
'from dual'))
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(75503285041664800)
,p_name=>'Close Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(75503211885664799)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(75503329446664801)
,p_event_id=>wwv_flow_imp.id(75503285041664800)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
