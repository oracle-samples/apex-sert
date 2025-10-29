-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 93F1DC5C43C4F344847D0A1309B1E39AD2AE599992F8A43E99699A82B3DE3038
prompt --application/pages/page_02050
begin
--   Manifest
--     PAGE: 02050
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>2050
,p_name=>'Manage Rule Set Associations'
,p_alias=>'MANAGE-RULE-SET-ASSOCIATIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Manage Rule Set Associations'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(394386952125759954)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(354106033141418977)
,p_plug_name=>'Content'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(354106346176418980)
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
 p_id=>wwv_flow_imp.id(354106484071418981)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(354106346176418980)
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
 p_id=>wwv_flow_imp.id(354106803545418984)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(354106346176418980)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(353894178761148252)
,p_branch_name=>'Return to Rules Report'
,p_branch_action=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(354106803545418984)
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P2050_BRANCH'
,p_branch_condition_text=>'2000'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(353893860201148249)
,p_name=>'P2050_BRANCH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(354106033141418977)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(354106134087418978)
,p_name=>'P2050_RULE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(354106033141418977)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(354106253719418979)
,p_name=>'P2050_RULE_SETS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(354106033141418977)
,p_item_default=>'select listagg(rule_set_id, '':'') from rule_set_rules_v where rule_id = :P2050_RULE_ID'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Rule Sets'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  rule_set_name',
'  ,rule_set_id',
'from',
'  rule_sets_v',
'where',
'  apex_version = (select apex_version from rules where rule_id = :P2050_RULE_ID)',
''))
,p_cHeight=>10
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_controls', 'ALL')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(354106605253418982)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(354106484071418981)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(354106637009418983)
,p_event_id=>wwv_flow_imp.id(354106605253418982)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(354106880129418985)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Rule Sets'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_result apex_application_global.vc_arr2;',
'begin',
'',
'-- remove all associatations',
'delete from rule_set_rules where rule_id = :P2050_RULE_ID;',
'',
'-- add back the ones selected',
'l_result := apex_string.string_to_table(:P2050_RULE_SETS,'':''); ',
'for x in 1..l_result.count',
'loop',
'  insert into rule_set_rules (rule_id, rule_set_id) values (:P2050_RULE_ID, l_result(x));',
'end loop;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(354106803545418984)
,p_internal_uid=>19345054010538441
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(353894068617148251)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(354106803545418984)
,p_process_when=>'P2050_BRANCH'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'2010'
,p_internal_uid=>19132242498267707
);
wwv_flow_imp.component_end;
end;
/
