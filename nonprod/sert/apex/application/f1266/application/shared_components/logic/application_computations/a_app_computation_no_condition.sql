-- file_checksum: E408A45BC2E99CF74B39596932EF52449270568562708658C636009EC9AE2B95
prompt --application/shared_components/logic/application_computations/a_app_computation_no_condition
begin
--   Manifest
--     APPLICATION COMPUTATION: A_APP_COMPUTATION_NO_CONDITION
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
 p_id=>wwv_flow_imp.id(22510073666057960)
,p_computation_sequence=>10
,p_computation_item=>'A_APP_COMPUTATION_NO_CONDITION'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'foo'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
