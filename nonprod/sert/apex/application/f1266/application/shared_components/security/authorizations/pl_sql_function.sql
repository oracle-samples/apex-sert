-- file_checksum: 7FBA88D1AA7495663EF3C793F4499BA62DC93C63566F078E7BE40166B3E58B06
prompt --application/shared_components/security/authorizations/pl_sql_function
begin
--   Manifest
--     SECURITY SCHEME: PL/SQL Function
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(43623144320207869)
,p_name=>'PL/SQL Function'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'RETURN ''&P1_ITEM.'' || ''DBMS_SQL'' = ''EXECUTE IMMEDIATE'';'
,p_error_message=>'ERROR'
,p_version_scn=>1
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
