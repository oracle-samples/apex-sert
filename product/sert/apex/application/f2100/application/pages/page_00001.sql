-- file_checksum: 8C8F583842FBCDCBC5C5904ABB86EC7FC0FC54DEDAE1E6EB1C9B4515F77F1643
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'APEX-SERT'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'$(''.fa-user'').addClass(''fa-apex'').removeClass(''fa-user'');'
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(138521536812551092)
,p_plug_name=>'Content'
,p_region_template_options=>'#DEFAULT#:margin-top-sm:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>30
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24102232892690207)
,p_plug_name=>'Filter & Sort'
,p_parent_plug_id=>wwv_flow_imp.id(138521536812551092)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24102398551690208)
,p_plug_name=>'Sort'
,p_parent_plug_id=>wwv_flow_imp.id(24102232892690207)
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs:margin-right-sm'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(138666704650464217)
,p_plug_name=>'Smart Filters'
,p_parent_plug_id=>wwv_flow_imp.id(24102232892690207)
,p_region_template_options=>'#DEFAULT#:margin-top-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(512543536144529972)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(511856519722815371)
,p_plug_name=>'New Evaluation'
,p_parent_plug_id=>wwv_flow_imp.id(138521536812551092)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--warning:t-Alert--removeHeading js-removeLandmark:margin-top-md:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_imp.id(511915446136949475)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(512384716436950120)
,p_plug_name=>'APEX-SERT'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(511953925299949517)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(512543536144529972)
,p_plug_name=>'Evaluations'
,p_region_name=>'evaluations'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511921980148949486)
,p_plug_display_sequence=>60
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   eval_id',
'  ,title',
'  ,application_id',
'  ,application_name',
'  ,rule_set',
'  ,eval_by_long',
'  ,null as actions',
'  ,job_status',
'  ,job_status_css ',
'  ,case ',
'    when app_icon is not null then ',
'        ''r/'' || workspace || ''/'' || application_id || ''/files/static/v6/'' ||app_icon',
'    else null',
'   end as app_image2',
'  ,app_image',
'  ,approved_score as score',
'  ,score_css',
'  ,exception_cnt',
'  ,apex_version ',
'  ,eval_on',
'  ,rule_set_active_yn',
'  ,case when rule_Set_active_yn = ''N'' then ''<span class="t-Badge t-Badge--warning t-Badge--sm" role="status" aria-label="INACTIVE rule-set" title="INACTIVE rule-set"> <span class="t-Badge-value">INACTIVE</span></span>'' ',
'     else '''' ',
'   end as rule_set_state',
'from   ',
'  evals_pub_v ep',
''))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"EVAL_DATE","expr":"eval_on desc"},{"key":"APPLICATION_ID","expr":"application_id asc"},{"key":"APPLICATION_NAME","expr":"title desc"}],"itemName":"P1_ORDER_BY"}'
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>true
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'AVATAR_IMAGE', '{"source":"URL_COLUMN","urlColumn":"APP_IMAGE2"}',
  'AVATAR_SHAPE', 't-Avatar--square',
  'AVATAR_TYPE', 'image',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--sm',
  'BADGE_LABEL', 'SCORE',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_SIZE', 't-Badge--lg',
  'BADGE_STATE', 'SCORE_CSS',
  'BADGE_VALUE', 'SCORE',
  'DESCRIPTION', '&EVAL_BY_LONG.',
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'Y',
  'HIDE_BORDERS', 'N',
  'MISC', wwv_flow_string.join(wwv_flow_t_varchar2(
    '&EXCEPTION_CNT. Exceptions <br />',
    '<span class="t-Badge t-Badge--&JOB_STATUS_CSS. u-pullRight">',
    '     <span class="t-Badge-value">&JOB_STATUS.</span>',
    '</span>')),
  'OVERLINE', '&RULE_SET. (&APEX_VERSION.) &RULE_SET_STATE!RAW.',
  'REMOVE_PADDING', 'N',
  'TITLE', '&TITLE.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24102103585690206)
,p_name=>'APPLICATION_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATION_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>270
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(94244296022095664)
,p_name=>'RULE_SET_ACTIVE_YN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_SET_ACTIVE_YN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>240
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(94244343987095665)
,p_name=>'RULE_SET_STATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_SET_STATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>250
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(106334192143065064)
,p_name=>'APP_IMAGE2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APP_IMAGE2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>260
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(132105208564348415)
,p_name=>'APEX_VERSION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APEX_VERSION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>220
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(138667612298464226)
,p_name=>'EVAL_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVAL_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>230
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(513069053317313864)
,p_name=>'EVAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVAL_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(513069173751313865)
,p_name=>'TITLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TITLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(513069492412313868)
,p_name=>'ACTIONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIONS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(513070693285313880)
,p_name=>'JOB_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOB_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>110
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(513070819762313881)
,p_name=>'RULE_SET'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RULE_SET'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>120
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(513567101858255034)
,p_name=>'APP_IMAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APP_IMAGE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>150
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(513568802363255051)
,p_name=>'APPLICATION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>160
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(513633065736584449)
,p_name=>'JOB_STATUS_CSS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOB_STATUS_CSS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>170
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(513633194851584450)
,p_name=>'SCORE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCORE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>180
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(513633339029584451)
,p_name=>'SCORE_CSS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCORE_CSS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>190
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(524437156252721456)
,p_name=>'EXCEPTION_CNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXCEPTION_CNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>200
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(524437322809721457)
,p_name=>'EVAL_BY_LONG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVAL_BY_LONG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>210
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(511856553588815372)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(511856519722815371)
,p_button_name=>'EVALUATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Evaluate'
,p_button_position=>'CREATE'
,p_button_condition=>'select 1 from apex_version_pub_v where apex_version = sert_apex_version'
,p_button_condition_type=>'EXISTS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(491679565808851098)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(511856519722815371)
,p_button_name=>'REFRESH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(512259741431949617)
,p_button_image_alt=>'Refresh'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(513069933026313872)
,p_branch_name=>'Go to Evaluation Results'
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::P10_EVAL_ID:&P1_EVAL_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'FUNCTION_BODY'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'case ',
'  when :P1_RUN_IN_BACKGROUND = ''N'' and :REQUEST in (''EVALUATE'') then return true;',
'  when :REQUEST = ''RE-EVALUATE'' then return true;',
'  else return false;',
'end case;'))
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24102000865690205)
,p_name=>'P1_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(24102398551690208)
,p_item_default=>'EVAL_DATE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Order by Evaluated On;EVAL_DATE,Order by App ID;APPLICATION_ID,Order by App Name;APPLICATION_NAME'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(512257674757949612)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24217374517277901)
,p_name=>'P1_APP_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(138666704650464217)
,p_prompt=>'Application ID'
,p_source=>'APPLICATION_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_compute_counts=>false
,p_fc_filter_values=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(127869122781496851)
,p_name=>'P1_BUILDER_SESSION_ID'
,p_item_sequence=>80
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(138666750885464218)
,p_name=>'P1_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(138666704650464217)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(138667055409464221)
,p_name=>'P1_SCORE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(138666704650464217)
,p_prompt=>'Score'
,p_source=>'SCORE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'N',
  'select_multiple', 'N')).to_clob
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_chart=>false
,p_fc_display_as=>'INLINE'
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(138667429787464224)
,p_name=>'P1_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(138666704650464217)
,p_prompt=>'Status'
,p_source=>'JOB_STATUS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_display_as=>'INLINE'
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(511856374497815370)
,p_name=>'P1_RULE_SET_KEY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(511856519722815371)
,p_prompt=>'Rule Set'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  rule_set_name || '' ('' || apex_version || '')'' as a',
' ,rule_set_key ',
'from',
'  rule_sets_pub_v',
'where',
'  cnt > 0',
'order by',
'  rule_set_name'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a Rule Set -'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(512257901776949613)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(512393041705168638)
,p_name=>'P1_APPLICATION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(511856519722815371)
,p_prompt=>'Application'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  application_id || '' - '' || application_name as a',
' ,application_id',
'from',
'  apex_applications',
'order by',
'  1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select an Application -'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(512257901776949613)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(512393207904168640)
,p_name=>'P1_RUN_IN_BACKGROUND'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(511856519722815371)
,p_item_default=>'Y'
,p_prompt=>'Background'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(512257901776949613)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(513069980225313873)
,p_name=>'P1_EVAL_ID'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(518343648467379777)
,p_name=>'P1_DELETE_EVAL_ID'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(524438627588721470)
,p_validation_name=>'Application is Not Null'
,p_validation_sequence=>10
,p_validation=>'P1_APPLICATION_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select an application to evaluate'
,p_when_button_pressed=>wwv_flow_imp.id(511856553588815372)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(127868931541496849)
,p_validation_name=>'Rule Set is not null'
,p_validation_sequence=>20
,p_validation=>'P1_RULE_SET_KEY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select a Rule Set'
,p_when_button_pressed=>wwv_flow_imp.id(511856553588815372)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(513568266144255046)
,p_name=>'Re-Evaluate'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.reEvaluation'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513568734728255050)
,p_event_id=>wwv_flow_imp.id(513568266144255046)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_EVAL_ID'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513568398261255047)
,p_event_id=>wwv_flow_imp.id(513568266144255046)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RE-EVALUATE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(513631570396584434)
,p_name=>'Re-Evaluate In Background'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.reEvaluationInBackground'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513631717819584435)
,p_event_id=>wwv_flow_imp.id(513631570396584434)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_EVAL_ID'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513631789001584436)
,p_event_id=>wwv_flow_imp.id(513631570396584434)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RE-EVALUATE_IN_BACKGROUND'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(513569115427255054)
,p_name=>'Delete Evaluation'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.deleteEvaluation'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513569575324255059)
,p_event_id=>wwv_flow_imp.id(513569115427255054)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Confirm'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to delete this evaluation?  All notes and exceptions will also be deleted.'
,p_attribute_02=>'Confirm Deletion'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513569298268255056)
,p_event_id=>wwv_flow_imp.id(513569115427255054)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_DELETE_EVAL_ID'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id;'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(518343514007379776)
,p_event_id=>wwv_flow_imp.id(513569115427255054)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- loop through the view so that if P1_DELETE_EVAL_ID was spoofed, it will not execute the delete procedure',
'for x in (select * from evals_pub_v where eval_id = :P1_DELETE_EVAL_ID)',
'loop',
'  eval_pkg.delete_eval(p_eval_id => :P1_DELETE_EVAL_ID);',
'end loop;'))
,p_attribute_02=>'P1_DELETE_EVAL_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513569372608255057)
,p_event_id=>wwv_flow_imp.id(513569115427255054)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(512543536144529972)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(491679663131851099)
,p_name=>'Refresh Report'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(491679565808851098)
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(491679773037851100)
,p_event_id=>wwv_flow_imp.id(491679663131851099)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(512543536144529972)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(518344110095379782)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-evaluate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for x in (select * from evals_pub_v where eval_id = :P1_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'    p_application_id => x.application_id',
'   ,p_rule_set_key => x.rule_set_key',
'   ,p_run_in_background => ''N''',
'   ,p_eval_id_out => :P1_EVAL_ID',
'  );',
'end loop;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RE-EVALUATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>27284561554707649
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(518344225633379783)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Re-evaluate in Background'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for x in (select * from evals_pub_v where eval_id = :P1_EVAL_ID)',
'loop',
'  eval_pkg.eval',
'    (',
'    p_application_id    => x.application_id',
'   ,p_rule_set_key      => x.rule_set_key',
'   ,p_run_in_background => ''Y''',
'   ,p_eval_id_out       => :P1_EVAL_ID',
'  );',
'end loop;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RE-EVALUATE_IN_BACKGROUND'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>27284677092707650
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(512393056697168639)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Evaluate'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'EVAL_PKG'
,p_attribute_04=>'EVAL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(511856553588815372)
,p_internal_uid=>21333508156496506
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(512142468657448440)
,p_page_process_id=>wwv_flow_imp.id(512393056697168639)
,p_page_id=>1
,p_name=>'p_eval_by'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>':APP_USER'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(512393437788168642)
,p_page_process_id=>wwv_flow_imp.id(512393056697168639)
,p_page_id=>1
,p_name=>'p_application_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P1_APPLICATION_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(512393516307168643)
,p_page_process_id=>wwv_flow_imp.id(512393056697168639)
,p_page_id=>1
,p_name=>'p_rule_set_key'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P1_RULE_SET_KEY'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(512393671359168645)
,p_page_process_id=>wwv_flow_imp.id(512393056697168639)
,p_page_id=>1
,p_name=>'p_run_in_background'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>40
,p_value_type=>'ITEM'
,p_value=>'P1_RUN_IN_BACKGROUND'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(518343993819379781)
,p_page_process_id=>wwv_flow_imp.id(512393056697168639)
,p_page_id=>1
,p_name=>'p_eval_id_out'
,p_direction=>'OUT'
,p_data_type=>'NUMBER'
,p_ignore_output=>false
,p_display_sequence=>80
,p_value_type=>'ITEM'
,p_value=>'P1_EVAL_ID'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(513568526209255048)
,p_region_id=>wwv_flow_imp.id(512543536144529972)
,p_position_id=>wwv_flow_imp.id(2307148645995436364)
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::P10_EVAL_ID:&EVAL_ID.'
,p_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_condition_expr1=>'JOB_STATUS'
,p_condition_expr2=>'Completed:Stale:Stale Rules'
,p_exec_cond_for_each_row=>true
,p_authorization_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(513568628394255049)
,p_region_id=>wwv_flow_imp.id(512543536144529972)
,p_position_id=>wwv_flow_imp.id(2320741672992811968)
,p_display_sequence=>30
,p_template_id=>wwv_flow_imp.id(2320742274669843097)
,p_label=>'Re-Evaluate'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
,p_link_attributes=>'id="&EVAL_ID."'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-play'
,p_action_css_classes=>'reEvaluation'
,p_is_hot=>false
,p_show_as_disabled=>false
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>':APEX_VERSION = &G_APEX_VERSION. and :RULE_SET_ACTIVE_YN = ''Y'''
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(513569001995255053)
,p_region_id=>wwv_flow_imp.id(512543536144529972)
,p_position_id=>wwv_flow_imp.id(2320741672992811968)
,p_display_sequence=>50
,p_template_id=>wwv_flow_imp.id(2320742274669843097)
,p_label=>'Delete Evaluation'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
,p_link_attributes=>'id="&EVAL_ID."'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-trash-o'
,p_action_css_classes=>'deleteEvaluation'
,p_is_hot=>false
,p_show_as_disabled=>false
,p_authorization_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(513570506527255068)
,p_region_id=>wwv_flow_imp.id(512543536144529972)
,p_position_id=>wwv_flow_imp.id(2320741672992811968)
,p_display_sequence=>40
,p_template_id=>wwv_flow_imp.id(2320742274669843097)
,p_label=>'Re-Evaluate in Background'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
,p_link_attributes=>'id="&EVAL_ID."'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-clock-o'
,p_action_css_classes=>'reEvaluationInBackground'
,p_is_hot=>false
,p_show_as_disabled=>false
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>':APEX_VERSION = &G_APEX_VERSION. and :RULE_SET_ACTIVE_YN = ''Y'''
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp.component_end;
end;
/
