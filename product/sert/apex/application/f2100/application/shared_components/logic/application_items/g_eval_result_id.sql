-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 284FCDDD79F061771A60A1355854B1E418978E7F7D0A45A359E3DCEC4AABCEC6
prompt --application/shared_components/logic/application_items/g_eval_result_id
begin
--   Manifest
--     APPLICATION ITEM: G_EVAL_RESULT_ID
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
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
