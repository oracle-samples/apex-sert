-- file_checksum: 7D16EB0CF98F9681B265A7D80AECB00D073FEB24684E3107FD27367C00FFB86E
prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>1266
,p_default_id_offset=>11322785363014083
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>4
,p_name=>'Calendar Page'
,p_alias=>'CALENDAR-PAGE'
,p_step_title=>'Calendar Page'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'08'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(97647021458373150)
,p_plug_name=>'Calendar Page &XSS_SCRIPT_ALERT_ESCAPED.  a < b > c'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''row1'' MODULE,',
'       SYSDATE -1 TIME_STAMP',
'from dual',
'union ',
'select ''row2'' MODULE,',
'       sysdate -2 TIME_STAMP',
'from dual',
'-- select ID,',
'--        LOGGER_LEVEL,',
'--        TEXT,',
'--        TIME_STAMP,',
'--        SCOPE,',
'--        MODULE,',
'--        ACTION,',
'--        USER_NAME,',
'--        CLIENT_IDENTIFIER,',
'--        CALL_STACK,',
'--        UNIT_NAME,',
'--        LINE_NO,',
'--        SCN,',
'--        EXTRA,',
'--        SID,',
'--        CLIENT_INFO',
'--   from LOGGER_LOGS',
'-- where time_stamp > sysdate -7'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_header=>' &XSS_SCRIPT_ALERT_ESCAPED. &XSS_SCRIPT_ALERT_ESCAPED!RAW. use of &amp;ESCAPED_ITEM!RAW. in a header can be dangerous'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_calendar_views', 'list:navigation',
  'display_column', 'MODULE',
  'event_sorting', 'AUTOMATIC',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'show_time', 'N',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'TIME_STAMP')).to_clob
,p_plug_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<SCRIPT>alert("XSS")</SCRIPT>"\>',
'\<a onmouseover="alert(document.cookie)"\>xxs link\</a\>'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(97848714784699430)
,p_plug_name=>'static Region &XSS_SCRIPT_ALERT_UNESCAPED.'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(97848546177699428)
,p_computation_sequence=>10
,p_computation_item=>'XSS_SCRIPT_ALERT_UNESCAPED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'<SCRIPT>alert("XSS")</SCRIPT>"\>'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(97848644697699429)
,p_computation_sequence=>20
,p_computation_item=>'XSS_SCRIPT_ALERT_ESCAPED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'XSS_SCRIPT_ALERT_UNESCAPED'
);
wwv_flow_imp.component_end;
end;
/
