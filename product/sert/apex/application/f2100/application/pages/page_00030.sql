-- file_checksum: 6D81C2BBC996EB4D780A86BF6DDCC1689BD6D2FF107DE73DD66F976471CE1F4F
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00030
begin
--   Manifest
--     PAGE: 00030
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
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
,p_step_template=>wwv_flow_imp.id(468163289284671148)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(88384004176070154)
,p_plug_name=>'Exceptions Form when Stale'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning:t-Alert--removeHeading js-removeLandmark'
,p_plug_template=>wwv_flow_imp.id(468194028275671212)
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
 p_id=>wwv_flow_imp.id(480599960008499699)
,p_plug_name=>'Reviews'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_imp.id(468227922853671248)
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
 p_id=>wwv_flow_imp.id(480600768129499707)
,p_plug_name=>' Review Buttons'
,p_parent_plug_id=>wwv_flow_imp.id(480599960008499699)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(468201967560671224)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(501922934482554795)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468201967560671224)
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
 p_id=>wwv_flow_imp.id(501971260010055841)
,p_plug_name=>'&G_RULE_NAME.'
,p_icon_css_classes=>'&G_ICON.'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--noPadding:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(468232507438671254)
,p_plug_display_sequence=>0
,p_plug_header=>'&G_CATEGORY_NAME.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(502999977745653061)
,p_name=>'Exceptions'
,p_template=>wwv_flow_imp.id(468200562287671223)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:margin-left-md:margin-right-md'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_item_display_point=>'BELOW'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'EXCEPTIONS_PUB_V'
,p_query_where=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'created_on desc'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(468507030177671313)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'n/a'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(479965567385940312)
,p_query_column_id=>1
,p_column_alias=>'EXCEPTION_ID'
,p_column_display_sequence=>180
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(479965677872940313)
,p_query_column_id=>2
,p_column_alias=>'EXCEPTION'
,p_column_display_sequence=>20
,p_column_heading=>'Exception'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(480715341078443189)
,p_query_column_id=>13
,p_column_alias=>'RESULT'
,p_column_display_sequence=>140
,p_column_heading=>'Result'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(480715438309443190)
,p_query_column_id=>14
,p_column_alias=>'REASON'
,p_column_display_sequence=>150
,p_column_heading=>'Reason'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(480597384737499673)
,p_query_column_id=>15
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>120
,p_column_heading=>'Created On'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(480597460134499674)
,p_query_column_id=>16
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>130
,p_column_heading=>'Created By'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(480597571948499675)
,p_query_column_id=>17
,p_column_alias=>'UPDATED_ON'
,p_column_display_sequence=>190
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(480597713740499676)
,p_query_column_id=>18
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>200
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(480715568741443191)
,p_query_column_id=>19
,p_column_alias=>'ACTIONED_BY'
,p_column_display_sequence=>160
,p_column_heading=>'Actioned By'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(480715713368443192)
,p_query_column_id=>20
,p_column_alias=>'ACTIONED_ON'
,p_column_display_sequence=>170
,p_column_heading=>'Actioned On'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(480598595813499685)
,p_plug_name=>'Withdraw Exception Button'
,p_parent_plug_id=>wwv_flow_imp.id(502999977745653061)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(468201967560671224)
,p_plug_display_sequence=>180
,p_plug_item_display_point=>'BELOW'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(506689968930738924)
,p_plug_name=>'Exceptions Form'
,p_region_template_options=>'#DEFAULT#:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_imp.id(468199188089671222)
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
 p_id=>wwv_flow_imp.id(507675457507006681)
,p_plug_name=>'Add Exception Button'
,p_parent_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(468201967560671224)
,p_plug_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(480033023319703052)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(501922934482554795)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-times-circle-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(480031737349703050)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(501922934482554795)
,p_button_name=>'EDIT_IN_APEX'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(468538323570671354)
,p_button_image_alt=>'Edit In APEX'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-apex'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(53356406129141902)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(480598595813499685)
,p_button_name=>'RESUBMIT_EXCEPTION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
,p_button_image_alt=>'Resubmit'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'return exceptions_api.is_stale(:P30_EXCEPTION_ID);'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(480600880157499708)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(480600768129499707)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(480032629696703052)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(501922934482554795)
,p_button_name=>'RESULT_DETAILS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
,p_button_image_alt=>'Result Details'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-info-circle-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(480393711488299058)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(507675457507006681)
,p_button_name=>'ADD_EXCEPTION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
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
 p_id=>wwv_flow_imp.id(480598729686499686)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(480598595813499685)
,p_button_name=>'WITHDRAW_EXCEPTION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
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
 p_id=>wwv_flow_imp.id(480032156952703051)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(501922934482554795)
,p_button_name=>'COMMENTS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
,p_button_image_alt=>'Comments'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-comments-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(480033381134703052)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(501922934482554795)
,p_button_name=>'EXCEPTION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(468539048343671357)
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
 p_id=>wwv_flow_imp.id(480598391201499683)
