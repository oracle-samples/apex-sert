-- file_checksum: 8E78E92C2ECF85F80591D80392D5F5B58594596295151C283F566DC64B5E2893
prompt --application/pages/page_00400
begin
--   Manifest
--     PAGE: 00400
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
 p_id=>400
,p_name=>'TEST_CR'
,p_alias=>'TEST-CR'
,p_step_title=>'TEST_CR'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(37720035625982937)
,p_name=>'Report 1'
,p_template=>wwv_flow_imp.id(43728368363394113)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ATTRIBUTE_ID,',
'       CATEGORY_ID,',
'       ATTRIBUTE_NAME,',
'       ATTRIBUTE_KEY,',
'       ACTIVE_FLAG,',
'       RULE_SOURCE,',
'       TABLE_NAME,',
'       COLUMN_NAME,',
'       VIEW_NAME,',
'       SCORE_COLLECTION_ID,',
'       RULE_PLSQL,',
'       RULE_TYPE,',
'       INFO,',
'       FIX,',
'       WHEN_NOT_FOUND,',
'       SEQ,',
'       INTERNAL_FLAG,',
'       HELP_PAGE,',
'       IMPACT,',
'       COL_TEMPLATE_ID,',
'       DISPLAY_PAGE_ID,',
'       SUMMARY_PAGE_ID,',
'       COMPONENT_TABLE,',
'       COMPONENT_COLUMN_ID,',
'       COMPONENT_COLUMN_DISPLAY,',
'       COLUMN_TABLE,',
'       COLUMN_COLUMN_ID,',
'       COLUMN_COLUMN_DISPLAY,',
'       COMPONENT_SIG_ID,',
'       TIME_TO_FIX,',
'       SEVERITY_LEVEL',
'  from SV_SEC_ATTRIBUTES'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(43718414101394098)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37719650684982932)
,p_query_column_id=>1
,p_column_alias=>'ATTRIBUTE_ID'
,p_column_display_sequence=>10
,p_column_heading=>'Attribute Id'
,p_use_as_row_header=>'N'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37719215774982931)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>20
,p_column_heading=>'Category Id'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37718836127982930)
,p_query_column_id=>3
,p_column_alias=>'ATTRIBUTE_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Attribute Name'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37718411923982930)
,p_query_column_id=>4
,p_column_alias=>'ATTRIBUTE_KEY'
,p_column_display_sequence=>40
,p_column_heading=>'Attribute Key'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37717988424982930)
,p_query_column_id=>5
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>50
,p_column_heading=>'Active Flag'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37717627837982929)
,p_query_column_id=>6
,p_column_alias=>'RULE_SOURCE'
,p_column_display_sequence=>60
,p_column_heading=>'Rule Source'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37717243361982929)
,p_query_column_id=>7
,p_column_alias=>'TABLE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Table Name'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37716853961982929)
,p_query_column_id=>8
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Column Name'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37716389462982928)
,p_query_column_id=>9
,p_column_alias=>'VIEW_NAME'
,p_column_display_sequence=>90
,p_column_heading=>'View Name'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37715987815982928)
,p_query_column_id=>10
,p_column_alias=>'SCORE_COLLECTION_ID'
,p_column_display_sequence=>100
,p_column_heading=>'Score Collection Id'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37715685613982928)
,p_query_column_id=>11
,p_column_alias=>'RULE_PLSQL'
,p_column_display_sequence=>110
,p_column_heading=>'Rule Plsql'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37715204075982927)
,p_query_column_id=>12
,p_column_alias=>'RULE_TYPE'
,p_column_display_sequence=>120
,p_column_heading=>'Rule Type'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37714881519982927)
,p_query_column_id=>13
,p_column_alias=>'INFO'
,p_column_display_sequence=>130
,p_column_heading=>'Info'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37714401799982927)
,p_query_column_id=>14
,p_column_alias=>'FIX'
,p_column_display_sequence=>140
,p_column_heading=>'Fix'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37714032196982926)
,p_query_column_id=>15
,p_column_alias=>'WHEN_NOT_FOUND'
,p_column_display_sequence=>150
,p_column_heading=>'When Not Found'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37713664965982926)
,p_query_column_id=>16
,p_column_alias=>'SEQ'
,p_column_display_sequence=>160
,p_column_heading=>'Seq'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37713269333982926)
,p_query_column_id=>17
,p_column_alias=>'INTERNAL_FLAG'
,p_column_display_sequence=>170
,p_column_heading=>'Internal Flag'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37712856756982925)
,p_query_column_id=>18
,p_column_alias=>'HELP_PAGE'
,p_column_display_sequence=>180
,p_column_heading=>'Help Page'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37712423881982925)
,p_query_column_id=>19
,p_column_alias=>'IMPACT'
,p_column_display_sequence=>190
,p_column_heading=>'Impact'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37712024588982925)
,p_query_column_id=>20
,p_column_alias=>'COL_TEMPLATE_ID'
,p_column_display_sequence=>200
,p_column_heading=>'Col Template Id'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37711652224982924)
,p_query_column_id=>21
,p_column_alias=>'DISPLAY_PAGE_ID'
,p_column_display_sequence=>210
,p_column_heading=>'Display Page Id'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37711197533982924)
,p_query_column_id=>22
,p_column_alias=>'SUMMARY_PAGE_ID'
,p_column_display_sequence=>220
,p_column_heading=>'Summary Page Id'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37710878420982924)
,p_query_column_id=>23
,p_column_alias=>'COMPONENT_TABLE'
,p_column_display_sequence=>230
,p_column_heading=>'Component Table'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37710446428982923)
,p_query_column_id=>24
,p_column_alias=>'COMPONENT_COLUMN_ID'
,p_column_display_sequence=>240
,p_column_heading=>'Component Column Id'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37710024526982923)
,p_query_column_id=>25
,p_column_alias=>'COMPONENT_COLUMN_DISPLAY'
,p_column_display_sequence=>250
,p_column_heading=>'Component Column Display'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37709637598982923)
,p_query_column_id=>26
,p_column_alias=>'COLUMN_TABLE'
,p_column_display_sequence=>260
,p_column_heading=>'Column Table'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37709260186982922)
,p_query_column_id=>27
,p_column_alias=>'COLUMN_COLUMN_ID'
,p_column_display_sequence=>270
,p_column_heading=>'Column Column Id'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37708818358982921)
,p_query_column_id=>28
,p_column_alias=>'COLUMN_COLUMN_DISPLAY'
,p_column_display_sequence=>280
,p_column_heading=>'Column Column Display'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37708458990982921)
,p_query_column_id=>29
,p_column_alias=>'COMPONENT_SIG_ID'
,p_column_display_sequence=>290
,p_column_heading=>'Component Sig Id'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37708061226982921)
,p_query_column_id=>30
,p_column_alias=>'TIME_TO_FIX'
,p_column_display_sequence=>300
,p_column_heading=>'Time To Fix'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37707607748982920)
,p_query_column_id=>31
,p_column_alias=>'SEVERITY_LEVEL'
,p_column_display_sequence=>310
,p_column_heading=>'Severity Level'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(98650062532227859)
,p_plug_name=>'Report 1_rest'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(43728883880394113)
,p_plug_display_sequence=>20
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(102541085801793404)
,p_query_type=>'SQL'
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Report 1_rest'
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
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(102544615191800644)
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
,p_internal_uid=>76003460456550319
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(102544727010800645)
,p_db_column_name=>'COLUMN_1_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Column 1 Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(102544828069800646)
,p_db_column_name=>'COLUMN_2_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Column 2 Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(102544907808800647)
,p_db_column_name=>'COLUMN_3_HIREDATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Column 3 Hiredate'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp.component_end;
end;
/
