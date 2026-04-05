-- file_checksum: A1FE91CF929A83EE54C9B6B334E86E4EDD8F6A12F85C1F10139B6135E8C55B97
prompt --application/shared_components/security/authentications/saml_sign_in
begin
--   Manifest
--     AUTHENTICATION: SAML Sign-In
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(30658403877251022718)
,p_name=>'SAML Sign-In'
,p_scheme_type=>'NATIVE_SAML'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>45785568298329
);
wwv_flow_imp.component_end;
end;
/
