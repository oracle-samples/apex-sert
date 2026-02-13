-- file_checksum: D82457617F71A10F8DD5BE7A68F2B35DC6E28CAB2CE1B559AB352AABC2CA6537
prompt --application/shared_components/logic/application_items/g_log_key
begin
--   Manifest
--     APPLICATION ITEM: G_LOG_KEY
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(35784428476922411181)
,p_name=>'G_LOG_KEY'
,p_protection_level=>'I'
,p_item_comment=>'Required to perform SERT evaluations. Not used by Guardian.'
,p_version_scn=>46172756600758
);
wwv_flow_imp.component_end;
end;
/
