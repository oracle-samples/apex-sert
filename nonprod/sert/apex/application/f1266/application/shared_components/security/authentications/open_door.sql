-- file_checksum: 5CAFD5213DF718C095EB015F9E7B3A2F8660E814A1B6950EF2113A17A2217D3D
prompt --application/shared_components/security/authentications/open_door
begin
--   Manifest
--     AUTHENTICATION: Open Door
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(97846826320534513)
,p_name=>'Open Door'
,p_scheme_type=>'NATIVE_OPEN_DOOR'
,p_cookie_name=>'&WORKSPACE_COOKIE_FAIL.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
