-- file_checksum: 67A91367B52938E103719E117B7BD7E70B1D22C37AE4E2493E2A0197A3335737
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_01000
begin
--   Manifest
--     PAGE: 01000
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>1000
,p_name=>'Risks'
,p_alias=>'RISKS'
,p_step_title=>'Risks'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(394699143512215039)
,p_plug_name=>'Smart Filters'
,p_parent_plug_id=>wwv_flow_imp.id(353748456745515658)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(394698137141215029)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(394698137141215029)
,p_name=>'Risks'
,p_template=>wwv_flow_imp.id(394479640660760093)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlightOff:t-Report--horizontalBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'RISKS'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(394527652631760130)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(353748771689515661)
,p_query_column_id=>1
,p_column_alias=>'RISK_ID'
,p_column_display_sequence=>80
,p_column_link=>'f?p=&APP_ID.:1010:&SESSION.::&DEBUG.::P1010_RISK_ID:#RISK_ID#'
,p_column_linktext=>'<img src="#APEX_FILES#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_report_column_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(353748895815515662)
,p_query_column_id=>2
,p_column_alias=>'RISK_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Risk Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(353748950840515663)
,p_query_column_id=>3
,p_column_alias=>'RISK_NAME'
,p_column_display_sequence=>100
,p_column_heading=>'Risk Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(353749069082515664)
,p_query_column_id=>4
,p_column_alias=>'URL'
,p_column_display_sequence=>110
,p_column_heading=>'URL'
,p_column_link=>'#URL#'
,p_column_linktext=>'View Risk'
,p_column_link_attr=>'target="_blank"'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(394698616563215034)
,p_query_column_id=>5
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>120
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(394698691296215035)
,p_query_column_id=>6
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>130
,p_column_heading=>'Created On'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(394698842175215036)
,p_query_column_id=>7
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>140
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(394698947983215037)
,p_query_column_id=>8
,p_column_alias=>'UPDATED_ON'
,p_column_display_sequence=>150
,p_column_heading=>'Updated On'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(394699067991215038)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(414553966215499010)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1010:&SESSION.::&DEBUG.:1010::'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(353748689201515660)
,p_name=>'P1000_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(394699143512215039)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(394699331771215041)
,p_name=>'Refresh - Button'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(394699067991215038)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(394699460306215042)
,p_event_id=>wwv_flow_imp.id(394699331771215041)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(394698137141215029)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(394699488069215043)
,p_name=>'Refresh - Region'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(394698137141215029)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(394699637234215044)
,p_event_id=>wwv_flow_imp.id(394699488069215043)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(394698137141215029)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
