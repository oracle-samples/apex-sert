-- file_checksum: 9FD58CE782055FF4C377822424A17C664CB3BB670DE2AB677EE77BEF26433F86
prompt --application/shared_components/navigation/lists/upload_exceptions_wizard
begin
--   Manifest
--     LIST: Upload Exceptions Wizard
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(51368190628558261)
,p_name=>'Upload Exceptions Wizard'
,p_list_status=>'PUBLIC'
,p_version_scn=>44506196022095
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(51369118727558260)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Upload Exceptions'
,p_list_item_link_target=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::::'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(52323540960633740)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Preview Exceptions'
,p_list_item_link_target=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(51368783229558260)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Exceptions Uploaded'
,p_list_item_link_target=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.::::'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
