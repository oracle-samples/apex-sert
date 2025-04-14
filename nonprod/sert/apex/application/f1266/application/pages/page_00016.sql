-- file_checksum: BD3EEC17B2B33FF6E994FBB0EFD261625A8470CFF68FF89ECB01A12C1B9BE103
prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Access Control pages'
,p_alias=>'ACCESS-CONTROL-PAGES'
,p_step_title=>'Access Control pages'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(21548711573636577)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(21560368603834707)
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(43101192770314745)
,p_plug_name=>'Cards Page'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(23085153165218123)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from apex_application_pages ',
'where application_id = :APP_ID',
'and page_group = ''ACCESS_CONTROL'''))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{ "itemName": "P16_ORDER_BY", "orderBys": [{"key":"PAGE_TITLE","expr":"\"PAGE_TITLE\" asc"},{"key":"PAGE_ID","expr":"\"PAGE_ID\" asc"},{"key":"PAGE_MODE","expr":"\"PAGE_MODE\" asc"}]}'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(21555253577694529)
,p_region_id=>wwv_flow_imp.id(43101192770314745)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'PAGE_TITLE'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_body_column_name=>'PAGE_ID'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'PAGE_GROUP'
,p_icon_position=>'START'
,p_badge_column_name=>'PAGE_MODE'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(21539429896582602)
,p_card_id=>wwv_flow_imp.id(21555253577694529)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:&PAGE_ID.:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43103560154314748)
,p_name=>'P16_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(43101192770314745)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'PAGE_TITLE'
,p_prompt=>'Order By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Page Title;PAGE_TITLE,Page Id;PAGE_ID,Page Mode;PAGE_MODE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'NONE'
,p_attribute_03=>'Y'
,p_ai_enabled=>false
);
wwv_flow_imp.component_end;
end;
/
