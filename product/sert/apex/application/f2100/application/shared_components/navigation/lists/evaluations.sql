-- file_checksum: A2C43113871B01DE4BED396AAA32690505F51492A95A33DDEAC0C49D6DAFD2C2
prompt --application/shared_components/navigation/lists/evaluations
begin
--   Manifest
--     LIST: EVALUATIONS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(469874802159167410)
,p_name=>'EVALUATIONS'
,p_list_status=>'PUBLIC'
,p_version_scn=>41986151444105
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(469874988149167421)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Re-Evaluate'
,p_list_item_link_target=>'javascript:$.event.trigger(''reEvaluate'');'
,p_list_item_icon=>'fa-play'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_list_item_disp_condition=>'G_STALE_EVAL'
,p_list_item_disp_condition2=>'N'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(469891372115537544)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Re-Evaluate in Background'
,p_list_item_link_target=>'javascript:$.event.trigger(''reEvaluateBackground'');'
,p_list_item_icon=>'fa-clock-o'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_list_item_disp_condition=>'G_STALE_EVAL'
,p_list_item_disp_condition2=>'N'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(469875384494167422)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Run Evaluation for Page'
,p_list_item_link_target=>'javascript:$.event.trigger(''reEvaluatePage'');'
,p_list_item_icon=>'fa-file-play'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_list_item_disp_condition=>'G_STALE_EVAL'
,p_list_item_disp_condition2=>'N'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(469875828506167423)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Run Evaluation for Rule'
,p_list_item_icon=>'fa-table-play'
,p_required_patch=>wwv_flow_imp.id(468161859695671137)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(94778972476946389)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Schedule Evaluation'
,p_list_item_link_target=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:::'
,p_list_item_icon=>'fa-calendar-clock'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(469876224105167423)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Delete Evaluation'
,p_list_item_link_target=>'javascript:$.event.trigger(''deleteEvaluation'');'
,p_list_item_icon=>'fa-trash-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
