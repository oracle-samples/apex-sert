-- file_checksum: A4DB4F62533A30BE477C039C8BCE28EA4C92EDC64FDFA80DE6CAAD68C8BC8E06
prompt --application/shared_components/workflow/task_definitions/task_1
begin
--   Manifest
--     TASK_DEF: task 1
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_task_def(
 p_id=>wwv_flow_imp.id(26549619526954916)
,p_name=>'task 1'
,p_static_id=>'TASK_1'
,p_subject=>'approve'
,p_task_type=>'APPROVAL'
,p_priority=>3
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_actions_sql_query=>'SELECT 1 FROM dual WHERE 1 = ''&P1_ITEM.'' AND ''DBMS_SQL'' = ''EXECUTE IMMEDIATE'''
,p_initiator_can_complete=>false
);
wwv_flow_imp.component_end;
end;
/
