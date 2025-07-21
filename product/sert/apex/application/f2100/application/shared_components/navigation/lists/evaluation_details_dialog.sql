-- file_checksum: 7BC4D0B74B88018B9A87D69437CECCAD28478474637D5F8D629F3D3D5B23BA16
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/navigation/lists/evaluation_details_dialog
begin
--   Manifest
--     LIST: Evaluation Details Dialog
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(523689332882232021)
,p_name=>'Evaluation Details Dialog'
,p_list_status=>'PUBLIC'
,p_version_scn=>39194514025817
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(523689536219232031)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Details'
,p_list_item_link_target=>'f?p=&APP_ID.:100:&APP_SESSION.'
,p_list_item_icon=>'fa-info-circle-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(523689873669232034)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Comments'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-comments-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
