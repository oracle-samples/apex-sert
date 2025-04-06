-- file_checksum: 8479EF3E6C82CF427F5922E55A7E4D5442F6B5F4002C53EB8CF5E0755B99D7CF
prompt --application/shared_components/navigation/lists/new_list
begin
--   Manifest
--     LIST: new list
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(102498328474403685)
,p_name=>'new list'
,p_list_status=>'PUBLIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102498518602403686)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102498874970403688)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Admin Users'
,p_list_item_link_target=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.::::'
,p_required_patch=>wwv_flow_imp.id(344546044302741721)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'300,310'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102499350203403689)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Roles'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-users'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'200,210'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102499698089403689)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Preferences'
,p_list_item_link_target=>'f?p=&APP_ID.:400:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gears'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'400,410'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102500131864403689)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Scheduled Evaluations'
,p_list_item_icon=>'fa-calendar-clock'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'500,540,510,520,530,525,535,550'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102500509756403690)
,p_list_item_display_sequence=>41
,p_list_item_link_text=>'Individual Evaluations'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(102500131864403689)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102500927327403690)
,p_list_item_display_sequence=>42
,p_list_item_link_text=>'Group Evaluations'
,p_list_item_link_target=>'f?p=&APP_ID.:510:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(102500131864403689)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102501308029403691)
,p_list_item_display_sequence=>43
,p_list_item_link_text=>'Schedule Groups'
,p_list_item_link_target=>'f?p=&APP_ID.:520:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(102500131864403689)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102501745943403691)
,p_list_item_display_sequence=>44
,p_list_item_link_text=>'Notification Lists'
,p_list_item_link_target=>'f?p=&APP_ID.:530:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(102500131864403689)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102502058635403692)
,p_list_item_display_sequence=>45
,p_list_item_link_text=>'Job Runs'
,p_list_item_link_target=>'f?p=&APP_ID.:540:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(102500131864403689)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102502524020403692)
,p_list_item_display_sequence=>46
,p_list_item_link_text=>'Job Status'
,p_list_item_link_target=>'f?p=&APP_ID.:550:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(102500131864403689)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102504139039403694)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Logs'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102502903598403693)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Error Logs'
,p_list_item_link_target=>'f?p=&APP_ID.:1500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(102504139039403694)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1500,'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102503259025403693)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Mail Queue'
,p_list_item_link_target=>'f?p=&APP_ID.:1600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(102504139039403694)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1600,,1610'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(102503701124403694)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Mail Queue Log'
,p_list_item_link_target=>'f?p=&APP_ID.:1610:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(102504139039403694)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
