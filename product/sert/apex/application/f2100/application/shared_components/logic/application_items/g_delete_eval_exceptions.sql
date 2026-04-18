-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: 724104F68834CFAF367DA7B77370A7E0E21684D6DFDF87EFB0FB3503F1C21867
-- file_checksum: BA28447D2205E14AB983FB9430FBEF7304F7593B2C6CB2B5D239B20E490B8562
prompt --application/shared_components/logic/application_items/g_delete_eval_exceptions
begin
--   Manifest
--     APPLICATION ITEM: G_DELETE_EVAL_EXCEPTIONS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(74163042591786563)
,p_name=>'G_DELETE_EVAL_EXCEPTIONS'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>46455294799284
);
wwv_flow_imp.component_end;
end;
/
