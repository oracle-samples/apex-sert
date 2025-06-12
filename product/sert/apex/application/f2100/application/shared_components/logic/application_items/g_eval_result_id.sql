-- file_checksum: AED8C7ABFC23EE1EAFE4F9054718A525ED36854B80A5638A235ADD951BF01314
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_eval_result_id
begin
--   Manifest
--     APPLICATION ITEM: G_EVAL_RESULT_ID
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(480011477512528778)
,p_name=>'G_EVAL_RESULT_ID'
,p_protection_level=>'S'
,p_version_scn=>41004789986894
);
wwv_flow_imp.component_end;
end;
/
