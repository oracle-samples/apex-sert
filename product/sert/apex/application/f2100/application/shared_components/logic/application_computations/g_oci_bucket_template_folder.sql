-- file_checksum: 60D6750BC38F393E9CA6ACD51EE5B41026F716ABF27CFBD5266ECB8C261B3A5A
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_computations/g_oci_bucket_template_folder
begin
--   Manifest
--     APPLICATION COMPUTATION: G_OCI_BUCKET_TEMPLATE_FOLDER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(69076809373327192)
,p_computation_sequence=>10
,p_computation_item=>'G_OCI_BUCKET_TEMPLATE_FOLDER'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'sert_core.reports_pkg.get_pref_value(p_pref_key=>''OCI_BUCKET_TEMPLATE_FOLDER'');'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>42133037509861
);
wwv_flow_imp.component_end;
end;
/
