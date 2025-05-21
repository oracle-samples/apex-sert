-- file_checksum: 5AE39F70ADB51CC4EAF03C07137EC0097AD030F8C818A9FACB9B92E3CDA09910
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/navigation/lists/rules_action_button
begin
--   Manifest
--     LIST: Rules Action Button
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(375573124050309460)
,p_name=>'Rules Action Button'
,p_list_status=>'PUBLIC'
,p_version_scn=>41858591378102
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(375573347161309460)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Create Rule'
,p_list_item_link_target=>'f?p=&APP_ID.:2010:&SESSION.::&DEBUG.:2010:::'
,p_list_item_icon=>'fa-table-plus'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(375573738109309460)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Export Rules as JSON'
,p_list_item_link_target=>'f?p=&APP_ID.:2000:&SESSION.:EXPORT:&DEBUG.::::'
,p_list_item_icon=>'fa-cloud-download'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(60763769934166536)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Export Rules as SQL Script'
,p_list_item_link_target=>'f?p=&APP_ID.:2000:&SESSION.:EXPORT_SQL:&DEBUG.::::'
,p_list_item_icon=>'fa-cloud-download'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(60963304005665081)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Export Rules as SQL HEX Script'
,p_list_item_link_target=>'f?p=&APP_ID.:2000:&SESSION.:EXPORT_HEX:&DEBUG.::::'
,p_list_item_icon=>'fa-cloud-download'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(375574089748309461)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Import Rules from JSON'
,p_list_item_link_target=>'f?p=&APP_ID.:2020:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cloud-upload'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
