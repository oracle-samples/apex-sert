-- file_checksum: 9073EAD09B23E35B44AAA89CD92E4DBF9992CB8D250E2EB22EC018775F48D16C
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
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
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
 p_id=>wwv_flow_imp.id(127868766572496848)
,p_plug_name=>'confirmClose'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511921980148949486)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_05'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script type="text/javascript">',
'function confirmClose()',
'{',
'var x = confirm("Are you sure that you want to leave APEX-SERT? \n\nThis window will close, but you will still be logged into the APEX Builder.");',
'',
'if (x) { window.close(); }',
'}',
'</script>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(171327143498672743)
,p_plug_name=>'Version Mismatch'
,p_title=>'Warning'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_template=>wwv_flow_imp.id(511915446136949475)
,p_plug_display_sequence=>0
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The version of APEX is newer than the associated APEX-SERT rules and thus, no new evaluations can be run.  Please have your administrator update your APEX-SERT rules.<br />',
''))
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- only show the message on pages 1 and 10',
'if :APP_PAGE_ID in (1,10) then',
'  for x in (select 1 from apex_version_pub_v where apex_version = sert_apex_version)',
'  loop',
'    -- do not show the message when the versions of APEX match',
'    return false;',
'  end loop;',
'',
'  -- show the region',
'  return true;',
'',
'end if;'))
,p_plug_display_when_cond2=>'PLSQL'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(187275441153526098)
,p_plug_name=>'Reports'
,p_region_name=>'reports'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511921980148949486)
,p_plug_display_sequence=>2
,p_location=>null
,p_list_id=>wwv_flow_imp.id(136314465783723109)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(512247215948949598)
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(524438532338721469)
,p_plug_name=>'Stale Exception'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--danger'
,p_plug_template=>wwv_flow_imp.id(511915446136949475)
,p_plug_display_sequence=>1
,p_location=>null
,p_plug_source=>'The value of this component has changed since an exception was added or approved.'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from eval_results_pub_v where result = ''STALE'' and eval_result_id = :G_EVAL_RESULT_ID and :APP_PAGE_ID in (20,30,100)'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(533511275641804087)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(511999637997949547)
,p_plug_display_sequence=>0
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(511883866849949405)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(512262008702949622)
,p_plug_display_condition_type=>'CURRENT_PAGE_IN_CONDITION'
,p_plug_display_when_condition=>'10'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(94688636710074468)
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
wwv_flow_imp.component_end;
end;
/
