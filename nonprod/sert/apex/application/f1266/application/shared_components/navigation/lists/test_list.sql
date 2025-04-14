-- file_checksum: 5B74B6D19F7FEB7699A7FCA8AED9388ABA3A1A9B95EA827B116284264696B6D3
prompt --application/shared_components/navigation/lists/test_list
begin
--   Manifest
--     LIST: test_list
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(101651195243999370)
,p_name=>'test_list'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select 1, 2',
'  from dual ',
'  where 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'';'))
,p_list_status=>'PUBLIC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
