-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: 724104F68834CFAF367DA7B77370A7E0E21684D6DFDF87EFB0FB3503F1C21867
-- file_checksum: 43FB928A482CF6A14F0EEEBB3441E2C3ED548A1CCD86DB7BC8083CB90DAE07DA
prompt --application/shared_components/logic/application_computations/g_application_id
begin
--   Manifest
--     APPLICATION COMPUTATION: G_APPLICATION_ID
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
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
