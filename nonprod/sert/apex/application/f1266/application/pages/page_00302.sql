-- file_checksum: 22D65E7CFFC50B11527B8684D7770F798654F7A0041A36FC52A51EFD4B31F266
prompt --application/pages/page_00302
begin
--   Manifest
--     PAGE: 00302
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
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
