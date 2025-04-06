-- file_checksum: 32D52CD7710D45F8991247DE9646A161096CF4EF4A2CE59E4042A0BEADBE980A
prompt --application/shared_components/user_interface/lovs/rules_lov_raise_exceptions
begin
--   Manifest
--     RULES_LOV_RAISE_EXCEPTIONS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(67634260270725470)
,p_lov_name=>'RULES_LOV_RAISE_EXCEPTIONS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with tab as ',
'(select rule_name,category_name,rule_id,count(*) cnt',
'from eval_results_pub_v ',
'where eval_id = :P10_EVAL_ID',
'  and result = ''FAIL''',
'  and application_id = :G_APPLICATION_ID',
'  and workspace_id = :G_WORKSPACE_ID',
'group by rule_name,category_name,rule_id',
')',
'select category_name ||'' - ''||rule_name||'' (''||cnt||'')'' d, rule_id r',
'from tab',
'order by cnt desc, category_name,rule_name ',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'SERT_CORE'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41902775368606
);
wwv_flow_imp.component_end;
end;
/
