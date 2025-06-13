-- file_checksum: 8546439B0DFC910EB73AD6CCEDEDFB4230351647FE9A7E8AA56BB51C8673547A
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(394386134507759938)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(68219489814114019)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Purge Stale Versions'
,p_link=>'f?p=&APP_ID.:2950:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>2950
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(74218747851698512)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Scheduled Evaluations'
,p_link=>'f?p=&APP_ID.:6000:&SESSION.::&DEBUG.:::'
,p_page_id=>6000
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(74327647602644408)
,p_parent_id=>wwv_flow_imp.id(74218747851698512)
,p_short_name=>'Scheduled Evaluation Runs for &P6010_JOB_NAME.'
,p_link=>'f?p=&APP_ID.:6010:&SESSION.::&DEBUG.:::'
,p_page_id=>6010
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(194073993857874314)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Builder URLs'
,p_link=>'f?p=&APP_ID.:2900:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>2900
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(339888475826593187)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Rule Criteria Types'
,p_link=>'f?p=&APP_ID.:2700:&SESSION.::&DEBUG.:::'
,p_page_id=>2700
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(345325476072028328)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Shared Component Types'
,p_link=>'f?p=&APP_ID.:2800:&SESSION.::&DEBUG.:::'
,p_page_id=>2800
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(353878754672145446)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Preferences'
,p_link=>'f?p=&APP_ID.:4000:&SESSION.::&DEBUG.:::'
,p_page_id=>4000
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(355519733190665160)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Rule Criteria'
,p_link=>'f?p=&APP_ID.:2600:&SESSION.::&DEBUG.:::'
,p_page_id=>2600
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(355554853914020794)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Reserved Strings'
,p_link=>'f?p=&APP_ID.:2650:&SESSION.::&DEBUG.:::'
,p_page_id=>2650
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(356114116327006917)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Scheduler Job Logs'
,p_link=>'f?p=&APP_ID.:3100:&SESSION.::&DEBUG.:::'
,p_page_id=>3100
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(375583955110047854)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Logs'
,p_link=>'f?p=&APP_ID.:3000:&SESSION.::&DEBUG.:::'
,p_page_id=>3000
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(394703827016304758)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Risks'
,p_link=>'f?p=&APP_ID.:1000:&SESSION.::&DEBUG.:::'
,p_page_id=>1000
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(394751279475377238)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Categories'
,p_link=>'f?p=&APP_ID.:1100:&SESSION.::&DEBUG.:::'
,p_page_id=>1100
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(394784567899466877)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Rules'
,p_link=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.:::'
,p_page_id=>2000
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(394811730220524501)
,p_parent_id=>wwv_flow_imp.id(394784567899466877)
,p_short_name=>'Manage Rule'
,p_link=>'f?p=&APP_ID.:2010:&SESSION.::&DEBUG.:::'
,p_page_id=>2010
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(394916281573085572)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Rule Sets'
,p_link=>'f?p=&APP_ID.:2500:&SESSION.::&DEBUG.:::'
,p_page_id=>2500
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(394958906332147281)
,p_parent_id=>wwv_flow_imp.id(394916281573085572)
,p_short_name=>'Manage Rule Set'
,p_link=>'f?p=&APP_ID.:2520:&SESSION.::&DEBUG.:::'
,p_page_id=>2520
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(395101973882730523)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Rule Set Types'
,p_link=>'f?p=&APP_ID.:1200:&SESSION.::&DEBUG.:::'
,p_page_id=>1200
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(395129961892754669)
,p_parent_id=>wwv_flow_imp.id(394386327372759939)
,p_short_name=>'Severity'
,p_link=>'f?p=&APP_ID.:1300:&SESSION.::&DEBUG.:::'
,p_page_id=>1300
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp.component_end;
end;
/
