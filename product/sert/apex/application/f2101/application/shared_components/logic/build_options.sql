-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: E617569B1FE376F5908F222125ECF01717D1CFD85D7168B02EA64312089B60BE
-- file_checksum: 23A9A0A4D498D7105CC051F148E004DE6C51C191CEA6D79E234F753DD638FE8B
prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 2101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(63448269773974883)
,p_build_option_name=>'Pretius - exclude export'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>42048776431712
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(394385489811759930)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41003307502361
);
wwv_flow_imp.component_end;
end;
/
