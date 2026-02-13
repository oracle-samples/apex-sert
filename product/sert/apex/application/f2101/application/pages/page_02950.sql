-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 8A6282251BFC8E5BD9359A886F64826782A657FC026D4778E4EB302B157E0C7A
prompt --application/pages/page_02950
begin
--   Manifest
--     PAGE: 02950
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>2950
,p_name=>'Purge Stale Versions'
,p_alias=>'PURGE-STALE-VERSIONS'
,p_step_title=>'Purge Stale Versions'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(67024148183388463)
,p_plug_name=>'Purge Stale Versions'
,p_region_template_options=>'#DEFAULT#:margin-top-lg:margin-bottom-lg:margin-left-lg:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(394429964089760060)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct apex_version',
'from ',
'  rules_v ',
'where ',
'  apex_version != :G_APEX_VERSION'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_no_data_found=>'No data found'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(68222272701107869)
,p_region_id=>wwv_flow_imp.id(67024148183388463)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>true
,p_title_html_expr=>'Version &APEX_VERSION.'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_pk1_column_name=>'APEX_VERSION'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(68222411292107870)
,p_card_id=>wwv_flow_imp.id(68222272701107869)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>'Purge'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
,p_link_attributes=>'id="&APEX_VERSION."'
,p_button_display_type=>'TEXT'
,p_action_css_classes=>'purgeVersion'
,p_is_hot=>true
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(68222746892107874)
,p_name=>'P2950_APEX_VERSION'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(68222490754107871)
,p_name=>'Purge Version'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.purgeVersion'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(68222582323107872)
,p_event_id=>wwv_flow_imp.id(68222490754107871)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to delete all data for this version?  This action cannot be undone.'
,p_attribute_02=>'Confirm'
,p_attribute_03=>'warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(68222653177107873)
,p_event_id=>wwv_flow_imp.id(68222490754107871)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Set Value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2950_APEX_VERSION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id;'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(68222897235107875)
,p_event_id=>wwv_flow_imp.id(68222490754107871)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from evals where eval_id in (select eval_id from evals_v where apex_version = :P2950_APEX_VERSION);',
'delete from rules where apex_version = :P2950_APEX_VERSION;',
'delete from rule_sets where apex_version = :P2950_APEX_VERSION;'))
,p_attribute_02=>'P2950_APEX_VERSION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(68223001733107876)
,p_event_id=>wwv_flow_imp.id(68222490754107871)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(67024148183388463)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(68223105850107877)
,p_event_id=>wwv_flow_imp.id(68222490754107871)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Version Purged'');'
);
wwv_flow_imp.component_end;
end;
/
