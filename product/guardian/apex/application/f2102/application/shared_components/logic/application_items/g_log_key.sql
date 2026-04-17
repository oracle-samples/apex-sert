prompt app_checksum: F24062FCE39D7AC19F9EA2292B88008E6F55784EDB74E6D62BAD565878490F78
-- file_checksum: 23E4E93CEE79D74E90FBF9C4FE3952AB19F85AEBF23B2F3F5F5F8B24D8849E4C
prompt --application/shared_components/logic/application_items/g_log_key
begin
--   Manifest
--     APPLICATION ITEM: G_LOG_KEY
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
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
