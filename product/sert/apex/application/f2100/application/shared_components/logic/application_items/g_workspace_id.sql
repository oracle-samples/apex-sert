-- file_checksum: 4448D90F981D1FDD4CABC9C74F9F4F5FE1B325AB1F148F32E2ACCC003C70545E
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_workspace_id
begin
--   Manifest
--     APPLICATION ITEM: G_WORKSPACE_ID
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(495588318631079341)
,p_name=>'G_WORKSPACE_ID'
,p_protection_level=>'I'
,p_version_scn=>41007621756786
);
wwv_flow_imp.component_end;
end;
/
