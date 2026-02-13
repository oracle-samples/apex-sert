-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 5248161B66C1E4E8BC45E2AE98D2899113637D8E9C249CA1F83E868B22574C49
prompt --application/shared_components/navigation/lists/upload_exceptions_wizard
begin
--   Manifest
--     LIST: Upload Exceptions Wizard
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(95089608489836524)
,p_name=>'Upload Exceptions Wizard'
,p_list_status=>'PUBLIC'
,p_version_scn=>44506196022095
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(95090536588836523)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Upload Exceptions'
,p_list_item_link_target=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::::'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(96044958821912003)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Preview Exceptions'
,p_list_item_link_target=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(95090201090836523)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Exceptions Uploaded'
,p_list_item_link_target=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.::::'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
