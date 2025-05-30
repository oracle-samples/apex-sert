-- file_checksum: 74136CA3E45FD93C30E368ABAC96130087A776FB9398721CE4D3C59E975BC9DB
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_oci_bucket_output_folder
begin
--   Manifest
--     APPLICATION ITEM: G_OCI_BUCKET_OUTPUT_FOLDER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(69074354203285500)
,p_name=>'G_OCI_BUCKET_OUTPUT_FOLDER'
,p_protection_level=>'I'
,p_version_scn=>42133019356561
);
wwv_flow_imp.component_end;
end;
/
