-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 9152E35F0B89DBF18C9D8CF9F3899DEBE1B9FAC8987A75D98C29CD42028AE9C3
prompt --application/pages/page_02010
begin
--   Manifest
--     PAGE: 02010
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>2010
,p_name=>'Manage Rules'
,p_alias=>'MANAGE-RULES'
,p_step_title=>'Manage Rules'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-fieldContainer--floatingLabel .apex-item-display-only { border-style: none !important; }',
'.textarea { font-family: monospace; font-size: 12px; }',
'.apex-item-display-only  { font-size: 14px !important; }',
''))
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_read_only_when_type=>'EXISTS'
,p_read_only_when=>'select 1 from rules_v where internal_yn = ''Y'' and rule_id = :P2010_RULE_ID'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(353805269860740390)
,p_name=>'Context'
,p_template=>wwv_flow_imp.id(394422849849760056)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:margin-left-lg'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked'
,p_display_point=>'REGION_POSITION_01'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with rsr as ',
'  (',
'  select ',
'    listagg(rule_set_name, '', '') within group (order by rule_set_name) as rule_sets ',
'  from',
'    rule_set_rules_v',
'  where',
'    rule_id = :P2010_RULE_ID',
'  )',
'select',
'   active_yn',
'  ,active_value',
'  ,active_color',
'  ,nvl(rsr.rule_sets, ''- None -'') as rule_sets',
'  ,rule_hash',
'  ,created_by || '' on '' || created_on as created',
'  ,updated_by || '' on '' || updated_on as updated',
'from',
'  rules_v r',
'  ,rsr',
'where',
'  r.rule_id = :P2010_RULE_ID',
''))
,p_display_when_condition=>'P2010_RULE_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2010_RULE_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(394523437164760127)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(353893454530148245)
,p_query_column_id=>1
,p_column_alias=>'ACTIVE_YN'
,p_column_display_sequence=>10
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
' {with/}',
'        LABEL:=ACTVE_YN',
'        VALUE:=#ACTIVE_VALUE#',
'        STATE:=#ACTIVE_COLOR#',
'        ICON:=#BADGE_ICON#',
'        LABEL_DISPLAY:=N',
'    {apply THEME$BADGE/}'))
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(353893543527148246)
,p_query_column_id=>2
,p_column_alias=>'ACTIVE_VALUE'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(353893632140148247)
,p_query_column_id=>3
,p_column_alias=>'ACTIVE_COLOR'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(354103003854418946)
,p_query_column_id=>4
,p_column_alias=>'RULE_SETS'
,p_column_display_sequence=>20
,p_column_heading=>'Rule Sets'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(361884830652686092)
,p_query_column_id=>5
,p_column_alias=>'RULE_HASH'
,p_column_display_sequence=>30
,p_column_heading=>'Rule Hash'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(361884976431686093)
,p_query_column_id=>6
,p_column_alias=>'CREATED'
,p_column_display_sequence=>40
,p_column_heading=>'Created'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(361885104879686094)
,p_query_column_id=>7
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>50
,p_column_heading=>'Updated'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(362074464783101455)
,p_plug_name=>'Actions'
,p_region_name=>'actions'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>40
,p_list_id=>wwv_flow_imp.id(362279438225466362)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(394556068597760164)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(375185236552278632)
,p_plug_name=>'LEFT'
,p_region_template_options=>'#DEFAULT#:margin-left-lg'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>7
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(394701078920215058)
,p_plug_name=>'Information'
,p_parent_plug_id=>wwv_flow_imp.id(375185236552278632)
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:margin-right-md'
,p_plug_template=>wwv_flow_imp.id(394451530673760077)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395483141786020832)
,p_plug_name=>'Guidance'
,p_parent_plug_id=>wwv_flow_imp.id(375185236552278632)
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(394451530673760077)
,p_plug_display_sequence=>50
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28718629046891501)
,p_plug_name=>'Valid Exceptions'
,p_parent_plug_id=>wwv_flow_imp.id(395483141786020832)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395483192939020833)
,p_plug_name=>'Information'
,p_parent_plug_id=>wwv_flow_imp.id(395483141786020832)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395483372852020834)
,p_plug_name=>'How to Fix'
,p_parent_plug_id=>wwv_flow_imp.id(395483141786020832)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395483535026020836)
,p_plug_name=>'Builder & Help URLs'
,p_parent_plug_id=>wwv_flow_imp.id(395483141786020832)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_footer=>'<a href="https://docs.oracle.com/en/database/oracle/apex/" target="_blank">https://docs.oracle.com/en/database/oracle/apex/</a>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(375185343334278633)
,p_plug_name=>'RIGHT'
,p_region_template_options=>'#DEFAULT#:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(394701172059215059)
,p_plug_name=>'Rule Details'
,p_parent_plug_id=>wwv_flow_imp.id(375185343334278633)
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:margin-left-md'
,p_plug_template=>wwv_flow_imp.id(394451530673760077)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(353801157594740349)
,p_plug_name=>'Custom Query'
,p_parent_plug_id=>wwv_flow_imp.id(394701172059215059)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>60
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(374344350297372071)
,p_plug_name=>'APEX View'
,p_parent_plug_id=>wwv_flow_imp.id(394701172059215059)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(394795639431498797)
,p_plug_name=>'Manage Rules'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'RULES'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(354105588530418972)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(353801157594740349)
,p_button_name=>'VALIDATE_SQL'
,p_button_static_id=>'validateSQL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_image_alt=>'Validate SQL'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(65754374511786458)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(353801157594740349)
,p_button_name=>'CUSTOM_QUERY_HELP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_image_alt=>'Custom Query Help'
,p_button_redirect_url=>'f?p=&APP_ID.:2011:&SESSION.::&DEBUG.:::'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(394803580847498808)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(414553966215499010)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.:::'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(362074553390101456)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(414553966215499010)
,p_button_name=>'ACTIONS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(394562739049760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actions'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P2010_RULE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-angle-down'
,p_button_cattributes=>'data-menu="actions_menu"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(361885179793686095)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(414553966215499010)
,p_button_name=>'RULE_SETS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_image_alt=>'Rule Sets'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:2050:&SESSION.::&DEBUG.::P2050_RULE_ID,P2050_BRANCH:&P2010_RULE_ID.,2010'
,p_button_condition=>'P2010_RULE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(354708729384380645)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(414553966215499010)
,p_button_name=>'COPY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_image_alt=>'Copy'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:2012:&SESSION.::&DEBUG.:2012:P2012_RULE_ID:&P2010_RULE_ID.'
,p_button_condition=>'select 1 from rules_v where internal_yn = ''N'' and rule_id = :P2010_RULE_ID'
,p_button_condition_type=>'EXISTS'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(394805421507498814)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(414553966215499010)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'select 1 from rules_v where internal_yn = ''N'' and rule_id = :P2010_RULE_ID'
,p_button_condition_type=>'EXISTS'
,p_database_action=>'UPDATE'
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(394805814417498814)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(414553966215499010)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2010_RULE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(394805052868498814)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(414553966215499010)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'select 1 from rules_v where internal_yn = ''N'' and rule_id = :P2010_RULE_ID'
,p_button_condition_type=>'EXISTS'
,p_database_action=>'DELETE'
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(354105681840418973)
,p_branch_name=>'Add Rule Sets when Creating'
,p_branch_action=>'f?p=&APP_ID.:2050:&SESSION.::&DEBUG.:2050:P2050_RULE_ID,P2050_BRANCH:&P2010_RULE_ID.,2000&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(394805814417498814)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(394700823507215056)
,p_branch_name=>'Return to Rules'
,p_branch_action=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28718748024891502)
,p_name=>'P2010_VALID_EXCEPTIONS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(28718629046891501)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Valid Exceptions'
,p_source=>'VALID_EXCEPTIONS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'N',
  'format', 'MARKDOWN',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(339918371927672558)
