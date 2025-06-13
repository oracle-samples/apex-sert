-- file_checksum: EEABCE4246A561CBEB3FD50AC8F55C4E1A854C2CF39DA273563BECFF397472A6
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/navigation/lists/reports
begin
--   Manifest
--     LIST: REPORTS
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
 p_id=>wwv_flow_imp.id(92593047922444846)
,p_name=>'REPORTS'
,p_list_status=>'PUBLIC'
,p_version_scn=>44595483802318
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(92594778878436195)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Score Trend'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP:P260_EVAL_ID:&P10_EVAL_ID.:'
,p_list_item_icon=>'fa-area-chart'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(49372987224300533)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Evaluation Summary'
,p_list_item_link_target=>'f?p=&APP_ID.:260:&SESSION.::&DEBUG.:RP:P260_EVAL_ID:&P10_EVAL_ID.:'
,p_list_item_icon=>'fa-area-chart'
,p_required_patch=>wwv_flow_imp.id(56752079131860347)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(49487690957729332)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Exception Details'
,p_list_item_link_target=>'f?p=&APP_ID.:270:&SESSION.::&DEBUG.::P270_EVAL_ID:&P10_EVAL_ID.:'
,p_list_item_icon=>'fa-file-text-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(49488220158719676)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Evaluation Details'
,p_list_item_link_target=>'f?p=&APP_ID.:280:&SESSION.::&DEBUG.::P280_EVAL_ID:&P10_EVAL_ID.:'
,p_list_item_icon=>'fa-file-text-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(61932617199771591)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'AOP Compliance Reports'
,p_list_item_icon=>'fa-badge-check'
,p_required_patch=>wwv_flow_imp.id(54925859627450308)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(76567304154559497)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Evaluation Summary Report'
,p_list_item_link_target=>'f?p=&APP_ID.:210:&SESSION.:EVAL_SUMMARY_REPORT:&DEBUG.::::'
,p_list_item_icon=>'fa-tiles-2x2'
,p_parent_list_item_id=>wwv_flow_imp.id(61932617199771591)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(54925859627450308)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(76566395295541865)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Evaluation Detail Report'
,p_list_item_link_target=>'f?p=&APP_ID.:220:&SESSION.:EVAL_DETAIL_REPORT:&DEBUG.::::'
,p_list_item_icon=>'fa-tiles-9'
,p_parent_list_item_id=>wwv_flow_imp.id(61932617199771591)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(54925859627450308)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(76566710463551953)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Exception Report'
,p_list_item_link_target=>'f?p=&APP_ID.:230:&SESSION.:EXCEPTION_REPORT:&DEBUG.::::'
,p_list_item_icon=>'fa-tiles-8'
,p_parent_list_item_id=>wwv_flow_imp.id(61932617199771591)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(54925859627450308)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(76566955766554916)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Evaluation Attributes Master Report'
,p_list_item_link_target=>'f?p=&APP_ID.:240:&SESSION.:ATTRIBUTE_MASTER_REPORT:&DEBUG.::::'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_imp.id(61932617199771591)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(54925859627450308)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(66473837402616083)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Compliance Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-badge-check'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
