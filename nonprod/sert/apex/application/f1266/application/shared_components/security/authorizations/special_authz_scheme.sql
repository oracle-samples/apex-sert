-- file_checksum: 29133BABB45D6BF2B48DB1204EB1B740C1A4741416CAEFB1883EAAA809B87108
prompt --application/shared_components/security/authorizations/special_authz_scheme
begin
--   Manifest
--     SECURITY SCHEME: Special AUTHZ scheme
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(21560368603834707)
,p_name=>'Special AUTHZ scheme'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_version_scn=>42039722965754
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