,p_name=>'P2010_RULE_CRITERIA_TYPE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Criteria Type'
,p_source=>'RULE_CRITERIA_TYPE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  rule_criteria_type_name',
' ,rule_criteria_type_id',
'from',
'  rule_criteria_types',
'order by',
'  1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a Criteria Type -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345316305735294851)
,p_name=>'P2010_SHARED_COMP_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Shared Component Identifier'
,p_source=>'SHARED_COMP_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   column_name a',
'  ,column_name b',
'from ',
'  all_tab_cols ',
'where ',
'  table_name = :P2010_VIEW_NAME',
'  and owner = (select username from all_users where REGEXP_LIKE(username, ''^APEX_[0-9]{6}$'') order by username desc fetch first 1 row only)',
'order by',
'  column_id'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a Column -'
,p_lov_cascade_parent_items=>'P2010_VIEW_NAME'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>250
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(349474231602257849)
,p_name=>'P2010_COMPONENT_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Component/Additional Name'
,p_source=>'COMPONENT_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   column_name a',
'  ,column_name b',
'from ',
'  all_tab_cols ',
'where ',
'  table_name = :P2010_VIEW_NAME',
'  and owner = (select username from all_users where REGEXP_LIKE(username, ''^APEX_[0-9]{6}$'') order by username desc fetch first 1 row only)',
'order by',
'  column_id'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a Column -'
,p_lov_cascade_parent_items=>'P2010_VIEW_NAME'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>250
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(353751887097515692)
,p_name=>'P2010_RISK_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(394701078920215058)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Risk'
,p_source=>'RISK_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   risk_code || '' - '' || risk_name a',
'  ,risk_id',
'from',
'  risks',
'order by',
'  1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- None -'
,p_cHeight=>1
,p_colspan=>8
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(353752003371515693)
,p_name=>'P2010_COLUMN_TO_EVALUATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Column to Evaluate'
,p_source=>'COLUMN_TO_EVALUATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   column_name a',
'  ,column_name b',
'from ',
'  all_tab_cols ',
'where ',
'  table_name = :P2010_VIEW_NAME',
'  and owner = (select username from all_users where REGEXP_LIKE(username, ''^APEX_[0-9]{6}$'') order by username desc fetch first 1 row only)',
'order by',
'  column_id'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a Column -'
,p_lov_cascade_parent_items=>'P2010_VIEW_NAME'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>250
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(353801078079740348)
,p_name=>'P2010_COMPONENT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Component ID'
,p_source=>'COMPONENT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   column_name a',
'  ,column_name b',
'from ',
'  all_tab_cols ',
'where ',
'  table_name = :P2010_VIEW_NAME',
'  and owner = (select username from all_users where REGEXP_LIKE(username, ''^APEX_[0-9]{6}$'') order by username desc fetch first 1 row only)',
'order by',
'  column_id'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a Column -'
,p_lov_cascade_parent_items=>'P2010_VIEW_NAME'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>250
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(353801288677740350)
,p_name=>'P2010_CUSTOM_QUERY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(353801157594740349)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Custom Query'
,p_source=>'CUSTOM_QUERY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>30
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355866523768797152)
,p_name=>'P2010_ITEM_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Item Name'
,p_source=>'ITEM_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   column_name a',
'  ,column_name b',
'from ',
'  all_tab_cols ',
'where ',
'  table_name = :P2010_VIEW_NAME',
'  and owner = (select username from all_users where REGEXP_LIKE(username, ''^APEX_[0-9]{6}$'') order by username desc fetch first 1 row only)',
'order by',
'  column_id'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a Column -'
,p_lov_cascade_parent_items=>'P2010_VIEW_NAME'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>250
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375184387327278624)
,p_name=>'P2010_VIEW_COMMENTS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_prompt=>'View Comments'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375184708260278627)
,p_name=>'P2010_COLUMN_COMMENTS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_prompt=>'Column Comments'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(394385489811759930)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375185093769278631)
,p_name=>'P2010_CASE_SENSITIVE_YN'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Case Sensitive'
,p_source=>'CASE_SENSITIVE_YN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375185443295278634)
,p_name=>'P2010_ADDITIONAL_WHERE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Additional WHERE Clause'
,p_source=>'ADDITIONAL_WHERE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>3
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'Y',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375185645783278636)
,p_name=>'P2010_BUILDER_URL_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(395483535026020836)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Builder URL'
,p_source=>'BUILDER_URL_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  component_name',
' ,builder_url_id',
'from',
'  builder_urls',
'order by',
'  1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(394701320521215061)
,p_name=>'P2010_INFO'
,p_source_data_type=>'CLOB'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(395483192939020833)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Info'
,p_source=>'INFO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'N',
  'format', 'MARKDOWN',
  'max_height', '600',
  'min_height', '350')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(394701431688215062)