,p_name=>'P30_EXCEPTION_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(480600076855499700)
,p_name=>'P30_RESULT'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(480599960008499699)
,p_item_default=>'APPROVED'
,p_prompt=>'Result'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Approve;APPROVED,Reject;REJECTED'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(480600302627499702)
,p_name=>'P30_REASON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(480599960008499699)
,p_prompt=>'Reason'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>3
,p_field_template=>wwv_flow_imp.id(468537787206671352)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(480716524166443200)
,p_name=>'P30_CURRENT_VALUE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(480718529748443220)
,p_name=>'P30_COMPONENT_NAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(502801394091457035)
,p_name=>'P30_EXCEPTION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_prompt=>'Exception'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(468537787206671352)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(502801701499457038)
,p_name=>'P30_APPLICATION_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(506886481824869027)
,p_name=>'P30_RULE_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(506886629161869028)
,p_name=>'P30_COMPONENT_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(506886740119869029)
,p_name=>'P30_ITEM_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(506886820670869030)
,p_name=>'P30_COLUMN_NAME'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(506887017173869032)
,p_name=>'P30_PAGE_ID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(506887174710869034)
,p_name=>'P30_WORKSPACE_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(506887330494869035)
,p_name=>'P30_RULE_SET_ID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(512087498341361220)
,p_name=>'P30_SHARED_COMP_NAME'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(506689968930738924)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(480598461898499684)
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
 p_id=>wwv_flow_imp.id(480601373173499713)
,p_validation_name=>'Reason Not Null when FAIL'
,p_validation_sequence=>10
,p_validation=>'P30_REASON'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please enter a reason.'
,p_validation_condition=>'P30_RESULT'
,p_validation_condition2=>'REJECTED'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(480600880157499708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(479963568187940292)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(480033023319703052)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(479963685681940293)
,p_event_id=>wwv_flow_imp.id(479963568187940292)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(480598767254499687)
,p_name=>'Withdraw Exception'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(480598729686499686)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(480598854849499688)
,p_event_id=>wwv_flow_imp.id(480598767254499687)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to withdraw this exception?'
,p_attribute_02=>'Withdraw Exception'
,p_attribute_03=>'warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(480599002106499689)
,p_event_id=>wwv_flow_imp.id(480598767254499687)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'exceptions_api.withdraw_exception(p_exception_id => :P30_EXCEPTION_ID, p_eval_id => :P10_EVAL_ID);'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53356872920141906)
,p_event_id=>wwv_flow_imp.id(480598767254499687)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(480600415188499703)
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
 p_id=>wwv_flow_imp.id(480600495362499704)
,p_event_id=>wwv_flow_imp.id(480600415188499703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P30_REASON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(480600533733499705)
,p_event_id=>wwv_flow_imp.id(480600415188499703)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P30_REASON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(480600714867499706)
,p_event_id=>wwv_flow_imp.id(480600415188499703)
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
 p_id=>wwv_flow_imp.id(53356576470141903)
,p_name=>'Resubmit Exception'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(53356406129141902)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53356659116141904)
,p_event_id=>wwv_flow_imp.id(53356576470141903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want RESUBMIT this exception without change?'
,p_attribute_03=>'warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53356794270141905)
,p_event_id=>wwv_flow_imp.id(53356576470141903)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'exceptions_api.resubmit_stale_exception(p_exception_id => :P30_EXCEPTION_ID, p_eval_result_id => :G_EVAL_RESULT_ID);'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(480599055018499690)
,p_event_id=>wwv_flow_imp.id(53356576470141903)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(479964127125940297)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Add Exception'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'EXCEPTIONS_API'
,p_attribute_04=>'ADD_EXCEPTION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(480393711488299058)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_internal_uid=>32625996446546427
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(162970253653955887)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(479964194755940298)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(479964260667940299)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(479964403290940300)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(479964448571940301)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(479964622457940302)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(479964655743940303)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(479964771192940304)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(479964865721940305)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(479965028807940306)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(479965122262940307)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(480716556057443201)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
,p_page_id=>30
,p_name=>'p_curernt_value'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>120
,p_value_type=>'ITEM'
,p_value=>'P30_CURRENT_VALUE'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(483192861877419971)
,p_page_process_id=>wwv_flow_imp.id(479964127125940297)
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
 p_id=>wwv_flow_imp.id(480601026330499709)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Approve or Reject Exception'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'EXCEPTIONS_API'
,p_attribute_04=>'APPROVE_OR_REJECT_EXCEPTION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(480600880157499708)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_internal_uid=>33262895651105839
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(162970156253955886)
,p_page_process_id=>wwv_flow_imp.id(480601026330499709)
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
 p_id=>wwv_flow_imp.id(480601125309499710)
,p_page_process_id=>wwv_flow_imp.id(480601026330499709)
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
 p_id=>wwv_flow_imp.id(480601309225499712)
,p_page_process_id=>wwv_flow_imp.id(480601026330499709)
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
 p_id=>wwv_flow_imp.id(480601530183499714)
,p_page_process_id=>wwv_flow_imp.id(480601026330499709)
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
 p_id=>wwv_flow_imp.id(480601573252499715)
,p_page_process_id=>wwv_flow_imp.id(480601026330499709)
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
 p_id=>wwv_flow_imp.id(480599872939499698)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog after Exception is Created'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_internal_uid=>33261742260105828
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(480403163137364568)
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
