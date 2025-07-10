-- file_checksum: A2DC913C7D9879D721524403CD3062BA59941F720C0B126F02E76C9A21000940
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00020
begin
--   Manifest
--     PAGE: 00020
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
 p_id=>20
,p_name=>'Comments'
,p_alias=>'COMMENTS'
,p_page_mode=>'MODAL'
,p_step_title=>'Comments'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(511884707145949411)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--md'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'27'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(513471241751831061)
,p_plug_name=>'Comments'
,p_region_template_options=>'#DEFAULT#:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_imp.id(511921980148949486)
,p_plug_display_sequence=>50
,p_query_type=>'TABLE'
,p_query_table=>'COMMENTS_PUB_V'
,p_query_where=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   rule_set_id     || '':''',
'|| rule_id         || '':''',
'|| workspace_id    || '':''',
'|| application_id  || '':''',
'|| page_id         || '':''',
'|| component_id    || '':''',
'|| component_name  || '':'' ',
'|| item_name       || '':''',
'|| column_name     || '':''',
'|| shared_comp_name ',
'= ',
'   :P20_RULE_SET_ID    || '':''',
'|| :P20_RULE_ID        || '':''',
'|| :P20_WORKSPACE_ID   || '':''',
'|| :P20_APPLICATION_ID || '':''',
'|| :P20_PAGE_ID        || '':''',
'|| :P20_COMPONENT_ID   || '':''',
'|| :P20_COMPONENT_NAME || '':''',
'|| :P20_ITEM_NAME      || '':''',
'|| :P20_COLUMN_NAME    || '':''',
'|| :P20_SHARED_COMP_NAME',
''))
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'created_on desc'
,p_include_rowid_column=>false
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$COMMENTS'
,p_plug_query_num_rows=>10
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>true
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'AVATAR_ICON', 'fa-user',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_TYPE', 'icon',
  'COMMENT_DATE', 'CREATED_ON',
  'COMMENT_TEXT', 'COMMENTS',
  'DISPLAY_AVATAR', 'Y',
  'STYLE', 't-Comments--basic',
  'USER_NAME', 'CREATED_BY')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518340255533379744)
