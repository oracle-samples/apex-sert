-- file_checksum: 38008EA799B6758CC9EA2966F260D90AEA85B8EEEBB389795CBC8D42A4278C59
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00280
begin
--   Manifest
--     PAGE: 00280
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>280
,p_name=>'Evaluation Details'
,p_alias=>'EVALUATION-DETAILS1'
,p_page_mode=>'MODAL'
,p_step_title=>'Evaluation Details'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(468163289284671148)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--xl:t-PageBody--noContentPadding'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(76377493695022397)
,p_plug_name=>'Evaluation Details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468199188089671222)
,p_plug_display_sequence=>50
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  ca1.category_id, ',
'  ca1.category_name,',
'  er1.eval_result_id,',
'  er1.rule_id,',
'  er1.rule_name,',
'  er1.description,',
'  er1.component_name,',
'  er1.application_id,',
'  er1.eval_id,                 ',
'  er1.result, ',
'  er1.page_id, ',
'  er1.component_id,',
'  er1.item_name,',
'  er1.current_value,',
'  ru1.info,',
'  ru1.fix,',
'  decode(er1.result,''FAIL'',NULL,er1.result) approved_flag',
'from',
'   sert_core.eval_results_pub_v er1,',
'   sert_core.categories_v ca1,',
'   sert_core.rules_pub_v ru1',
'where 1=1',
'and er1.eval_id = :P280_EVAL_ID  --SYS_CONTEXT(''SV_SERT_CTX'', ''COLLECTION_ID'')',
'and er1.result not like ''%PASS%''',
'and er1.category_key = ca1.category_key',
'and ca1.category_key = ru1.category_key',
'and ru1.rule_id = er1.rule_id',
'and (:P280_CATEGORY is null or :P280_CATEGORY = ca1.category_key)',
'order by ca1.category_id, er1.rule_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P280_EVAL_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(98616151675746613)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'SUJITH.SASANKAN@ORACLE.COM'
,p_internal_uid=>98616151675746613
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98616247869746614)
,p_db_column_name=>'CATEGORY_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Category Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98616339765746615)
,p_db_column_name=>'CATEGORY_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Category Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98616406456746616)
,p_db_column_name=>'EVAL_RESULT_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Eval Result Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98635889946740967)
,p_db_column_name=>'RULE_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Rule Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98635936551740968)
,p_db_column_name=>'RULE_NAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Rule Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98636038669740969)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98636120724740970)
,p_db_column_name=>'COMPONENT_NAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Component Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98636215555740971)
,p_db_column_name=>'APPLICATION_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Application ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98636344719740972)
,p_db_column_name=>'EVAL_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Eval Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98636416511740973)
,p_db_column_name=>'RESULT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Result'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98636537936740974)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Page ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98636651634740975)
,p_db_column_name=>'COMPONENT_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Component Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98636745529740976)
,p_db_column_name=>'ITEM_NAME'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Item Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98636892040740977)
,p_db_column_name=>'CURRENT_VALUE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Current Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(98636999748740978)
,p_db_column_name=>'APPROVED_FLAG'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Approved Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12988191508532929)
,p_db_column_name=>'INFO'
,p_display_order=>160
,p_column_identifier=>'R'
,p_column_label=>'Info'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12988285977532930)
,p_db_column_name=>'FIX'
,p_display_order=>170
,p_column_identifier=>'S'
,p_column_label=>'Fix'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(98652839767734471)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'492095'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'APPLICATION_ID:CATEGORY_NAME:RULE_NAME:PAGE_ID:DESCRIPTION:RESULT:CURRENT_VALUE'
,p_sort_column_1=>'CATEGORY_NAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'RULE_NAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PAGE_ID'
,p_sort_direction_3=>'ASC NULLS LAST'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'APPLICATION_ID:CATEGORY_NAME:RULE_NAME'
,p_break_enabled_on=>'APPLICATION_ID:CATEGORY_NAME:RULE_NAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(104515522227194122)
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
 p_id=>wwv_flow_imp.id(567244841380021765)
