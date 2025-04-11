-- file_checksum: 2C2EC908504AB027BC2A60A8B445542322DD796F6B4F65973A5BC25A575AC863
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00302
begin
--   Manifest
--     PAGE: 00302
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
 p_id=>302
,p_name=>'IS Reports'
,p_alias=>'IS_REPORTS'
,p_step_title=>'IS Reports'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(468189105088671207)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(128059977852043619)
,p_plug_name=>'IS Reports'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--large force-fa-lg:t-MediaList--iconsRounded'
,p_plug_template=>wwv_flow_imp.id(468265822494671277)
,p_plug_display_sequence=>60
,p_location=>null
,p_list_id=>wwv_flow_imp.id(65843423135553318)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(468521948494671332)
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(170518241235831842)
,p_plug_name=>'Generating Report'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info'
,p_plug_template=>wwv_flow_imp.id(468194028275671212)
,p_plug_display_sequence=>50
,p_location=>null
,p_plug_source=>'Report is generating and will automictically download when completed.  Please check your inbox for the password.'
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'REPORTS_DG_HIDE'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(170518329668831843)
,p_plug_name=>'Header'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468278220136671284)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(468162448988671142)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(468540590841671359)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(66480178290649513)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(489789857780525824)
,p_button_name=>'CLOSE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(67485119772375207)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(170518329668831843)
,p_button_name=>'CLOSE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(171601341402071108)
,p_name=>'P302_PDF_FILENAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(170518241235831842)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(171604451865071162)
,p_name=>'P302_PDF_PASS'
,p_item_sequence=>40
,p_prompt=>'Generated Password'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'REPORTS_DG_HIDE'
,p_display_when_type=>'REQUEST_EQUALS_CONDITION'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(66483751791649517)
,p_name=>'Evaluation Summary Report'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'REQUEST_EQUALS_CONDITION'
,p_display_when_cond=>'EVAL_SUMMARY_REPORT_AOP'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(66484245843649518)
,p_event_id=>wwv_flow_imp.id(66483751791649517)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Generate password and send email'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'  :P302_PDF_PASS := dbms_random.string(''X'', 20);',
'  :P302_PDF_FILENAME := ''GIS_application_evaluation_summary_report_''|| to_char(SYSDATE,''DDMMYYYYHH24MISS'');',
'',
'  sert_core.reports_pkg.send_password_email (',
'    p_report_name  => ''Evaluation Summary Report'',',
'    p_from         => :G_EMAIL_FROM,',
'    p_filename     => :P302_PDF_FILENAME,',
'    p_password     => :P302_PDF_PASS,',
'    p_subj         => ''Report password'',',
'    p_ws           => :G_WORKSPACE_NAME',
'    );',
'    ',
'end;'))
,p_attribute_03=>'P302_PDF_PASS,P302_PDF_FILENAME'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(66484739905649519)
,p_event_id=>wwv_flow_imp.id(66483751791649517)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Report'
,p_action=>'PLUGIN_BE.APEXRND.AOP_DA'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sert_core.aop_api_pkg.g_output_read_password := v(''P302_PDF_PASS'');',
'sert_core.aop_api_pkg.g_output_filename := v(''P302_PDF_FILENAME'');'))
,p_attribute_04=>'pdf'
,p_attribute_05=>'SQL'
,p_attribute_06=>'SQL'
,p_attribute_09=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''docx'', blob_content ',
' from apex_application_files ',
' where filename = ''GIS_Evaluation_Summary_Report_Template.docx'' ',
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
'          (select application_id || '' '' || application_name ',
'           from apex_applications',
'           where application_id = (select application_id from sert_core.evals where eval_id = :P10_EVAL_ID) ',
'          ) application_name,  ',
'          cursor(',
'            select ',
'              ca1.category_id, ',
'              ca1.category_name,',
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
'              er1.current_value,',
'              decode(er1.result,''FAIL'',NULL,er1.result) approved_flag',
'              --ex1.exception justification,  @MZ issue here, as these 2 are not listed in eval_results_v',
'              -- ex1.reason rejection',
'            from',
'               sert_core.eval_results_pub_v er1,',
'               --sert_core.eval_results_v er2,  @MZ we prbably don''t need this ref here',
'               sert_core.categories ca1',
'            where 1=1 --er1.eval_result_id = er2.eval_result_id',
'            and er1.category_key = ca.category_key',
'            and er1.eval_id = :P10_EVAL_ID  --SYS_CONTEXT(''SV_SERT_CTX'', ''COLLECTION_ID'')',
'            and er1.result not like ''%PASS%''',
'            and er1.category_key = ca1.category_key',
'            order by ca1.category_id, er1.rule_id',
'          ) as "rule"',
'        from sert_core.categories ca',
'        /*',
'        where exists',
'        (select 1 from sert_core.eval_results er',
'          where er.eval_id = :P10_EVAL_ID --SYS_CONTEXT(''SV_SERT_CTX'', ''COLLECTION_ID'') ',
'          and er.category_key = ca.category_key   --no category_key in er',
'          and er.result not like ''%PASS%'')',
'        */',
'        order by ca.category_id',
'      ) as "category"',
'    from dual',
'  ) as "data"',
'from dual'))
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(66486940314649521)
,p_name=>'New'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ( this.data.successMessage ) {',
'apex.message.showPageSuccess(this.data.successMessage.text);',
'}'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(66482214044649516)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_COM.ORACLE.APEX.DOCGEN'
,p_process_name=>'Evaluation Summary Report DG_BTN'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_serialize( ',
'            json_object(   ',
'                    ''current_date''  value to_char(sysdate, ''DD MON YYYY''),',
'                    ''category''      value',
'                     json_arrayagg( ',
'                        json_object(''category_id''   value cat.category_id,',
'                                    ''category_name'' value cat.category_name,',
'                                    ''application_name'' value eva.application_name,',
'                                    ''rule'' value (',
'                                    select',
'                                    json_arrayagg(',
'                                      json_object(''rule_id''   value ers1.rule_id,',
'                                                  ''rule_name'' value ers1.rule_name,',
'                                                  ''result''    value ers1.result,',
'                                                  ''page_id''   value ers1.page_id, ',
'                                                  ''component_name'' value ers1.component_name,',
'                                                  ''current_value''  value ers1.current_value,',
'                                                  ''region_name''  value ers1.region_name,',
'                                                  ''column_name''  value ers1.column_name                                                ',
'                                                 ) order by ers1.rule_name',
'                                        returning clob)',
'                                       from ',
'                                         sert_core.eval_results_pub_v ers1,',
'                                         sert_core.categories cat1',
'                                       where ers1.category_key = cat.category_key',
'                                       and ers1.eval_id = :P10_EVAL_ID',
'                                       and ers1.result not like ''%PASS%''',
'                                       and ers1.category_key = cat1.category_key',
'                                       )',
'                                      returning clob',
'                                      ) order by cat.category_id',
'                        returning clob)',
'                returning clob) ',
'        returning clob pretty) as report_data',
'from sert_core.categories cat,',
'     sert_core.evals_v eva',
'--order by cat.category_id'))
,p_attribute_02=>'GIS_Evaluation_Summary_Report_Template.docx'
,p_attribute_03=>'GIS_Evaluation_Summary_Report.pdf'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Report successfully generated'
,p_internal_uid=>22760796183371253
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(66483002400649516)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'PLUGIN_COM.ORACLE.APEX.DOCGEN'
,p_process_name=>'Evaluation Summary Report DG'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_serialize( ',
'            json_object(   ',
'                    ''current_date''  value to_char(sysdate, ''DD MON YYYY''),',
'                    ''category''      value',
'                     json_arrayagg( ',
'                        json_object(''category_id''   value cat.category_id,',
'                                    ''category_name'' value cat.category_name,',
'                                    ''application_name'' value eva.application_name,',
'                                    ''rule'' value (',
'                                    select',
'                                    json_arrayagg(',
'                                      json_object(''rule_id''   value ers1.rule_id,',
'                                                  ''rule_name'' value ers1.rule_name,',
'                                                  ''result''    value ers1.result,',
'                                                  ''page_id''   value ers1.page_id, ',
'                                                  ''component_name'' value ers1.component_name,',
'                                                  ''current_value''  value ers1.current_value,',
'                                                  ''region_name''  value ers1.region_name,',
'                                                  ''column_name''  value ers1.column_name                                                ',
'                                                 ) order by ers1.rule_name, ers1.page_id, ers1.result',
'                                        returning clob)',
'                                       from ',
'                                         sert_core.eval_results_pub_v ers1,',
'                                         sert_core.categories cat1',
'                                       where ers1.category_key = cat.category_key',
'                                       and ers1.eval_id = :P10_EVAL_ID',
'                                       and ers1.result not like ''%PASS%''',
'                                       and ers1.category_key = cat1.category_key',
'                                       )',
'                                      returning clob',
'                                      ) order by cat.category_id',
'                        returning clob)',
'                returning clob) ',
'        returning clob pretty) as report_data',
'from sert_core.categories cat,',
'     sert_core.evals_v eva',
'where eva.eval_id = :P10_EVAL_ID',
'--order by cat.category_id'))
,p_attribute_02=>'IS_Evaluation_Summary_Report_Template.docx'
,p_attribute_03=>'IS_Evaluation_Summary_Report.pdf'
,p_process_when=>'EVAL_SUMMARY_REPORT_DG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Report successfully generated'
,p_internal_uid=>22761584539371253
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(66483364267649517)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'PLUGIN_COM.ORACLE.APEX.DOCGEN'
,p_process_name=>'Evaluation Detail Report DG'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_serialize( ',
'            json_object(   ',
'                    ''current_date''  value to_char(sysdate, ''DD MON YYYY''),',
'                    ''category''      value',
'                     json_arrayagg( ',
'                        json_object(''category_id''   value cat.category_id,',
'                                    ''category_name'' value cat.category_name,',
'                                    ''rule_name'' value rul.rule_name,',
'                                    ''info'' value rul.info,',
'                                    ''fix'' value rul.fix,',
'                                    ''application_name'' value eva.application_name,',
'                                    ''finding'' value (',
'                                    select',
'                                    json_arrayagg(',
'                                      json_object(''result''    value ers1.result,',
'                                                  ''page_id''   value ers1.page, ',
'                                                  ''component_name'' value ers1.component_name,',
'                                                  ''current_value''  value ers1.current_value,',
'                                                  ''region_name''  value ers1.region_name,',
'                                                  ''column_name''  value ers1.column_name                                                ',
'                                                 ) order by ers1.page_id, ers1.result',
'                                        returning clob) ',
'                                       from ',
'                                         sert_core.eval_results_pub_v ers1',
'                                       where ers1.category_key = cat.category_key',
'                                       and ers1.rule_id = rul.rule_id',
'                                       and ers1.eval_id = :P10_EVAL_ID',
'                                       and ers1.result not like ''%PASS%''',
'                                       )                                                                                                                                                ',
'                                      returning clob',
'                                      ) order by cat.category_id, rul.rule_name',
'                        returning clob)',
'                returning clob) ',
'        returning clob pretty) as report_data',
'from sert_core.categories cat,',
'     sert_core.rules rul,',
'     sert_core.evals_v eva',
'where rul.category_id = cat.category_id   ',
'and exists (select 1 from sert_core.eval_results er',
'            where er.eval_id = :P10_EVAL_ID',
'            and er.rule_id = rul.rule_id',
'            and er.result not like ''%PASS%'')  ',
'and eva.eval_id = :P10_EVAL_ID            ',
'--order by cat.category_id'))
,p_attribute_02=>'IS_Evaluation_Detail_Report_Template.docx'
,p_attribute_03=>'IS_Evaluation_Detail_Report.pdf'
,p_process_when=>'EVAL_DETAIL_REPORT_DG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>22761946406371254
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(66481415560649515)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'PLUGIN_COM.ORACLE.APEX.DOCGEN'
,p_process_name=>'Evaluation Exception Report DG'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_serialize( ',
'            json_object(   ',
'                    ''current_date''  value to_char(sysdate, ''DD MON YYYY''),',
'                    ''category''      value',
'                     json_arrayagg( ',
'                        json_object(''category_id''   value cat.category_id,',
'                                    ''category_name'' value cat.category_name,',
'                                    ''rule_name'' value rul.rule_name,',
'                                    ''info'' value rul.info,',
'                                    ''fix'' value rul.fix,',
'                                    ''application_name'' value eva.application_name,                                    ',
'                                    ''finding'' value (',
'                                    select',
'                                    json_arrayagg(',
'                                      json_object(''result''    value ers1.result,',
'                                                  ''page_id''   value ers1.page_id, ',
'                                                  ''component_name'' value ers1.component_name,',
'                                                  ''region_name''  value ers1.region_name,',
'                                                  ''column_name''  value ers1.column_name,',
'                                                  ''result'' value ers1.result,',
'                                                  ''current_value'' value ers1.current_value',
'                                                 )  order by ers1.page_id',
'                                        returning clob',
'                                        )',
'                                       from ',
'                                         --sert_core.eval_results_pub_v ers1,',
'                                         eval_results_exc_pub_v ers1',
'                                         --sert_core.exception_cnt_v ex1',
'                                       where ers1.category_key = cat.category_key',
'                                       and ers1.rule_id = rul.rule_id',
'                                       and ers1.eval_id = :P10_EVAL_ID',
'                                       --and ers1.result not like ''%PASS%''',
'                                       and ers1.result not in (''PASS'',''FAIL'')',
'                                      -- and ers1.eval_result_id = ex1.eval_result_id                                        ',
'                                       )                                                                                                                                                ',
'                                      returning clob',
'                                      ) order by cat.category_id, rul.rule_name',
'                        returning clob)',
'                returning clob) ',
'        returning clob pretty) as report_data',
'from sert_core.categories cat,',
'     sert_core.rules rul,',
'     sert_core.evals_v eva',
'where rul.category_id = cat.category_id   ',
'and exists (select 1 from sert_core.exceptions_v ev',
'            where ev.rule_id = rul.rule_id)  ',
'and eva.eval_id = :P10_EVAL_ID             ',
'--and exists (select 1 from sert_core.eval_results er',
'--            where er.eval_id = :P10_EVAL_ID',
'--            and er.rule_id = rul.rule_id',
'--            and er.result not like ''%PASS%'') '))
,p_attribute_02=>'IS_Evaluation_Exception_Report_Template.docx'
,p_attribute_03=>'IS_Application_Exceptions_Report.pdf'
,p_process_when=>'EVAL_EXCEPTION_REPORT_DG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>22759997699371252
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(66481722265649515)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'PLUGIN_COM.ORACLE.APEX.DOCGEN'
,p_process_name=>'Attribute Master Report DG'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_serialize( ',
'            json_object(   ',
'                    ''current_date''  value to_char(sysdate, ''DD MON YYYY''),',
'                    ''category''      value',
'                     json_arrayagg( ',
'                        json_object(''category_id''   value cat.category_id,',
'                                    ''category_name'' value cat.category_name,',
'                                    ''application_name'' value eva.application_name,',
'                                    ''rule'' value (',
'                                    select',
'                                    json_arrayagg(',
'                                      json_object(''rule_id''   value rul1.rule_id,',
'                                                  ''rule_name'' value rul1.rule_name,',
'                                                  ''rule_count'' value count(*)',
'                                                 ) order by rul1.rule_name',
'                                        returning clob)',
'                                       from ',
'                                         sert_core.rules rul1',
'                                       where rul1.category_id = cat.category_id',
'                                       group by rul1.rule_name, rul1.rule_id',
'                                       )',
'                                      returning clob',
'                                      ) order by cat.category_id',
'                        returning clob)',
'                returning clob) ',
'        returning clob pretty) as report_data',
'from sert_core.categories cat,',
'     sert_core.evals_v eva',
'where eva.eval_id = :P10_EVAL_ID        '))
,p_attribute_02=>'IS_Attributes_Master_Report_Template.docx'
,p_attribute_03=>'IS_Attribute_Master_Report.pdf'
,p_process_when=>'EVAL_MASTER_REPORT_DG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>22760304404371252
);
wwv_flow_imp.component_end;
end;
/
