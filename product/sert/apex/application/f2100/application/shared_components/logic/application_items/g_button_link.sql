-- file_checksum: 9CDB7DA3B0CCCDB7F6EF38C05AC3E3D0E2E97120ED19BC487F27365A73AE74B3
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
,p_release=>'24.2.0'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(394626067812897276)
,p_name=>'G_BUTTON_LINK'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>41013552840944
);
wwv_flow_imp.component_end;
end;
/
