-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: D2A4FE7A48C4C486EDCC0D2CF2834161C5D7F3B7CD61FE821A6CBD27E24C0D9E
prompt --application/pages/page_00302
begin
--   Manifest
--     PAGE: 00302
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>302
,p_name=>'Compliance Reports'
,p_alias=>'COMPLIANCE-REPORTS'
,p_page_mode=>'MODAL'
,p_step_title=>'Compliance Reports'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(511884707145949411)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--md:t-PageBody--noContentPadding'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(98647601139726859)
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(148237363740472389)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511923385421949487)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(171781395713321882)
,p_plug_name=>'IS Reports'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--iconsRounded'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>60
,p_location=>null
,p_list_id=>wwv_flow_imp.id(109564840996831581)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(512243366355949595)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(214239659097110105)
,p_plug_name=>'Generating Report'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info'
,p_plug_template=>wwv_flow_imp.id(511915446136949475)
,p_plug_display_sequence=>50
,p_location=>null
,p_plug_source=>'Report is generating and will automatically download when completed.  Please check your inbox for the password.'
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'REPORTS_DG_HIDE'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(148237447786472390)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(148237363740472389)
,p_button_name=>'CLOSE_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_image_alt=>'Close'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(110201596151927776)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(533511275641804087)
,p_button_name=>'CLOSE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(215322759263349371)
,p_name=>'P302_PDF_FILENAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(214239659097110105)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(215325869726349425)
,p_name=>'P302_PDF_PASS'
,p_item_sequence=>40
,p_prompt=>'Generated Password'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'REPORTS_DG_HIDE'
,p_display_when_type=>'REQUEST_EQUALS_CONDITION'
,p_field_template=>wwv_flow_imp.id(512257901776949613)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(148237609962472391)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(148237447786472390)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(148237678077472392)
,p_event_id=>wwv_flow_imp.id(148237609962472391)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(110204420261927779)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Evaluation Summary Report DG'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_document blob;',
'  l_json     clob;',
'  l_report_layout_static_id  VARCHAR2(100) := ''IS_EVALUATION_SUMMARY_REPORT_TEMPLATE'';',
'  l_report_name VARCHAR2(100) := ''EVALUATION_SUMMARY_REPORT'';',
'  l_error_message  VARCHAR2(32000);',
'',
'BEGIN',
'',
'  select sert_core.is_reports_api.evaluation_summary_report_json (',
'           p_eval_id  => :P10_EVAL_ID,',
'           p_app_id => :APP_ID)',
'  into l_json',
'  from dual;',
'',
'',
'  if not sert_core.is_reports_api.report_generate (',
'     p_application_id => :APP_ID,',
'     p_data           => l_json,',
'     p_report_layout_static_id => l_report_layout_static_id,',
'     p_output_type    => apex_print.c_output_pdf ,',
'     p_content_type   => ''application/pdf'',',
'     p_report_name    => l_report_name,',
'     p_error_message  => l_error_message',
'     ) then',
'',
'    --report failed, check log table',
'    apex_error.add_error (p_message => l_error_message,',
'                          p_display_location => apex_error.c_inline_in_notification);',
'',
'  end if;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Report Failed'
,p_process_when=>'EVAL_SUMMARY_REPORT_DG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Report successfully generated'
,p_internal_uid=>22761584539371253
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(96113876219601479)
,p_process_sequence=>2
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Evaluation Detail Report DG'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_document blob;',
'  l_json     clob;',
'  l_report_layout_static_id  VARCHAR2(100) := ''IS_EVALUATION_DETAIL_REPORT_TEMPLATE'';',
'  l_report_name VARCHAR2(100) := ''EVALUATION_DETAIL_REPORT'';',
'  l_error_message  VARCHAR2(32000);',
'',
'BEGIN',
'',
'  select sert_core.is_reports_api.evaluation_detail_report_json (',
'           p_eval_id  => :P10_EVAL_ID,',
'           p_app_id => :APP_ID)',
'  into l_json',
'  from dual;',
'',
'',
'  if not sert_core.is_reports_api.report_generate (',
'     p_application_id => :APP_ID,',
'     p_data           => l_json,',
'     p_report_layout_static_id => l_report_layout_static_id,',
'     p_output_type    => apex_print.c_output_pdf ,',
'     p_content_type   => ''application/pdf'',',
'     p_report_name    => l_report_name,',
'     p_error_message  => l_error_message',
'     ) then',
'',
'    --report failed, check log table',
'    apex_error.add_error (p_message => l_error_message,',
'                          p_display_location => apex_error.c_inline_in_notification);',
'',
'  end if;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Report Failed'
,p_process_when=>'EVAL_DETAIL_REPORT_DG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Report successfully generated'
,p_internal_uid=>52392458358323216
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(96113953700601480)
,p_process_sequence=>3
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Evaluation Exception Report DG'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_document blob;',
'  l_json     clob;',
'  l_report_layout_static_id  VARCHAR2(100) := ''IS_EVALUATION_EXCEPTION_REPORT_TEMPLATE'';',
'  l_report_name VARCHAR2(100) := ''EVALUATION_EXCEPTION_REPORT'';',
'  l_error_message  VARCHAR2(32000);',
'',
'BEGIN',
'',
'  select sert_core.is_reports_api.evaluation_exception_report_json (',
'           p_eval_id  => :P10_EVAL_ID,',
'           p_app_id => :APP_ID)',
'  into l_json',
'  from dual;',
'',
'',
'  if not sert_core.is_reports_api.report_generate (',
'     p_application_id => :APP_ID,',
'     p_data           => l_json,',
'     p_report_layout_static_id => l_report_layout_static_id,',
'     p_output_type    => apex_print.c_output_pdf ,',
'     p_content_type   => ''application/pdf'',',
'     p_report_name    => l_report_name,',
'     p_error_message  => l_error_message',
'     ) then',
'',
'    --report failed, check log table',
'    apex_error.add_error (p_message => l_error_message,',
'                          p_display_location => apex_error.c_inline_in_notification);',
'',
'  end if;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Report Failed'
,p_process_when=>'EVAL_EXCEPTION_REPORT_DG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Report successfully generated'
,p_internal_uid=>52392535839323217
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(81705146700832400)
,p_process_sequence=>4
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Attribute Master Report DG'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_document blob;',
'  l_json     clob;',
'  l_report_layout_static_id  VARCHAR2(100) := ''IS_ATTRIBUTES_MASTER_REPORT_TEMPLATE'';',
'  l_report_name VARCHAR2(100) := ''ATTRIBUTES_MASTER_REPORT'';',
'  l_error_message  VARCHAR2(32000);',
'',
'BEGIN',
'',
'  select sert_core.is_reports_api.attributes_master_report_json (',
'           p_eval_id  => :P10_EVAL_ID,',
'           p_app_id => :APP_ID,',
'           p_apex_version => :G_APEX_VERSION)',
'  into l_json',
'  from dual;',
'',
'',
'  if not sert_core.is_reports_api.report_generate (',
'     p_application_id => :APP_ID,',
'     p_data           => l_json,',
'     p_report_layout_static_id => l_report_layout_static_id,',
'     p_output_type    => apex_print.c_output_pdf ,',
'     p_content_type   => ''application/pdf'',',
'     p_report_name    => l_report_name,',
'     p_error_message  => l_error_message',
'     ) then',
'',
'    --report failed, check log table',
'    apex_error.add_error (p_message => l_error_message,',
'                          p_display_location => apex_error.c_inline_in_notification);',
'',
'  end if;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Report Failed'
,p_process_when=>'EVAL_MASTER_REPORT_DG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Report successfully generated'
,p_internal_uid=>37983728839554137
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(96113813865601478)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'PLUGIN_COM.ORACLE.APEX.DOCGEN'
,p_process_name=>'Evaluation Summary Report DG_Plugin'
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
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Report successfully generated'
,p_required_patch=>wwv_flow_imp.id(100473496993138610)
,p_internal_uid=>52392396004323215
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(110204782128927780)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'PLUGIN_COM.ORACLE.APEX.DOCGEN'
,p_process_name=>'Evaluation Detail Report DG_Plugin'
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
,p_process_when_type=>'NEVER'
,p_required_patch=>wwv_flow_imp.id(100473496993138610)
,p_internal_uid=>22761946406371254
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(110202833421927778)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'PLUGIN_COM.ORACLE.APEX.DOCGEN'
,p_process_name=>'Evaluation Exception Report DG_Plugin'
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
,p_process_when_type=>'NEVER'
,p_required_patch=>wwv_flow_imp.id(100473496993138610)
,p_internal_uid=>22759997699371252
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(110203140126927778)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'PLUGIN_COM.ORACLE.APEX.DOCGEN'
,p_process_name=>'Attribute Master Report DG_Plugin'
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
,p_process_when_type=>'NEVER'
,p_required_patch=>wwv_flow_imp.id(100473496993138610)
,p_internal_uid=>22760304404371252
);
wwv_flow_imp.component_end;
end;
/
