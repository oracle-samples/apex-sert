-- file_checksum: 60245547B224364F6F1E442BC726E31802B3B0A5DA30606D32F709B453F3D911
prompt --application/shared_components/security/authorizations/pl_sql_function
begin
--   Manifest
--     SECURITY SCHEME: PL/SQL Function
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
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
