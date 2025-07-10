-- file_checksum: C3F58B81D92B008E5877F65F0AA61E89813CD51861F3CAAFA19AD2C64BA08677
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/navigation/lists/evaluations
begin
--   Manifest
--     LIST: EVALUATIONS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(513596220020445673)
,p_name=>'EVALUATIONS'
,p_list_status=>'PUBLIC'
,p_version_scn=>41986151444105
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(513596406010445684)
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
 p_id=>wwv_flow_imp.id(513612789976815807)
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
 p_id=>wwv_flow_imp.id(513596802355445685)
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
 p_id=>wwv_flow_imp.id(513597246367445686)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Run Evaluation for Rule'
,p_list_item_icon=>'fa-table-play'
,p_required_patch=>wwv_flow_imp.id(511883277556949400)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(138500390338224652)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Schedule Evaluation'
,p_list_item_link_target=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:::'
,p_list_item_icon=>'fa-calendar-clock'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(513597641966445686)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Delete Evaluation'
,p_list_item_link_target=>'javascript:$.event.trigger(''deleteEvaluation'');'
,p_list_item_icon=>'fa-trash-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
