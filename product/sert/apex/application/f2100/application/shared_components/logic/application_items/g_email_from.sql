-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: A036E923159FA961D6313A1F9BB4A90AB2F6B253ED7B7BE5595F25FCEB9544FC
prompt --application/shared_components/logic/application_items/g_email_from
begin
--   Manifest
--     APPLICATION ITEM: G_EMAIL_FROM
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(102010611549796701)
,p_name=>'G_EMAIL_FROM'
,p_protection_level=>'I'
,p_version_scn=>41916700941964
);
wwv_flow_imp.component_end;
end;
/
