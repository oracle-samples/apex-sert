-- file_checksum: BC02B1FE4084AED39C4689A83EA50CD65BD76429D7721B2DA960FBADCBE79661
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_log_key
begin
--   Manifest
--     APPLICATION ITEM: G_LOG_KEY
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
 p_id=>wwv_flow_imp.id(468677338323001282)
,p_name=>'G_LOG_KEY'
,p_protection_level=>'I'
,p_version_scn=>41003907746248
);
wwv_flow_imp.component_end;
end;
/
