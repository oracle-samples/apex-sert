-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: 724104F68834CFAF367DA7B77370A7E0E21684D6DFDF87EFB0FB3503F1C21867
-- file_checksum: B34034527330242D18A893C5F749ABA8C594CD4B61E87D8975F9D8DBFAD66C22
prompt --application/shared_components/user_interface/lovs/category_lov
begin
--   Manifest
--     CATEGORY_LOV
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(92844141325415099)
,p_lov_name=>'CATEGORY_LOV'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_owner=>'SERT_CORE'
,p_query_table=>'CATEGORIES'
,p_return_column_name=>'CATEGORY_KEY'
,p_display_column_name=>'CATEGORY_NAME'
,p_default_sort_column_name=>'CATEGORY_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>44454483993337
);
wwv_flow_imp.component_end;
end;
/
