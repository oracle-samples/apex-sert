-- file_checksum: D985629603AB1C68D286A42636F16763B53741372F6F306A805A84FAF7361003
prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(2100)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_auto_dismiss_success_msg=>true
,p_global_page_id=>0
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_imp.id(468532153589671342)
,p_nav_list_template_options=>'#DEFAULT#:js-tabLike'
,p_javascript_file_urls=>'#APP_FILES#js/apex-sert-lib#MIN#.js'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(468651848467671760)
,p_nav_bar_list_template_id=>wwv_flow_imp.id(468526403861671336)
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_imp.component_end;
end;
/
