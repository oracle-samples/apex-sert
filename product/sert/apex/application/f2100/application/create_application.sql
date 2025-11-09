-- file_checksum: A6424F5890847C77F6B7719E41AF1D65C56371FB975F1DF595500BDD61B78BB6
prompt --application/create_application
begin
--   Manifest
--     FLOW: 2100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'SERT_PUB')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'APEX-SERT')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'APEX_SERT')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'7880FF7B1F9DBBC850F0329EA347D8A600D5723DC9960594A445ABCA76CCD0F1'
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
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(138499404854707068)
,p_application_tab_set=>0
,p_logo_type=>'T'
,p_logo_text=>'APEX-SERT'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'&G_RELEASE_VERSION.'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'Y'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'APEX-SERT'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>204
,p_version_scn=>45760148678001
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
,p_pwa_is_push_enabled=>'N'
,p_copyright_banner=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Copyright (c) 2024, #YEAR# Oracle and/or its affiliates.',
'',
'The Universal Permissive License (UPL), Version 1.0',
'',
'Subject to the condition set forth below, permission is hereby granted to any',
'person obtaining a copy of this software, associated documentation and/or data',
'(collectively the "Software"), free of charge and under any and all copyright',
'rights in the Software, and any and all patent rights owned or freely',
'licensable by each licensor hereunder covering either (i) the unmodified',
'Software as contributed to or provided by such licensor, or (ii) the Larger',
'Works (as defined below), to deal in both',
'',
'(a) the Software, and',
'(b) any piece of software and/or hardware listed in the lrgrwrks.txt file if',
'one is included with the Software (each a "Larger Work" to which the Software',
'is contributed by such licensors),',
'',
'without restriction, including without limitation the rights to copy, create',
'derivative works of, display, perform, and distribute the Software and make,',
'use, sell, offer for sale, import, export, have made, and have sold the',
'Software and the Larger Work(s), and to sublicense the foregoing rights on',
'either these or other terms.',
'',
'This license is subject to the following condition:',
'The above copyright notice and either this complete permission notice or at',
'a minimum a reference to the UPL must be included in all copies or',
'substantial portions of the Software.',
'',
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR',
'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,',
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE',
'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER',
'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,',
'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE',
'SOFTWARE.'))
);
wwv_flow_imp.component_end;
end;
/
