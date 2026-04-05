-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: D056F909FE17B01BA9317B2F25A00D38C3F1E5FBC7D5B83FA083E73696870CCF
prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
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
