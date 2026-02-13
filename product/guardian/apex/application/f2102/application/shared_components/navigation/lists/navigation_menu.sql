-- file_checksum: 5B8CCE733FEB2E0038200E6883D01910ACDB18E6ADC188914B6C7E9611E1D548
prompt --application/shared_components/navigation/lists/navigation_menu
begin
--   Manifest
--     LIST: Navigation Menu
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(30658404691621022719)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>46220513934533
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(30658410113106022741)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(32681450751285989922)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Activity Log'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table-search'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(33524678855526220686)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'SERT Applications'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table-search'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(32819421526003000591)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Rule Fails'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table-search'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(139268059442252482)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Synchronization Log'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-layout-header-sidebar-left'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'7'
);
wwv_flow_imp.component_end;
end;
/
