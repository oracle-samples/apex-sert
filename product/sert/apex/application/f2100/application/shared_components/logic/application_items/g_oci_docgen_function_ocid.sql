-- file_checksum: 5E6F1782D4DF5D4D99681A75815F64D64A9F33D1F2F20B157C9C0EFF23513CEF
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_oci_docgen_function_ocid
begin
--   Manifest
--     APPLICATION ITEM: G_OCI_DOCGEN_FUNCTION_OCID
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
 p_id=>wwv_flow_imp.id(69073796630283174)
,p_name=>'G_OCI_DOCGEN_FUNCTION_OCID'
,p_protection_level=>'I'
,p_version_scn=>42133018944983
);
wwv_flow_imp.component_end;
end;
/
