-- file_checksum: DAC7D17918C98F783616634B4152362F5AA13FBAF026DFC6E263AC0019EE0CB7
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/delete_application
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp.remove_flow(wwv_flow.g_flow_id);
wwv_flow_imp.component_end;
end;
/
