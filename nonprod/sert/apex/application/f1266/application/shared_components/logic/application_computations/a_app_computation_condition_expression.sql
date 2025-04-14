-- file_checksum: F9B7AC0DB2B5B94778144398E137E4F6CC09F89EA1430C8A464379C1D6BEA03B
prompt --application/shared_components/logic/application_computations/a_app_computation_condition_expression
begin
--   Manifest
--     APPLICATION COMPUTATION: A_APP_COMPUTATION_CONDITION_EXPRESSION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(22509610965052322)
,p_computation_sequence=>10
,p_computation_item=>'A_APP_COMPUTATION_CONDITION_EXPRESSION'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'foo'
,p_compute_when=>'1=2'
,p_compute_when_text=>'PLSQL'
,p_compute_when_type=>'EXPRESSION'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
