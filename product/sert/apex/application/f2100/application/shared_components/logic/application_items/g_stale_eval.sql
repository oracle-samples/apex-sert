-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: 724104F68834CFAF367DA7B77370A7E0E21684D6DFDF87EFB0FB3503F1C21867
-- file_checksum: 02A0A6CD2791B6359466BFF2896038306D62608D85AACF8BE49F8FB5BC523BB4
prompt --application/shared_components/logic/application_items/g_stale_eval
begin
--   Manifest
--     APPLICATION ITEM: G_STALE_EVAL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(132305033781762805)
,p_name=>'G_STALE_EVAL'
,p_protection_level=>'I'
,p_version_scn=>39194837647963
);
wwv_flow_imp.component_end;
end;
/
