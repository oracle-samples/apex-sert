-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 8FF7C1D6010482F52CFEE03C27B2627FE11E28A5426CE66880E227CFD02C2877
prompt --application/shared_components/navigation/lists/reports
begin
--   Manifest
--     LIST: REPORTS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(136314465783723109)
,p_name=>'REPORTS'
,p_list_status=>'PUBLIC'
,p_version_scn=>45143439857877
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(136316196739714458)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Score Trend'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP:P260_EVAL_ID:&P10_EVAL_ID.:'
,p_list_item_icon=>'fa-area-chart'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(93094405085578796)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Evaluation Summary'
,p_list_item_link_target=>'f?p=&APP_ID.:260:&SESSION.::&DEBUG.:RP:P260_EVAL_ID:&P10_EVAL_ID.:'
,p_list_item_icon=>'fa-area-chart'
,p_required_patch=>wwv_flow_imp.id(100473496993138610)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(93209638019997939)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Evaluation Details'
,p_list_item_link_target=>'f?p=&APP_ID.:280:&SESSION.::&DEBUG.::P280_EVAL_ID:&P10_EVAL_ID.:'
,p_list_item_icon=>'fa-file-text-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(105654035061049854)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'AOP Compliance Reports'
,p_list_item_icon=>'fa-badge-check'
,p_required_patch=>wwv_flow_imp.id(98647277488728571)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(120288722015837760)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Evaluation Summary Report'
,p_list_item_link_target=>'f?p=&APP_ID.:210:&SESSION.:EVAL_SUMMARY_REPORT:&DEBUG.::::'
,p_list_item_icon=>'fa-tiles-2x2'
,p_parent_list_item_id=>wwv_flow_imp.id(105654035061049854)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(98647277488728571)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(120287813156820128)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Evaluation Detail Report'
,p_list_item_link_target=>'f?p=&APP_ID.:220:&SESSION.:EVAL_DETAIL_REPORT:&DEBUG.::::'
,p_list_item_icon=>'fa-tiles-9'
,p_parent_list_item_id=>wwv_flow_imp.id(105654035061049854)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(98647277488728571)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(120288128324830216)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Exception Report'
,p_list_item_link_target=>'f?p=&APP_ID.:230:&SESSION.:EXCEPTION_REPORT:&DEBUG.::::'
,p_list_item_icon=>'fa-tiles-8'
,p_parent_list_item_id=>wwv_flow_imp.id(105654035061049854)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(98647277488728571)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(120288373627833179)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Evaluation Attributes Master Report'
,p_list_item_link_target=>'f?p=&APP_ID.:240:&SESSION.:ATTRIBUTE_MASTER_REPORT:&DEBUG.::::'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_imp.id(105654035061049854)
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_required_patch=>wwv_flow_imp.id(98647277488728571)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(110195255263894346)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Compliance Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-badge-check'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
