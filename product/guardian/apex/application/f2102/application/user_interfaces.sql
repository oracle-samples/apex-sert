prompt app_checksum: F24062FCE39D7AC19F9EA2292B88008E6F55784EDB74E6D62BAD565878490F78
-- file_checksum: D836B909C6460203551362AEBD33A8C658AC09829CBAB11B624D3296D538AD79
prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 2102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(2102)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(30658404691621022719)
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>1666893936301477844
,p_nav_list_template_options=>'#DEFAULT#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(30658405886868022724)
,p_nav_bar_list_template_id=>2847543055748234966
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_imp.component_end;
end;
/
