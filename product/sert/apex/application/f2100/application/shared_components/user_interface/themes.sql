-- file_checksum: 8C8FFF096D165A727D5294614447889223FFF96A25FF3292F1967C80F8348C6A
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(512350470178950000)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'24.1'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_current_theme_style_id=>wwv_flow_imp.id(512028254784249018)
,p_default_page_template=>wwv_flow_imp.id(511910522949949470)
,p_default_dialog_template=>wwv_flow_imp.id(511905303236949466)
,p_error_template=>wwv_flow_imp.id(511895304418949453)
,p_printer_friendly_template=>wwv_flow_imp.id(511910522949949470)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(511895304418949453)
,p_default_button_template=>wwv_flow_imp.id(512260372386949620)
,p_default_region_template=>wwv_flow_imp.id(511987240355949540)
,p_default_chart_template=>wwv_flow_imp.id(511987240355949540)
,p_default_form_template=>wwv_flow_imp.id(511987240355949540)
,p_default_reportr_template=>wwv_flow_imp.id(511987240355949540)
,p_default_tabform_template=>wwv_flow_imp.id(511987240355949540)
,p_default_wizard_template=>wwv_flow_imp.id(511987240355949540)
,p_default_menur_template=>wwv_flow_imp.id(511999637997949547)
,p_default_listr_template=>wwv_flow_imp.id(511987240355949540)
,p_default_irr_template=>wwv_flow_imp.id(511977446662949534)
,p_default_report_template=>wwv_flow_imp.id(512225358725949572)
,p_default_label_template=>wwv_flow_imp.id(512257901776949613)
,p_default_menu_template=>wwv_flow_imp.id(512262008702949622)
,p_default_calendar_template=>wwv_flow_imp.id(512262142602949625)
,p_default_list_template=>wwv_flow_imp.id(512241782999949593)
,p_default_nav_list_template=>wwv_flow_imp.id(512253571450949605)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(512253571450949605)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(512248159131949600)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(511923385421949487)
,p_default_dialogr_template=>wwv_flow_imp.id(511920605950949485)
,p_default_option_label=>wwv_flow_imp.id(512257901776949613)
,p_default_required_label=>wwv_flow_imp.id(512259205067949615)
,p_default_navbar_list_template=>wwv_flow_imp.id(512247821722949599)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/24.1/')
,p_files_version=>65
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
