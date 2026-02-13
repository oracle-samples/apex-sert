-- file_checksum: 5B614057386BCDAFE8674FBBA76C9D8EDC07336E755532B3DAAE222642038C65
prompt --application/create_application
begin
--   Manifest
--     FLOW: 2102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'SERT_CORE')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'SERT Guardian')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'SERT-GUARDIAN')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'17FFF65C2F987270EB7A6B9783B4519E05D0FF22FFB4211F0992C66BFA04C243'
,p_bookmark_checksum_function=>'SH512'
,p_max_session_length_sec=>28800
,p_max_session_idle_sec=>3600
,p_compatibility_mode=>'24.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'YYYY-MM-DD'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(192433314997850056)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'SERT Guardian'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'SERT Guardian'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>6
,p_version_scn=>46227287385865
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
,p_pwa_is_push_enabled=>'N'
);
wwv_flow_imp.component_end;
end;
/
