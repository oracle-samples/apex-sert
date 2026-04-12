-- file_checksum: D001F4366C9D62D8ABB5A9ACF61F124C00E4053967BCCD19DA654DE072A1E4A5
prompt --application/shared_components/security/authentications/open_door
begin
--   Manifest
--     AUTHENTICATION: Open Door
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
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
