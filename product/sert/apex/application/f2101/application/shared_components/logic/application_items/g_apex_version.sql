-- file_checksum: 0BDA141727159FA7998ECAC74A23084864213FCDE847833C4B07EFE5C6309EEC
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
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(375231515162064773)
,p_name=>'G_APEX_VERSION'
,p_protection_level=>'I'
,p_version_scn=>41003355353559
);
wwv_flow_imp.component_end;
end;
/
