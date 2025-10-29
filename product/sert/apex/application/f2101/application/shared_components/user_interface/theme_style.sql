-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: E5698940FAC025B523F289EC50BD21AE0452A7CB948672D417565492CBF95963
prompt --application/shared_components/user_interface/theme_style
begin
--   Manifest
--     THEME STYLE: 2101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(73501533225359450)
,p_theme_id=>42
,p_name=>'Redwood Light'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/oracle-fonts/oraclesans-apex#MIN#.css?v=#APEX_VERSION#',
'#THEME_FILES#css/Redwood#MIN#.css?v=#APEX_VERSION#'))
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Redwood-Theme.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Redwood-Theme#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(73501891121359450)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(73502268833359450)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(73502690454359450)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(73503062356359450)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(394689074844769288)
,p_theme_id=>42
,p_name=>'Redwood'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/oracle-fonts/oraclesans-apex#MIN#.css?v=#APEX_VERSION#',
'#THEME_FILES#css/Redwood#MIN#.css?v=#APEX_VERSION#'))
,p_css_classes=>' rw-mode-nav--light rw-mode-header--pillar rw-mode-body--light rw-layout--contained rw-mode-body-header--dark'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Redwood-Theme.less'
,p_theme_roller_config=>'{"classes":["rw-layout--fixed t-PageBody--scrollTitle","rw-mode-nav--light","rw-mode-header--pillar","rw-mode-body--light","rw-layout--fixed t-PageBody--scrollTitle","rw-layout--contained","rw-mode-body-header--dark"],"vars":{},"customCSS":"","useCus'
||'tomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#329620525179879700.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp.component_end;
end;
/
