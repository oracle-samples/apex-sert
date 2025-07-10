-- file_checksum: F4456F6F9563857BDA189443FA70EEEB1C158C4BA0AA1116A6B76E53399E4C4C
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/security/authentications/builder_extension_authn
begin
--   Manifest
--     AUTHENTICATION: Builder Extension AuthN
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(138499404854707068)
,p_name=>'Builder Extension AuthN'
,p_scheme_type=>'NATIVE_EXTENSION'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>39194514307376
);
wwv_flow_imp.component_end;
end;
/
