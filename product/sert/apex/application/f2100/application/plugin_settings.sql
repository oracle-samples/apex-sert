-- file_checksum: 713F5B14DE0D2B9218E02B5BE3C91FE6F9D5B6E1893D0A71EA5C357CC09AC3D2
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/plugin_settings
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(45179772458447455)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>44702721089621
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(120281642685670207)
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
 p_id=>wwv_flow_imp.id(120283739510687449)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'PLUGIN_BE.APEXRND.AOP_DA'
,p_attribute_01=>'&G_AOP_URL.'
,p_version_scn=>44532527532630
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(138490742788743681)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>39194514024545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(138491409198743680)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>39194514024545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(138491531713743680)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>39194514024545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(511880288594949391)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>41003904241487
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(511880565427949397)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>41003904241600
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(511880894805949397)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>41003904241602
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(511881169658949398)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>41003904241610
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(511881530678949398)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>41003904241618
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(511881766915949398)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>41003904241621
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(511882058102949398)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>41003904241623
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(511882374171949398)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>41003904241624
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(511882688711949398)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>41003904241629
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(511882988341949399)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER',
  'show_coordinates', 'N')).to_clob
,p_version_scn=>41003904241636
);
wwv_flow_imp.component_end;
end;
/
