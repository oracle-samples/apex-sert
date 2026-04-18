-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: 724104F68834CFAF367DA7B77370A7E0E21684D6DFDF87EFB0FB3503F1C21867
-- file_checksum: 3B16C686655E84D5A5AC55D6CD8D36385BF2CC54162391001386D1B78D36D8E3
prompt --application/shared_components/logic/application_computations/g_workspace_name
begin
--   Manifest
--     APPLICATION COMPUTATION: G_WORKSPACE_NAME
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
 p_id=>wwv_flow_imp.id(120308221708267775)
,p_computation_sequence=>10
,p_computation_item=>'G_WORKSPACE_NAME'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select apex_extension.get_grantor_workspace from dual'
,p_compute_when=>'G_WORKSPACE_NAME'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_version_scn=>42122302251123
);
wwv_flow_imp.component_end;
end;
/
