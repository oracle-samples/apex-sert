-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 454623E8FA7B89687FA72548D8F3E6AE42E6E5A46A170163C8841FECD1A4342B
prompt --application/shared_components/logic/application_items/g_aop_url
begin
--   Manifest
--     APPLICATION ITEM: G_AOP_URL
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
 p_id=>wwv_flow_imp.id(111848158914588129)
,p_name=>'G_AOP_URL'
,p_protection_level=>'I'
,p_version_scn=>41905337165052
);
wwv_flow_imp.component_end;
end;
/
