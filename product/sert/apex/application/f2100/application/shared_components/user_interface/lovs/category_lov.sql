-- file_checksum: 483956A68C3F364321D23EF6DBAFF3523D6890E5633B5AED74F46F24E5B452BA
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/user_interface/lovs/category_lov
begin
--   Manifest
--     CATEGORY_LOV
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
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
