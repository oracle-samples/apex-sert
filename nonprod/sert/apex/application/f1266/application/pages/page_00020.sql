-- file_checksum: 7AB4390715A68A22BDCDDDF1423C3D5475383ADCD59257A53445457640831456
prompt --application/pages/page_00020
begin
--   Manifest
--     PAGE: 00020
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
 p_id=>20
,p_name=>'Tree'
,p_alias=>'TREE'
,p_step_title=>'Tree'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'20'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(98649625770227854)
,p_plug_name=>'tree_test'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(43728883880394113)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VERSION',
'from SV_SEC_VERSION',
'where 1 = ''&P1_ITEM.'' || ''DBMS_SQL'' || ''EXECUTE IMMEDIATE'';'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'activate_node_link_with', 'S',
  'default_icon_css_class', 'icon-tree-folder',
  'icon_type_css_class', 'a-Icon',
  'node_id_column', 'VERSION',
  'node_label_column', 'VERSION',
  'parent_key_column', 'VERSION',
  'start_tree_with', 'NULL',
  'tree_hierarchy', 'SQL',
  'tree_tooltip', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
