-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 483C293D6D5BA6A7E81C2861F9606F03CE8BE4CD56A1C31561A1C2BBB9A57C13
prompt --application/shared_components/logic/application_items/g_release_version
begin
--   Manifest
--     APPLICATION ITEM: G_RELEASE_VERSION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
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
