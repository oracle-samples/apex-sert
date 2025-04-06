-- file_checksum: 0FB77D3E0D8CCBA420186F0A14285A7C57C78119EC2B2B10382709AC5CC69680
prompt --application/pages/page_05000
begin
--   Manifest
--     PAGE: 05000
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
 p_id=>5000
,p_name=>'Upgrade'
,p_alias=>'UPGRADE'
,p_page_mode=>'MODAL'
,p_step_title=>'Upgrade'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(73442963665585809)
,p_plug_name=>'Upgrade'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Clicking <b>Upgrade</b> will copy all Rule Sets, Rules & Exceptions to the current version of APEX.</p>',
'<p>Rules that are upgraded should be tested to ensure that they still function properly.  You may also need to add additional rules to cover new features of APEX.</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(73443108831585810)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394425593983760058)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(73443330744585812)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(73443108831585810)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(73443164388585811)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(73443108831585810)
,p_button_name=>'UPGRADE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upgrade'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(73443684985585816)
,p_branch_name=>'Refresh Calling Page'
,p_branch_action=>'P5000_BRANCH_TO'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_imp.id(73443164388585811)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73443611012585815)
,p_name=>'P5000_BRANCH_TO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(73442963665585809)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(73443433850585813)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(73443330744585812)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(73443531427585814)
,p_event_id=>wwv_flow_imp.id(73443433850585813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(73443787223585817)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Upgrade'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'RULES_PKG'
,p_attribute_04=>'UPGRADE_RULES'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(73443164388585811)
,p_internal_uid=>8375237558696229
);
wwv_flow_imp.component_end;
end;
/
