-- file_checksum: EEFBDCC107E7423CAA9E46BB4089511525215A4FC099A8C6F571932788AA416B
prompt --application/shared_components/navigation/lists/list_sv_chk_list_entry_cond_never
begin
--   Manifest
--     LIST: LIST SV_CHK_LIST_ENTRY_COND_NEVER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(22530547415440132)
,p_name=>'LIST SV_CHK_LIST_ENTRY_COND_NEVER'
,p_list_status=>'PUBLIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(22530698965440142)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'No Conditions'
,p_list_item_link_target=>'javascript:;'
,p_list_item_current_for_pages=>'javascript:;'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(22531109524440149)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Conditions Expression'
,p_list_item_link_target=>'javascript:;'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'1=2'
,p_list_item_disp_condition2=>'PLSQL'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(22531491316440150)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Conditions Never'
,p_list_item_link_target=>'javascript:;'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
