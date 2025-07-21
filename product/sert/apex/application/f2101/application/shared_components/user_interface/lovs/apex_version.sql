-- file_checksum: F1F9BFA8ED5F16EBF10846DB3B91A085430D448832AE54D6DD0CBF2BA5715B8C
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/user_interface/lovs/apex_version
begin
--   Manifest
--     APEX_VERSION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(395940241802377235)
,p_lov_name=>'APEX_VERSION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'   substr(VERSION_NO, 1, instr(version_no,''.'',1)+1) as a',
'  ,substr(VERSION_NO, 1, instr(version_no,''.'',1)+1) as b  ',
'FROM ',
'  APEX_RELEASE',
'order by',
'  1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'B'
,p_display_column_name=>'A'
,p_version_scn=>39194514068497
);
wwv_flow_imp.component_end;
end;
/
