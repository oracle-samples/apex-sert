-- file_checksum: 902E1B7177D5553A4F95BE41D33C81BF70B62CAA100764E4416CC9B326BFEFB2
prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 2102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(30658409877532022739)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
