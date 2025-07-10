-- file_checksum: 826A7C66A0E220D78AFDD592D115497D19E14DAE362BCD100AE83BFD81F1E363
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_computations/g_oci_bucket_namespace
begin
--   Manifest
--     APPLICATION COMPUTATION: G_OCI_BUCKET_NAMESPACE
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
 p_id=>wwv_flow_imp.id(112797577478597763)
,p_computation_sequence=>10
,p_computation_item=>'G_OCI_BUCKET_NAMESPACE'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'sert_core.reports_pkg.get_pref_value(p_pref_key=>''OCI_BUCKET_NAMESPACE'');'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>42133035059140
);
wwv_flow_imp.component_end;
end;
/