,p_plug_name=>'Select Page'
,p_region_name=>'selectPageRegion'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(468241383290671261)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_04'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(104515632469194123)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(104515522227194122)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_image_alt=>'Close'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(49466248333750115)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(567244841380021765)
,p_button_name=>'RE-EVALUATE_PAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(49474891456750102)
,p_branch_name=>'Stay on Evaluation Summary'
,p_branch_action=>'f?p=&APP_ID.:280:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'RE-EVALUATE,RE-EVALUATE_PAGE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(49474441986750103)
,p_branch_name=>'Return to Home Page'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'DELETE_EVALUATION,RE-EVALUATE_BACKGROUND'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(567275790305021664)
,p_name=>'P280_PAGE_ID'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(567244841380021765)
,p_prompt=>'Page'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  page_id || '' - '' || page_name a',
'  ,page_id',
'from',
'  apex_application_pages',
'where',
'  application_id = (select application_id from evals_pub_v where eval_id = :P280_EVAL_ID)',
'  and page_id > 0',
'order by',
'  page_id'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(468537787206671352)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(567611619206399372)
,p_name=>'P280_EVAL_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49469332030750109)
,p_name=>'reEvaluate'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'reEvaluate'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49469880022750108)
,p_event_id=>wwv_flow_imp.id(49469332030750109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RE-EVALUATE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49470235847750108)
,p_name=>'reEvaluateBackground'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'reEvaluateBackground'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49470793797750107)
,p_event_id=>wwv_flow_imp.id(49470235847750108)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RE-EVALUATE_BACKGROUND'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49471129878750107)
,p_name=>'reEvaluatePage'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'reEvaluatePage'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49471656634750106)
,p_event_id=>wwv_flow_imp.id(49471129878750107)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(567244841380021765)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49472064218750106)
,p_name=>'deleteEvaluation'
,p_event_sequence=>70
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'deleteEvaluation'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49472513977750105)
,p_event_id=>wwv_flow_imp.id(49472064218750106)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to delete this evaluation?  All notes and exceptions will also be deleted.'
,p_attribute_02=>'Confirm Deletion'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(49473069154750105)
,p_event_id=>wwv_flow_imp.id(49472064218750106)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DELETE_EVALUATION'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(49473464941750104)
,p_name=>'Refresh page'
,p_event_sequence=>100
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(104515798882194124)
,p_name=>'Close Dialog'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(104515632469194123)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(104515862736194125)
,p_event_id=>wwv_flow_imp.id(104515798882194124)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49467725437750112)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate Application'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P280_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P280_EVAL_ID',
'    ,p_rule_set_key      => x.rule_set_key',
'    ,p_run_in_background => ''N''',
'    ,p_eval_id_out       => l_eval_id',
'    );',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RE-EVALUATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>49467725437750112
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49468504429750110)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate in the Background'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P280_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P280_EVAL_ID',
'    ,p_rule_set_key      => x.rule_set_key',
'    ,p_run_in_background => ''Y''',
'    ,p_eval_id_out       => l_eval_id',
'    );',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RE-EVALUATE_BACKGROUND'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>49468504429750110
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49468134963750111)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-Evaluate for a Page'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P280_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'     p_application_id    => x.application_id',
'    ,p_eval_id           => :P280_EVAL_ID',
'    ,p_page_id           => :P280_PAGE_ID',
'    ,p_rule_set_key      => x.rule_set_key',
'    ,p_run_in_background => ''N''',
'    ,p_eval_id_out       => l_eval_id',
'    );',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RE-EVALUATE_PAGE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>49468134963750111
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(49468954842750110)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Evaluation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_eval_id number;',
'begin',
'for x in (select * from evals_pub_v where eval_id = :P280_EVAL_ID)',
'loop',
'  eval_pkg.delete_eval',
'    (',
'    p_eval_id           => :P280_EVAL_ID',
'    );',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_EVALUATION'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Evaluation Deleted'
,p_internal_uid=>49468954842750110
);
wwv_flow_imp.component_end;
end;
/
