-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: 724104F68834CFAF367DA7B77370A7E0E21684D6DFDF87EFB0FB3503F1C21867
-- file_checksum: 46638A46CE8947159184C3128769753F694C5D9F2F56A8BF1FCC67840D6796CA
prompt --application/shared_components/logic/application_items/g_eval_title
begin
--   Manifest
--     APPLICATION ITEM: G_EVAL_TITLE
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
 p_id=>wwv_flow_imp.id(512432013569197748)
,p_name=>'G_EVAL_TITLE'
,p_protection_level=>'I'
,p_version_scn=>41003917378337
);
wwv_flow_imp.component_end;
end;
/
