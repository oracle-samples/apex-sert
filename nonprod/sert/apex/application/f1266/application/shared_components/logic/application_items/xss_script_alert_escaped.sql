-- file_checksum: DEC413E6585BB9A917052BA69B43EECA4242775DF74008B414F6952B27DA6B19
prompt --application/shared_components/logic/application_items/xss_script_alert_escaped
begin
--   Manifest
--     APPLICATION ITEM: XSS_SCRIPT_ALERT_ESCAPED
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
 p_id=>wwv_flow_imp.id(97847476880686870)
,p_name=>'XSS_SCRIPT_ALERT_ESCAPED'
,p_protection_level=>'I'
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<SCRIPT>alert("XSS")</SCRIPT>"\>',
'\<a onmouseover="alert(document.cookie)"\>xxs link\</a\>'))
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
