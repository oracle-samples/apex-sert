-- file_checksum: A123595B9228E6C13D9D0618773B9089D037A3CFEC4D21427D967EE4FE02E5DA
prompt --application/pages/page_00301
begin
--   Manifest
--     PAGE: 00301
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
 p_id=>301
,p_name=>'Calendar'
,p_step_title=>'Calendar'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'08'
);
wwv_flow_imp_page.create_calendar(
 p_id=>wwv_flow_imp.id(43632242820237444)
,p_plug_name=>'Legacy Calendar'
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  1 ID,',
'  SYSDATE START_DATE,',
'  SYSDATE END_DATE,',
'  ''x'' TASK_NAME',
'from ',
'  DUAL',
'WHERE',
'  1 = ''&P1_ITEM.''',
'  AND ''DBMS_SQL'' = ''EXECUTE IMMEDIATE'''))
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_imp.id(43632186694237443)
,p_begin_at_start_of_interval=>'Y'
,p_display_as=>'M'
,p_display_type=>'COL'
,p_date_column=>'START_DATE'
,p_display_column=>'TASK_NAME'
,p_start_of_week=>19721105
,p_start_time=>8
,p_end_time=>18
,p_time_format=>'24HOUR'
,p_week_start_day=>19721105
,p_week_end_day=>19721111
,p_custom_cal_days=>3
,p_item_link_open_in=>'W'
,p_include_time_with_date=>'N'
,p_agenda_cal_days_type=>'MONTH'
,p_agenda_cal_days=>30
,p_template_id=>wwv_flow_imp.id(43704935681394067)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(43633520732237457)
,p_plug_name=>'CalendarTitle'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(43728368363394113)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  1 ID,',
'  SYSDATE START_DATE,',
'  SYSDATE END_DATE,',
'  ''x'' TASK_NAME',
'from ',
'  DUAL',
'WHERE',
'  1 = ''&P1_ITEM.''',
'  AND ''DBMS_SQL'' = ''EXECUTE IMMEDIATE'''))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_calendar_views', 'list:navigation',
  'display_column', 'TASK_NAME',
  'event_sorting', 'AUTOMATIC',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'show_time', 'N',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'START_DATE')).to_clob
);
wwv_flow_imp.component_end;
end;
/
