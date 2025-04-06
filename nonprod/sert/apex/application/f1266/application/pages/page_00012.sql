-- file_checksum: 35D5B84149180E9CBC9405EE89CAF7665DE320080DAE888F6849AA1747586223
prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>12
,p_name=>'Security'
,p_alias=>'SECURITY'
,p_step_title=>'security'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21537123686570386)
,p_plug_name=>'Access Control'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(23085153165218123)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from apex_application_pages',
'where application_id = :APP_ID'))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"PAGE_ID","expr":"\"PAGE_ID\" asc"},{"key":"PAGE_TITLE","expr":"\"PAGE_TITLE\" asc"},{"key":"PAGE_GROUP","expr":"\"PAGE_GROUP\" asc"}],"itemName":"P12_ORDER_BY"}'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(21537661065570392)
,p_region_id=>wwv_flow_imp.id(21537123686570386)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'PAGE_NAME'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_body_column_name=>'PAGE_TITLE'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'PAGE_ID'
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'PAGE_NAME'
,p_icon_position=>'START'
,p_badge_column_name=>'PAGE_GROUP'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(21539331734582601)
,p_card_id=>wwv_flow_imp.id(21537661065570392)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:&PAGE_ID.:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21538144173570398)
,p_name=>'P12_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21537123686570386)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'PAGE_ID'
,p_prompt=>'Order By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Page ID;PAGE_ID,Page Title;PAGE_TITLE,Page Group;PAGE_GROUP'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
);
wwv_flow_imp.component_end;
end;
/
