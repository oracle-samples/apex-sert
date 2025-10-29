-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 481A60FC2AEB17A23C276637B9E00C0C6CE1B37A97C5655B3369C1B212BBB12E
prompt --application/shared_components/navigation/lists/upload_wizard
begin
--   Manifest
--     LIST: Upload Wizard
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(375449574827050457)
,p_name=>'Upload Wizard'
,p_list_status=>'PUBLIC'
,p_version_scn=>39194514063490
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(375449723899050470)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Upload Rules'
,p_list_item_link_target=>'f?p=&APP_ID.:2020:&APP_SESSION.::&DEBUG.:::'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(375450088774050472)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Preview Rules'
,p_list_item_link_target=>'f?p=&APP_ID.:2030:&APP_SESSION.::&DEBUG.:::'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(375450489821050473)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Rules Uploaded'
,p_list_item_link_target=>'f?p=&APP_ID.:2040:&APP_SESSION.::&DEBUG.:::'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
