-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt app_checksum: 724104F68834CFAF367DA7B77370A7E0E21684D6DFDF87EFB0FB3503F1C21867
-- file_checksum: 0081A0C347ED66A8CBABFEEEE706128F74B74E41706AA761B4E7324A0D8901B6
prompt --application/shared_components/security/authorizations/allow_for_evaluation
begin
--   Manifest
--     SECURITY SCHEME: Allow for Evaluation
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(140413007122936271)
,p_name=>'Allow for Evaluation'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>'select 1 from apex_version_pub_v where apex_version = sert_apex_version'
,p_version_scn=>39194530888862
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
