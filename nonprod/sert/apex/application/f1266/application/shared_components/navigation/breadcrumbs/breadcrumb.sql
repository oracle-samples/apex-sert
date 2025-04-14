-- file_checksum: E10C96B678540DA303F12B5D1176E88A0E1B57682F3142650FA88C5FF9ABBB5A
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU:  Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(43693467211393956)
,p_name=>' Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(18964978572518418)
,p_short_name=>'Page: Item Default Name'
,p_link=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20109597128923043)
,p_short_name=>'Conditions Never'
,p_link=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20907455282849782)
,p_short_name=>'Page: Dynamic Action Condition Never'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20909691252972906)
,p_short_name=>'URL Tampering: Item Protection'
,p_link=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(21536956445570385)
,p_parent_id=>wwv_flow_imp.id(43693068852393951)
,p_short_name=>'Security'
,p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::'
,p_page_id=>12
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(21546679081620216)
,p_short_name=>'Cards Page'
,p_link=>'f?p=&APP_ID.:13:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>13
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(21552759774675923)
,p_parent_id=>wwv_flow_imp.id(21536956445570385)
,p_short_name=>'Cards'
,p_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(21556238763694531)
,p_parent_id=>wwv_flow_imp.id(21536956445570385)
,p_short_name=>'Access Control'
,p_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:::'
,p_page_id=>16
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(43569233776682129)
,p_parent_id=>wwv_flow_imp.id(43635079212242366)
,p_short_name=>'Dynamic Actions'
,p_link=>'f?p=&APP_ID.:305:&SESSION.'
,p_page_id=>305
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(43578403643715680)
,p_parent_id=>wwv_flow_imp.id(43635079212242366)
,p_short_name=>'Computations'
,p_link=>'f?p=&APP_ID.:304:&SESSION.'
,p_page_id=>304
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(43618138053162657)
,p_parent_id=>wwv_flow_imp.id(43635079212242366)
,p_short_name=>'Charts/Maps'
,p_link=>'f?p=&APP_ID.:303:&SESSION.'
,p_page_id=>303
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(43620872452179988)
,p_parent_id=>wwv_flow_imp.id(43635079212242366)
,p_short_name=>'Branches'
,p_link=>'f?p=&APP_ID.:302:&SESSION.'
,p_page_id=>302
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(43633739520238186)
,p_parent_id=>wwv_flow_imp.id(43635079212242366)
,p_short_name=>'Calendar'
,p_link=>'f?p=&APP_ID.:301:&SESSION.'
,p_page_id=>301
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(43635079212242366)
,p_short_name=>'SQLi'
,p_link=>'f?p=&APP_ID.:300:&SESSION.'
,p_page_id=>300
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(43691250528390986)
,p_short_name=>'Page Settings'
,p_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::'
,p_page_id=>200
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(43693068852393951)
,p_short_name=>'Home &P3_ITEM_NEW_NOT_EXISTS1.'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(45097427623812047)
,p_parent_id=>wwv_flow_imp.id(43693068852393951)
,p_short_name=>'Modal Form'
,p_link=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_imp.component_end;
end;
/
