-- file_checksum: 1B90F14DA3970DF204BE5767D28856DC5883432102513FF86038CC26CB513575
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_computations/g_stale_eval
begin
--   Manifest
--     APPLICATION COMPUTATION: G_STALE_EVAL
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
 p_id=>wwv_flow_imp.id(88978768558307898)
,p_computation_sequence=>10
,p_computation_item=>'G_STALE_EVAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ',
'  case when apex_version != :G_APEX_VERSION then ''Y'' else ''N'' end',
'from ',
'  evals_pub_v ',
'where ',
'  eval_id = :P10_EVAL_ID'))
,p_compute_when=>'10,20,30,100'
,p_compute_when_type=>'CURRENT_PAGE_IN_CONDITION'
,p_version_scn=>39194879616660
);
wwv_flow_imp.component_end;
end;
/
