-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: B9805BB00F57B034F2B98C5A8796422BBD3958973AB4E6F0817FCF296D245327
prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(259269648080578307)
);
wwv_flow_imp.component_end;
end;
/
