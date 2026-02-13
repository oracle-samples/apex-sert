-- file_checksum: 88C5D735F1108FC8BE08D895BAF09D218143D977C87292587A99E59F7160193A
prompt --application/plugin_settings
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658399417685022713)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>45785568297746
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658399762623022714)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>45785568297909
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658400061924022715)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>45785568297937
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658400349259022715)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER',
  'show_coordinates', 'N')).to_clob
,p_version_scn=>45785568297968
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658400593249022715)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>45785568297997
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658400916961022715)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>45785568298033
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658401202177022716)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>45785568298068
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658401481528022716)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>45785568298095
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658401846880022716)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>45785568298118
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658402164352022716)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>45785568298151
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658402448408022717)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>45785568298174
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658402731533022717)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>45785568298193
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658403036088022717)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>45785568298221
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(30658403339486022717)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>45785568298250
);
wwv_flow_imp.component_end;
end;
/
