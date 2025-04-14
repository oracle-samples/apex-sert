-- file_checksum: FEE6635B03EEB1050E6EE17A03C26F49B76CFA1AE984BDAB05A96F11BAB82F94
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(215548230219300044)
);
wwv_flow_imp.component_end;
end;
/
