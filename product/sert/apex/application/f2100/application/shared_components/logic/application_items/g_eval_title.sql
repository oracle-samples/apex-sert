-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 8EC57267EF6C42D90CEB4EB76F5F2CC5A688E6712CD9514CA2BE88A14528176F
prompt --application/shared_components/logic/application_items/g_eval_title
begin
--   Manifest
--     APPLICATION ITEM: G_EVAL_TITLE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(512432013569197748)
,p_name=>'G_EVAL_TITLE'
,p_protection_level=>'I'
,p_version_scn=>41003917378337
);
wwv_flow_imp.component_end;
end;
/
