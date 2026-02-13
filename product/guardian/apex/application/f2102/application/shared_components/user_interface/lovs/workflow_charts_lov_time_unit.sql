-- file_checksum: 0B1440235E23E4EA30C13A58CF6DBC86BE188FE776710D24B7F7633AE1576E6D
prompt --application/shared_components/user_interface/lovs/workflow_charts_lov_time_unit
begin
--   Manifest
--     WORKFLOW_CHARTS.LOV.TIME_UNIT
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
 p_id=>wwv_flow_imp.id(193718312634912566)
,p_lov_name=>'WORKFLOW_CHARTS.LOV.TIME_UNIT'
,p_lov_query=>'.'||wwv_flow_imp.id(193718312634912566)||'.'
,p_location=>'STATIC'
,p_version_scn=>45840720783322
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(193718592421912566)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Seconds'
,p_lov_return_value=>'SEC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(193718942595912567)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Minutes'
,p_lov_return_value=>'MIN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(193719388763912567)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Hours'
,p_lov_return_value=>'HOUR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(193719797814912567)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Days'
,p_lov_return_value=>'DAY'
);
wwv_flow_imp.component_end;
end;
/
