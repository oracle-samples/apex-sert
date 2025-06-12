-- file_checksum: 65ACF64387C36149CCD6E455AD4840FA5FFDBF80F2C4C1A0136154D5A4F864A5
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
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(479967915020953758)
,p_name=>'Evaluation Details Dialog'
,p_list_status=>'PUBLIC'
,p_version_scn=>39194514025817
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(479968118357953768)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Details'
,p_list_item_link_target=>'f?p=&APP_ID.:100:&APP_SESSION.'
,p_list_item_icon=>'fa-info-circle-o'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(479968455807953771)
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
