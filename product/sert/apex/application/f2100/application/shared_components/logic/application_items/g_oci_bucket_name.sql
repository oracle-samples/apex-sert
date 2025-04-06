-- file_checksum: BCCCCB69843CD4AF30BAE48C1BB7ABCBF43574E7573C862FF5C595DAF25E4153
prompt --application/shared_components/logic/application_items/g_oci_bucket_name
begin
--   Manifest
--     APPLICATION ITEM: G_OCI_BUCKET_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(69074168767284744)
,p_name=>'G_OCI_BUCKET_NAME'
,p_protection_level=>'I'
,p_version_scn=>42133019226236
);
wwv_flow_imp.component_end;
end;
/
