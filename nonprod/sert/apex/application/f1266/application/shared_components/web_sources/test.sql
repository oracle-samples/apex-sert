-- file_checksum: 393FB60AE6883FBC1ABF63EFF3B3E732CC659A5EAA5F440D09566B38FCCF4E14
prompt --application/shared_components/web_sources/test
begin
--   Manifest
--     WEB SOURCE: test
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(102541085801793404)
,p_name=>'test'
,p_static_id=>'test'
,p_web_source_type=>'NATIVE_ORDS'
,p_data_profile_id=>wwv_flow_imp.id(102540000366793395)
,p_remote_server_id=>wwv_flow_imp.id(94837979799522695)
,p_url_path_prefix=>'test1'
,p_pass_ecid=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(102541264359793408)
,p_web_src_module_id=>wwv_flow_imp.id(102541085801793404)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(102541683184793410)
,p_web_src_module_id=>wwv_flow_imp.id(102541085801793404)
,p_operation=>'POST'
,p_database_operation=>'INSERT'
,p_url_pattern=>'.'
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(102542092002793410)
,p_web_src_module_id=>wwv_flow_imp.id(102541085801793404)
,p_operation=>'PUT'
,p_database_operation=>'UPDATE'
,p_url_pattern=>'/:id'
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(102542516058793411)
,p_web_src_module_id=>wwv_flow_imp.id(102541085801793404)
,p_operation=>'DELETE'
,p_database_operation=>'DELETE'
,p_url_pattern=>'/:id'
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp.component_end;
end;
/
