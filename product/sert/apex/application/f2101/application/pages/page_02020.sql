-- file_checksum: 09FB1EE293C2856CC70A3470D0B1755A9CF3AA856BC75E26201A27A092A9C428
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_02020
begin
--   Manifest
--     PAGE: 02020
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>2020
,p_name=>'Upload Rules'
,p_alias=>'UPLOAD-RULES'
,p_page_mode=>'MODAL'
,p_step_title=>'Upload Rules'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(394416172125760029)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_height=>'825'
,p_dialog_width=>'1200'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(375384405702119626)
,p_plug_name=>'Content'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(375384647262119628)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394425593983760058)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(375384940967119631)
,p_plug_name=>'Steps'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>10
,p_list_id=>wwv_flow_imp.id(375449574827050457)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(394554653424760163)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(375384876883119630)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(375384647262119628)
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
 p_id=>wwv_flow_imp.id(375384748051119629)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(375384647262119628)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(375385281434119635)
,p_branch_name=>'Goto Preview File'
,p_branch_action=>'f?p=&APP_ID.:2030:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375384492799119627)
,p_name=>'P2020_NAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(375384405702119626)
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_multiple_files', 'N',
  'display_as', 'DROPZONE_BLOCK',
  'dropzone_title', 'Upload APEX-SERT Rules',
  'file_types', '.json',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(375385020157119632)
,p_name=>'Cancel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(375384876883119630)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(375385142292119633)
,p_event_id=>wwv_flow_imp.id(375385020157119632)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(355557688668023771)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_attribute_01=>'PAGES'
,p_attribute_02=>'2030,2040'
,p_internal_uid=>20795862549143227
);
wwv_flow_imp.component_end;
end;
/
