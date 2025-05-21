-- file_checksum: 31B930A9789490AA4FB6DC9FE9626F421758550F15CFA3308AD3D9C6D4B320E6
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(468162448988671142)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(49019658168019780)
,p_parent_id=>wwv_flow_imp.id(468709247269812977)
,p_short_name=>'Evaluation Summary'
,p_link=>'f?p=&APP_ID.:260:&SESSION.::&DEBUG.::P260_EVAL_ID:&P10_EVAL_ID.'
,p_page_id=>260
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(468162697851671143)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(468709247269812977)
,p_parent_id=>wwv_flow_imp.id(468162697851671143)
,p_short_name=>'Evaluation &G_EVAL_TITLE.'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(49415435155768290)
,p_parent_id=>wwv_flow_imp.id(468709247269812977)
,p_option_sequence=>20
,p_short_name=>'Exception Details'
,p_link=>'f?p=&APP_ID.:270:&SESSION.::&DEBUG.::P270_EVAL_ID:&P10_EVAL_ID.'
,p_page_id=>270
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(49467120113750114)
,p_parent_id=>wwv_flow_imp.id(468709247269812977)
,p_option_sequence=>30
,p_short_name=>'Evaluation Details'
,p_link=>'f?p=&APP_ID.:280:&SESSION.::&DEBUG.::P280_EVAL_ID:&P10_EVAL_ID.'
,p_page_id=>280
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(66779730710813632)
,p_parent_id=>wwv_flow_imp.id(468709247269812977)
,p_option_sequence=>40
,p_short_name=>'Exceptions Details'
,p_link=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.:::'
,p_page_id=>60
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(67647324861390797)
,p_parent_id=>wwv_flow_imp.id(468709247269812977)
,p_option_sequence=>50
,p_short_name=>'Document Generator IS Reports'
,p_long_name=>'Document Generator IS Reports'
,p_link=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:::'
,p_page_id=>302
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp.component_end;
end;
/
