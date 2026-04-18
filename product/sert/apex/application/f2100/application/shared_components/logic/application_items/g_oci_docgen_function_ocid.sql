-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: 724104F68834CFAF367DA7B77370A7E0E21684D6DFDF87EFB0FB3503F1C21867
-- file_checksum: 303FE0045380D45F2688EBDF523B32A77597C39922F5F78F93AD9C683F048252
prompt --application/shared_components/logic/application_items/g_oci_docgen_function_ocid
begin
--   Manifest
--     APPLICATION ITEM: G_OCI_DOCGEN_FUNCTION_OCID
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
 p_id=>wwv_flow_imp.id(112795214491561437)
,p_name=>'G_OCI_DOCGEN_FUNCTION_OCID'
,p_protection_level=>'I'
,p_version_scn=>42133018944983
);
wwv_flow_imp.component_end;
end;
/
