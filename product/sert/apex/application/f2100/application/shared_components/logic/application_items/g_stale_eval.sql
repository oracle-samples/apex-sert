-- file_checksum: FB7EBE6991364151FB8EE1E53F63634340B0E79A5E6259669E31009CC2CC34F1
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_stale_eval
begin
--   Manifest
--     APPLICATION ITEM: G_STALE_EVAL
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
 p_id=>wwv_flow_imp.id(88583615920484542)
,p_name=>'G_STALE_EVAL'
,p_protection_level=>'I'
,p_version_scn=>39194837647963
);
wwv_flow_imp.component_end;
end;
/
