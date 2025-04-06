-- file_checksum: 71830C43FF62E75C560181986E7B963B2371BCCA1CD281C815E14913AF4C4163
prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
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
,p_version_scn=>44531875108893
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
 p_id=>wwv_flow_imp.id(468161859695671137)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41003904241656
);
wwv_flow_imp.component_end;
end;
/