,p_name=>'P2010_FIX'
,p_source_data_type=>'CLOB'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(395483372852020834)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Fix'
,p_source=>'FIX'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'N',
  'format', 'MARKDOWN',
  'max_height', '600',
  'min_height', '350')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(394701779862215066)
,p_name=>'P2010_RULE_SEVERITY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(394701078920215058)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_item_default=>'select rule_severity_id from rule_severity where rule_severity_key = ''MEDIUM'''
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Severity'
,p_source=>'RULE_SEVERITY_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'RULE_SEVERITY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '5',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(394795879946498799)
,p_name=>'P2010_RULE_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Rule Id'
,p_source=>'RULE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(394796316430498799)
,p_name=>'P2010_RULE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(394701078920215058)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Rule Name'
,p_source=>'RULE_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>250
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(394796723791498800)
,p_name=>'P2010_RULE_KEY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(394701078920215058)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Rule Key'
,p_source=>'RULE_KEY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>250
,p_read_only_when=>'P2010_RULE_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(394797141624498800)
,p_name=>'P2010_CATEGORY_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(394701078920215058)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Category'
,p_source=>'CATEGORY_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CATEGORIES.CATEGORY_NAME'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(394797720561498802)
,p_name=>'P2010_APEX_VERSION'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(394701078920215058)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'APEX Version'
,p_source=>'APEX_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'APEX_VERSION'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'   substr(VERSION_NO, 1, instr(version_no,''.'',1)+1) as a',
'  ,substr(VERSION_NO, 1, instr(version_no,''.'',1)+1) as b  ',
'FROM ',
'  APEX_RELEASE',
'order by',
'  1'))
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(394832750830886627)
,p_name=>'P2010_TIME_TO_FIX'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(394701078920215058)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Time to Fix (hours)'
,p_source=>'TIME_TO_FIX'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'min_value', '0',
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(394832818206886628)
,p_name=>'P2010_ACTIVE_YN'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(394701078920215058)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_item_default=>'Y'
,p_prompt=>'Active'
,p_source=>'ACTIVE_YN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395025426902421156)
,p_name=>'P2010_RULE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(394701172059215059)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_item_default=>'APEX_VIEW'
,p_prompt=>'Rule Type'
,p_source=>'RULE_TYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:APEX View;APEX_VIEW,Custom Query;CUSTOM_QUERY'
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '3',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395025531314421157)
,p_name=>'P2010_VIEW_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'View Name'
,p_source=>'VIEW_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   view_name a',
'  ,view_name b',
'from ',
'  all_views ',
'where ',
'  view_name like ''APEX_APPL%''    ',
'  and owner = (select username from all_users where REGEXP_LIKE(username, ''^APEX_[0-9]{6}$'') order by username desc fetch first 1 row only)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a View -'
,p_cSize=>30
,p_cMaxlength=>250
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395025689951421159)
,p_name=>'P2010_COLUMN_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Column Name'
,p_source=>'COLUMN_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   column_name a',
'  ,column_name b',
'from ',
'  all_tab_cols ',
'where ',
'  table_name = :P2010_VIEW_NAME',
'  and owner = (select username from all_users where REGEXP_LIKE(username, ''^APEX_[0-9]{6}$'') order by username desc fetch first 1 row only)',
'order by',
'  column_id'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a Column -'
,p_lov_cascade_parent_items=>'P2010_VIEW_NAME'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>250
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395026645800421168)
,p_name=>'P2010_OPERAND'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_item_default=>'EQUALS'
,p_prompt=>'Pass Criteria'
,p_source=>'OPERAND'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Equals;EQUALS,Does Not Equal;DOES_NOT_EQUAL,Greater Than;GREATER_THAN,Less Than;LESS_THAN,Is Not Null;IS_NOT_NULL,Is Null;IS_NULL,Criteria Type;CRITERIA'
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395026736514421169)
,p_name=>'P2010_VAL_CHAR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Values'
,p_source=>'VAL_CHAR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'  val_char a',
' ,val_char b',
'from',
'  rules_v',
'order by',
'  1'))
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'NO_FETCH',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395483380125020835)
,p_name=>'P2010_IMPACT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(394701078920215058)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_item_default=>'PAGE'
,p_prompt=>'Impact'
,p_source=>'IMPACT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Application;APP,Shared Component;SC,Page;PAGE,Region;REGION,Item;ITEM,Column;COLUMN,Component;COMPONENT'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395483596048020837)
,p_name=>'P2010_HELP_URL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(395483535026020836)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Help URL'
,p_source=>'HELP_URL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1000
,p_field_template=>wwv_flow_imp.id(394560104116760172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'URL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395484422287020845)
,p_name=>'P2010_VAL_NUMBER'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(374344350297372071)
,p_item_source_plug_id=>wwv_flow_imp.id(394795639431498797)
,p_prompt=>'Value'
,p_source=>'VAL_NUMBER'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(394561407168760174)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(395483049462020831)
,p_validation_name=>'Value Char Required'
,p_validation_sequence=>10
,p_validation=>'P2010_VAL_CHAR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please enter at least one value'
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P2010_OPERAND in (''EQUALS'',''DOES_NOT_EQUAL'') and :P2010_RULE_TYPE = ''APEX_VIEW'' then',
'  return true;',
'else',
'  return false;',
'end if;'))
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'FUNCTION_BODY'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(345317402748294862)
,p_validation_name=>'Shared Component Name Required'
,p_validation_sequence=>20
,p_validation=>'P2010_SHARED_COMP_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please enter a Shared Component Name'
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P2010_IMPACT = ''SC'' and :P2010_RULE_TYPE = ''APEX_VIEW'' then',
'  return true;',
'else',
'  return false;',
'end if;'))
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'FUNCTION_BODY'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(395485674710020857)
,p_validation_name=>'Value Number Required'
,p_validation_sequence=>30
,p_validation=>'P2010_VAL_NUMBER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please enter a value'
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P2010_OPERAND in (''GREATER_THAN'',''LESS_THAN'') and :P2010_RULE_TYPE = ''APEX_VIEW'' then',
'  return true;',
'else',
'  return false;',
'end if;'))
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'FUNCTION_BODY'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(374344122452372069)
,p_validation_name=>'View Name not null'
,p_validation_sequence=>40
,p_validation=>'P2010_VIEW_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select a view'
,p_validation_condition=>'P2010_RULE_TYPE'
,p_validation_condition2=>'APEX_VIEW'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(374344233219372070)
,p_validation_name=>'Column Name not null'
,p_validation_sequence=>50
,p_validation=>'P2010_COLUMN_TO_EVALUATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select a column to evaluate'
,p_validation_condition=>'P2010_RULE_TYPE'
,p_validation_condition2=>'APEX_VIEW'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(375501782634137868)
,p_validation_name=>'Rule cannot be mapped to any Rule Sets'
,p_validation_sequence=>60
,p_validation=>'select 1 from rule_set_rules where rule_id = :P2010_RULE_ID'
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Rules mapped to an existing Rule Set cannot be deleted; please remove it from the Rule Set(s) first.'
,p_when_button_pressed=>wwv_flow_imp.id(394805052868498814)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(355557553846023770)
,p_validation_name=>'Rule cannot be included in any evaluations'
,p_validation_sequence=>70
,p_validation=>'select 1 from eval_results where rule_id = :P2010_RULE_ID'
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Rules included in an active Evaluation cannot be deleted; please either remove the Evaluation or set the rule to Inactive.'
,p_when_button_pressed=>wwv_flow_imp.id(394805052868498814)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(339918623670672560)
,p_validation_name=>'Criteria Type not null'
,p_validation_sequence=>80
,p_validation=>'P2010_RULE_CRITERIA_TYPE_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select a criteria type'
,p_validation_condition=>'P2010_OPERAND'
,p_validation_condition2=>'CRITERIA'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(395025790624421160)
,p_name=>'Select APEX View'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_RULE_TYPE'
,p_condition_element=>'P2010_RULE_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'APEX_VIEW'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(395025977688421161)
,p_event_id=>wwv_flow_imp.id(395025790624421160)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(374344350297372071)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(353803750999740375)
,p_event_id=>wwv_flow_imp.id(395025790624421160)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(353801157594740349)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(375184358413278623)
,p_event_id=>wwv_flow_imp.id(395025790624421160)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_OPERAND'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'EQUALS'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P2010_OPERAND'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(395026036693421162)
,p_name=>'Select Custom Query'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_RULE_TYPE'
,p_condition_element=>'P2010_RULE_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CUSTOM_QUERY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(395026105212421163)
,p_event_id=>wwv_flow_imp.id(395026036693421162)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(374344350297372071)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(353803833605740376)
,p_event_id=>wwv_flow_imp.id(395026036693421162)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(353801157594740349)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(395026779606421170)
,p_name=>'Operand Selected is Null/Not Null'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_OPERAND'
,p_condition_element=>'P2010_OPERAND'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'IS_NULL,IS_NOT_NULL'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(395026966013421171)
,p_event_id=>wwv_flow_imp.id(395026779606421170)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_VAL_CHAR,P2010_VAL_NUMBER,P2010_CASE_SENSITIVE_YN,P2010_RULE_CRITERIA_TYPE_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(395482923066020830)
,p_event_id=>wwv_flow_imp.id(395026779606421170)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_VAL_CHAR,P2010_VAL_NUMBER,P2010_RULE_CRITERIA_TYPE_ID'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(395484737932020848)
,p_name=>'Operand Selected is = or !='
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_OPERAND'
,p_condition_element=>'P2010_OPERAND'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'EQUALS,DOES_NOT_EQUAL'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(395484851256020849)
,p_event_id=>wwv_flow_imp.id(395484737932020848)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_VAL_NUMBER,P2010_RULE_CRITERIA_TYPE_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(395484904050020850)
,p_event_id=>wwv_flow_imp.id(395484737932020848)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_VAL_NUMBER,P2010_RULE_CRITERIA_TYPE_ID'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(395484997101020851)
,p_event_id=>wwv_flow_imp.id(395484737932020848)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_VAL_CHAR,P2010_CASE_SENSITIVE_YN'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P2010_RULE_TYPE'
,p_client_condition_expression=>'APEX_VIEW'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(395485147918020852)
,p_name=>'Operand Selected is > or <'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_OPERAND'
,p_condition_element=>'P2010_OPERAND'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'GREATER_THAN,LESS_THAN'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(395485189927020853)
,p_event_id=>wwv_flow_imp.id(395485147918020852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_VAL_CHAR,P2010_CASE_SENSITIVE_YN,P2010_RULE_CRITERIA_TYPE_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(395485328863020854)
,p_event_id=>wwv_flow_imp.id(395485147918020852)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_VAL_CHAR,P2010_RULE_CRITERIA_TYPE_ID'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(395485425992020855)
,p_event_id=>wwv_flow_imp.id(395485147918020852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_VAL_NUMBER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(339917845655672553)
,p_name=>'Operand Selected is Criteria Type'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_OPERAND'
,p_condition_element=>'P2010_OPERAND'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CRITERIA'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(339918166053672556)
,p_event_id=>wwv_flow_imp.id(339917845655672553)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_RULE_CRITERIA_TYPE_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(339917961948672554)
,p_event_id=>wwv_flow_imp.id(339917845655672553)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_VAL_CHAR,P2010_CASE_SENSITIVE_YN,P2010_VAL_NUMBER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(339918117885672555)
,p_event_id=>wwv_flow_imp.id(339917845655672553)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_VAL_CHAR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(375184485577278625)
,p_name=>'Fetch View Comments'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_VIEW_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(375184614166278626)
,p_event_id=>wwv_flow_imp.id(375184485577278625)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_VIEW_COMMENTS'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select comments ',
'from all_tab_comments ',
'where table_name = :P2010_VIEW_NAME',
'and owner = APEX_UTIL.GET_APEX_OWNER;'))
,p_attribute_07=>'P2010_VIEW_NAME'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(375184797200278628)
,p_name=>'Fetch Column Comments'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_COLUMN_TO_EVALUATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(375184954668278629)
,p_event_id=>wwv_flow_imp.id(375184797200278628)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COLUMN_COMMENTS'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select comments from all_col_comments where table_name = :P2010_VIEW_NAME and column_name = :P2010_COLUMN_TO_EVALUATE'
,p_attribute_07=>'P2010_VIEW_NAME,P2010_COLUMN_TO_EVALUATE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(353804536709740383)
,p_name=>'Validate SQL'
,p_event_sequence=>100
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#validateSQL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(353805006351740387)
,p_event_id=>wwv_flow_imp.id(353804536709740383)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process( "validateSQL", {',
'    x01: $v("P2010_CUSTOM_QUERY")',
'},',
'{',
'    dataType: "text", // default is json',
'    success: function( data )  {',
'    if (data === ''pass'') ',
'      { ',
'      apex.message.showPageSuccess("Valid SQL");    ',
'      }',
'    else ',
'      {',
'      alert(data);',
'      }',
'    },',
'    error: function( jqXHR, textStatus, errorThrown ) {',
'        // handle error',
'        alert(''An unexpected error has occured.'');',
'    }',
'} ',
').always( function() {',
'    // code that needs to run for both success and failure cases',
' }',
');'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(353805100592740388)
,p_name=>'Copy to Key'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_RULE_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P2010_RULE_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(353805157407740389)
,p_event_id=>wwv_flow_imp.id(353805100592740388)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_RULE_KEY'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item("P2010_RULE_NAME").getValue().toUpperCase().replace(/ /g,"_");',
''))
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(353894239057148253)
,p_name=>'Refresh Context'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(353894375788148254)
,p_event_id=>wwv_flow_imp.id(353894239057148253)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(353805269860740390)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(355866801328797155)
,p_name=>'Impact is Application'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_IMPACT'
,p_condition_element=>'P2010_IMPACT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'APP'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355866859498797156)
,p_event_id=>wwv_flow_imp.id(355866801328797155)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COLUMN_NAME,P2010_ITEM_NAME,P2010_SHARED_COMP_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355868332030797171)
,p_event_id=>wwv_flow_imp.id(355866801328797155)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COLUMN_NAME,P2010_ITEM_NAME,P2010_SHARED_COMP_NAME'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(355867843090797166)
,p_name=>'Impact is Shared Component'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_IMPACT'
,p_condition_element=>'P2010_IMPACT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SC'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355868101792797168)
,p_event_id=>wwv_flow_imp.id(355867843090797166)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_SHARED_COMP_NAME,P2010_COMPONENT_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345316370648294852)
,p_event_id=>wwv_flow_imp.id(355867843090797166)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_ITEM_NAME,P2010_COLUMN_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345316997309294858)
,p_event_id=>wwv_flow_imp.id(355867843090797166)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_ITEM_NAME,P2010_COLUMN_NAME'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(355868225271797169)
,p_name=>'Impact is Page'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_IMPACT'
,p_condition_element=>'P2010_IMPACT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'PAGE'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355868312671797170)
,p_event_id=>wwv_flow_imp.id(355868225271797169)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COLUMN_NAME,P2010_ITEM_NAME,P2010_SHARED_COMP_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355868478583797172)
,p_event_id=>wwv_flow_imp.id(355868225271797169)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COLUMN_NAME,P2010_ITEM_NAME,P2010_SHARED_COMP_NAME'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(355867011043797157)
,p_name=>'Impact is Region'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_IMPACT'
,p_condition_element=>'P2010_IMPACT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'REGION'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355867073697797158)
,p_event_id=>wwv_flow_imp.id(355867011043797157)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COLUMN_NAME,P2010_ITEM_NAME,P2010_SHARED_COMP_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355867132681797159)
,p_event_id=>wwv_flow_imp.id(355867011043797157)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COMPONENT_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355868610181797173)
,p_event_id=>wwv_flow_imp.id(355867011043797157)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COLUMN_NAME,P2010_ITEM_NAME,P2010_SHARED_COMP_NAME'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(355867323907797160)
,p_name=>'Impact is Item'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_IMPACT'
,p_condition_element=>'P2010_IMPACT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ITEM'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355867388339797161)
,p_event_id=>wwv_flow_imp.id(355867323907797160)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COLUMN_NAME,P2010_SHARED_COMP_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355867485275797162)
,p_event_id=>wwv_flow_imp.id(355867323907797160)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_ITEM_NAME,P2010_COMPONENT_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355868704081797174)
,p_event_id=>wwv_flow_imp.id(355867323907797160)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COLUMN_NAME,P2010_SHARED_COMP_NAME'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(355867597047797163)
,p_name=>'Impact is Column'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_IMPACT'
,p_condition_element=>'P2010_IMPACT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'COLUMN'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355867700603797164)
,p_event_id=>wwv_flow_imp.id(355867597047797163)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COLUMN_NAME,P2010_COMPONENT_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355867727228797165)
,p_event_id=>wwv_flow_imp.id(355867597047797163)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_ITEM_NAME,P2010_SHARED_COMP_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(355868798396797175)
,p_event_id=>wwv_flow_imp.id(355867597047797163)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_ITEM_NAME,P2010_SHARED_COMP_NAME'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(349476459209257871)
,p_name=>'Impact is Component'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_IMPACT'
,p_condition_element=>'P2010_IMPACT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'COMPONENT'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(349476531109257872)
,p_event_id=>wwv_flow_imp.id(349476459209257871)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_COMPONENT_NAME,P2010_COMPONENT_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(349476698615257873)
,p_event_id=>wwv_flow_imp.id(349476459209257871)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_ITEM_NAME,P2010_SHARED_COMP_NAME,P2010_COLUMN_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(349476768332257874)
,p_event_id=>wwv_flow_imp.id(349476459209257871)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2010_ITEM_NAME,P2010_SHARED_COMP_NAME'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(362090813108501601)
,p_name=>'Refresh Rules'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(362074553390101456)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(362091205189501612)
,p_event_id=>wwv_flow_imp.id(362090813108501601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(394795639431498797)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(362074638409101457)
,p_name=>'Confirm Delete'
,p_event_sequence=>210
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'deleteRule'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(362074759687101458)
,p_event_id=>wwv_flow_imp.id(362074638409101457)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to delete this Rule?'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(362074889031101459)
,p_event_id=>wwv_flow_imp.id(362074638409101457)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DELETE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(374344387553372072)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre Process Values'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'case',
'  -- reset custom function before updating when type = view',
'  when :P2010_RULE_TYPE = ''APEX_VIEW'' then',
'    :P2010_CUSTOM_QUERY    := null;',
'',
'  -- reset all item values before updating when type = function',
'  when :P2010_RULE_TYPE = ''CUSTOM_QUERY'' then',
'    :P2010_VIEW_NAME          := null;',
'    :P2010_COLUMN_NAME        := null;',
'    :P2010_COMPONENT_ID       := null;',
'    :P2010_COLUMN_TO_EVALUATE := null;',
'    :P2010_OPERAND            := null;',
'    :P2010_VAL_CHAR           := null;',
'    :P2010_CASE_SENSITIVE_YN  := ''N'';',
'    :P2010_VAL_NUMBER         := null;',
'    :P2010_ADDITIONAL_WHERE   := null;',
'  else',
'    null;',
'  end case;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>20633507180908950
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(394806665216498816)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(394795639431498797)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Manage Rules'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>19953185656386895
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(394806250205498815)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(394795639431498797)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Manage Rules'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>19952770645386894
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(353804832399740386)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validateSQL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_query      varchar2(32767);',
'  l_cursor     integer default dbms_sql.open_cursor;',
'begin',
'-- set l_query to the current SQL',
'l_query := apex_application.g_x01;',
'',
'-- replace tokens with a "1"; just need a valid number here to test the SQL',
'l_query := replace (l_query, ''#APP_ID#'', 1);',
'l_query := replace (l_query, ''#EVAL_ID#'', 1);',
'l_query := replace (l_query, ''#RULE_ID#'', 1);',
'',
'-- parse the SQL',
'dbms_sql.parse(l_cursor, l_query, dbms_sql.native );',
'',
'-- return "pass" if parsed successfully',
'sys.htp.prn(''pass'');',
'',
'exception',
'  when others then',
'    -- SQL did not parse; display error stack',
'    sys.htp.prn(DBMS_UTILITY.format_error_stack);',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_internal_uid=>19043006280859842
);
wwv_flow_imp.component_end;
end;
/
