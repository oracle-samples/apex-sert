-- file_checksum: 21B6991F9D045F5B3FCE72718DC4D90A4B388E77491D1DB30EECA69F09983677
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/application_items/g_email_from
begin
--   Manifest
--     APPLICATION ITEM: G_EMAIL_FROM
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
 p_id=>wwv_flow_imp.id(58289193688518438)
,p_name=>'G_EMAIL_FROM'
,p_protection_level=>'I'
,p_version_scn=>41916700941964
);
wwv_flow_imp.component_end;
end;
/