,p_name=>'COMMENT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENT_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518340357321379745)
,p_name=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENTS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518340544087379746)
,p_name=>'RULE_SET_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_SET_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518340557671379747)
,p_name=>'RULE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518340699100379748)
,p_name=>'WORKSPACE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WORKSPACE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518340839678379749)
,p_name=>'APPLICATION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>60
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518340886955379750)
,p_name=>'PAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>70
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518340989532379751)
,p_name=>'COMPONENT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPONENT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>80
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518341075668379752)
,p_name=>'COLUMN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COLUMN_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>90
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518341157748379753)
,p_name=>'ITEM_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>100
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518341290659379754)
,p_name=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>110
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518341398872379755)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>120
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518341463598379756)
,p_name=>'UPDATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>130
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(518341571271379757)
,p_name=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>140
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517360132501112960)
,p_plug_name=>'Comments Form'
,p_region_template_options=>'#DEFAULT#:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(518341674556379758)
,p_plug_name=>'Comments Button'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(511923385421949487)
,p_plug_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(545607060561266078)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511923385421949487)
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(545639192970673503)
,p_plug_name=>'&G_RULE_NAME.'
,p_icon_css_classes=>'&G_ICON.'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--noPadding:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(511953925299949517)
,p_plug_display_sequence=>0
,p_plug_header=>'&G_CATEGORY_NAME.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523717079029414335)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(545607060561266078)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-times-circle-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523715940367414334)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(545607060561266078)
,p_button_name=>'EDIT_IN_APEX'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(512259741431949617)
,p_button_image_alt=>'Edit In APEX'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-apex'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(513471427492831063)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(518341674556379758)
,p_button_name=>'ADD_COMMENT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Comment'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523716648594414335)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(545607060561266078)
,p_button_name=>'RESULT_DETAILS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Result Details'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-info-circle-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523716313400414334)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(545607060561266078)
,p_button_name=>'COMMENTS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Comments'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-comments-o'
,p_button_cattributes=>'style="font-weight:bold; border-top: 4px green solid;"'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523684443749218549)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(545607060561266078)
,p_button_name=>'EXCEPTION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Exception'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:30::'
,p_button_condition=>'return exceptions_api.show_exception(p_eval_result_id => :G_EVAL_RESULT_ID);'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-workflow'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(513471280747831062)
,p_name=>'P20_COMMENTS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_prompt=>'Comments'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(512257901776949613)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(513471588155831065)
,p_name=>'P20_APPLICATION_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(513471738796831066)
,p_name=>'P20_EVAL_RESULT_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(517556368481243054)
,p_name=>'P20_RULE_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(517556515818243055)
,p_name=>'P20_COMPONENT_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(517556626776243056)
,p_name=>'P20_ITEM_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(517556707327243057)
,p_name=>'P20_COLUMN_NAME'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(517556903830243059)
,p_name=>'P20_PAGE_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(517557061367243061)
,p_name=>'P20_WORKSPACE_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(517557217151243062)
,p_name=>'P20_RULE_SET_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(518342905274379770)
,p_name=>'P20_DELETE_COMMENT_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(522757384997735247)
,p_name=>'P20_SHARED_COMP_NAME'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(526914396333698235)
,p_name=>'P20_COMPONENT_NAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(517360132501112960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(518341846714379759)
,p_name=>'Add Comment'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(513471427492831063)
,p_condition_element=>'P20_COMMENTS'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(518341926337379760)
,p_event_id=>wwv_flow_imp.id(518341846714379759)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'comments_api.add_comment',
'(',
'   p_rule_set_id      => :P20_RULE_SET_ID ',
'  ,p_rule_id          => :P20_RULE_ID     ',
'  ,p_workspace_id     => :P20_WORKSPACE_ID',
'  ,p_application_id   => :P20_APPLICATION_ID',
'  ,p_page_id          => :P20_PAGE_ID     ',
'  ,p_component_id     => :P20_COMPONENT_ID',
'  ,p_column_name      => :P20_COLUMN_NAME ',
'  ,p_item_name        => :P20_ITEM_NAME',
'  ,p_shared_comp_name => :P20_SHARED_COMP_NAME',
'  ,p_comments         => :P20_COMMENTS',
'  ,p_component_name   => :P20_COMPONENT_NAME',
');'))
,p_attribute_02=>'P20_COMMENTS,P20_EVAL_RESULT_ID,P20_RULE_SET_ID,P20_RULE_ID,P20_WORKSPACE_ID,P20_APPLICATION_ID,P20_PAGE_ID,P20_COMPONENT_ID,P20_ITEM_NAME,P20_COLUMN_NAME,P20_SHARED_COMP_NAME,P20_COMPONENT_NAME'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(518342090005379762)
,p_event_id=>wwv_flow_imp.id(518341846714379759)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_COMMENTS'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(518341951503379761)
,p_event_id=>wwv_flow_imp.id(518341846714379759)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(513471241751831061)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(518342598642379767)
,p_name=>'Delete Comment'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.deleteComment'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(518343213102379773)
,p_event_id=>wwv_flow_imp.id(518342598642379767)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to delete this comment?'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(518342736235379768)
,p_event_id=>wwv_flow_imp.id(518342598642379767)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_DELETE_COMMENT_ID'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id;'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(518342806054379769)
,p_event_id=>wwv_flow_imp.id(518342598642379767)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'comments_api.delete_comment(p_comment_id => :P20_DELETE_COMMENT_ID);'
,p_attribute_02=>'P20_DELETE_COMMENT_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(518342977850379771)
,p_event_id=>wwv_flow_imp.id(518342598642379767)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(513471241751831061)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(518343336090379774)
,p_event_id=>wwv_flow_imp.id(518342598642379767)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Comment deleted'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(523684157170218547)
,p_name=>'Close Dialog'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(523717079029414335)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(523684344367218548)
,p_event_id=>wwv_flow_imp.id(523684157170218547)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(517557273343243063)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Add Comment'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'COMMENTS_API'
,p_attribute_04=>'ADD_COMMENT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(513471427492831063)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_internal_uid=>26497724802570930
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(517557419688243064)
,p_page_process_id=>wwv_flow_imp.id(517557273343243063)
,p_page_id=>20
,p_name=>'p_rule_set_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P20_RULE_SET_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(517557516816243065)
,p_page_process_id=>wwv_flow_imp.id(517557273343243063)
,p_page_id=>20
,p_name=>'p_rule_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P20_RULE_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(517557588768243066)
,p_page_process_id=>wwv_flow_imp.id(517557273343243063)
,p_page_id=>20
,p_name=>'p_workspace_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P20_WORKSPACE_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(517557680525243067)
,p_page_process_id=>wwv_flow_imp.id(517557273343243063)
,p_page_id=>20
,p_name=>'p_application_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>40
,p_value_type=>'ITEM'
,p_value=>'P20_APPLICATION_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(517557805042243068)
,p_page_process_id=>wwv_flow_imp.id(517557273343243063)
,p_page_id=>20
,p_name=>'p_page_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'P20_PAGE_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(517557911702243069)
,p_page_process_id=>wwv_flow_imp.id(517557273343243063)
,p_page_id=>20
,p_name=>'p_component_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>60
,p_value_type=>'ITEM'
,p_value=>'P20_COMPONENT_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(517558040017243070)
,p_page_process_id=>wwv_flow_imp.id(517557273343243063)
,p_page_id=>20
,p_name=>'p_column_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>70
,p_value_type=>'ITEM'
,p_value=>'P20_COLUMN_NAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(517558142297243071)
,p_page_process_id=>wwv_flow_imp.id(517557273343243063)
,p_page_id=>20
,p_name=>'p_item_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>80
,p_value_type=>'ITEM'
,p_value=>'P20_ITEM_NAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(517558211274243072)
,p_page_process_id=>wwv_flow_imp.id(517557273343243063)
,p_page_id=>20
,p_name=>'p_comments'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>100
,p_value_type=>'ITEM'
,p_value=>'P20_COMMENTS'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(522757593201735249)
,p_page_process_id=>wwv_flow_imp.id(517557273343243063)
,p_page_id=>20
,p_name=>'p_shared_comp_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>90
,p_value_type=>'ITEM'
,p_value=>'P20_SHARED_COMP_NAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(526914459909698236)
,p_page_process_id=>wwv_flow_imp.id(517557273343243063)
,p_page_id=>20
,p_name=>'p_component_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>110
,p_value_type=>'ITEM'
,p_value=>'P20_COMPONENT_NAME'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(517558321114243073)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(513471427492831063)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_internal_uid=>26498772573570940
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(517556822247243058)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Values for Component Key'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   workspace_id',
'  ,application_id',
'  ,page_id',
'  ,rule_id',
'  ,rule_set_id',
'  ,component_id',
'  ,component_name',
'  ,column_name',
'  ,item_name',
'  ,shared_comp_name',
'into',
'   :P20_WORKSPACE_ID',
'  ,:P20_APPLICATION_ID',
'  ,:P20_PAGE_ID',
'  ,:P20_RULE_ID',
'  ,:P20_RULE_SET_ID',
'  ,:P20_COMPONENT_ID',
'  ,:P20_COMPONENT_NAME',
'  ,:P20_COLUMN_NAME',
'  ,:P20_ITEM_NAME',
'  ,:P20_SHARED_COMP_NAME',
'from ',
'  eval_results_pub_v',
'where',
'  eval_result_id = :G_EVAL_RESULT_ID;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>26497273706570925
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(127868122579496841)
,p_region_id=>wwv_flow_imp.id(513471241751831061)
,p_position_id=>wwv_flow_imp.id(2312297812548075508)
,p_display_sequence=>10
,p_template_id=>wwv_flow_imp.id(2312298404053082965)
,p_label=>'Delete'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
,p_link_attributes=>'class="deleteComment" id="&COMMENT_ID."'
,p_show_as_disabled=>false
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>'''&CREATED_BY.'' = :APP_USER'
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp.component_end;
end;
/
