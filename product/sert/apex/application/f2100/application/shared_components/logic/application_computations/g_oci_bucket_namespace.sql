-- file_checksum: BB95A326DCEA754DD5B6E20D3E07C5F78B3A439E638A52A1184EE35E16C92CA1
prompt --application/shared_components/logic/application_computations/g_oci_bucket_namespace
begin
--   Manifest
--     APPLICATION COMPUTATION: G_OCI_BUCKET_NAMESPACE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(69076159617319500)
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
