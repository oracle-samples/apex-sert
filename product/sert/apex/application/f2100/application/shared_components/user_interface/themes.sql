-- file_checksum: CBC75ABBD86C4457870975C5C7523B0475ED02CE5293556F10EE84904ACC2283
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
,p_release=>'24.2.0'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(468629052317671737)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'24.1'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_current_theme_style_id=>wwv_flow_imp.id(468306836922970755)
,p_default_page_template=>wwv_flow_imp.id(468189105088671207)
,p_default_dialog_template=>wwv_flow_imp.id(468183885375671203)
,p_error_template=>wwv_flow_imp.id(468173886557671190)
,p_printer_friendly_template=>wwv_flow_imp.id(468189105088671207)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(468173886557671190)
,p_default_button_template=>wwv_flow_imp.id(468538954525671357)
,p_default_region_template=>wwv_flow_imp.id(468265822494671277)
,p_default_chart_template=>wwv_flow_imp.id(468265822494671277)
,p_default_form_template=>wwv_flow_imp.id(468265822494671277)
,p_default_reportr_template=>wwv_flow_imp.id(468265822494671277)
,p_default_tabform_template=>wwv_flow_imp.id(468265822494671277)
,p_default_wizard_template=>wwv_flow_imp.id(468265822494671277)
,p_default_menur_template=>wwv_flow_imp.id(468278220136671284)
,p_default_listr_template=>wwv_flow_imp.id(468265822494671277)
,p_default_irr_template=>wwv_flow_imp.id(468256028801671271)
,p_default_report_template=>wwv_flow_imp.id(468503940864671309)
,p_default_label_template=>wwv_flow_imp.id(468536483915671350)
,p_default_menu_template=>wwv_flow_imp.id(468540590841671359)
,p_default_calendar_template=>wwv_flow_imp.id(468540724741671362)
,p_default_list_template=>wwv_flow_imp.id(468520365138671330)
,p_default_nav_list_template=>wwv_flow_imp.id(468532153589671342)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(468532153589671342)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(468526741270671337)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(468201967560671224)
,p_default_dialogr_template=>wwv_flow_imp.id(468199188089671222)
,p_default_option_label=>wwv_flow_imp.id(468536483915671350)
,p_default_required_label=>wwv_flow_imp.id(468537787206671352)
,p_default_navbar_list_template=>wwv_flow_imp.id(468526403861671336)
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
