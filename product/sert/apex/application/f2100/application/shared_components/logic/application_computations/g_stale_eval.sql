-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: A06FCD24DA80B29E3E47710424BE2E9CD0FA45B0CCB98FBA4AE923ED82741C11
prompt --application/shared_components/logic/application_computations/g_stale_eval
begin
--   Manifest
--     APPLICATION COMPUTATION: G_STALE_EVAL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(132700186419586161)
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
,p_compute_when=>'10'
,p_compute_when_type=>'CURRENT_PAGE_IN_CONDITION'
,p_computation_comment=>'removed ,20,30,100 from conditions'
,p_version_scn=>44997293662469
);
wwv_flow_imp.component_end;
end;
/
