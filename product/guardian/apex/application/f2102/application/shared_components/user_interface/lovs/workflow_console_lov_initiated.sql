-- file_checksum: 6AD2E0D3CD387913A8FA3A45EFD87AE8CCDB27A6CB1086ED419BE2FAC04B8D23
prompt --application/shared_components/user_interface/lovs/workflow_console_lov_initiated
begin
--   Manifest
--     WORKFLOW_CONSOLE.LOV.INITIATED
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(193641955878912435)
,p_lov_name=>'WORKFLOW_CONSOLE.LOV.INITIATED'
,p_lov_query=>'.'||wwv_flow_imp.id(193641955878912435)||'.'
,p_location=>'STATIC'
,p_version_scn=>45840720776175
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(193642289518912435)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Last hour'
,p_lov_return_value=>'|1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(193642685020912441)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Last 24 hours'
,p_lov_return_value=>'1|24'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(193643075118912441)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Last 7 days'
,p_lov_return_value=>'24|168'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(193643489631912442)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Last 30 days'
,p_lov_return_value=>'168|720'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(193643843035912442)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Older than 30 days'
,p_lov_return_value=>'720|'
);
wwv_flow_imp.component_end;
end;
/
