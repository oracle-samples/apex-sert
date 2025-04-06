-- file_checksum: B47FA800EB57A4B88ADD57FFAC3E0B3EA024A01D1D7CD2D55E9AA978ADC1B4DF
prompt --application/shared_components/logic/application_computations/g_oci_docgen_function_ocid
begin
--   Manifest
--     APPLICATION COMPUTATION: G_OCI_DOCGEN_FUNCTION_OCID
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
 p_id=>wwv_flow_imp.id(69076008817316555)
,p_computation_sequence=>10
,p_computation_item=>'G_OCI_DOCGEN_FUNCTION_OCID'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'sert_core.reports_pkg.get_pref_value(p_pref_key=>''OCI_DOCGEN_FUNCTION_OCID'');'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>42133032834054
);
wwv_flow_imp.component_end;
end;
/
