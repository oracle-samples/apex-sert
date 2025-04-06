-- file_checksum: 9424D0831CF33467F8D5082F9B96326EB0A63720B737CE6732BC718BE1F51C3A
prompt --application/shared_components/logic/application_computations/g_workspace_id
begin
--   Manifest
--     APPLICATION COMPUTATION: G_WORKSPACE_ID
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(494999535622108130)
,p_computation_sequence=>10
,p_computation_item=>'G_WORKSPACE_ID'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select min(workspace_id) from apex_applications ',
'where workspace = apex_extension.get_grantor_workspace'))
,p_computation_comment=>'9487931383538866'
,p_version_scn=>42122305569047
);
wwv_flow_imp.component_end;
end;
/
