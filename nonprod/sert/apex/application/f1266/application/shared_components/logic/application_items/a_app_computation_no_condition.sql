-- file_checksum: 91B7CCA5710A42A5833759079361BC1054E88D74CB919E8886C8E9FE50A991C9
prompt --application/shared_components/logic/application_items/a_app_computation_no_condition
begin
--   Manifest
--     APPLICATION ITEM: A_APP_COMPUTATION_NO_CONDITION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(22508572139038348)
,p_name=>'A_APP_COMPUTATION_NO_CONDITION'
,p_protection_level=>'I'
,p_item_comment=>'For SV_CHK_APP_COMP_COND_NEVER'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
