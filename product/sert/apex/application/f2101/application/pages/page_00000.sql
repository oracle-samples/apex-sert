-- file_checksum: 48CF2B1082D9BFF629DC056DF4D3AE79940A87B0D340092EB83321EE7271AA83
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page'
,p_step_title=>'Global Page'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(83722576804314174)
,p_plug_name=>'Warning'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_template=>wwv_flow_imp.id(394417639951760031)
,p_plug_display_sequence=>0
,p_location=>null
,p_plug_source=>'The version of APEX is newer than the associated APEX-SERT rules. Click <b>Upgrade</b> to upgrade all rules, rule sets & exceptions.'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_count number;',
'begin',
'',
'-- first, determine if the versions of APEX match',
'select count(*) into l_count from apex_version_v where apex_version != sert_apex_version;',
'if l_count = 1 then',
'',
'  -- version do match; do not display on modal pages or the login page',
'  select count(*) into l_count from apex_application_pages ',
'    where application_id = :APP_ID and page_id = :APP_PAGE_ID and page_mode = ''Normal'' and page_id != 9999;',
'  if l_count = 1 then ',
'    return true;',
'  end if;',
'',
'end if;',
'',
'return false;',
'',
'end;'))
,p_plug_display_when_cond2=>'PLSQL'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(353748456745515658)
,p_plug_name=>'Smart Filter Placeholder'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md:margin-left-lg:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from APEX_APPL_PAGE_FILTERS where application_id = :APP_ID and page_id = :APP_PAGE_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(414553966215499010)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394501821245760106)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(394386134507759938)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(394564241705760183)
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from apex_application_pages where application_id = :APP_ID and page_id = :APP_PAGE_ID and page_mode = ''Normal'' and :APP_PAGE_ID > 1'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(75348584098617953)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(83722576804314174)
,p_button_name=>'UPGRADE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(394562605517760181)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upgrade'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:5000:&SESSION.::&DEBUG.::P5000_BRANCH_TO:&APP_PAGE_ID.'
);
wwv_flow_imp.component_end;
end;
/
