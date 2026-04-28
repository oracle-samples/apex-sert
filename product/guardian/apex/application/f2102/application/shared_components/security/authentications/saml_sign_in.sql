prompt app_checksum: 8F8731917A0435ECB64029293CE8ADA7F9A127EC84A6C907C03DC4A0522EABF3
-- file_checksum: AEAAD63A51091DF31ADBC5A4521AC6238DB00A746C044318919DE6B2B6A2BDF4
prompt --application/shared_components/security/authentications/saml_sign_in
begin
--   Manifest
--     AUTHENTICATION: SAML Sign-In
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
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
,p_created_on=>wwv_flow_imp.dz('20260416193316Z')
,p_updated_on=>wwv_flow_imp.dz('20260416193316Z')
);
wwv_flow_imp.component_end;
end;
/
