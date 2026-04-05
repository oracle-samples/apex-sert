-- file_checksum: 77E7F4FA8889B8B4186B6C239CD152035007683027E252BA8903F8F6E4A7AB10
prompt --application/shared_components/security/authentications/builder_extension_sign_in
begin
--   Manifest
--     AUTHENTICATION: Builder Extension Sign-In
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
 p_id=>wwv_flow_imp.id(192433314997850056)
,p_name=>'Builder Extension Sign-In'
,p_scheme_type=>'NATIVE_EXTENSION'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>45830494398965
);
wwv_flow_imp.component_end;
end;
/
