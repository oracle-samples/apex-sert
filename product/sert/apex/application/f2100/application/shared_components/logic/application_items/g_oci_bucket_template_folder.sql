-- file_checksum: D1C167F725046F3260831EA063F1BE443B7A5FC8879DC9AC38CE912F56220EF6
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_oci_bucket_template_folder
begin
--   Manifest
--     APPLICATION ITEM: G_OCI_BUCKET_TEMPLATE_FOLDER
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
 p_id=>wwv_flow_imp.id(69074614137286259)
,p_name=>'G_OCI_BUCKET_TEMPLATE_FOLDER'
,p_protection_level=>'I'
,p_version_scn=>42133019488520
);
wwv_flow_imp.component_end;
end;
/
