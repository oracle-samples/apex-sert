-- file_checksum: 6F41475102EAABD2B78B41EFB33FCA5C3AA2F56DA3FE83CE398D675E30BFA89F
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00045
begin
--   Manifest
--     PAGE: 00045
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>45
,p_name=>'Exceptions Uploaded'
,p_alias=>'EXCEPTIONS-UPLOADED'
,p_page_mode=>'MODAL'
,p_step_title=>'Exceptions Uploaded'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(468192478777671210)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_height=>'1000'
,p_dialog_width=>'1400'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(104514702587194114)
,p_plug_name=>'Statuts'
,p_region_template_options=>'margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(468206296054671228)
,p_plug_display_sequence=>60
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1 as seq',
'  ,''Imported Successfully'' as label',
'  ,''fa fa-check'' as icon',
'  ,''u-success'' as icon_class',
'  ,:P45_IMPORT_SUCCESS as value  ',
'from',
'  dual',
'union',
'select',
'   2 as seq',
'  ,''Failed Imports'' as label',
'  ,''fa fa-times'' as icon',
'  ,''u-danger'' as icon_class',
'  ,:P45_IMPORT_FAIL as value  ',
'from',
'  dual',
'union',
'select',
'   3 as seq',
'  ,''Duplicate Exceptions'' as label',
'  ,''fa fa-copy'' as icon',
'  ,''u-warning'' as icon_class',
'  ,:P45_IMPORT_DUPLICATE as value  ',
'from',
'  dual',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(104515006018194117)
,p_region_id=>wwv_flow_imp.id(104514702587194114)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_title_adv_formatting=>false
,p_title_column_name=>'LABEL'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'DYNAMIC_CLASS'
,p_icon_class_column_name=>'ICON'
,p_icon_css_classes=>'&ICON_CLASS.'
,p_icon_position=>'START'
,p_badge_column_name=>'VALUE'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(426874714603579357)
,p_plug_name=>'Exception Upload Results'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468256028801671271)
,p_plug_display_sequence=>70
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  c001 as import_status',
' ,c002 as import_message',
' ,c003 as page_id',
' ,c004 as columnn_name',
' ,c005 as item_name',
' ,c006 as shared_comp_name',
' ,c007 as component_name',
' ,c008 as current_value',
' ,c009 as reason',
'from',
'  apex_collections',
'where',
'  collection_name = ''EXCEPTIONS''',
'order by c001, c002, c003'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(52391017472323202)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'MILOSZ.ZIMON@ORACLE.COM'
,p_internal_uid=>52391017472323202
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(52391146035323203)
,p_db_column_name=>'IMPORT_STATUS'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Import Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(52391289045323204)
,p_db_column_name=>'IMPORT_MESSAGE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Import Message'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(52391306641323205)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Page ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(52391465408323206)
,p_db_column_name=>'COLUMNN_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Columnn Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(52391514572323207)
,p_db_column_name=>'ITEM_NAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Item Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(52391698109323208)
,p_db_column_name=>'SHARED_COMP_NAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Shared Comp Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(52391768934323209)
,p_db_column_name=>'COMPONENT_NAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Component Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(52391863742323210)
,p_db_column_name=>'CURRENT_VALUE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Current Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(52391902276323211)
,p_db_column_name=>'REASON'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Reason'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(52729317591348805)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'527294'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'IMPORT_STATUS:IMPORT_MESSAGE:PAGE_ID:COLUMNN_NAME:ITEM_NAME:SHARED_COMP_NAME:COMPONENT_NAME:CURRENT_VALUE:REASON'
,p_sort_column_1=>'IMPORT_MESSAGE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PAGE_ID'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'COLUMNN_NAME'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'ITEM_NAME'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'IMPORT_STATUS'
,p_break_enabled_on=>'IMPORT_STATUS'
,p_count_columns_on_break=>'IMPORT_STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(470333781720919331)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468201967560671224)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(470334075425919334)
,p_plug_name=>'Steps'
,p_region_template_options=>'#DEFAULT#:margin-bottom-lg'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_imp.id(468199188089671222)
,p_plug_display_sequence=>10
,p_location=>null
,p_list_id=>wwv_flow_imp.id(51368190628558261)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(468534782685671345)
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51377118898441489)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(470333781720919331)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51377564366441487)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(470333781720919331)
,p_button_name=>'CLOSE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(51379966262441484)
,p_branch_name=>'Return to Evaluations'
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(51377564366441487)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52392062491323212)
,p_name=>'P45_IMPORT_SUCCESS'
,p_item_sequence=>30
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'from apex_collections',
'where collection_name = ''EXCEPTIONS''',
'and c001 = ''SUCCESS'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52392118276323213)
,p_name=>'P45_IMPORT_FAIL'
,p_item_sequence=>40
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'from apex_collections',
'where collection_name = ''EXCEPTIONS''',
'and c001 = ''FAIL'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52392220193323214)
,p_name=>'P45_IMPORT_DUPLICATE'
,p_item_sequence=>50
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'from apex_collections',
'where collection_name = ''EXCEPTIONS''',
'and c001 = ''FAIL''',
'and c002 like ''%duplicate%'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51378960908441485)
,p_name=>'Cancel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(51377118898441489)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51379441065441485)
,p_event_id=>wwv_flow_imp.id(51378960908441485)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp.component_end;
end;
/
