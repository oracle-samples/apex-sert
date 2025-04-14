-- file_checksum: 390521513E3D7F6D059DE2016F2C2CF541C82B08E09976F5714EA7B4A183AEEC
prompt --application/pages/page_00302
begin
--   Manifest
--     PAGE: 00302
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>302
,p_name=>'Branches by name'
,p_step_title=>'Branches'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(43633508499237456)
,p_branch_name=>'PL/SQL Function Returning a URL'
,p_branch_action=>'RETURN ''&P1_ITEM.'' || ''DBMS_SQL EXECUTE IMMEDIATE'';    '
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_language=>'PLSQL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(43633148444237453)
,p_branch_name=>'PL/SQL Function Returning a Page'
,p_branch_action=>'RETURN ''&P1_ITEM.'' || ''DBMS_SQL EXECUTE IMMEDIATE'';    '
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_PAGE'
,p_branch_language=>'PLSQL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(43633337169237455)
,p_branch_name=>'PL/SQL Procedure'
,p_branch_action=>'RETURN ''&P1_ITEM.'' || ''DBMS_SQL EXECUTE IMMEDIATE'';    '
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'PLSQL'
,p_branch_sequence=>30
);
wwv_flow_imp.component_end;
end;
/
