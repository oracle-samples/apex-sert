-- file_checksum: D3311D19F8EB7E592BC55AB6F21FC62A6D630D027AEC196BD0CFCD616DBA740A
prompt --application/shared_components/logic/application_computations/g_apex_version
begin
--   Manifest
--     APPLICATION COMPUTATION: G_APEX_VERSION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(375231962429067262)
,p_computation_sequence=>10
,p_computation_item=>'G_APEX_VERSION'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'   substr(VERSION_NO, 1, instr(version_no,''.'',1)+1)',
'FROM ',
'  APEX_RELEASE'))
,p_version_scn=>41003355389780
);
wwv_flow_imp.component_end;
end;
/
