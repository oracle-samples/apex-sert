-- file_checksum: 8C1B2CC2D0B726C72C66317325AE2009D40E4B1ABDD56465D86413087BC6F035
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 2101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
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
