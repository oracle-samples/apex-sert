-- file_checksum: 2DF3831E1F692FED58F91FA7BB3FB379C3FE04B43B66A6D9768FC23FCD33CF06
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_processes/saveapexlink
begin
--   Manifest
--     APPLICATION PROCESS: saveApexLink
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(538110768177763269)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'saveApexLink'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'null;',
'/*',
'sv_sec_util.save_apex_link(',
'  p_page_id        => apex_application.g_x01,',
'  p_link           => apex_application.g_x02,',
'  p_rp             => apex_application.g_x03,',
'  p_component_name => apex_application.g_x04,',
'  p_category       => apex_application.g_x05',
'  );',
' */'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>41007459300697
);
wwv_flow_imp.component_end;
end;
/
