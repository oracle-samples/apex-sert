-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: C7E6164FDE8FB087C48901E538EB331A3357BE830642D220C4109EAD55774F64
prompt --application/shared_components/logic/application_items/g_apex_version
begin
--   Manifest
--     APPLICATION ITEM: G_APEX_VERSION
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
 p_id=>wwv_flow_imp.id(140446414279329475)
,p_name=>'G_APEX_VERSION'
,p_protection_level=>'I'
,p_version_scn=>39194546757510
);
wwv_flow_imp.component_end;
end;
/
