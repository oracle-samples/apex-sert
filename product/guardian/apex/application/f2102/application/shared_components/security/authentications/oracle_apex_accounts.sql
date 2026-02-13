-- file_checksum: D737A19796CB5F2B8EE73B9A2999565E729BE05559D5CB3059AE3C5937A6E7F2
prompt --application/shared_components/security/authentications/oracle_apex_accounts
begin
--   Manifest
--     AUTHENTICATION: Oracle APEX Accounts
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
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
);
wwv_flow_imp.component_end;
end;
/
