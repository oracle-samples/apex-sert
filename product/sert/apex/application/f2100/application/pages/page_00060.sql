-- file_checksum: A7D32C2526F934739144E6B4A5CE109C8C942F93294411926B534A6277B0577C
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00060
begin
--   Manifest
--     PAGE: 00060
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
 p_id=>60
,p_name=>'Exception Details'
,p_alias=>'EXCEPTION-DETAILS'
,p_step_title=>'Exception Details'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// set the smart filters based on clicks from the chart',
'function setCategory(pCategoryName)',
'{ ',
'  apex.item("P10_RESULT").value = ''FAIL'';',
'  apex.item("P10_CATEGORY_NAME").value = pCategoryName;',
'  // wait .75 sec and refresh, else data is stale',
'  setTimeout(function() {',
'    apex.region("evaluationResults").refresh();',
'  }, 750);',
'}',
'',
'function setResult(pResultName)',
'{ ',
'  apex.item("P10_SEARCH").value = "";',
'  apex.item("P10_CATEGORY_NAME").value = "";',
'  apex.item("P10_RULE_NAME").value = "";',
'  apex.item("P10_FULL_PAGE_NAME").value = "";',
'  apex.item("P10_RESULT").value = pResultName;',
'  // wait .75 sec and refresh, else data is stale',
'  setTimeout(function() {',
'    apex.region("evaluationResults").refresh();',
'  }, 750);',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(108914546082750146)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511999637997949547)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(511883866849949405)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(512262008702949622)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(108914674746750147)
,p_plug_name=>'Exceptions'
,p_region_css_classes=>'refreshMe'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511977446662949534)
,p_plug_display_sequence=>50
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select er.EVAL_RESULT_ID,',
'       er.EVAL_ID,',
'       er.RULE_SET_ID,',
'       er.WORKSPACE_ID,',
'       er.APPLICATION_ID,',
'       er.PAGE_ID,',
'       er.PAGE_NAME,',
'       er.PAGE,',
'       er.FULL_PAGE_NAME,',
'       er.DESCRIPTION,',
'       er.REGION_NAME,',
'       er.COMPONENT_ID,',
'       er.COMPONENT_NAME,',
'       er.COLUMN_NAME,',
'       er.ITEM_NAME,',
'       er.SHARED_COMP_NAME,',
'       er.SHARED_COMP_TYPE,',
'       er.CATEGORY_NAME,',
'       er.CATEGORY_KEY,',
'       er.CURRENT_VALUE,',
'       er.EXCEPTION_VALUE,',
'       er.VALID_VALUES,',
'       er.RESULT,',
'       er.RESULT_COLOR,',
'       er.REASON,',
'       er.RULE_ID,',
'       er.RULE_NAME,',
'       er.RISK_NAME,',
'       er.RISK_URL,',
'       er.RISK,',
'       er.HELP_URL,',
'       er.IMPACT,',
'       er.RULE_CRITERIA_TYPE_NAME,',
'       ex.EXCEPTION',
'  from EVAL_RESULTS_PUB_V er ',
'       left join',
'       sert_core.exceptions ex ',
'   ON',
'      er.rule_set_id     || '':''',
'   || er.rule_id         || '':''',
'   || er.workspace_id    || '':''',
'   || er.application_id  || '':''',
'   || er.page_id         || '':''',
'   || er.component_id    || '':''',
'   || er.item_name       || '':''',
'   || er.column_name     || '':''',
'   || er.shared_comp_name ',
'   = ',
'      ex.rule_set_id    || '':''',
'   || ex.rule_id        || '':''',
'   || ex.workspace_id   || '':''',
'   || ex.application_id || '':''',
'   || ex.page_id        || '':''',
'   || ex.component_id   || '':''',
'   || ex.item_name      || '':''',
'   || ex.column_name    || '':''',
'   || ex.shared_comp_name   ',
'   where er.eval_id = :P60_EVAL_ID',
'   --and er.result = ''FAIL'''))
,p_plug_source_type=>'NATIVE_IG'
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
,p_landmark_type=>'region'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110650083657829934)
,p_name=>'EVAL_RESULT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVAL_RESULT_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110650176026829935)
,p_name=>'EVAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVAL_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110650288409829936)
,p_name=>'RULE_SET_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_SET_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110650422193829937)
,p_name=>'WORKSPACE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WORKSPACE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110650511991829938)
,p_name=>'APPLICATION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110650540818829939)
,p_name=>'PAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110650732083829940)
,p_name=>'PAGE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110650747455829941)
,p_name=>'PAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110650921718829942)
,p_name=>'FULL_PAGE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FULL_PAGE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Page '
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110651019704829943)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110651043375829944)
,p_name=>'REGION_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REGION_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110651147912829945)
,p_name=>'COMPONENT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPONENT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110651331297829946)
,p_name=>'COMPONENT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPONENT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110651360845829947)
,p_name=>'COLUMN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COLUMN_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110651530548829948)
,p_name=>'ITEM_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110651561213829949)
,p_name=>'SHARED_COMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHARED_COMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110651700921829950)
,p_name=>'SHARED_COMP_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHARED_COMP_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110651833241829951)
,p_name=>'CATEGORY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CATEGORY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Category'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110651859092829952)
,p_name=>'CATEGORY_KEY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CATEGORY_KEY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110651971420829953)
,p_name=>'CURRENT_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CURRENT_VALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Current Value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110652061635829954)
,p_name=>'EXCEPTION_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXCEPTION_VALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Exception Value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110652138773829955)
,p_name=>'VALID_VALUES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALID_VALUES'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valid Values'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110652273332829956)
,p_name=>'RESULT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESULT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110652337046829957)
,p_name=>'RESULT_COLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESULT_COLOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110652478089829958)
,p_name=>'REASON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REASON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110652612472829959)
,p_name=>'RULE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110652664728829960)
,p_name=>'RULE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Rule'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110652753543829961)
,p_name=>'RISK_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RISK_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Risk'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_link_target=>'&RISK_URL.'
,p_link_text=>'&RISK_NAME.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110652927890829962)
,p_name=>'RISK_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RISK_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110652963448829963)
,p_name=>'RISK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RISK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110653088245829964)
,p_name=>'HELP_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HELP_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110653210994829965)
,p_name=>'IMPACT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPACT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>350
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110653283630829966)
,p_name=>'RULE_CRITERIA_TYPE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_CRITERIA_TYPE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>360
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110669725915950623)
,p_name=>'EXCEPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXCEPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Exception'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>370
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110669748163950624)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(110669878267950625)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(110650028558829933)
,p_internal_uid=>12524093563858714
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(110686752216951334)
,p_interactive_grid_id=>wwv_flow_imp.id(110650028558829933)
,p_static_id=>'125609'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(110687005794951336)
,p_report_id=>wwv_flow_imp.id(110686752216951334)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(98127317786029680)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(110669725915950623)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>341
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110687471851951348)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(110650083657829934)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110688370971951362)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(110650176026829935)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110689259477951368)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(110650288409829936)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110690169709951372)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(110650422193829937)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110691050443951376)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(110650511991829938)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110691981817951381)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(110650540818829939)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110692881492951385)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(110650732083829940)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110693772918951389)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(110650747455829941)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110694672484951393)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(110650921718829942)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110695616823951397)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(110651019704829943)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>145
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110696454991951401)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(110651043375829944)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110697338829951404)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(110651147912829945)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110698213560951410)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(110651331297829946)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110699047732951415)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(110651360845829947)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110700022236951420)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(110651530548829948)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110700910769951424)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(110651561213829949)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110701777030951429)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(110651700921829950)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110702664891951434)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(110651833241829951)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110703587352951439)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(110651859092829952)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110704518147951443)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(110651971420829953)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110705335219951448)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(110652061635829954)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110706311808951453)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(110652138773829955)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>149
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110707141628951458)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(110652273332829956)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>48
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110708090324951463)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(110652337046829957)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110709014355951467)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(110652478089829958)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110709878783951472)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(110652612472829959)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110710763195951479)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(110652664728829960)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>224
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110711687870951484)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(110652753543829961)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110712561836951489)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(110652927890829962)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>458
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110713489219951494)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(110652963448829963)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>616
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110714378312951500)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(110653088245829964)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110715313979951505)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(110653210994829965)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110716070838951510)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(110653283630829966)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(110947850313016535)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(110669748163950624)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_highlight(
 p_id=>wwv_flow_imp.id(98126015638971221)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_execution_seq=>5
,p_name=>'Status-fail'
,p_column_id=>wwv_flow_imp.id(110652273332829956)
,p_background_color=>'#f44336'
,p_text_color=>'#ffffff'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_imp.id(110652273332829956)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'FAIL'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_highlight(
 p_id=>wwv_flow_imp.id(98126166176004694)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_execution_seq=>10
,p_name=>'Status-pending'
,p_column_id=>wwv_flow_imp.id(110652273332829956)
,p_background_color=>'#c48b20'
,p_text_color=>'#ffffff'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_imp.id(110652273332829956)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'PENDING'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_highlight(
 p_id=>wwv_flow_imp.id(98126213225004694)
,p_view_id=>wwv_flow_imp.id(110687005794951336)
,p_execution_seq=>15
,p_name=>'Status-pass'
,p_column_id=>wwv_flow_imp.id(110652273332829956)
,p_background_color=>'#18a573'
,p_text_color=>'#ffffff'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_imp.id(110652273332829956)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'PASS'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_filter(
 p_id=>wwv_flow_imp.id(98126140912991944)
,p_report_id=>wwv_flow_imp.id(110686752216951334)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_imp.id(110652273332829956)
,p_operator=>'EQ'
,p_is_case_sensitive=>false
,p_expression=>'FAIL'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(524851342004516277)
,p_name=>'Context'
,p_template=>wwv_flow_imp.id(511920605950949485)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:margin-left-lg'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked'
,p_display_point=>'REGION_POSITION_01'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   eval_id',
'  ,job_status',
'  ,rule_set_name',
'  ,apex_version',
'  ,eval_on',
'  ,eval_by',
'  ,job_status_css',
'  ,application_id',
'  ,(',
'   select ',
'     substr',
'      (',
'       j.repeat_interval',
'      ,instr(j.repeat_interval, ''BYDAY='') + length(''BYDAY='')',
'      ,instr(j.repeat_interval || '';'', '';'', instr(j.repeat_interval, ''BYDAY='')) - (instr(j.repeat_interval, ''BYDAY='') + length(''BYDAY=''))',
'      ) ',
'      || '' at '' || TO_CHAR(TO_TIMESTAMP_TZ(TO_CHAR(j.next_run_date, ''YYYY-MM-DD HHPM:MI:SS TZH:TZM''),''YYYY-MM-DD HHPM:MI:SS TZH:TZM'') at time zone sessiontimezone, ''HH:MIPM'') ',
'    FROM ',
'      user_scheduler_jobs j',
'    where ',
'      job_name = ''SERT_SCHEDULED_EVAL_'' || application_id || ''_'' || rule_set_key ',
'    ) as schedule',
'from ',
'  evals_pub_v',
'where ',
'  eval_id = :P60_EVAL_ID'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(512221217471949568)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(110460478935063103)
,p_query_column_id=>1
,p_column_alias=>'EVAL_ID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(110460881584063106)
,p_query_column_id=>2
,p_column_alias=>'JOB_STATUS'
,p_column_display_sequence=>10
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
' {with/}',
'        LABEL:=JOB_STATUS',
'        VALUE:=#JOB_STATUS#',
'        STATE:=#JOB_STATUS_CSS#',
'        ICON:=#BADGE_ICON#',
'        LABEL_DISPLAY:=N',
'    {apply THEME$BADGE/}'))
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(110461240951063107)
,p_query_column_id=>3
,p_column_alias=>'RULE_SET_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Rule Set'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(110461689071063107)
,p_query_column_id=>4
,p_column_alias=>'APEX_VERSION'
,p_column_display_sequence=>30
,p_column_heading=>'Rules APEX Version'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(110462115866063108)
,p_query_column_id=>5
,p_column_alias=>'EVAL_ON'
,p_column_display_sequence=>50
,p_column_heading=>'Evaluated on'
,p_column_format=>'DD-MON-YYYY HH:MIPM'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(110462446352063109)
,p_query_column_id=>6
,p_column_alias=>'EVAL_BY'
,p_column_display_sequence=>40
,p_column_heading=>'Evaluated by'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(110462843890063109)
,p_query_column_id=>7
,p_column_alias=>'JOB_STATUS_CSS'
,p_column_display_sequence=>220
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(110463262310063110)
,p_query_column_id=>8
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(110463690973063110)
,p_query_column_id=>9
,p_column_alias=>'SCHEDULE'
,p_column_display_sequence=>60
,p_column_heading=>'Schedule'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if SCHEDULE/}',
'  #SCHEDULE#',
'{else/}',
'  None',
'{endif/}'))
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(110488410761063194)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(533511275641804087)
,p_button_name=>'REPORTS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Reports'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-down'
,p_button_cattributes=>'data-menu="reports_menu"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(110488774871063195)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(533511275641804087)
,p_button_name=>'EXCEPTIONS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Exceptions'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-down'
,p_button_cattributes=>'data-menu="exceptions_menu"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(110489167329063195)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(533511275641804087)
,p_button_name=>'EVALUATION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Evaluation'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-down'
,p_button_cattributes=>'data-menu="actions_menu"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(525208209666999721)
,p_name=>'P60_EVAL_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(110490098003063199)
,p_computation_sequence=>10
,p_computation_item=>'G_EVAL_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select '' for '' || application_name || '' (App '' || application_id || '')'' from evals_pub_v where eval_id = :P60_EVAL_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(110498684129063239)
,p_name=>'Refresh Metrics'
,p_event_sequence=>90
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data.dialogPageId === 50'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(110499167023063239)
,p_event_id=>wwv_flow_imp.id(110498684129063239)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(524851342004516277)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(110670018536950626)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(108914674746750147)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Exceptions - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'exceptions_api.add_exception',
'  (',
'   p_rule_set_id      => :RULE_SET_ID',
'  ,p_rule_id          => :RULE_ID',
'  ,p_workspace_id     => :WORKSPACE_ID',
'  ,p_application_id   => :APPLICATION_ID',
'  ,p_page_id          => :PAGE_ID',
'  ,p_component_id     => :COMPONENT_ID',
'  ,p_component_name   => :COMPONENT_NAME',
'  ,p_column_name      => :COLUMN_NAME',
'  ,p_item_name        => :ITEM_NAME',
'  ,p_shared_comp_name => :SHARED_COMP_NAME',
'  ,p_exception        => :EXCEPTION',
'  ,p_current_value    => :CURRENT_VALUE',
'  ,p_eval_id          => :EVAL_ID',
'  );',
'',
'eval_pkg.calc_score(:EVAL_ID);',
'',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>12544083541979407
);
wwv_flow_imp.component_end;
end;
/
