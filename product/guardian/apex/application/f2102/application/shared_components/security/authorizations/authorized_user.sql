-- file_checksum: 83CF2AC117B4001FF2D54F872D5255936538BFB7FA36F7DB40790C1395D16E05
prompt --application/shared_components/security/authorizations/authorized_user
begin
--   Manifest
--     SECURITY SCHEME: Authorized User
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(30658409527755022737)
,p_name=>'Authorized User'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Insufficient privileges, user is not an authorized user.'
,p_version_scn=>46179585962556
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_imp.component_end;
end;
/
