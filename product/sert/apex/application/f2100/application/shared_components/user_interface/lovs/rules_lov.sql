-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 956F96819A541EF211267DDD7534DD117B0A38B312A19CBCC4F3FDAE4A1FB47E
prompt --application/shared_components/user_interface/lovs/rules_lov
begin
--   Manifest
--     RULES_LOV
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
 p_id=>wwv_flow_imp.id(111110891776426049)
,p_lov_name=>'RULES_LOV'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select category_name || '' - '' || rule_name || '' ('' || count(*) || '')'' d, ',
'       rule_id r ',
'from sert_core.rules_by_category_eval_v  ',
'where application_id = :G_APPLICATION_ID',
'  and workspace_id = :G_WORKSPACE_ID',
'  and eval_id = :P10_EVAL_ID',
'group by category_name, rule_name, rule_id',
'order by count(*) desc, ',
'category_name, rule_name',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'SERT_CORE'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>7383914
,p_updated_on=>wwv_flow_imp.dz('20260501234039Z')
);
wwv_flow_imp.component_end;
end;
/
