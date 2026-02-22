-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: AF2179420D211232A1B1087B7B2472AD6F6B8C43674846F29409EA21BAB80FB8
prompt --application/pages/page_00030
begin
--   Manifest
--     PAGE: 00030
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>30
,p_name=>'Exception'
,p_alias=>'EXCEPTION'
,p_page_mode=>'MODAL'
,p_step_title=>'Exception'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(511884707145949411)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(132105422037348417)
,p_plug_name=>'Exceptions Form when Stale'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning:t-Alert--removeHeading js-removeLandmark'
,p_plug_template=>wwv_flow_imp.id(511915446136949475)
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_source=>'Changes cannot be made to this exception because the evaluation rules are based on an older version of APEX.'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'G_STALE_EVAL'
,p_plug_display_when_cond2=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(524321377869777962)
,p_plug_name=>'Reviews'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_imp.id(511949340714949511)
,p_plug_display_sequence=>60
,p_location=>null
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :G_STALE_EVAL = ''Y'' then',
'  -- evaluation is on an older version of APEX; do not display the form',
'  return false;',
'else',
'  -- check to see if an exception exists and if the current user is the owner',
'  for x in ',
'    (',
'    select',
'      1 ',
'    from ',
'      eval_results_pub_v ',
'    where',
'      eval_result_id = :G_EVAL_RESULT_ID',
'      and result = ''PENDING''',
'      and 1 = (select 1 from exceptions_pub_v where exception_id = :P30_EXCEPTION_ID and created_by != :APP_USER)',
'    )',
'  loop',
'    -- there is an exception by another user; allow review',
'    return true;',
'  end loop;',
'end if;',
'-- exception is there, but is by the same user; do not allow review',
'return false;'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(524322185990777970)
,p_plug_name=>' Review Buttons'
,p_parent_plug_id=>wwv_flow_imp.id(524321377869777962)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(511923385421949487)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(545644352343833058)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511923385421949487)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>'return exceptions_api.show_exception(p_eval_result_id => :G_EVAL_RESULT_ID);'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(545692677871334104)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(546721395606931324)
,p_name=>'Exceptions'
,p_template=>wwv_flow_imp.id(511921980148949486)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:margin-left-md:margin-right-md'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_item_display_point=>'BELOW'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  UTL_I18N.UNESCAPE_REFERENCE(EXCEPTION) EXCEPTION,',
'       CREATED_ON,',
'       CREATED_BY,',
'       RESULT,',
'       REASON,',
'       exception_score,',
'       exception_score_reason,',
'       exception_color,',
'       ACTIONED_BY,',
'       ACTIONED_ON,',
'       EXCEPTION_ID,       ',
'       UPDATED_ON,',
'       UPDATED_BY',
'  from EXCEPTIONS_PUB_V',
' where    rule_set_id     || '':''',
'|| rule_id         || '':''',
'|| workspace_id    || '':''',
'|| application_id  || '':''',
'|| page_id         || '':''',
'|| component_id    || '':''',
'|| item_name       || '':''',
'|| column_name     || '':''',
'|| shared_comp_name ',
'= ',
'   :P30_RULE_SET_ID    || '':''',
'|| :P30_RULE_ID        || '':''',
'|| :P30_WORKSPACE_ID   || '':''',
'|| :P30_APPLICATION_ID || '':''',
'|| :P30_PAGE_ID        || '':''',
'|| :P30_COMPONENT_ID   || '':''',
'|| :P30_ITEM_NAME      || '':''',
'|| :P30_COLUMN_NAME    || '':''',
'|| :P30_SHARED_COMP_NAME',
''))
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'created_on desc'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(512228448038949576)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'n/a'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(523687095734218576)
,p_query_column_id=>1
,p_column_alias=>'EXCEPTION'
,p_column_display_sequence=>20
,p_column_heading=>'Exception'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(524318802598777936)
,p_query_column_id=>2
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>50
,p_column_heading=>'Created On'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(524318877995777937)
,p_query_column_id=>3
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>60
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(524436758939721452)
,p_query_column_id=>4
,p_column_alias=>'RESULT'
,p_column_display_sequence=>70
,p_column_heading=>'Result'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(524436856170721453)
,p_query_column_id=>5
,p_column_alias=>'REASON'
,p_column_display_sequence=>80
,p_column_heading=>'Reason'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28718963048891504)
,p_query_column_id=>6
,p_column_alias=>'EXCEPTION_SCORE'
,p_column_display_sequence=>30
,p_column_heading=>'Exception Score'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if EXCEPTION_SCORE/}',
'  <span class="t-Badge t-Badge--#EXCEPTION_COLOR#" role="status" aria-label="#EXCEPTION_SCORE#" title="#EXCEPTION_SCORE#">',
'     <span class="t-Badge-value">#EXCEPTION_SCORE#</span>',
'  </span>',
'{else/}',
'  n/a',
'{endif/}'))
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28719017273891505)
,p_query_column_id=>7
,p_column_alias=>'EXCEPTION_SCORE_REASON'
,p_column_display_sequence=>40
,p_column_heading=>'Exception Score Reason'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28723535687891550)
,p_query_column_id=>8
,p_column_alias=>'EXCEPTION_COLOR'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(524436986602721454)
,p_query_column_id=>9
,p_column_alias=>'ACTIONED_BY'
,p_column_display_sequence=>90
,p_column_heading=>'Actioned By'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(524437131229721455)
,p_query_column_id=>10
,p_column_alias=>'ACTIONED_ON'
,p_column_display_sequence=>100
,p_column_heading=>'Actioned On'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(523686985247218575)
,p_query_column_id=>11
,p_column_alias=>'EXCEPTION_ID'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(524318989809777938)
,p_query_column_id=>12
,p_column_alias=>'UPDATED_ON'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(524319131601777939)
,p_query_column_id=>13
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(524320013674777948)
,p_plug_name=>'Withdraw Exception Button'
,p_parent_plug_id=>wwv_flow_imp.id(546721395606931324)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(511923385421949487)
,p_plug_display_sequence=>180
,p_plug_item_display_point=>'BELOW'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(550411386792017187)
,p_plug_name=>'Exceptions Form'
,p_region_template_options=>'#DEFAULT#:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_imp.id(511920605950949485)
,p_plug_display_sequence=>40
,p_location=>null
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return exceptions_api.show_exceptions_form',
'  (',
'   p_stale_eval    => :G_STALE_EVAL',
'  ,p_exception_key => ',
'     :P30_RULE_SET_ID || '':''',
'     || :P30_RULE_ID        || '':''',
'     || :P30_WORKSPACE_ID   || '':''',
'     || :P30_APPLICATION_ID || '':''',
'     || :P30_PAGE_ID        || '':''',
'     || :P30_COMPONENT_ID   || '':''',
'     || :P30_COMPONENT_NAME || '':''',
'     || :P30_ITEM_NAME      || '':''',
'     || :P30_COLUMN_NAME    || '':''',
'     || :P30_SHARED_COMP_NAME',
'  );'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(551396875368284944)
,p_plug_name=>'Add Exception Button'
,p_parent_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(511923385421949487)
,p_plug_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523754441180981315)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(545644352343833058)
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
 p_id=>wwv_flow_imp.id(523753155210981313)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(545644352343833058)
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
 p_id=>wwv_flow_imp.id(97077823990420165)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(524320013674777948)
