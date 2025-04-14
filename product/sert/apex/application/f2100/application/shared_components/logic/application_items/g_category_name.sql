-- file_checksum: 7C771C2B05054F61904B04E8EC9ED0253588625C621E8AC5D4E09DF91563501F
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_category_name
begin
--   Manifest
--     APPLICATION ITEM: G_CATEGORY_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(480018076884574689)
,p_name=>'G_CATEGORY_NAME'
,p_protection_level=>'I'
,p_version_scn=>41004790461825
);
wwv_flow_imp.component_end;
end;
/
