-- file_checksum: 4154185DBE9919A0CBCEC3A5F9CA602CD9BFD310FCF2A47872394EF248C8D07B
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_rule_name
begin
--   Manifest
--     APPLICATION ITEM: G_RULE_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(523739339482852179)
,p_name=>'G_RULE_NAME'
,p_protection_level=>'I'
,p_version_scn=>41004790450267
);
wwv_flow_imp.component_end;
end;
/
