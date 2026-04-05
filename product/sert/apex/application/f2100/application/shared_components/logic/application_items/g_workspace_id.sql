-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: A93EE19BF3C4ACC52B6A166A44738D3F40925AFA5A81A5A5C249B67CD31A7182
prompt --application/shared_components/logic/application_items/g_workspace_id
begin
--   Manifest
--     APPLICATION ITEM: G_WORKSPACE_ID
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(539309736492357604)
,p_name=>'G_WORKSPACE_ID'
,p_protection_level=>'I'
,p_version_scn=>41007621756786
);
wwv_flow_imp.component_end;
end;
/
