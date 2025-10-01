-- file_checksum: 3362633E89E3589D87920B07C98F5B5D9C1D4830A88676A1FFAF4F3B95166059
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
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'APEX-SERT Administration'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29100572512038403)
,p_plug_name=>'Metrics'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-left-md:margin-right-md'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394429964089760060)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'ADMIN_METRICS_V'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(29100611797038404)
,p_region_id=>wwv_flow_imp.id(29100572512038403)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'LABEL'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_badge_column_name=>'VALUE'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(353804233789740380)
,p_plug_name=>'APEX-SERT Administration'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394456121008760080)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp.component_end;
end;
/
