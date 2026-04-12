-- file_checksum: B3F32E29051FDBC2298B84D6901C7A54B1D567A2AAE326760577ADFBDBF83987
prompt --application/shared_components/logic/application_items/xss_script_alert_unescaped
begin
--   Manifest
--     APPLICATION ITEM: XSS_SCRIPT_ALERT_UNESCAPED
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(97847775407690994)
,p_name=>'XSS_SCRIPT_ALERT_UNESCAPED'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<SCRIPT>alert("XSS")</SCRIPT>"\>',
''))
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
