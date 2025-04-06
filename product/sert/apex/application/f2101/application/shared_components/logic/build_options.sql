-- file_checksum: E4B69911D0F296268118E76B33AF0ABAD55422CBD307685C7670E334183D6812
prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 2101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
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
