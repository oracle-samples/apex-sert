-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: BCAB8594357F4D55B7B3669EC2962A0938843A83CA57D885D5E17705413150D9
prompt --application/shared_components/logic/application_items/g_release_version
begin
--   Manifest
--     APPLICATION ITEM: G_RELEASE_VERSION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(105681209535627826)
,p_name=>'G_RELEASE_VERSION'
,p_protection_level=>'I'
,p_version_scn=>41974810723305
);
wwv_flow_imp.component_end;
end;
/
