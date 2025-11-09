-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 73A97D2E51EE4729823714A0A98C3CBD526FA4B8CFCC59F0204F85545B372B3B
prompt --application/shared_components/logic/application_items/g_category_name
begin
--   Manifest
--     APPLICATION ITEM: G_CATEGORY_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(523739494745852952)
,p_name=>'G_CATEGORY_NAME'
,p_protection_level=>'I'
,p_version_scn=>41004790461825
);
wwv_flow_imp.component_end;
end;
/
