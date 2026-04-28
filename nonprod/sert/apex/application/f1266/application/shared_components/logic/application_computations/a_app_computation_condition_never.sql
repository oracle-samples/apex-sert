-- file_checksum: 86A750B7848C06B1C149E193D499BA918568E85C802A21830C45B7C05C5927B9
prompt --application/shared_components/logic/application_computations/a_app_computation_condition_never
begin
--   Manifest
--     APPLICATION COMPUTATION: A_APP_COMPUTATION_CONDITION_NEVER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(22509858030054964)
,p_computation_sequence=>10
,p_computation_item=>'A_APP_COMPUTATION_CONDITION_NEVER'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'foo'
,p_compute_when_type=>'NEVER'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
