-- file_checksum: E44E65507B281984E79A6D72F90E6B492BDC2C3EB12FC01887BFFD028E0DA606
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/user_interface/lovs/rule_set_types_rule_set_type_name
begin
--   Manifest
--     RULE_SET_TYPES.RULE_SET_TYPE_NAME
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
 p_id=>wwv_flow_imp.id(394932226639092221)
,p_lov_name=>'RULE_SET_TYPES.RULE_SET_TYPE_NAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'RULE_SET_TYPES'
,p_return_column_name=>'RULE_SET_TYPE_ID'
,p_display_column_name=>'RULE_SET_TYPE_NAME'
,p_default_sort_column_name=>'RULE_SET_TYPE_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39194514069201
);
wwv_flow_imp.component_end;
end;
/
