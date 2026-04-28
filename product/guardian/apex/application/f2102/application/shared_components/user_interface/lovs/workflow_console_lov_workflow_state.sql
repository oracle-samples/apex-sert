prompt app_checksum: 8F8731917A0435ECB64029293CE8ADA7F9A127EC84A6C907C03DC4A0522EABF3
-- file_checksum: BAE4B4ECAFBC0E94343F14F60DA8B15A0DA00A5EAF3D4B6C2FB262C60BE6BEBC
prompt --application/shared_components/user_interface/lovs/workflow_console_lov_workflow_state
begin
--   Manifest
--     WORKFLOW_CONSOLE.LOV.WORKFLOW_STATE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(193640460754912427)
,p_lov_name=>'WORKFLOW_CONSOLE.LOV.WORKFLOW_STATE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'       val',
'  from table ( apex_workflow.get_lov_workflow_state )',
' order by insert_order'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'VAL'
,p_display_column_name=>'DISP'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>45840720775412
);
wwv_flow_imp.component_end;
end;
/
