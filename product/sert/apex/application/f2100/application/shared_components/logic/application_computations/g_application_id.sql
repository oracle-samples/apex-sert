-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: ADF175F5AFAA76386721C437749B2B6B9A18116FE7826A0D52C072823E5DC14E
prompt --application/shared_components/logic/application_computations/g_application_id
begin
--   Manifest
--     APPLICATION COMPUTATION: G_APPLICATION_ID
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
 p_id=>wwv_flow_imp.id(111270980993106020)
,p_computation_sequence=>10
,p_computation_item=>'G_APPLICATION_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'SELECT application_id FROM evals_pub_v WHERE eval_id = :P10_EVAL_ID'
,p_compute_when=>'P10_EVAL_ID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
,p_version_scn=>41899852712647
);
wwv_flow_imp.component_end;
end;
/
