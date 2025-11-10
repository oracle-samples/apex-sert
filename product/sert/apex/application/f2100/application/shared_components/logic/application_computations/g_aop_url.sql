-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 55D73B290D0DBB27B3765FC4716C845F7E823F71B1BEF9E778F7DF1E50D472D0
prompt --application/shared_components/logic/application_computations/g_aop_url
begin
--   Manifest
--     APPLICATION COMPUTATION: G_AOP_URL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(111848639420601409)
,p_computation_sequence=>10
,p_computation_item=>'G_AOP_URL'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pref_value',
'from sert_core.prefs',
'where pref_key = ''AOP_URL'';'))
,p_version_scn=>41905342983349
);
wwv_flow_imp.component_end;
end;
/
