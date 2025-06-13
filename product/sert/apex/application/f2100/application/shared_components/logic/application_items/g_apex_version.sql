-- file_checksum: 26BF6142F9BEFB8F7BF513917A711FB75DB1A230D51E6822EABB96C57C199C25
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_apex_version
begin
--   Manifest
--     APPLICATION ITEM: G_APEX_VERSION
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
 p_id=>wwv_flow_imp.id(96724996418051212)
,p_name=>'G_APEX_VERSION'
,p_protection_level=>'I'
,p_version_scn=>39194546757510
);
wwv_flow_imp.component_end;
end;
/
