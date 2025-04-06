-- file_checksum: C23752A6BE5DA7DF35F4608993423DB7C6790118BC9E6BBD6CD12DAAFD8C186C
prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>'Page: Item Default Name'
,p_alias=>'PAGE-ITEM-DEFAULT-NAME'
,p_step_title=>'Page: Item Default Name'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18922663944067827)
,p_plug_name=>'Region To Evaluate Page Items'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18922712908067828)
,p_name=>'P5_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(18922663944067827)
,p_prompt=>'Default Version 1'
,p_source=>'This should result in FAIL because it is using a default name'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18922868805067829)
,p_name=>'P5_NEW_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(18922663944067827)
,p_prompt=>'Default Version 1'
,p_source=>'This should result in FAIL because it is using a default name'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18922940996067830)
,p_name=>'P5_FIRSTNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(18922663944067827)
,p_prompt=>'Non-Default'
,p_source=>'This should result in PASS because it has varied from the default name'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(43706081860394077)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp.component_end;
end;
/
