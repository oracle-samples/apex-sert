-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 919F0A42803A637E0EFFF828C3376F8F4CA1FE574EE32449A1752F8DF3D6D00F
prompt --application/shared_components/navigation/lists/exceptions
begin
--   Manifest
--     LIST: EXCEPTIONS
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
 p_id=>wwv_flow_imp.id(136301758012484256)
,p_name=>'EXCEPTIONS'
,p_list_status=>'PUBLIC'
,p_version_scn=>45172060544566
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(28940987997545384)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Exception Details'
,p_list_item_link_target=>'f?p=&APP_ID.:270:&SESSION.::&DEBUG.::P270_EVAL_ID:&P10_EVAL_ID.:'
,p_list_item_icon=>'fa-file-text-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(136304413345484250)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Export Exceptions'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.:DOWNLOAD_EXCEPTIONS:&DEBUG.::::'
,p_list_item_icon=>'fa-cloud-download'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(136303992947484250)
,p_list_item_display_sequence=>55
,p_list_item_link_text=>'Import Exceptions'
,p_list_item_link_target=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cloud-upload'
,p_list_item_icon_attributes=>'class="foo"'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_list_item_disp_condition=>'G_STALE_EVAL'
,p_list_item_disp_condition2=>'N'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(110454986413843728)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Bulk Exceptions'
,p_list_item_link_target=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:70,80,90:P70_BULK_ACTION:RAISE:'
,p_list_item_icon=>'fa-table-plus'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(110454715459837006)
,p_list_item_display_sequence=>65
,p_list_item_link_text=>'Raise Exceptions'
,p_list_item_link_target=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.::P60_EVAL_ID:&P10_EVAL_ID.:'
,p_list_item_icon=>'fa-table-edit'
,p_list_item_disp_cond_type=>'NEVER'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(111623567622471794)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Bulk Approve/Reject Exceptions'
,p_list_item_link_target=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:70,80,90:P70_BULK_ACTION:AR:'
,p_list_item_icon=>'fa-table-check'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
