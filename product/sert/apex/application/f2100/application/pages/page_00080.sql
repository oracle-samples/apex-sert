-- file_checksum: 9427362ED4C44385CC882093E9DBA5E5B1C3EE289F52D5C95057A78F9E56116E
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00080
begin
--   Manifest
--     PAGE: 00080
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>80
,p_name=>'Bulk Comments'
,p_alias=>'COMMENTS-BY-RULE'
,p_page_mode=>'MODAL'
,p_step_title=>'Bulk Comments'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(511884707145949411)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--md'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'27'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(530531340683036660)
,p_plug_name=>'Comments Form'
,p_region_template_options=>'#DEFAULT#:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>30
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(531512882738303458)
,p_plug_name=>'Comments Button'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(511923385421949487)
,p_plug_display_sequence=>40
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(539046859167455828)
,p_plug_name=>'Evaluation Results'
,p_region_name=>'evaluationResults'
,p_region_css_classes=>'refreshMe'
,p_region_template_options=>'#DEFAULT#:margin-bottom-lg:margin-left-lg:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(511921980148949486)
,p_plug_display_sequence=>50
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EVAL_RESULT_ID,',
'       EVAL_ID,',
'       RULE_SET_ID,',
'       WORKSPACE_ID,',
'       APPLICATION_ID,',
'       PAGE_ID,',
'       PAGE_NAME,',
'       PAGE,',
'       FULL_PAGE_NAME,',
'       DESCRIPTION,',
'       REGION_NAME,',
'       COMPONENT_ID,',
'       COMPONENT_NAME,',
'       COLUMN_NAME,',
'       ITEM_NAME,',
'       SHARED_COMP_NAME,',
'       SHARED_COMP_TYPE,',
'       CATEGORY_NAME,',
'       CATEGORY_KEY,',
'       CURRENT_VALUE,',
'       EXCEPTION_VALUE,',
'       VALID_VALUES,',
'       RESULT,',
'       RESULT_COLOR,',
'       REASON,',
'       RULE_ID,',
'       RULE_NAME,',
'       RISK_NAME,',
'       RISK_URL,',
'       RISK,',
'       HELP_URL,',
'       IMPACT,',
'       RULE_CRITERIA_TYPE_NAME,',
'       COMMENT_CNT,',
'       COMMENT_ICON,',
'       CREATED_BY,',
'       CREATED_ON,',
'       UPDATED_BY,',
'       UPDATED_ON',
'  from EVAL_RESULTS_PUB_V',
' where rule_id = :P80_SELECT_RULE ',
'   and application_id = :G_APPLICATION_ID',
'   and workspace_id = :G_WORKSPACE_ID',
'   and RESULT = :P80_RESULT',
' order by page_id, rule_name, description'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_ajax_items_to_submit=>'P80_SELECT_RULE,P80_RESULT'
,p_plug_query_num_rows=>10
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>true
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--md',
  'BADGE_LABEL', '&RESULT.',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_STATE', 'RESULT_COLOR',
  'BADGE_VALUE', 'RESULT',
  'DESCRIPTION', '&CATEGORY_NAME. - &RULE_NAME.<div class="t-ContentRow-overline">&DESCRIPTION.</div>',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'Y',
  'HIDE_BORDERS', 'N',
  'MISC', '<span class="&COMMENT_ICON."</span>&nbsp;&COMMENT_CNT.',
  'REMOVE_PADDING', 'Y')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(123883157031939318)
,p_name=>'PAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>300
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(123883266197939319)
,p_name=>'COMPONENT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPONENT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>310
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(123883350411939320)
,p_name=>'SHARED_COMP_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHARED_COMP_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>320
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(123883431517939321)
,p_name=>'EXCEPTION_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXCEPTION_VALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>330
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(123883549317939322)
,p_name=>'RISK_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RISK_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>340
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(123883661250939323)
,p_name=>'RISK_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RISK_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>350
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(123883725100939324)
,p_name=>'RISK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RISK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>360
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(123883857876939325)
,p_name=>'HELP_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HELP_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>370
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(123883939869939326)
,p_name=>'IMPACT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPACT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>380
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(123884038640939327)
,p_name=>'RULE_CRITERIA_TYPE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_CRITERIA_TYPE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>390
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539049089280455851)
,p_name=>'EVAL_RESULT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVAL_RESULT_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539049257044455852)
,p_name=>'EVAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVAL_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539049325817455853)
,p_name=>'APPLICATION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539049458353455854)
,p_name=>'PAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539049488219455855)
,p_name=>'PAGE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539049585389455856)
,p_name=>'REGION_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REGION_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>60
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539049677161455857)
,p_name=>'COMPONENT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPONENT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>70
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539049781257455858)
,p_name=>'COLUMN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COLUMN_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>80
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539049887390455859)
,p_name=>'ITEM_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>90
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539050025809455860)
,p_name=>'CATEGORY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CATEGORY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>100
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539050084446455861)
,p_name=>'CATEGORY_KEY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CATEGORY_KEY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>110
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539050219094455862)
,p_name=>'CURRENT_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CURRENT_VALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>120
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539050330222455863)
,p_name=>'VALID_VALUES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALID_VALUES'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>130
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539050404388455864)
,p_name=>'RESULT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESULT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>140
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539100445885547415)
,p_name=>'RESULT_COLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESULT_COLOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>150
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539100561586547416)
,p_name=>'REASON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REASON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>160
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539100611867547417)
,p_name=>'RULE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>170
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539100732283547418)
,p_name=>'RULE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>180
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539100783519547419)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>200
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539100916340547420)
,p_name=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>210
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539100994516547421)
,p_name=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>220
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539101106507547422)
,p_name=>'UPDATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>230
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(539673057304379140)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>190
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(543760374751791155)
,p_name=>'RULE_SET_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_SET_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>240
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(543760523390791156)
,p_name=>'WORKSPACE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WORKSPACE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>250
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(543760638672791157)
,p_name=>'COMMENT_CNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENT_CNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>260
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(543760741027791158)
,p_name=>'COMMENT_ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENT_ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>270
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(544952710481338215)
,p_name=>'FULL_PAGE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FULL_PAGE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>280
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(548958786032283322)
,p_name=>'SHARED_COMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHARED_COMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>290
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(558778268743189778)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511923385421949487)
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_03'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(111309164600895012)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(558778268743189778)
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
 p_id=>wwv_flow_imp.id(111309566348895014)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(558778268743189778)
