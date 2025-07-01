-- file_checksum: 539996939DFEAC54A5354DBFB6F4C186AB40FFE6DFD6830641039E3E1BC278A6
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/user_interface/lovs/rule_severity_v
begin
--   Manifest
--     RULE_SEVERITY_V
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(21100502907699167)
,p_lov_name=>'RULE_SEVERITY_V'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rule_severity_name d, rule_severity_id r',
'from sert_core.rule_severity_v',
'order by seq'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'SERT_CORE'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>44901328460206
);
wwv_flow_imp.component_end;
end;
/
