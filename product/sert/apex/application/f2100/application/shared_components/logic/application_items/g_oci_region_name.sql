-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: A2636A147AD76E89A2FF1D4D777249C7E94A20A0CE7EDD06BF42F1D7DDB10C3C
prompt --application/shared_components/logic/application_items/g_oci_region_name
begin
--   Manifest
--     APPLICATION ITEM: G_OCI_REGION_NAME
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
 p_id=>wwv_flow_imp.id(112794985414559874)
,p_name=>'G_OCI_REGION_NAME'
,p_protection_level=>'I'
,p_version_scn=>42133018655516
);
wwv_flow_imp.component_end;
end;
/