,p_button_name=>'EDIT_IN_APEX'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(512259741431949617)
,p_button_image_alt=>'Edit In APEX'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-apex'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(111308350291895010)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(531512882738303458)
,p_button_name=>'ADD_COMMENT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Comment'
,p_button_position=>'CREATE'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(111309988992895014)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(558778268743189778)
,p_button_name=>'RESULT_DETAILS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Result Details'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-info-circle-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(111310336812895015)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(558778268743189778)
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
 p_id=>wwv_flow_imp.id(111310823203895016)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(558778268743189778)
,p_button_name=>'EXCEPTION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Exception'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-workflow'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(101018434118760170)
,p_name=>'P80_RESULT'
,p_is_required=>true
,p_item_sequence=>20
,p_item_default=>'FAIL'
,p_prompt=>'Result'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct result d, result r from eval_results_pub_v ',
'where application_id = :G_APPLICATION_ID',
'  and workspace_id = :G_WORKSPACE_ID',
'  and rule_id = :P80_SELECT_RULE',
'  and result not in (''PASS'',''APPROVED'')'))
,p_lov_cascade_parent_items=>'P80_SELECT_RULE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(512259205067949615)
,p_item_template_options=>'#DEFAULT#:margin-left-sm:margin-right-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(110673788043950664)
,p_name=>'P80_SELECT_RULE'
,p_item_sequence=>10
,p_prompt=>'Select Rule'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'RULES_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct category_name ||'' - ''|| rule_name d, rule_id r ',
'from eval_results_pub_v ',
'where application_id = :G_APPLICATION_ID',
'  and workspace_id = :G_WORKSPACE_ID',
'  and RESULT not in (''PASS'',''APPROVED'')',
'order by 1 '))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(512259205067949615)
,p_item_template_options=>'#DEFAULT#:margin-left-sm:margin-right-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(526649572994754840)
,p_name=>'P80_COMMENTS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(530531340683036660)
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(111320413964895075)
,p_name=>'Delete Comment'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.deleteComment'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111320852951895075)
,p_event_id=>wwv_flow_imp.id(111320413964895075)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to delete this comment?'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111321387032895078)
,p_event_id=>wwv_flow_imp.id(111320413964895075)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P80_DELETE_COMMENT_ID'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id;'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111321905636895079)
,p_event_id=>wwv_flow_imp.id(111320413964895075)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'comments_api.delete_comment(p_comment_id => :P80_DELETE_COMMENT_ID);'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111322841265895080)
,p_event_id=>wwv_flow_imp.id(111320413964895075)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Comment deleted'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(111323276129895080)
,p_name=>'Close Dialog'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(111309164600895012)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(111323762294895080)
,p_event_id=>wwv_flow_imp.id(111323276129895080)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(110673871835950665)
,p_name=>'Refresh Region'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P80_RESULT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(110674014043950666)
,p_event_id=>wwv_flow_imp.id(110673871835950665)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(539046859167455828)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(110674200742950668)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add comments'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'for i in(',
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
'  ,current_value',
'  ,eval_id',
'from ',
'  eval_results_pub_v',
'where',
'      rule_id = :P80_SELECT_RULE',
'  and application_id = :G_APPLICATION_ID',
'  and workspace_id = :G_WORKSPACE_ID',
'  and RESULT = :P80_RESULT)',
'loop',
'',
'comments_api.add_comment',
'  (',
'   p_rule_set_id      => i.rule_set_id',
'  ,p_rule_id          => :P80_SELECT_RULE',
'  ,p_workspace_id     => i.workspace_id',
'  ,p_application_id   => i.application_id',
'  ,p_page_id          => i.page_id',
'  ,p_component_id     => i.component_id',
'  ,p_component_name   => i.component_name',
'  ,p_column_name      => i.column_name',
'  ,p_item_name        => i.item_name',
'  ,p_shared_comp_name => i.shared_comp_name',
'  ,p_comments        => :P80_COMMENTS',
'  );',
'',
'',
'end loop;',
'end;',
'',
'',
'',
'  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(111308350291895010)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_internal_uid=>12548265747979449
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(111318090221895065)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_internal_uid=>13192155226923846
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(103021662432600934)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Select Rule'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'IF :P70_BULK_ACTION = ''RAISE'' THEN',
'   :P80_SELECT_RULE := :P70_SELECT_RULE_RAISE;',
' ELSIF :P70_BULK_ACTION = ''AR'' THEN',
'   :P80_SELECT_RULE := :P70_SELECT_RULE_AR;',
'END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>15578826710044408
);
wwv_flow_imp.component_end;
end;
/
