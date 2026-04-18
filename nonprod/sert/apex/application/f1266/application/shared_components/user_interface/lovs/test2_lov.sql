-- file_checksum: 1207D65C593908E7855614659CD15413087DB660E833D5AC0E0CBB3D7D88E5AC
prompt --application/shared_components/user_interface/lovs/test2_lov
begin
--   Manifest
--     TEST2_LOV
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(101746058978379732)
,p_lov_name=>'TEST2_LOV'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select 1, 2',
'  from dual ',
'  where 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'1'
,p_display_column_name=>'2'
,p_default_sort_column_name=>'2'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
