-- file_checksum: 28246CAA78E5440C1C251CD0F19C13EF17FB1273A9E5106FE792DF3C19491C07
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_computations/g_release_version
begin
--   Manifest
--     APPLICATION COMPUTATION: G_RELEASE_VERSION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(61959986203351605)
,p_computation_sequence=>10
,p_computation_item=>'G_RELEASE_VERSION'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pref_value',
'from sert_core.prefs',
'where pref_key = ''RELEASE_VERSION'';'))
,p_version_scn=>41974810723163
);
wwv_flow_imp.component_end;
end;
/
