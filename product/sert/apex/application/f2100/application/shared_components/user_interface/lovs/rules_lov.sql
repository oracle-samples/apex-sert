-- file_checksum: DFB62FC6FC30CA2CE3EACAF3ED7740EEFBF480674349D671DC2D2334E3E138B4
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/user_interface/lovs/rules_lov
begin
--   Manifest
--     RULES_LOV
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
 p_id=>wwv_flow_imp.id(67389473915147786)
,p_lov_name=>'RULES_LOV'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct category_name ||'' - ''|| rule_name d, rule_id r ',
'from eval_results_pub_v ',
'where application_id = :G_APPLICATION_ID',
'  and workspace_id = :G_WORKSPACE_ID',
'  and RESULT not in (''PASS'',''APPROVED'')',
'order by 1 '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'SERT_CORE'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41953397247791
);
wwv_flow_imp.component_end;
end;
/
