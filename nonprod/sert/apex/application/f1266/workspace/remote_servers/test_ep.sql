-- file_checksum: 01FCD02CECE789B0778F6AFDA89B015E1D219F6453A94010751EECD8C3902F62
prompt --workspace/remote_servers/test_ep
begin
--   Manifest
--     REMOTE SERVER: test_ep
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_imp_workspace.create_remote_server(
 p_id=>wwv_flow_imp.id(94837979799522695)
,p_name=>'test_ep'
,p_static_id=>'test_ep'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('test_ep'),'http://test_ep')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('test_ep'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('test_ep'),'')
,p_remote_sql_default_schema=>nvl(wwv_flow_application_install.get_remote_server_default_db('test_ep'),'')
,p_mysql_sql_modes=>nvl(wwv_flow_application_install.get_remote_server_sql_mode('test_ep'),'')
,p_prompt_on_install=>false
,p_ai_is_builder_service=>false
,p_ai_model_name=>nvl(wwv_flow_application_install.get_remote_server_ai_model('test_ep'),'')
,p_ai_http_headers=>nvl(wwv_flow_application_install.get_remote_server_ai_headers('test_ep'),'')
,p_ai_attributes=>nvl(wwv_flow_application_install.get_remote_server_ai_attrs('test_ep'),'')
);
wwv_flow_imp.component_end;
end;
/
