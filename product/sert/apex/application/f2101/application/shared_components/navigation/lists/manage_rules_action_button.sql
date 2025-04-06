-- file_checksum: C7C0DF666EA54B67B483BCEF6926E202ADCD12C800735F70EA35CB1AFE6E500C
prompt --application/shared_components/navigation/lists/manage_rules_action_button
begin
--   Manifest
--     LIST: Manage Rules Action Button
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(362279438225466362)
,p_name=>'Manage Rules Action Button'
,p_list_status=>'PUBLIC'
,p_version_scn=>39194514063473
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(362280059316466373)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Rule Sets'
,p_list_item_link_target=>'f?p=&APP_ID.:2050:&SESSION.::&DEBUG.::P2050_RULE_ID,P2050_BRANCH:&P2010_RULE_ID.,2010:'
,p_list_item_icon=>'fa-list'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(362280498289466374)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Delete'
,p_list_item_link_target=>'javascript:$.event.trigger(''deleteRule'');'||wwv_flow.LF||
''
,p_list_item_icon=>'fa-trash-o'
,p_list_item_icon_attributes=>'class="deleteRule"'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(362280921855466374)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Copy'
,p_list_item_link_target=>'f?p=&APP_ID.:2012:&SESSION.::&DEBUG.::P2012_RULE_ID:&P2010_RULE_ID.:'
,p_list_item_icon=>'fa-copy'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(362281298032466374)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Apply Changes'
,p_list_item_link_target=>'javascript:apex.submit(''SAVE'');'
,p_list_item_icon=>'fa-save'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
