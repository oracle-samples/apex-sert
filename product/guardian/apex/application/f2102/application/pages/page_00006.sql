-- file_checksum: A17EF1FCE105299312A8917E330E308C72BC3975F398B2F6D8729701B7891F1D
prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2102
,p_default_id_offset=>69907164856017883
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>6
,p_name=>'Application Details'
,p_alias=>'APPLICATION-DETAILS'
,p_step_title=>'Application Details'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Adjust dialog width for confirmation message */',
'.ui-dialog--notification {',
'    width: 400px !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(30658409527755022737)
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(139310204087438202)
,p_plug_name=>'Application no longer exists'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning:t-Alert--accessibleHeading'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>'Application &P6_APPLICATION_NAME. no longer exists. It may has been deleted, or re-imported using a different workspace or application id.'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P6_APP_EXISTS_YN'
,p_plug_display_when_cond2=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(34586985181645449481)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(30658404260306022718)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(34587258087164477112)
,p_plug_name=>'Daily page events for the last year'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h240:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(34587258162851477113)
,p_region_id=>wwv_flow_imp.id(34587258087164477112)
,p_chart_type=>'bar'
,p_height=>'240'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_time_axis_type=>'enabled'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(34587258322110477114)
,p_chart_id=>wwv_flow_imp.id(34587258162851477113)
,p_seq=>10
,p_name=>'Daily page events for last year'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (',
'    select l_start_date + level - 1 as log_day',
'    from (',
'        select trunc(add_months(sysdate, -11), ''mm'') as l_start_date,',
'               trunc(sysdate)                        as l_end_date',
'        from dual',
'    )',
'    connect by level <= (l_end_date - l_start_date) + 1',
')',
'select d.log_day,',
'       nvl(a.page_events, 0) as page_events',
'from dates d',
'left join apex_workspace_log_archive a on (d.log_day = a.log_day and a.application_id = :P6_APPLICATION_ID and a.workspace_id = :P6_WORKSPACE_ID)',
'order by d.log_day asc'))
,p_items_value_column_name=>'PAGE_EVENTS'
,p_items_label_column_name=>'LOG_DAY'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(34587258340619477115)
,p_chart_id=>wwv_flow_imp.id(34587258162851477113)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Date'
,p_format_type=>'date-short'
,p_numeric_pattern=>'E d MMM yyyy'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_major_tick_rendered=>'on'
,p_min_step=>14
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(34587258481686477116)
,p_chart_id=>wwv_flow_imp.id(34587258162851477113)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Page Events'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(67983273758300181178)
,p_name=>'Context'
,p_template=>4501440665235496320
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked:t-Report--hideNoPagination'
,p_display_point=>'REGION_POSITION_01'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if sg_util.exists_4wk_app_activity (',
'    p_workspace_id   => :P6_WORKSPACE_ID,',
'    p_application_id => :P6_APPLICATION_ID )',
'then',
'    -- apps with activity that may not be sert apps',
'    return q''~',
'    with ranked_activity as (',
'        select t.workspace_id, t.workspace, t.application_id, t.application_name, t.app_size, t.pages,',
'               dense_rank() over (order by t.page_events desc, t.application_name) rank',
'          from sg_most_4wk_app_activity_f t',
'    )',
'    select app.workspace, app.application_id, app.application_name, ',
'           a.authentication_scheme_type, a.last_updated_on, ',
'           app.pages, app.app_size, app.rank,',
'           sg.eval_on as sg_eval_on,',
'           (select -- use live value because gets refreshed on evaluation',
'                   max(e.eval_on) ',
'              from evals e',
'              join rule_sets r on (e.rule_set_id = r.rule_set_id and r.rule_set_key = ''SERT-SECURITY'')',
'             where e.application_id = app.application_id',
'               and e.workspace_id = app.workspace_id) as sert_eval_on,',
'           (select last_sync from sg_last_completed_main_etl_v) last_sync',
'      from ranked_activity app',
'      left join apex_applications a on (app.workspace_id = a.workspace_id and app.application_id = a.application_id)',
'      left join sg_applications_d sg on (app.workspace_id = sg.workspace_id and app.application_id = sg.application_id)',
'     where app.application_id = :P6_APPLICATION_ID',
'       and app.workspace_id = :P6_WORKSPACE_ID',
'    ~'';',
'',
'else',
'    -- apps without activity that are sert apps',
'    return q''~       ',
'    select app.workspace, app.application_id, app.application_name, ',
'           a.authentication_scheme_type, a.last_updated_on, ',
'           app.pages, app.app_size, null rank,',
'           app.eval_on as sg_eval_on,',
'           (select -- use live value because gets refreshed on evaluation',
'                   max(e.eval_on) ',
'              from evals e',
'              join rule_sets r on (e.rule_set_id = r.rule_set_id and r.rule_set_key = ''SERT-SECURITY'')',
'             where e.application_id = app.application_id',
'               and e.workspace_id = app.workspace_id) as sert_eval_on,',
'           (select last_sync from sg_last_completed_main_etl_v) last_sync',
'      from sg_applications_d app',
'      left join apex_applications a on (app.workspace_id = a.workspace_id and app.application_id = a.application_id)',
'     where app.application_id = :P6_APPLICATION_ID',
'       and app.workspace_id = :P6_WORKSPACE_ID',
'    ~'';',
'',
'end if;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2115772683903439354
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'APEX application no longer exists - please synchronize to view current data.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612025896616904950)
,p_query_column_id=>1
,p_column_alias=>'WORKSPACE'
,p_column_display_sequence=>10
,p_column_heading=>'Workspace'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612026039127904951)
,p_query_column_id=>2
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>20
,p_column_heading=>'Application Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612026138119904952)
,p_query_column_id=>3
,p_column_alias=>'APPLICATION_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Application Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612026187351904953)
,p_query_column_id=>4
,p_column_alias=>'AUTHENTICATION_SCHEME_TYPE'
,p_column_display_sequence=>40
,p_column_heading=>'Authentication Scheme Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612026264856904954)
,p_query_column_id=>5
,p_column_alias=>'LAST_UPDATED_ON'
,p_column_display_sequence=>50
,p_column_heading=>'Last Updated On'
,p_column_format=>'YYYY-MM-DD'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612026420059904955)
,p_query_column_id=>6
,p_column_alias=>'PAGES'
,p_column_display_sequence=>60
,p_column_heading=>'Pages'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612026507618904956)
,p_query_column_id=>7
,p_column_alias=>'APP_SIZE'
,p_column_display_sequence=>70
,p_column_heading=>'App Size'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(33612026602727904957)
,p_query_column_id=>8
,p_column_alias=>'RANK'
,p_column_display_sequence=>80
,p_column_heading=>'Rank'
,p_column_html_expression=>'<span title="Activity rank for last 2 weeks">#RANK#</span>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(34814344386677673733)
,p_query_column_id=>9
,p_column_alias=>'SG_EVAL_ON'
,p_column_display_sequence=>90
,p_column_heading=>'Guardian Eval On'
,p_column_format=>'YYYY-MM-DD'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:P3_WORKSPACE,P3_APPLICATION_NAME:#WORKSPACE#,#APPLICATION_NAME#'
,p_column_linktext=>'#SG_EVAL_ON#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(34814344489674673734)
,p_query_column_id=>10
,p_column_alias=>'SERT_EVAL_ON'
,p_column_display_sequence=>100
,p_column_heading=>'SERT Eval On'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(34814344544113673735)
,p_query_column_id=>11
,p_column_alias=>'LAST_SYNC'
,p_column_display_sequence=>110
,p_column_heading=>'Last Sync'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35797438777374713724)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(34586985181645449481)
,p_button_name=>'EVALUATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Run Evaluation'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P6_APP_EXISTS_YN'
,p_button_condition2=>'Y'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_button_css_classes=>'title="Run SERT security evaluation as a background task"'
,p_icon_css_classes=>'fa-database-arrow-up'
,p_security_scheme=>wwv_flow_imp.id(30658409527755022737)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(139310064520438200)
,p_name=>'P6_APP_EXISTS_YN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(67983273758300181178)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34587257781794477109)
,p_name=>'P6_APPLICATION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(67983273758300181178)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34587257865492477110)
,p_name=>'P6_APPLICATION_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(67983273758300181178)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34587258581658477117)
,p_name=>'P6_WORKSPACE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(67983273758300181178)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34814344959499673739)
,p_name=>'P6_ESTIMATED_DURATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(67983273758300181178)
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(34587257984401477111)
,p_computation_sequence=>10
,p_computation_item=>'P6_APPLICATION_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Return name when application activity exists',
'for c in (',
'    select application_name',
'      from sg_most_4wk_app_activity_f',
'     where application_id = :P6_APPLICATION_ID',
'       and workspace_id = :P6_WORKSPACE_ID )',
'loop',
'    return c.application_name;',
'end loop;',
'',
'-- Otherwise return name for SERT application',
'for c in (',
'    select application_name',
'      from sg_applications_d',
'     where application_id = :P6_APPLICATION_ID',
'       and workspace_id = :P6_WORKSPACE_ID )',
'loop',
'    return c.application_name;',
'end loop;',
''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(34814345048173673740)
,p_computation_sequence=>30
,p_computation_item=>'P6_ESTIMATED_DURATION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--',
'-- Estimate evaluation duration based on similar sized application',
'--',
'declare',
'    l_diff          interval day to second;',
'    l_duration_sec  number := 30; -- default',
'    l_pages         number;',
'    l_t0            timestamp with local time zone;',
'    l_t1            timestamp with local time zone;',
'begin',
'    select nvl(max(pages), 30)',
'      into l_pages',
'      from sg_most_4wk_app_activity_f',
'     where application_id = :P6_APPLICATION_ID',
'       and workspace_id = :P6_WORKSPACE_ID;',
'',
'    -- Find a similar sized app for our estimate',
'    for c in (',
'        select e.eval_id, a.pages, e.eval_on',
'          from evals e',
'          join sg_applications_d a on (a.workspace_id = e.workspace_id and a.application_id = e.application_id and a.eval_on = e.eval_on)',
'         where e.rule_set_id = (select rule_set_id from rule_sets_pub_v where rule_set_key = ''SERT-SECURITY'')',
'           and e.job_status = ''COMPLETED''',
'           and a.pages >= l_pages*0.90 ',
'         order by case when a.application_id = :P6_APPLICATION_ID then 1 else 2 end,',
'                  a.pages, ',
'                  a.eval_on desc',
'         fetch first 1 rows only )',
'    loop',
'        ',
'        select min(r.created_on) into l_t0 from eval_results r where r.eval_id = c.eval_id;',
'        select max(r.created_on) into l_t1 from eval_results r where r.eval_id = c.eval_id;',
'',
'        l_diff := l_t1 - l_t0;',
'',
'        l_duration_sec := round(',
'           extract(day from l_diff) * 86400 +',
'           extract(hour from l_diff) * 3600 +',
'           extract(minute from l_diff) * 60 +',
'           extract(second from l_diff), 3);',
'    end loop;',
'',
'    return l_duration_sec;',
'end;',
''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(139310128982438201)
,p_computation_sequence=>40
,p_computation_item=>'P6_APP_EXISTS_YN'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when count(*) > 0 then ''Y'' else ''N'' end app_exists',
'  from apex_applications',
' where application_id = :P6_APPLICATION_ID',
'   and workspace_id = :P6_WORKSPACE_ID'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35797672783113067266)
,p_name=>'Confirm background task'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35797438777374713724)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35797673153121067269)
,p_event_id=>wwv_flow_imp.id(35797672783113067266)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>SERT security evalution will run as a background task.<br>',
'Refresh the page manually to see updated data.</p>',
'<p>Estimated time: &P6_ESTIMATED_DURATION. seconds</p>'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35797673679036067270)
,p_event_id=>wwv_flow_imp.id(35797672783113067266)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_application_id number := :P6_APPLICATION_ID;',
'    l_eval_id number;',
'begin',
'    eval_pkg.eval(',
'        p_application_id    => l_application_id,',
'        p_rule_set_key      => ''SERT-SECURITY'',',
'        p_run_in_background => ''Y'',',
'        p_eval_id_out       => l_eval_id );',
'end;',
''))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(139308599558438186)
,p_event_id=>wwv_flow_imp.id(35797672783113067266)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.setDismissPreferences({dismissPageSuccess: true});',
'apex.message.showPageSuccess( "SERT evaluation started as a background task." );'))
);
wwv_flow_imp.component_end;
end;
/
