-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: E617569B1FE376F5908F222125ECF01717D1CFD85D7168B02EA64312089B60BE
-- file_checksum: 7A5CE5EE20CD1145DA7DEB9321A333E8D82FC59AFC477DB0FB323663B42D1383
prompt --application/shared_components/security/authentications/builder_extension_authn
begin
--   Manifest
--     AUTHENTICATION: Builder Extension AuthN
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(54436883263045263)
,p_name=>'Builder Extension AuthN'
,p_scheme_type=>'NATIVE_EXTENSION'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>39194514307376
,p_created_on=>wwv_flow_imp.dz('20260412021322Z')
,p_updated_on=>wwv_flow_imp.dz('20260412021322Z')
);
wwv_flow_imp.component_end;
end;
/
