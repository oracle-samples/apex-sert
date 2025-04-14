-- file_checksum: BA04AE74A781B8EE9B2127D7E5E4599F9F8566B4DCA59A885B1CACA4B820CFDF
prompt --application/shared_components/security/authorizations/exist_sql_query
begin
--   Manifest
--     SECURITY SCHEME: Exist SQL Query
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
 p_id=>wwv_flow_imp.id(43624685667213658)
,p_name=>'Exist SQL Query'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  1 ID,',
'  SYSDATE START_DATE,',
'  SYSDATE END_DATE,',
'  ''x'' TASK_NAME',
'from ',
'  DUAL',
'WHERE',
'  1 = ''&P1_ITEM.''',
'  AND ''DBMS_SQL'' = ''EXECUUTE IMMEDIATE'''))
,p_error_message=>'ERROR'
,p_version_scn=>1
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
