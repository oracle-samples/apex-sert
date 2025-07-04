-- file_checksum: 1920FDEEFF6EB9D36C0C47B0AB2356579B76BC040B3C4A1B4BA174D3D1164B7A
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/user_interface/lovs/classifications_classification_name
begin
--   Manifest
--     CLASSIFICATIONS.CLASSIFICATION_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(394763226635429665)
,p_lov_name=>'CLASSIFICATIONS.CLASSIFICATION_NAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'CLASSIFICATIONS'
,p_return_column_name=>'CLASSIFICATION_ID'
,p_display_column_name=>'CLASSIFICATION_NAME'
,p_default_sort_column_name=>'CLASSIFICATION_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39194514068851
);
wwv_flow_imp.component_end;
end;
/
