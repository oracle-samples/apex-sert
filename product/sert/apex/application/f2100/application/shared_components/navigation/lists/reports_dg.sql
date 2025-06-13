-- file_checksum: D826C5D74508E52492AACED26AC69C0A8DD813B365FA3307EE7B5A757EDD2F49
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/navigation/lists/reports_dg
begin
--   Manifest
--     LIST: REPORTS_DG
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
 p_id=>wwv_flow_imp.id(65843423135553318)
,p_name=>'REPORTS_DG'
,p_list_status=>'PUBLIC'
,p_version_scn=>44541157296621
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(65844320652553345)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Evaluation Summary'
,p_list_item_link_target=>'f?p=&APP_ID.:302:&SESSION.:EVAL_SUMMARY_REPORT_DG:&DEBUG.::::'
,p_list_item_icon=>'fa-tiles-2x2'
,p_list_text_03=>'templates/GIS_Evaluation_Summary_Report_Template.docx'
,p_list_text_04=>'EVAL_SUMMARY_REPORT_DG'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(65844805032553345)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Evaluation Details'
,p_list_item_link_target=>'f?p=&APP_ID.:302:&SESSION.:EVAL_DETAIL_REPORT_DG:&DEBUG.::::'
,p_list_item_icon=>'fa-tiles-9'
,p_list_text_03=>'templates/GIS_Evaluation_Detail_Report_Template.docx'
,p_list_text_04=>'EVAL_DETAIL_REPORT_DG'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(65843691857553337)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Exceptions'
,p_list_item_link_target=>'f?p=&APP_ID.:302:&SESSION.:EVAL_EXCEPTION_REPORT_DG:&DEBUG.::::'
,p_list_item_icon=>'fa-tiles-8'
,p_list_text_03=>'templates/GIS_Evaluation_Exception_Report_Template.docx'
,p_list_text_04=>'EVAL_EXCEPTION_REPORT_DG'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(65844054060553343)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Evaluation Attributes Master Report'
,p_list_item_link_target=>'f?p=&APP_ID.:302:&SESSION.:EVAL_MASTER_REPORT_DG:&DEBUG.::::'
,p_list_item_icon=>'fa-database'
,p_list_text_03=>'templates/GIS_Attributes_Master_Report_Template.docx'
,p_list_text_04=>'EVAL_MASTER_REPORT_DG'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
