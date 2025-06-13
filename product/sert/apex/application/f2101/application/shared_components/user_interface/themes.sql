-- file_checksum: 0133866343C2129D83528653087DA6DE1E388453FED1068CAD1956D785FCC7AB
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 2101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(394652642980760562)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'24.1'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_current_theme_style_id=>wwv_flow_imp.id(394689074844769288)
,p_default_page_template=>wwv_flow_imp.id(394397214174760012)
,p_default_dialog_template=>wwv_flow_imp.id(394414620570760027)
,p_error_template=>wwv_flow_imp.id(394411980165760025)
,p_printer_friendly_template=>wwv_flow_imp.id(394397214174760012)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(394411980165760025)
,p_default_button_template=>wwv_flow_imp.id(394562605517760181)
,p_default_region_template=>wwv_flow_imp.id(394489463335760099)
,p_default_chart_template=>wwv_flow_imp.id(394489463335760099)
,p_default_form_template=>wwv_flow_imp.id(394489463335760099)
,p_default_reportr_template=>wwv_flow_imp.id(394489463335760099)
,p_default_tabform_template=>wwv_flow_imp.id(394489463335760099)
,p_default_wizard_template=>wwv_flow_imp.id(394489463335760099)
,p_default_menur_template=>wwv_flow_imp.id(394501821245760106)
,p_default_listr_template=>wwv_flow_imp.id(394489463335760099)
,p_default_irr_template=>wwv_flow_imp.id(394479640660760093)
,p_default_report_template=>wwv_flow_imp.id(394527652631760130)
,p_default_label_template=>wwv_flow_imp.id(394560104116760172)
,p_default_menu_template=>wwv_flow_imp.id(394564241705760183)
,p_default_calendar_template=>wwv_flow_imp.id(394564296302760187)
,p_default_list_template=>wwv_flow_imp.id(394550028240760159)
,p_default_nav_list_template=>wwv_flow_imp.id(394558846436760167)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(394558846436760167)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(394557056262760165)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(394425593983760058)
,p_default_dialogr_template=>wwv_flow_imp.id(394422849849760056)
,p_default_option_label=>wwv_flow_imp.id(394560104116760172)
,p_default_required_label=>wwv_flow_imp.id(394561407168760174)
,p_default_navbar_list_template=>wwv_flow_imp.id(394556637195760165)
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
