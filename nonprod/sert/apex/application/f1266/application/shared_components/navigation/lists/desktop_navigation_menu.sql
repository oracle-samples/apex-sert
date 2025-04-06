-- file_checksum: 2ECF452F86AA4914ADEC27F3668B5FB54DF6F56141B18253EC6F80999DBAB8F2
prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
--   Manifest
--     LIST: Desktop Navigation Menu
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
 p_id=>wwv_flow_imp.id(43746963146394161)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>42040390082603
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(43693362423393955)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_text_02=>'&P3_NEW.'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1,3'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(45029607708668559)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'logger report'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_parent_list_item_id=>wwv_flow_imp.id(43693362423393955)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(43692206592390991)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Page Settings'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'200'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(43635975236242376)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'SQLi'
,p_list_item_link_target=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'300,301,302,303,304,305,4'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(97646309090373142)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Calendar Page'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_parent_list_item_id=>wwv_flow_imp.id(43635975236242376)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(99571525816976463)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'test URL &P3_NEW.'
,p_list_item_link_target=>'&P3_NEW.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18963686370506386)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Standards'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18964002651508777)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Page: Item Default Name'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:::'
,p_parent_list_item_id=>wwv_flow_imp.id(18963686370506386)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(20109117134923030)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Conditions Never'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(18963686370506386)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'6'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(20906980336849615)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'SV_CHK_DA_COND_NEVER'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(18963686370506386)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(20908834148965195)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Security'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user-secret'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(20909206089972896)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'SV_URL_ITEM_PROTECT'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(20908834148965195)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'7'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(21536439937570378)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'P12'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(20908834148965195)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'12'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(21551039345675904)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Cards Page'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:::'
,p_parent_list_item_id=>wwv_flow_imp.id(20908834148965195)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'15'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(21554576573694528)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'Access Control'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user-wrench'
,p_parent_list_item_id=>wwv_flow_imp.id(20908834148965195)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'16'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(21603450108122784)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'Card Action AuthZ Inconsistency - literal link'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:::'
,p_parent_list_item_id=>wwv_flow_imp.id(21554576573694528)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'17'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(21546114994620216)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Cards Page'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'13'
);
wwv_flow_imp.component_end;
end;
/
