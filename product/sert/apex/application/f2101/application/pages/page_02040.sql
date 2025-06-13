-- file_checksum: 2032D9814DAC464BB63338A49225DA35DFF4D2EE1078FD18B267D88786D5AE5D
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_02040
begin
--   Manifest
--     PAGE: 02040
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
 p_id=>2040
,p_name=>'Rules Uploaded'
,p_alias=>'RULES-UPLOADED'
,p_page_mode=>'MODAL'
,p_step_title=>'Rules Uploaded'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(394416172125760029)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_height=>'825'
,p_dialog_width=>'1200'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(375500918638137859)
,p_name=>'Failed Results'
,p_template=>wwv_flow_imp.id(394422849849760056)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--horizontalBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'--  c001 as result',
'  c002 as reason',
' ,c003 as rule_name',
' ,c004 as rule_key',
' ,c005 as category',
' ,c006 as risk',
'from',
'  apex_collections',
'where',
'  collection_name = ''RULES''',
'  and c001 = ''FAIL'''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(394527652631760130)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(375501710223137867)
,p_query_column_id=>1
,p_column_alias=>'REASON'
,p_column_display_sequence=>20
,p_column_heading=>'Reason'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(375501050779137860)
,p_query_column_id=>2
,p_column_alias=>'RULE_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Rule'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(375501116486137861)
,p_query_column_id=>3
,p_column_alias=>'RULE_KEY'
,p_column_display_sequence=>40
,p_column_heading=>'Rule'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(375501433120137864)
,p_query_column_id=>4
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>60
,p_column_heading=>'Category'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(353804507306740382)
,p_query_column_id=>5
,p_column_alias=>'RISK'
,p_column_display_sequence=>70
,p_column_heading=>'Risk'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(375501487611137865)
,p_plug_name=>'Notice'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_template=>wwv_flow_imp.id(394417639951760031)
,p_plug_display_sequence=>20
,p_plug_source=>'Some of your rules did not upload.  Please see the report below for details.'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  1',
'from',
'  apex_collections',
'where',
'  collection_name = ''RULES''',
'  and c001 = ''FAIL'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(375501673171137866)
,p_plug_name=>'Notice'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--success'
,p_plug_template=>wwv_flow_imp.id(394417639951760031)
,p_plug_display_sequence=>30
,p_plug_source=>'All rules have been uploaded.'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  1',
'from',
'  apex_collections',
'where',
'  collection_name = ''RULES''',
'  and c001 = ''FAIL'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(418959985755477833)
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
 p_id=>wwv_flow_imp.id(418960279460477836)
,p_plug_name=>'Steps'
,p_region_template_options=>'#DEFAULT#:margin-bottom-lg'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>10
,p_list_id=>wwv_flow_imp.id(375449574827050457)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(394554653424760163)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(375556733526218450)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(418959985755477833)
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
 p_id=>wwv_flow_imp.id(375556322530218448)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(418959985755477833)
,p_button_name=>'CLOSE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(375560030809218456)
,p_branch_name=>'Return to Rules Report'
,p_branch_action=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(375556322530218448)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(375559071592218455)
,p_name=>'Cancel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(375556733526218450)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(375559565340218455)
,p_event_id=>wwv_flow_imp.id(375559071592218455)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp.component_end;
end;
/
