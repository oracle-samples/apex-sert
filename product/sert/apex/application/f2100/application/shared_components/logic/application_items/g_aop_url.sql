-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 94CAF9D7BE00F584BD2A0B0B7D639E09BD67DA96D3D708C51C7EBBC521858CE7
prompt --application/shared_components/logic/application_items/g_aop_url
begin
--   Manifest
--     APPLICATION ITEM: G_AOP_URL
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
 p_id=>wwv_flow_imp.id(111848158914588129)
,p_name=>'G_AOP_URL'
,p_protection_level=>'I'
,p_version_scn=>41905337165052
);
wwv_flow_imp.component_end;
end;
/
