-- file_checksum: B183E248845515A348416E0E3FF0F992CE9A96D186D412A8E7CB39943293D0C8
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(30658404260306022718)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(139315703508484069)
,p_short_name=>'Synchronization Log'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(30658404466814022719)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(32681451680759989924)
,p_short_name=>'Activity Log'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(32819422247737000623)
,p_short_name=>'Rule Fails'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(33524679838562220688)
,p_short_name=>'SERT Applications'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_page_id=>4
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(33534421593247921550)
,p_parent_id=>wwv_flow_imp.id(32819422247737000623)
,p_short_name=>'Rule Fails: &P5_RULE_NAME.'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(34586985770159449482)
,p_parent_id=>wwv_flow_imp.id(32681451680759989924)
,p_short_name=>'Application : &P6_APPLICATION_NAME.'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp.component_end;
end;
/
