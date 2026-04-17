prompt app_checksum: F24062FCE39D7AC19F9EA2292B88008E6F55784EDB74E6D62BAD565878490F78
-- file_checksum: DE6743D5387A4701B52A803A8C0BE32CEC73431DE96E6F8D4D63577C6F64A8A7
prompt --application/shared_components/security/authentications/oracle_apex_accounts
begin
--   Manifest
--     AUTHENTICATION: Oracle APEX Accounts
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
 p_id=>wwv_flow_imp.id(139436262497028957)
,p_name=>'Oracle APEX Accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>46194472973267
,p_created_on=>wwv_flow_imp.dz('20260416193315Z')
,p_updated_on=>wwv_flow_imp.dz('20260416193315Z')
);
wwv_flow_imp.component_end;
end;
/
