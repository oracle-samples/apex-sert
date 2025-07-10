-- file_checksum: 8E97CC95AA3C6B82543189DAA640F498306D576434E98FF0EDFAB0573148DAEE
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_button_link
begin
--   Manifest
--     APPLICATION ITEM: G_BUTTON_LINK
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(438347485674175539)
,p_name=>'G_BUTTON_LINK'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>41013552840944
);
wwv_flow_imp.component_end;
end;
/
