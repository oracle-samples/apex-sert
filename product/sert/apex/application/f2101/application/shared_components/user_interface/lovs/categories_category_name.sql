-- file_checksum: 5BC6F29006D1288DF4A8611874AB69947D1C0AB782FCF60933816A01200AE5EC
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/user_interface/lovs/categories_category_name
begin
--   Manifest
--     CATEGORIES.CATEGORY_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
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
