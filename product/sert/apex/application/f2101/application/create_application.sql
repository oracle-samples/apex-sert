-- file_checksum: 0B1DF47E228938A25315B1F223AD0B0B221CD920DCD9BF42F80ED0FDE6F14A4F
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/create_application
begin
--   Manifest
--     FLOW: 2101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.6'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'SERT_CORE')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'APEX-SERT Administration')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'APEX_SERT_ADMIN')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'61B7199A2AFDAEA997A397603AA37BD6E2AC5DAFB7851F58E4654632D0798BB9'
,p_bookmark_checksum_function=>'SH512'
,p_max_session_length_sec=>28800
,p_max_session_idle_sec=>3600
,p_compatibility_mode=>'21.2'
,p_accessible_read_only=>'N'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DD-MON-YYYY HH24:MI TZR'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(54436883263045263)
,p_application_tab_set=>0
,p_logo_type=>'T'
,p_logo_text=>'APEX-SERT Administration'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'&G_RELEASE_VERSION.'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application has been disabled.  Please contact your administrator for assistance.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_runtime_api_usage=>'T:O:W'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'Y'
,p_error_handling_function=>'log_pkg.error'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'SERT v2'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>16
,p_version_scn=>45172215865034
,p_print_server_type=>'NATIVE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
,p_pwa_is_push_enabled=>'N'
);
wwv_flow_imp.component_end;
end;
/
