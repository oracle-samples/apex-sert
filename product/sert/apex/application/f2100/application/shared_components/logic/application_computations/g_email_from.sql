-- file_checksum: 521D682A05BE4491392E29C7D6A6873B500AF50A0CB244ABAE1D581D3FC2AE54
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_computations/g_email_from
begin
--   Manifest
--     APPLICATION COMPUTATION: G_EMAIL_FROM
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(102010987593802294)
,p_computation_sequence=>10
,p_computation_item=>'G_EMAIL_FROM'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pref_value',
'from sert_core.prefs',
'where pref_key = ''EMAIL_FROM'';'))
,p_version_scn=>41916728598068
);
wwv_flow_imp.component_end;
end;
/
