-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: F2F2D5ED4BF088E3EEB98B2A8D853793E64C0F330B3397FC211973097002CFBE
prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(94074581943606179)
,p_build_option_name=>'IN_DEVELOPMENT'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>44481343954097
,p_default_on_export=>'EXCLUDE'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(98647277488728571)
,p_build_option_name=>'AOP'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>45026449812038
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(98647601139726859)
,p_build_option_name=>'DOCGEN'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>44528696674946
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(100473496993138610)
,p_build_option_name=>'Deprecated'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>44559215634750
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Object deprecated to be deleted, eg OCI Docgen plugin'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(511883277556949400)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41003904241656
);
wwv_flow_imp.component_end;
end;
/
