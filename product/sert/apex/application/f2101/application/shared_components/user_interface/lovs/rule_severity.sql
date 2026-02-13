-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 8257419F5B4867B66895C33631F7A17D7B2844390D995218062630F57411BB47
prompt --application/shared_components/user_interface/lovs/rule_severity
begin
--   Manifest
--     RULE_SEVERITY
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(394830723173869983)
,p_lov_name=>'RULE_SEVERITY'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'RULE_SEVERITY'
,p_return_column_name=>'RULE_SEVERITY_ID'
,p_display_column_name=>'RULE_SEVERITY_NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'SEQ'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39194514069321
);
wwv_flow_imp.component_end;
end;
/
