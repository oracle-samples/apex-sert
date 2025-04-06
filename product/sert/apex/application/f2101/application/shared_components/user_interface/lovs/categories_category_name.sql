-- file_checksum: 1F092D090812651867C5F16EE1BBABBA4054CC279184B7B480BFA414A42E926E
prompt --application/shared_components/user_interface/lovs/categories_category_name
begin
--   Manifest
--     CATEGORIES.CATEGORY_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(394797224866498800)
,p_lov_name=>'CATEGORIES.CATEGORY_NAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'CATEGORIES'
,p_return_column_name=>'CATEGORY_ID'
,p_display_column_name=>'CATEGORY_NAME'
,p_default_sort_column_name=>'CATEGORY_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39194514068851
);
wwv_flow_imp.component_end;
end;
/
