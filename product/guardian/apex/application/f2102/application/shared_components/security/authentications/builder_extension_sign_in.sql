prompt app_checksum: F24062FCE39D7AC19F9EA2292B88008E6F55784EDB74E6D62BAD565878490F78
-- file_checksum: 5C6C74DA88E42A8F9E38A96DDC9747AD0DECAAB443017CE707769E000CD57CBD
prompt --application/shared_components/security/authentications/builder_extension_sign_in
begin
--   Manifest
--     AUTHENTICATION: Builder Extension Sign-In
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
 p_id=>wwv_flow_imp.id(192433314997850056)
,p_name=>'Builder Extension Sign-In'
,p_scheme_type=>'NATIVE_EXTENSION'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>45830494398965
,p_created_on=>wwv_flow_imp.dz('20260416193315Z')
,p_updated_on=>wwv_flow_imp.dz('20260416193315Z')
);
wwv_flow_imp.component_end;
end;
/
