-- file_checksum: C926AAE07236E2DD5ED566F3855205CD75FA155A3B39F3CCF3299070A62A2E7A
prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 1266
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(43704296239394051)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'23.1'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(43741515325394135)
,p_default_dialog_template=>wwv_flow_imp.id(43742882598394139)
,p_error_template=>wwv_flow_imp.id(43744976526394141)
,p_printer_friendly_template=>wwv_flow_imp.id(43741515325394135)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(43744976526394141)
,p_default_button_template=>wwv_flow_imp.id(43705559437394070)
,p_default_region_template=>wwv_flow_imp.id(43728368363394113)
,p_default_chart_template=>wwv_flow_imp.id(43728368363394113)
,p_default_form_template=>wwv_flow_imp.id(43728368363394113)
,p_default_reportr_template=>wwv_flow_imp.id(43728368363394113)
,p_default_tabform_template=>wwv_flow_imp.id(43728368363394113)
,p_default_wizard_template=>wwv_flow_imp.id(43728368363394113)
,p_default_menur_template=>wwv_flow_imp.id(43724015402394110)
,p_default_listr_template=>wwv_flow_imp.id(43728368363394113)
,p_default_irr_template=>wwv_flow_imp.id(43728883880394113)
,p_default_report_template=>wwv_flow_imp.id(43718414101394098)
,p_default_label_template=>wwv_flow_imp.id(43706081860394077)
,p_default_menu_template=>wwv_flow_imp.id(43705096459394069)
,p_default_calendar_template=>wwv_flow_imp.id(43704935681394067)
,p_default_list_template=>wwv_flow_imp.id(43710855372394085)
,p_default_nav_list_template=>wwv_flow_imp.id(43707315345394080)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(43707315345394080)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(43708170783394083)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(43737941448394124)
,p_default_dialogr_template=>wwv_flow_imp.id(43738368551394125)
,p_default_option_label=>wwv_flow_imp.id(43706081860394077)
,p_default_required_label=>wwv_flow_imp.id(43705830593394077)
,p_default_navbar_list_template=>wwv_flow_imp.id(43708250048394083)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/23.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
