-- file_checksum: 25C43896C9718ED67E095DF128616365A5D64325A70491D0FE6C855DFF390E37
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_computations/g_workspace_name
begin
--   Manifest
--     APPLICATION COMPUTATION: G_WORKSPACE_NAME
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
 p_id=>wwv_flow_imp.id(76586803846989512)
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
