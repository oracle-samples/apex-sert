-- file_checksum: 748A0D0E3576B0B6E3C1D160DAA3B83C0146F9422D748CF61CB2C01CCEB0EA47
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_application_id
begin
--   Manifest
--     APPLICATION ITEM: G_APPLICATION_ID
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
 p_id=>wwv_flow_imp.id(111270894426100325)
,p_name=>'G_APPLICATION_ID'
,p_protection_level=>'I'
,p_version_scn=>41899843936188
);
wwv_flow_imp.component_end;
end;
/
