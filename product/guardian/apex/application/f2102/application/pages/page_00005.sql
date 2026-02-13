-- file_checksum: 8F54E4DF446F7C5CAD5D7F74E5BAB172B4344328A671D682DDECA7134484426A
prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>5
,p_name=>'Individual Rule Fails'
,p_alias=>'INDIVIDUAL-RULE-FAILS'
,p_step_title=>'Individual Rule Fails'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.is-markdownified {',
'    font-size: 1.1rem;',
'}'))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(30658409527755022737)
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33534421115685921548)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(30658404260306022718)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(33534426682430923521)
,p_name=>'Context'
,p_template=>4501440665235496320
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked:t-Report--hideNoPagination'
,p_display_point=>'REGION_POSITION_01'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.rule_name,',
'       r.category_name                  as category,',
'       r.risk_code||'' - ''||r.risk_name  as risk,',
'       r.impact,',
'       r.rule_severity_name             as severity,',
'       case when r.rule_active_yn = ''Y'' then ''Active''',
'            else ''Inactive''',
'            end                         as status,',
'       ''see more details...''         as link_text',
'  from sert_core.sg_rules_d r',
' where r.rule_wid = :P5_RULE_WID'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2115772683903439354
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33534427389973923528)
,p_query_column_id=>1
,p_column_alias=>'RULE_NAME'
,p_column_display_sequence=>10
,p_column_heading=>'Rule Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33534427524883923529)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>20
,p_column_heading=>'Category'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33534427606642923530)
,p_query_column_id=>3
,p_column_alias=>'RISK'
,p_column_display_sequence=>30
,p_column_heading=>'Risk'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33534427644822923531)
,p_query_column_id=>4
,p_column_alias=>'IMPACT'
,p_column_display_sequence=>40
,p_column_heading=>'Impact'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33534427772461923532)
,p_query_column_id=>5
,p_column_alias=>'SEVERITY'
,p_column_display_sequence=>50
,p_column_heading=>'Severity'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33534427884872923533)
,p_query_column_id=>6
,p_column_alias=>'STATUS'
,p_column_display_sequence=>60
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33534428713645923541)
,p_query_column_id=>7
,p_column_alias=>'LINK_TEXT'
,p_column_display_sequence=>70
,p_column_heading=>'Additional Information'
,p_column_link=>'javascript:apex.theme.openRegion(''additional-info'');'
,p_column_linktext=>'#LINK_TEXT#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_report_column_required_role=>wwv_flow_imp.id(30658409527755022737)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33534428370552923538)
,p_plug_name=>'Additional Information'
,p_region_name=>'additional-info'
,p_region_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--md'
,p_plug_template=>1660973136434625155
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_04'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33534425676019923511)
,p_plug_name=>'RDS'
,p_parent_plug_id=>wwv_flow_imp.id(33534428370552923538)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(33534425776554923512)
,p_name=>'About this rule'
,p_parent_plug_id=>wwv_flow_imp.id(33534425676019923511)
,p_template=>4501440665235496320
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.info',
'  from sert_core.sg_rules_d d',
'  join sert_core.rules r on (d.rule_key = r.rule_key)',
' where d.rule_wid = :P5_RULE_WID',
' order by r.apex_version desc',
' fetch first 1 rows only'))
,p_lazy_loading=>false
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33534425926037923513)
,p_query_column_id=>1
,p_column_alias=>'INFO'
,p_column_display_sequence=>10
,p_column_heading=>'Info'
,p_heading_alignment=>'LEFT'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'MARKDOWN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(33534426004762923514)
,p_name=>'How to fix'
,p_parent_plug_id=>wwv_flow_imp.id(33534425676019923511)
,p_template=>4501440665235496320
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.fix',
'  from sert_core.sg_rules_d d',
'  join sert_core.rules r on (d.rule_key = r.rule_key)',
' where d.rule_wid = :P5_RULE_WID',
' order by r.apex_version desc',
' fetch first 1 rows only'))
,p_lazy_loading=>false
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33534426216376923516)
,p_query_column_id=>1
,p_column_alias=>'FIX'
,p_column_display_sequence=>10
,p_column_heading=>'Fix'
,p_heading_alignment=>'LEFT'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'MARKDOWN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(33534426353471923518)
,p_name=>'Valid exceptions'
,p_parent_plug_id=>wwv_flow_imp.id(33534425676019923511)
,p_template=>4501440665235496320
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_matches number := 0;',
'',
'    l_sql varchar2(2000) := q''~',
'select r.valid_exceptions',
'  from sert_core.sg_rules_d d',
'  join sert_core.rules r on (d.rule_key = r.rule_key)',
' where d.rule_wid = :P5_RULE_WID',
' order by r.apex_version desc',
' fetch first 1 rows only',
'~'';',
'',
'begin',
'    -- Check if the column exists',
'    select count(*)',
'      into l_matches',
'      from all_tab_columns',
'     where owner = ''SERT_CORE''',
'       and table_name = ''RULES''',
'       and column_name = ''VALID_EXCEPTIONS'';',
'',
'    if l_matches = 0 then',
'        l_sql := q''~select ''This is a **future feature** not currently available'' valid_exceptions from dual~'';',
'    end if;',
'',
'    return l_sql;',
'end;'))
,p_lazy_loading=>false
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33534426634005923520)
,p_query_column_id=>1
,p_column_alias=>'VALID_EXCEPTIONS'
,p_column_display_sequence=>10
,p_column_heading=>'Valid exceptions'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'MARKDOWN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33534428949445923544)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(33534429177908923546)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'current_facets_selector', '#active_facets',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'E',
  'show_total_row_count', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(33534429177908923546)
