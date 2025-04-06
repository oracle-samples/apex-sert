-- file_checksum: BE65CC4989828A2942B39DAEED2D484D8F4D009F09F3660975A70E88D30AE58E
prompt --application/shared_components/logic/application_items/g_release_version
begin
--   Manifest
--     APPLICATION ITEM: G_RELEASE_VERSION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(61971102905380736)
,p_name=>'G_RELEASE_VERSION'
,p_protection_level=>'I'
,p_version_scn=>41974828921857
);
wwv_flow_imp.component_end;
end;
/
