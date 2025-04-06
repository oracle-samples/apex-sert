-- file_checksum: B99AADF9BCA658536CAA0B9373698044C10735946A6D51EBC0AA69798E318AA0
prompt --application/plugin_settings
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(76560224824391944)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'PLUGIN_COM.ORACLE.APEX.DOCGEN'
,p_attribute_01=>'&G_OCI_REGION_NAME.'
,p_attribute_02=>'&G_OCI_DOCGEN_FUNCTION_OCID.'
,p_attribute_03=>'&G_OCI_BUCKET_OUTPUT_FOLDER.'
,p_attribute_05=>'&G_OCI_BUCKET_NAMESPACE.'
,p_attribute_06=>'&G_OCI_BUCKET_NAME.'
,p_attribute_07=>'&G_OCI_BUCKET_TEMPLATE_FOLDER.'
,p_version_scn=>42133015390438
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(76562321649409186)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'PLUGIN_BE.APEXRND.AOP_DA'
,p_attribute_01=>'&G_AOP_URL.'
,p_version_scn=>44532527532630
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(94769324927465418)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attribute_01=>'separated'
,p_version_scn=>39194514024545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(94769991337465417)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>39194514024545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(94770113852465417)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>39194514024545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(468158870733671128)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attribute_01=>'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON'
,p_attribute_02=>'VISIBLE'
,p_attribute_03=>'15'
,p_attribute_04=>'FOCUS'
,p_version_scn=>41003904241487
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(468159147566671134)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>41003904241600
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(468159476944671134)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_version_scn=>41003904241602
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(468159751797671135)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>41003904241610
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(468160112817671135)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'FULL'
,p_attribute_02=>'POPUP'
,p_version_scn=>41003904241618
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(468160349054671135)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attribute_01=>'fa-star'
,p_attribute_04=>'#VALUE#'
,p_version_scn=>41003904241621
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(468160640241671135)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>41003904241623
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(468160956310671135)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>41003904241624
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(468161270850671135)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH_CB'
,p_version_scn=>41003904241629
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(468161570480671136)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_attribute_02=>'N'
,p_attribute_03=>'POPUP:ITEM'
,p_attribute_04=>'default'
,p_attribute_06=>'LIST'
,p_version_scn=>41003904241636
);
wwv_flow_imp.component_end;
end;
/
