prompt app_checksum: 8F8731917A0435ECB64029293CE8ADA7F9A127EC84A6C907C03DC4A0522EABF3
-- file_checksum: 2F75EC69E7CBF4C0F48E56B55A6B80C6E9150D0C9C153D7A609888286FBC87EE
prompt --application/shared_components/workflow/workflows/sert_guardian_etl
begin
--   Manifest
--     WORKFLOW: SERT Guardian ETL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_workflow(
 p_id=>wwv_flow_imp.id(193628903850762909)
,p_name=>'SERT Guardian ETL'
,p_static_id=>'sg-etl'
,p_title=>'SERT Guardian ETL'
);
wwv_flow_imp_shared.create_workflow_version(
 p_id=>wwv_flow_imp.id(193629002644762910)
,p_workflow_id=>wwv_flow_imp.id(193628903850762909)
,p_version=>'New'
,p_state=>'ACTIVE'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(193629076132762911)
,p_workflow_version_id=>wwv_flow_imp.id(193629002644762910)
,p_name=>'Start'
,p_static_id=>'New'
,p_display_sequence=>10
,p_activity_type=>'NATIVE_WORKFLOW_START'
,p_diagram=>'{"position":{"x":-330,"y":-60},"z":1}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(193629205949762912)
,p_workflow_version_id=>wwv_flow_imp.id(193629002644762910)
,p_name=>'Load SG_AGG_APP_RULE_EVAL_FS'
,p_static_id=>'Load SG_AGG_APP_RULE_EVAL_FS'
,p_display_sequence=>20
,p_activity_type=>'NATIVE_PLSQL'
,p_activity_code=>'dbms_session.sleep(3);'
,p_activity_code_language=>'PLSQL'
,p_location=>'LOCAL'
,p_diagram=>'{"position":{"x":-140,"y":-60},"z":2}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(193629277643762913)
,p_workflow_version_id=>wwv_flow_imp.id(193629002644762910)
,p_name=>'End'
,p_static_id=>'New_2'
,p_display_sequence=>30
,p_activity_type=>'NATIVE_WORKFLOW_END'
,p_attribute_01=>'COMPLETED'
,p_diagram=>'{"position":{"x":210,"y":-60},"z":3}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(193629393931762914)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(193629076132762911)
,p_to_activity_id=>wwv_flow_imp.id(193629205949762912)
,p_diagram=>'{"source":{},"target":{},"vertices":[],"z":4,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(193629478502762915)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(193629205949762912)
,p_to_activity_id=>wwv_flow_imp.id(193629277643762913)
,p_diagram=>'{"source":{},"target":{},"vertices":[],"z":5,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_participant(
 p_id=>wwv_flow_imp.id(193629581262762916)
,p_workflow_version_id=>wwv_flow_imp.id(193629002644762910)
,p_participant_type=>'ADMIN'
,p_name=>'New'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>':APP_USER'
);
wwv_flow_imp.component_end;
end;
/