,p_button_name=>'RESUBMIT_EXCEPTION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Resubmit'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'return exceptions_api.is_stale(:P30_EXCEPTION_ID);'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(524322298018777971)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(524322185990777970)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523754047557981315)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(545644352343833058)
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
 p_id=>wwv_flow_imp.id(524115129349577321)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(551396875368284944)
,p_button_name=>'ADD_EXCEPTION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Exception'
,p_button_position=>'CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return exceptions_api.show_add_exception_button',
'  (',
'  p_exception_key =>    ',
'       :P30_RULE_SET_ID    || '':''',
'    || :P30_RULE_ID        || '':''',
'    || :P30_WORKSPACE_ID   || '':''',
'    || :P30_APPLICATION_ID || '':''',
'    || :P30_PAGE_ID        || '':''',
'    || :P30_COMPONENT_ID   || '':''',
'    || :P30_ITEM_NAME      || '':''',
'    || :P30_COLUMN_NAME    || '':''',
'    || :P30_SHARED_COMP_NAME',
'  );'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(524320147547777949)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(524320013674777948)
,p_button_name=>'WITHDRAW_EXCEPTION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(512260372386949620)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Withdraw Exception'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return exceptions_api.show_withdraw_exception_button',
'  (',
'   p_stale_eval    => :G_STALE_EVAL',
'  ,p_exception_key =>     ',
'       :P30_RULE_SET_ID    || '':''',
'    || :P30_RULE_ID        || '':''',
'    || :P30_WORKSPACE_ID   || '':''',
'    || :P30_APPLICATION_ID || '':''',
'    || :P30_PAGE_ID        || '':''',
'    || :P30_COMPONENT_ID   || '':''',
'    || :P30_COMPONENT_NAME || '':''',
'    || :P30_ITEM_NAME      || '':''',
'    || :P30_COLUMN_NAME    || '':''',
'    || :P30_SHARED_COMP_NAME',
'  ,p_exception_id  => :P30_EXCEPTION_ID',
'  ,p_app_user      => :APP_USER',
'  );'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523753574813981314)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(545644352343833058)
,p_button_name=>'COMMENTS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Comments'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-comments-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(523754798995981315)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(545644352343833058)
,p_button_name=>'EXCEPTION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(512260466204949620)
,p_button_image_alt=>'Exception'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'return exceptions_api.show_exception(p_eval_result_id => :G_EVAL_RESULT_ID);'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-workflow'
,p_button_cattributes=>'style="font-weight:bold; border-top: 4px green solid;"'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524319809062777946)
,p_name=>'P30_EXCEPTION_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524321494716777963)
,p_name=>'P30_RESULT'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(524321377869777962)
,p_item_default=>'APPROVED'
,p_prompt=>'Result'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Approve;APPROVED,Reject;REJECTED'
,p_field_template=>wwv_flow_imp.id(512257901776949613)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524321720488777965)
,p_name=>'P30_REASON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(524321377869777962)
,p_prompt=>'Reason'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>3
,p_field_template=>wwv_flow_imp.id(512259205067949615)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524437942027721463)
,p_name=>'P30_CURRENT_VALUE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524439947609721483)
,p_name=>'P30_COMPONENT_NAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(546522811952735298)
,p_name=>'P30_EXCEPTION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_prompt=>'Exception'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(512259205067949615)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(546523119360735301)
,p_name=>'P30_APPLICATION_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(550607899686147290)
,p_name=>'P30_RULE_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(550608047023147291)
,p_name=>'P30_COMPONENT_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(550608157981147292)
,p_name=>'P30_ITEM_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(550608238532147293)
,p_name=>'P30_COLUMN_NAME'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(550608435035147295)
,p_name=>'P30_PAGE_ID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(550608592572147297)
,p_name=>'P30_WORKSPACE_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(550608748356147298)
,p_name=>'P30_RULE_SET_ID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(555808916202639483)
,p_name=>'P30_SHARED_COMP_NAME'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(550411386792017187)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(524319879759777947)
,p_computation_sequence=>10
,p_computation_item=>'P30_EXCEPTION_ID'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  exception_id',
'from ',
'  exceptions_pub_v',
'where',
'   rule_set_id     || '':''',
'|| rule_id         || '':''',
'|| workspace_id    || '':''',
'|| application_id  || '':''',
'|| page_id         || '':''',
'|| component_id    || '':''',
'|| item_name       || '':''',
'|| column_name     || '':''',
'|| shared_comp_name ',
'= ',
'   :P30_RULE_SET_ID    || '':''',
'|| :P30_RULE_ID        || '':''',
'|| :P30_WORKSPACE_ID   || '':''',
'|| :P30_APPLICATION_ID || '':''',
'|| :P30_PAGE_ID        || '':''',
'|| :P30_COMPONENT_ID   || '':''',
'|| :P30_ITEM_NAME      || '':''',
'|| :P30_COLUMN_NAME    || '':''',
'|| :P30_SHARED_COMP_NAME',
''))
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(524322791034777976)
,p_validation_name=>'Reason Not Null when FAIL'
,p_validation_sequence=>10
,p_validation=>'P30_REASON'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please enter a reason.'
,p_validation_condition=>'P30_RESULT'
,p_validation_condition2=>'REJECTED'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(524322298018777971)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(54066101120103765)
,p_validation_name=>'no single quotes'
,p_validation_sequence=>20
,p_validation=>'instr(:P30_EXCEPTION,'''''''') = 0'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Single quote marks are not allowed in exception text'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(546522811952735298)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(511883277556949400)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(523684986049218555)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(523754441180981315)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(523685103543218556)
,p_event_id=>wwv_flow_imp.id(523684986049218555)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(524320185115777950)
,p_name=>'Withdraw Exception'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(524320147547777949)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(524320272710777951)
,p_event_id=>wwv_flow_imp.id(524320185115777950)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to withdraw this exception?'
,p_attribute_02=>'Withdraw Exception'
,p_attribute_03=>'warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(524320419967777952)
,p_event_id=>wwv_flow_imp.id(524320185115777950)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'exceptions_api.withdraw_exception(p_exception_id => :P30_EXCEPTION_ID, p_eval_id => :P10_EVAL_ID);'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(97078290781420169)
,p_event_id=>wwv_flow_imp.id(524320185115777950)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(524321833049777966)
,p_name=>'Toggle Reason'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_RESULT'
,p_condition_element=>'P30_RESULT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'REJECTED'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(524321913223777967)
,p_event_id=>wwv_flow_imp.id(524321833049777966)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P30_REASON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(524321951594777968)
,p_event_id=>wwv_flow_imp.id(524321833049777966)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P30_REASON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(524322132728777969)
,p_event_id=>wwv_flow_imp.id(524321833049777966)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P30_REASON'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(97077994331420166)
,p_name=>'Resubmit Exception'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(97077823990420165)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(97078076977420167)
,p_event_id=>wwv_flow_imp.id(97077994331420166)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want RESUBMIT this exception without change?'
,p_attribute_03=>'warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(97078212131420168)
,p_event_id=>wwv_flow_imp.id(97077994331420166)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'exceptions_api.resubmit_stale_exception(p_exception_id => :P30_EXCEPTION_ID, p_eval_result_id => :G_EVAL_RESULT_ID);'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(524320472879777953)
,p_event_id=>wwv_flow_imp.id(97077994331420166)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(523685544987218560)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Add Exception'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'EXCEPTIONS_API'
,p_attribute_04=>'ADD_EXCEPTION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(524115129349577321)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_internal_uid=>32625996446546427
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(206691671515234150)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_eval_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>130
,p_value_type=>'ITEM'
,p_value=>'P10_EVAL_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(523685612617218561)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_rule_set_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P30_RULE_SET_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(523685678529218562)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_rule_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P30_RULE_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(523685821152218563)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_workspace_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P30_WORKSPACE_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(523685866433218564)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_application_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>40
,p_value_type=>'ITEM'
,p_value=>'P30_APPLICATION_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(523686040319218565)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_page_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'P30_PAGE_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(523686073605218566)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_component_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>60
,p_value_type=>'ITEM'
,p_value=>'P30_COMPONENT_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(523686189054218567)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_column_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>80
,p_value_type=>'ITEM'
,p_value=>'P30_COLUMN_NAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(523686283583218568)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_item_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>90
,p_value_type=>'ITEM'
,p_value=>'P30_ITEM_NAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(523686446669218569)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_shared_comp_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>100
,p_value_type=>'ITEM'
,p_value=>'P30_SHARED_COMP_NAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(523686540124218570)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_exception'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>110
,p_value_type=>'ITEM'
,p_value=>'P30_EXCEPTION'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(524437973918721464)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_current_value'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>120
,p_value_type=>'ITEM'
,p_value=>'P30_CURRENT_VALUE'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(526914279738698234)
,p_page_process_id=>wwv_flow_imp.id(523685544987218560)
,p_page_id=>30
,p_name=>'p_component_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>70
,p_value_type=>'ITEM'
,p_value=>'P30_COMPONENT_NAME'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28718847346891503)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Evaluate Exception with AI'
,p_process_sql_clob=>'null;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :REQUEST in (''SUBMIT_EXCEPTION'',''RESUBMIT_EXCEPTION'') and sert_core.reports_pkg.get_pref_value(p_pref_key => ''USE_AI'') = ''Y'' then',
'  return true;',
'else',
'  return false;',
'end if;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_internal_uid=>28718847346891503
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(524322444191777972)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Approve or Reject Exception'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'EXCEPTIONS_API'
,p_attribute_04=>'APPROVE_OR_REJECT_EXCEPTION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(524322298018777971)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_internal_uid=>33262895651105839
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(206691574115234149)
,p_page_process_id=>wwv_flow_imp.id(524322444191777972)
,p_page_id=>30
,p_name=>'p_eval_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>60
,p_value_type=>'ITEM'
,p_value=>'P10_EVAL_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(524322543170777973)
,p_page_process_id=>wwv_flow_imp.id(524322444191777972)
,p_page_id=>30
,p_name=>'p_exception_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P30_EXCEPTION_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(524322727086777975)
,p_page_process_id=>wwv_flow_imp.id(524322444191777972)
,p_page_id=>30
,p_name=>'p_reason'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P30_REASON'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(524322948044777977)
,p_page_process_id=>wwv_flow_imp.id(524322444191777972)
,p_page_id=>30
,p_name=>'p_result'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>40
,p_value_type=>'ITEM'
,p_value=>'P30_RESULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(524322991113777978)
,p_page_process_id=>wwv_flow_imp.id(524322444191777972)
,p_page_id=>30
,p_name=>'p_app_user'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>50
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>':APP_USER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(524321290800777961)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog after Exception is Created'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_internal_uid=>33261742260105828
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(524124580998642831)
,p_process_sequence=>20
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
'  ,substr(current_value,1,2000)',
'into',
'   :P30_WORKSPACE_ID',
'  ,:P30_APPLICATION_ID',
'  ,:P30_PAGE_ID',
'  ,:P30_RULE_ID',
'  ,:P30_RULE_SET_ID',
'  ,:P30_COMPONENT_ID',
'  ,:P30_COMPONENT_NAME',
'  ,:P30_COLUMN_NAME',
'  ,:P30_ITEM_NAME',
'  ,:P30_SHARED_COMP_NAME',
'  ,:P30_CURRENT_VALUE',
'from ',
'  eval_results_pub_v',
'where',
'  eval_result_id = :G_EVAL_RESULT_ID;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>33065032457970698
);
wwv_flow_imp.component_end;
end;
/