,p_name=>'Search Results'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.workspace, a.application_id, a.application_name, a.eval_on, a.app_size, ',
'       p.page_id, p.page_name, p.complexity_score as page_complexity,',
'       res.final_status,',
'       f.exception_reason',
'  from sert_core.sg_app_rule_fails_f f',
'  join sert_core.sg_applications_d a on (f.application_wid = a.application_wid)',
'  join sert_core.sg_results_d res on (f.result_wid = res.result_wid)',
'  join sert_core.sg_application_pages_d p on (f.page_wid = p.page_wid)',
' where f.rule_wid = :P5_RULE_WID'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612024873577904940)
,p_query_column_id=>1
,p_column_alias=>'WORKSPACE'
,p_column_display_sequence=>10
,p_column_heading=>'Workspace'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612024985327904941)
,p_query_column_id=>2
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>20
,p_column_heading=>'Application Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612025113562904942)
,p_query_column_id=>3
,p_column_alias=>'APPLICATION_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Application Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612025142589904943)
,p_query_column_id=>4
,p_column_alias=>'EVAL_ON'
,p_column_display_sequence=>40
,p_column_heading=>'Eval On'
,p_column_format=>'YYYY-MM-DD'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612025245365904944)
,p_query_column_id=>5
,p_column_alias=>'APP_SIZE'
,p_column_display_sequence=>50
,p_column_heading=>'App Size'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612025350084904945)
,p_query_column_id=>6
,p_column_alias=>'PAGE_ID'
,p_column_display_sequence=>60
,p_column_heading=>'Page Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612025497203904946)
,p_query_column_id=>7
,p_column_alias=>'PAGE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Page Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612025591122904947)
,p_query_column_id=>8
,p_column_alias=>'PAGE_COMPLEXITY'
,p_column_display_sequence=>80
,p_column_heading=>'Page Complexity'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612025672498904948)
,p_query_column_id=>9
,p_column_alias=>'FINAL_STATUS'
,p_column_display_sequence=>90
,p_column_heading=>'Final Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612025745429904949)
,p_query_column_id=>10
,p_column_alias=>'EXCEPTION_REASON'
,p_column_display_sequence=>100
,p_column_heading=>'Exception Reason'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(66295056684364362689)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>'<div id="active_facets"></div>'
,p_plug_query_num_rows=>15
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(33613897080893211120)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(66295056684364362689)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RR,5:P5_RULE_WID:&P5_RULE_WID.'
,p_icon_css_classes=>'fa-undo'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33534425458720923509)
,p_name=>'P5_RULE_WID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(33534426682430923521)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33534428790431923542)
,p_name=>'P5_RULE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(33534426682430923521)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33534429068082923545)
,p_name=>'P5_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(33534428949445923544)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33612022753740904919)
,p_name=>'P5_WORKSPACE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(33534428949445923544)
,p_prompt=>'Workspace'
,p_source=>'WORKSPACE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33612023025485904921)
,p_name=>'P5_APPLICATION_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(33534428949445923544)
,p_prompt=>'Application Name'
,p_source=>'APPLICATION_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_depending_on_id=>wwv_flow_imp.id(33612022753740904919)
,p_depending_on_condition_type=>'NOT_NULL'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33612023205115904923)
,p_name=>'P5_APP_SIZE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(33534428949445923544)
,p_prompt=>'App Size'
,p_source=>'APP_SIZE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33612023417791904925)
,p_name=>'P5_PAGE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(33534428949445923544)
,p_prompt=>'Page Name'
,p_source=>'PAGE_NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_depending_on_id=>wwv_flow_imp.id(33612023025485904921)
,p_depending_on_condition_type=>'NOT_NULL'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33612023590551904927)
,p_name=>'P5_FINAL_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(33534428949445923544)
,p_prompt=>'Final Status'
,p_source=>'FINAL_STATUS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(33534428868226923543)
,p_computation_sequence=>10
,p_computation_item=>'P5_RULE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select rule_name from sg_rules_d where rule_wid = :P5_RULE_WID'
,p_compute_when=>'P5_RULE_WID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp.component_end;
end;
/
