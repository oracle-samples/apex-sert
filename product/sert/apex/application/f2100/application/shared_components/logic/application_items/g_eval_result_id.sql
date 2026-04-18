-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: 724104F68834CFAF367DA7B77370A7E0E21684D6DFDF87EFB0FB3503F1C21867
-- file_checksum: 4E9ACDA12B2C1690E87DF7ADD26A660024BAA39D533F950547F7E7F896C36FBC
prompt --application/shared_components/logic/application_items/g_eval_result_id
begin
--   Manifest
--     APPLICATION ITEM: G_EVAL_RESULT_ID
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
 p_id=>wwv_flow_imp.id(523732895373807041)
,p_name=>'G_EVAL_RESULT_ID'
,p_protection_level=>'S'
,p_version_scn=>41004789986894
);
wwv_flow_imp.component_end;
end;
/
