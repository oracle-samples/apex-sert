-- file_checksum: 378A58E90DEF2F3FB816FB0F247AF135DB4E1BCEAD8AF448ED42A1DC69E5409E
prompt --application/shared_components/security/authorizations/not_exists_sql_query
begin
--   Manifest
--     SECURITY SCHEME: NOT Exists SQL Query
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
 p_id=>wwv_flow_imp.id(43623365303210597)
,p_name=>'NOT Exists SQL Query'
,p_scheme_type=>'NATIVE_NOT_EXISTS'
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
'  AND ''DBMS_SQL'' = ''EXECUTE IMMEDIATE'''))
,p_error_message=>'ERROR'
,p_version_scn=>1
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
