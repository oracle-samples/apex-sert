-- file_checksum: 4CC1E6DA973953D9A8BB16551288766999B4D3E7A0823B0E94DC80E28E660A16
prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 2101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(2101)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_auto_dismiss_success_msg=>true
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(394386614971759946)
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_imp.id(394552623077760161)
,p_nav_list_template_options=>'#DEFAULT#:t-MegaMenu--layout5Cols'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(394675430441760590)
,p_nav_bar_list_template_id=>wwv_flow_imp.id(394556637195760165)
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_imp.component_end;
end;
/
