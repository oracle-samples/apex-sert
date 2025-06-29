-- file_checksum: 8E6C09B5B7E4D4BCA3FDF9ECF77E6A0A86FFA95FF7A4DAD806B6E5A3F55CA805
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(50353164082327916)
,p_build_option_name=>'IN_DEVELOPMENT'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>44481343954097
,p_default_on_export=>'EXCLUDE'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(54925859627450308)
,p_build_option_name=>'AOP'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>44658456743049
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(54926183278448596)
,p_build_option_name=>'DOCGEN'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>44528696674946
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(56752079131860347)
,p_build_option_name=>'Deprecated'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>44559215634750
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Object deprecated to be deleted, eg OCI Docgen plugin'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(468161859695671137)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41003904241656
);
wwv_flow_imp.component_end;
end;
/
