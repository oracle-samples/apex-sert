-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: FFF63BD9C8A8E5876DDFF54937F06EA707E7E93D8A227F835D7D2F0543500F86
prompt --application/shared_components/logic/application_computations/g_delete_eval_exceptions
begin
--   Manifest
--     APPLICATION COMPUTATION: G_DELETE_EVAL_EXCEPTIONS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(74163685763804096)
,p_computation_sequence=>10
,p_computation_item=>'G_DELETE_EVAL_EXCEPTIONS'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  return sert_core.reports_pkg.get_pref_value(''DELETE_EVAL_EXCEPTIONS'');',
'exception ',
'  when NO_DATA_FOUND then',
'    return ''N'';',
'  when others then',
'    raise;',
'end;'))
,p_version_scn=>46455329315680
);
wwv_flow_imp.component_end;
end;
/
