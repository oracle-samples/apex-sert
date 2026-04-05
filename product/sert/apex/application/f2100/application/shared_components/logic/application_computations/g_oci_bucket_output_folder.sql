-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 27BA617F7773479A4F8514939C4F3C478700FAC06B0C52518F35A5CA89B52274
prompt --application/shared_components/logic/application_computations/g_oci_bucket_output_folder
begin
--   Manifest
--     APPLICATION COMPUTATION: G_OCI_BUCKET_OUTPUT_FOLDER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(112797971054603118)
,p_computation_sequence=>10
,p_computation_item=>'G_OCI_BUCKET_OUTPUT_FOLDER'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'sert_core.reports_pkg.get_pref_value(p_pref_key=>''OCI_BUCKET_OUTPUT_FOLDER'');'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>42133035941713
);
wwv_flow_imp.component_end;
end;
/
