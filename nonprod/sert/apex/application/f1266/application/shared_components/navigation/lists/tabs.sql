-- file_checksum: 8F89633642099FFD9E9987012F1200E6CBC6DDC2684C2E66A712695643BC3F87
prompt --application/shared_components/navigation/lists/tabs
begin
--   Manifest
--     LIST: Tabs
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
 p_id=>wwv_flow_imp.id(98278095324549808)
,p_name=>'Tabs'
,p_list_status=>'PUBLIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(98278349525549828)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Tab1'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(98278685568549832)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Tab2'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
