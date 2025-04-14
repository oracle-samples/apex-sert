--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset SERT:aop_db_package-create runOnChange:true endDelimiter:/ stripComments=false
--preconditions onFail:MARK_RAN onError:HALT
---------------------------------------------------------------------
--
---------------------------------------------------------------------
-- set define off verify off feedback off

create or replace package sert_core.aop_api22_pkg
AUTHID CURRENT_USER
as

/* Copyright 2015-2022 - APEX RnD - United Codes
*/

--## CONSTANTS

--### AOP Version
-- The version of APEX Office Print (AOP)
c_aop_version               constant varchar2(6)  := '22.2';

--### AOP URLs
-- The default url for the AOP Server
c_aop_url                   constant varchar2(50) := 'http://api.apexofficeprint.com/';
-- The default url for the AOP Fallback Server in case the c_aop_url would fail
c_aop_url_fallback          constant varchar2(50) := 'http://www.cloudofficeprint.com/aop/';
-- The default secure url for the AOP Server
c_aop_url_secure            constant varchar2(50) := 'https://api.apexofficeprint.com/';
-- The default secure url for the AOP Fallback Server
c_aop_url_secure_fallback   constant varchar2(50) := 'https://www.cloudofficeprint.com/aop/';
-- The url for the AOP Server in the Oracle Cloud US (Ashburn)
c_aop_url_oci_us            constant varchar2(50) := 'https://api-us.apexofficeprint.com/';
-- The url for the AOP Server in the Oracle Cloud EU (Frankfurt)
c_aop_url_oci_eu            constant varchar2(50) := 'https://api-eu.apexofficeprint.com/';
-- The url for the AOP Server in the Oracle Cloud APAC
c_aop_url_oci_apac          constant varchar2(50) := 'https://api-apac.apexofficeprint.com/';

--### Available constants
--### _Template and Data Type_
c_source_type_apex          constant varchar2(4)  := 'APEX';           -- Template Type
c_source_type_workspace     constant varchar2(9)  := 'WORKSPACE';      -- Template Type
c_source_type_sql           constant varchar2(3)  := 'SQL';            -- Template and Data Type
c_source_type_plsql_sql     constant varchar2(9)  := 'PLSQL_SQL';      -- Template and Data Type
c_source_type_plsql         constant varchar2(5)  := 'PLSQL';          -- Template and Data Type
c_source_type_url           constant varchar2(3)  := 'URL';            -- Template and Data Type
c_source_type_url_aop       constant varchar2(7)  := 'URL_AOP';        -- Template Type
c_source_type_rpt           constant varchar2(6)  := 'IR';             -- Data Type
c_source_type_xml           constant varchar2(3)  := 'XML';            -- Data Type
c_source_type_json          constant varchar2(4)  := 'JSON';           -- Template and Data Type
c_source_type_json_files    constant varchar2(10) := 'JSON_FILES';     -- Data Type
c_source_type_refcursor     constant varchar2(9)  := 'REFCURSOR';      -- Data Type
c_source_type_sql_array     constant varchar2(9)  := 'SQL_ARRAY';      -- Data Type
c_source_type_filename      constant varchar2(8)  := 'FILENAME';       -- Template Type
c_source_type_db_directory  constant varchar2(12) := 'DB_DIRECTORY';   -- Template Type
c_source_type_aop_report    constant varchar2(10) := 'AOP_REPORT';     -- Template Type
c_source_type_apex_report   constant varchar2(11) := 'APEX_REPORT';    -- Template Type
c_source_type_apex_report_do constant varchar2(14):= 'APEX_REPORT_DO'; -- Template Type
c_source_type_layouts       constant varchar2(14) := 'REPORT_LAYOUTS'; -- Template Type
c_source_type_aop_template  constant varchar2(1)  := null;             -- Template Type
c_source_type_clob_base64   constant varchar2(11) := 'CLOB_BASE64';    -- Template Type
c_source_type_oci_objs      constant varchar2(8)  := 'OCI_OBJS';       -- Template Type
c_source_type_none          constant varchar2(4)  := 'NONE';           -- Template and Data Type
--### Converter
c_source_type_converter     constant varchar2(9)  := 'CONVERTER';
--### Mime Type
c_mime_type_docx            constant varchar2(71) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
c_mime_type_xlsx            constant varchar2(65) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
c_mime_type_pptx            constant varchar2(73) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
c_mime_type_odt             constant varchar2(39) := 'application/vnd.oasis.opendocument.text';
c_mime_type_ods             constant varchar2(46) := 'application/vnd.oasis.opendocument.spreadsheet';
c_mime_type_odp             constant varchar2(47) := 'application/vnd.oasis.opendocument.presentation';
c_mime_type_pdf             constant varchar2(15) := 'application/pdf';
c_mime_type_html            constant varchar2(9)  := 'text/html';
c_mime_type_markdown        constant varchar2(13) := 'text/markdown';
c_mime_type_rtf             constant varchar2(15) := 'application/rtf';
c_mime_type_json            constant varchar2(16) := 'application/json';
c_mime_type_xml             constant varchar2(15) := 'application/xml';
c_mime_type_text            constant varchar2(10) := 'text/plain';
c_mime_type_csv             constant varchar2(10) := 'text/csv';
c_mime_type_png             constant varchar2(9)  := 'image/png';
c_mime_type_jpg             constant varchar2(10) := 'image/jpeg';
c_mime_type_gif             constant varchar2(9)  := 'image/gif';
c_mime_type_bmp             constant varchar2(9)  := 'image/bmp';
c_mime_type_msbmp           constant varchar2(19) := 'image/x-windows-bmp';
c_mime_type_docm            constant varchar2(48) := 'application/vnd.ms-word.document.macroenabled.12';
c_mime_type_xlsm            constant varchar2(46) := 'application/vnd.ms-excel.sheet.macroenabled.12';
c_mime_type_pptm            constant varchar2(58) := 'application/vnd.ms-powerpoint.presentation.macroenabled.12';
c_mime_type_ics             constant varchar2(13) := 'text/calendar';
c_mime_type_ifb             constant varchar2(13) := 'text/calendar';
c_mime_type_eml             constant varchar2(14) := 'message/rfc822';
c_mime_type_msg             constant varchar2(26) := 'application/vnd.ms-outlook';
--### Calender Type
c_cal_month                 constant varchar2(19) := 'month';
c_cal_week                  constant varchar2(19) := 'week';
c_cal_day                   constant varchar2(19) := 'day';
c_cal_list                  constant varchar2(19) := 'list';
--### Output Encoding
c_output_encoding_raw       constant varchar2(3)  := 'raw';
c_output_encoding_base64    constant varchar2(6)  := 'base64';
--### Output Type
c_word_docx                 constant varchar2(4)  := 'docx';
c_excel_xlsx                constant varchar2(4)  := 'xlsx';
c_powerpoint_pptx           constant varchar2(4)  := 'pptx';
c_opendocument_odt          constant varchar2(3)  := 'odt';
c_opendocument_ods          constant varchar2(3)  := 'ods';
c_opendocument_odp          constant varchar2(3)  := 'odp';
c_pdf_pdf                   constant varchar2(3)  := 'pdf';
c_html_html                 constant varchar2(4)  := 'html';
c_markdown_md               constant varchar2(2)  := 'md';
c_text_txt                  constant varchar2(3)  := 'txt';
c_csv_csv                   constant varchar2(3)  := 'csv';
c_word_rtf                  constant varchar2(3)  := 'rtf';
c_word_macro_docm           constant varchar2(4)  := 'docm';
c_excel_macro_xlsm          constant varchar2(4)  := 'xlsm';
c_powerpoint_macro_pptm     constant varchar2(4)  := 'pptm';
c_calendar_ics              constant varchar2(3)  := 'ics';
c_calendar_ifb              constant varchar2(3)  := 'ifb';
c_json_json                 constant varchar2(4)  := 'json';
c_xml_xml                   constant varchar2(3)  := 'xml';
c_email_eml                 constant varchar2(3)  := 'eml';
c_email_msg                 constant varchar2(3)  := 'msg';
c_onepagepdf_pdf            constant varchar2(10) := 'onepagepdf';
c_count_tags                constant varchar2(10) := 'count_tags';
c_form_fields               constant varchar2(11) := 'form_fields';
c_defined_by_apex_item      constant varchar2(9)  := 'apex_item';
--### Output To
c_output_return             constant varchar2(1)  := null;
c_output_browser            constant varchar2(7)  := 'BROWSER';
c_output_procedure          constant varchar2(9)  := 'PROCEDURE';
c_output_procedure_browser  constant varchar2(17) := 'PROCEDURE_BROWSER';
c_output_procedure_inline   constant varchar2(17) := 'PROCEDURE_INLINE';
c_output_inline             constant varchar2(14) := 'BROWSER_INLINE';
c_output_directory          constant varchar2(9)  := 'DIRECTORY';
c_output_db_directory       constant varchar2(12) := 'DB_DIRECTORY';
c_output_cloud              constant varchar2(5)  := 'CLOUD';
c_output_async              constant varchar2(5)  := 'ASYNC';
c_output_web_service        constant varchar2(12) := 'WEB_SERVICE';
c_apex_office_edit          constant varchar2(16) := 'APEX_OFFICE_EDIT';
--### Special
c_special_number_as_string  constant varchar2(16) := 'NUMBER_TO_STRING';
c_special_report_as_label   constant varchar2(16) := 'REPORT_AS_LABELS';
c_special_ir_filters_top    constant varchar2(14) := 'FILTERS_ON_TOP';
c_special_ir_highlights_top constant varchar2(17) := 'HIGHLIGHTS_ON_TOP';
c_special_ir_excel_header_f constant varchar2(18) := 'HEADER_WITH_FILTER';
c_special_ir_saved_report   constant varchar2(19) := 'ALWAYS_REPORT_ALIAS';
c_special_ir_repeat_header  constant varchar2(13) := 'REPEAT_HEADER';
c_obfuscate_data            constant varchar2(14) := 'OBFUSCATE_DATA';
--### Debug
c_debug_remote              constant varchar2(3)  := 'Yes';
c_debug_local               constant varchar2(5)  := 'Local';
c_debug_application_item    constant varchar2(9)  := 'APEX_ITEM';
--### Converter
c_converter_libreoffice     constant varchar2(7)  := 'soffice';            -- LibreOffice
c_converter_libreoffice_sa  constant varchar2(18) := 'soffice-standalone'; -- LibreOffice Standalone
c_converter_msoffice        constant varchar2(11) := 'officetopdf';        -- MS Office (only Windows)
c_converter_custom          constant varchar2(7)  := 'custom';             -- Custom converter defined in the AOP Server config
--### Mode
c_mode_production           constant varchar2(15) := 'production';
c_mode_development          constant varchar2(15) := 'development';
--### Supported Languages; used for the translation of IR
c_en                        constant varchar2(5)  := 'en';
c_nl                        constant varchar2(5)  := 'nl';
c_fr                        constant varchar2(5)  := 'fr';
c_de                        constant varchar2(5)  := 'de';
--### Strings
c_init_null                 constant varchar2(5)  := 'null;';
c_false                     constant varchar2(5)  := 'false';
c_true                      constant varchar2(4)  := 'true';
c_yes                       constant varchar2(3)  := 'Yes';
c_no                        constant varchar2(2)  := 'No';
c_y                         constant varchar2(1)  := 'Y';
c_n                         constant varchar2(1)  := 'N';
--### Internal Use for conditional compilation - see api.sql
c_apex_050                  constant pls_integer  := 20130101;
c_apex_051                  constant pls_integer  := 20160824;
c_apex_181                  constant pls_integer  := 20180404;
c_apex_191                  constant pls_integer  := 20190331;
c_apex_192                  constant pls_integer  := 20191004;
c_apex_201                  constant pls_integer  := 20200331;
c_apex_202                  constant pls_integer  := 20201001;
c_apex_211                  constant pls_integer  := 20210415;

--## TYPES
type t_query is record (
    name  varchar2(30),
    query varchar2(32767),
    binds wwv_flow_plugin_util.t_bind_list);

type t_query_list is table of t_query index by pls_integer;

c_sql_array t_query_list;

--type t_bind_record is record(name varchar2(100), value varchar2(32767));
--type t_bind_table  is table of t_bind_record index by pls_integer;
c_binds wwv_flow_plugin_util.t_bind_list;


--## VARIABLES

--### Logger
g_logger_enabled             boolean := true;        -- In case you use Logger (https://github.com/OraOpenSource/Logger), you can compile this package to enable Logger output:
                                                     -- SQL> ALTER PACKAGE aop_api22_pkg COMPILE PLSQL_CCFLAGS = 'logger_on:TRUE';
                                                     -- When compiled and this global variable is set to true, debug will be written to logger too
--### Call to AOP
g_aop_url                    varchar2(200) := null;  -- AOP Server url
g_api_key                    varchar2(50)  := null;  -- AOP API Key; only needed when AOP Cloud is used (http(s)://www.apexofficeprint.com/api)
g_aop_mode                   varchar2(15)  := null;  -- AOP Mode can be development or production; when running in development no cloud credits are used but a watermark is printed
g_failover_aop_url           varchar2(200) := null;  -- AOP Server url in case of failure of AOP url
g_failover_procedure         varchar2(200) := null;  -- When the failover url is used, the procedure specified in this variable will be called
g_template_type              varchar2(100) := null;  -- Specify the template type (xlsx, docx, ...) in case the filename is not part of the template source (e.g. URL of OneDrive or Object Storage)
g_output_converter           varchar2(50)  := null;  -- Set the converter to go to PDF (or other format different from template) e.g. officetopdf, libreoffice or libreoffice-standalone
g_output_correct_page_nr     boolean       := false; -- boolean to check for AOPMergePage text to replace it with the page number.
g_output_lock_form           boolean       := false; -- boolean that determines if the pdf forms should be locked/flattened.
g_lock_form_ignoring_sign    boolean       := false; -- boolean that determines to lock/flatten everything in the output PDF but not the signature fields
g_sign_certificate_field     varchar2(100) := '';    -- the name of the signature field to sign the output document (optional: invisible signature will be placed otherwise)
g_identify_form_fields       boolean       := false; -- boolean that fills in the name of the fields of a PDF Form in the field itself so it's easy to identify which field is at what position
g_proxy_override             varchar2(300) := null;  -- null=proxy defined in the application attributes
g_transfer_timeout           number(6)     := 1800;  -- default of APEX is 180
g_wallet_path                varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_wallet_pwd                 varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_https_host                 varchar2(300) := null;  -- The host name to be matched against the common name (CN) of the remote server's certificate for an HTTPS request.
g_output_filename            varchar2(300) := null;  -- output
g_cloud_provider             varchar2(100) := null;  -- dropbox, gdrive, onedrive, aws_s3, (s)ftp
g_cloud_location             varchar2(4000):= null;  -- directory in dropbox, gdrive, onedrive, aws_s3 (with bucket), (s)ftp
g_cloud_access_token         varchar2(4000):= null;  -- access token or credentials for dropbox, gdrive, onedrive, aws_s3, (s)ftp (needs json)
g_language                   varchar2(2)   := c_en;  -- Language can be: en, fr, nl, de, used for the translation of filters applied etc. (translation build-in AOP)
g_app_language               varchar2(20)  := null;  -- Language specified in the APEX app (primary language, translated language), when left to null, apex_util.get_session_lang is being used
g_logging                    clob          := '';    -- ability to add your own logging: e.g. "request_id":"123", "request_app":"APEX", "request_user":"RND"
g_debug                      varchar2(10)  := null;  -- set to 'Local' when only the JSON needs to be generated, 'Remote' for remote debug
g_debug_procedure            varchar2(4000):= null;  -- when debug in APEX is turned on, next to the normal APEX debug, this procedure will be called
                                                     --   e.g. to write to your own debug table. The definition of the procedure needs to be the same as aop_debug
g_special                    varchar2(4000):= null;  -- Special settings defined in the APEX Plug-in concerning Reports (colon separated), see p_special
g_app_id                     number        := null;  -- APEX application id
g_page_id                    number        := null;  -- APEX page id
g_user_name                  varchar2(200) := null;  -- APEX user name (APP_USER)
--### APEX Page Items
g_apex_items                 varchar2(4000):= null;  -- colon-separated list of APEX items e.g. P1_X:P1_Y, which can be referenced in a template using {Pxx_ITEM}
                                                     -- you can only use this global variable in combination with reports (classic, IR, IG, ...).
                                                     -- When using a SQL Query, you can define the page item in your SQL query, e.g. :P1_ITEM as "P1_ITEM"
--### Layout for IR
g_rpt_header_font_name       varchar2(50)  := '';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163
g_rpt_header_font_size       varchar2(3)   := '';    -- 14
g_rpt_header_font_color      varchar2(50)  := '';    -- #071626
g_rpt_header_back_color      varchar2(50)  := '';    -- #FAFAFA
g_rpt_header_border_width    varchar2(50)  := '';    -- 1 ; '0' = no border
g_rpt_header_border_color    varchar2(50)  := '';    -- #000000
g_rpt_break_font_color       varchar2(50)  := '';    -- #071626
g_rpt_break_back_color       varchar2(50)  := '';    -- #FAFAFA
g_rpt_break_show_header      varchar2(1)   := null;  -- Show the header again after the break (Y/N)
g_rpt_data_font_name         varchar2(50)  := '';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163
g_rpt_data_font_size         varchar2(3)   := '';    -- 14
g_rpt_data_font_color        varchar2(50)  := '';    -- #000000
g_rpt_data_back_color        varchar2(50)  := '';    -- #FFFFFF
g_rpt_data_border_width      varchar2(50)  := '';    -- 1 ; '0' = no border
g_rpt_data_border_color      varchar2(50)  := '';    -- #000000
g_rpt_data_alt_row_color     varchar2(50)  := '';    -- #FFFFFF for no alt row color, use same color as g_rpt_data_back_color
/* see also Printing attributes in Interactive Report */
g_is_component_used_yn       varchar2(1)   := null;  -- If you want to override the is_component_used_yn, you can specify 'Y' to always show or 'N' to never show.
g_visible_report_columns     varchar2(4000):= null;  -- Colon separated list of classic report, interactive report or interactive grid columns e.g. EMPNO:ENAME,
                                                     -- which will be visible regardless of authorization and condition
g_hidden_report_columns      varchar2(4000):= null;  -- Colon separated list of classic report, interactive report or interactive grid columns e.g. EMPNO:ENAME
                                                     -- which will be hidden regardless of authorization and condition
--### Settings for Calendar
g_cal_type                   varchar2(10)  := c_cal_month; -- can be month (default), week, day, list; constants can be used
g_start_date                 date          := null;  -- start date of calendar
g_end_date                   date          := null;  -- end date of calendar
g_weekdays                   varchar2(300) := null;  -- translation for weekdays e.g. Monday:Tuesday:Wednesday etc.
g_months                     varchar2(300) := null;  -- translation for months   e.g. January:February etc.
g_color_days_sql             varchar2(4000):= null;  -- color the background of certain days.
                                                     --   e.g. select 1 as "id", sysdate as "date", 'FF8800' as "color" from dual
g_separate_pages             varchar2(5)   := 'false'; -- start calendar on new page (true) or start calendar on same page
g_alignment                  varchar2(5)   := 'right'; -- align text on calender: left center or right
g_title_alignment            varchar2(5)   := 'right'; -- align title of the calendar: left right or center
g_day_alignment              varchar2(5)   := 'right'; -- align days of the calendar: left right or center
g_start_of_week              varchar2(3)   := 'Mon';   -- start of the week day: Monday (Mon) or Sunday (Sun)
--### HTML template to Word/PDF
g_orientation                varchar2(50)  := '';    -- empty is portrait, other option is 'landscape'
--### Call to URL data source
g_url_http_method            varchar2(10)  := 'GET';
g_url_username               varchar2(300) := null;
g_url_password               varchar2(300) := null;
g_url_schema                 varchar2(100) := 'Basic';
g_url_proxy_override         varchar2(300) := null;
g_url_transfer_timeout       number        := 180;
g_url_body                   clob          := empty_clob();
g_url_body_blob              blob          := empty_blob();
g_url_parm_name              apex_application_global.vc_arr2; --:= empty_vc_arr;
g_url_parm_value             apex_application_global.vc_arr2; --:= empty_vc_arr;
g_url_wallet_path            varchar2(300) := null;
g_url_wallet_pwd             varchar2(300) := null;
g_url_https_host             varchar2(300) := null;  -- parameter for apex_web_service, not used, please apply APEX patch if issues
g_url_credential_static_id   varchar2(300) := null;
g_url_token_url              varchar2(300) := null;
--### Web Source Module (APEX >= 18.1)
g_web_source_first_row       pls_integer   := null;  -- parameter for apex_exec.open_web_source_query
g_web_source_max_rows        pls_integer   := null;  -- parameter for apex_exec.open_web_source_query
g_web_source_total_row_cnt   boolean       := false; -- parameter for apex_exec.open_web_source_query
--### REST Enabled SQL (APEX >= 18.1)
g_rest_sql_auto_bind_items   boolean       := true;  -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_first_row         pls_integer   := null;  -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_max_rows          pls_integer   := null;  -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_total_row_cnt     boolean       := false; -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_total_row_limit   pls_integer   := null;  -- parameter for apex_exec.open_remote_sql_query
--### Input Data
g_replace_special_symbols    varchar2(5)   := null;  -- Option to replace special symbols in the selected columns/keys. Replaces +, -, *, /, and  % by _.
g_override_html_expr_on_null boolean       := false; -- When HTML expressions are being used in reports, but they are null, they can be overwritten to use the report_null_value_as
--### IP Printer support
g_ip_printer_location        varchar2(300) := null;
g_ip_printer_version         varchar2(300) := '1';
g_ip_printer_requester       varchar2(300) := nvl(apex_application.g_user, USER);
g_ip_printer_job_name        varchar2(300) := 'AOP';
g_ip_printer_return_output   varchar2(5)   := null;  -- null or 'Yes' or 'true'
--### AOP Processing
g_pre_conversion_command     varchar2(4000):= null; -- The command to execute before the conversion to another file format. This command should be present on aop_config.json file.
g_pre_conversion_command_p   varchar2(4000):= null; -- Parameter (in JSON) before the conversion to another file format. These parameters should be present on aop_config.json file.
g_post_conversion_command    varchar2(4000):= null; -- The command to execute after the conversion to another file format. This command should be present on aop_config.json file.
g_post_conversion_command_p  varchar2(4000):= null; -- Parameter (in JSON) after the conversion to another file format. These parameters should be present on aop_config.json file.
g_post_merge_command         varchar2(4000):= null; -- The command to execute after the merge of files. This command should be present on aop_config.json file.
g_post_merge_command_p       varchar2(4000):= null; -- Parameter (in JSON) after the merge of files. These parameters should be present on aop_config.json file.
g_pipeline_name              varchar2(4000):= null; -- The name of the pipeline that will be executed.
g_post_process_command       varchar2(4000):= null; -- The command to execute. This command should be present on aop_config.json file.
g_post_process_command_p     varchar2(4000):= null; -- Parameter (in JSON) in the post process command. These parameters should be present on aop_config.json file.
g_post_process_return_output boolean       := true; -- Either to return the output or not. Note this output is AOP's output and not the post process command output.
g_post_process_delete_delay  number(9)     := 1500; -- AOP deletes the file provided to the command directly after executing it. This can be delayed with this option. Integer in milliseconds.
--### AOP Config
g_aop_config                 varchar2(32767):= null; -- AOP config file; anything here will overwrite or extend other attributes in the JSON. Make sure this is valid JSON.
--### Convert characterset
g_convert                    varchar2(1)   := c_n;   -- set to Y (c_y) if you want to convert the JSON that is send over; necessary for Arabic support
g_convert_source_charset     varchar2(20)  := null;  -- default of database
g_convert_target_charset     varchar2(20)  := 'AL32UTF8';
g_stop_apex_engine           varchar2(1)   := c_n;   -- stop the APEX engine
g_run_with_dbms_scheduler    varchar2(1)   := c_n;   -- Run the call in the background through a dbms_scheduler job, when finished call defined procedure.
--### Output
-- set output directory on AOP Server
-- if . is specified the files are saved in the default directory: outputfiles
g_output_directory           varchar2(200) := '.';
g_output_sign_certificate    varchar2(32000):= null; -- sign PDF with signature which is base64 encoded
g_output_sign_certificate_pwd varchar2(500):= null;  -- sign PDF with password
g_output_sign_certificate_fld varchar2(500):= null;  -- sign PDF with the given signature field name
g_output_sign_certificate_img varchar2(32767):= null;-- sign PDF with the given base64 encoded image as background for visible signature
g_output_split               varchar2(5)   := null;  -- split file: one file per page: true/false
g_output_merge               varchar2(5)   := null;  -- merge files into one PDF true/false
g_output_icon_font           varchar2(20)  := null;  -- the icon font to use for the output, Font-APEX or Font Awesome 5 (default)
g_output_even_page           varchar2(5)   := null;  -- PDF option to always print even pages (necessary for two-sided pages): true/false
g_output_merge_making_even   varchar2(5)   := null;  -- PDF option to merge making all documents even paged (necessary for two-sided pages): true/false
g_output_page_margin         varchar2(50)  := null;  -- HTML to PDF option: margin in px, can also add top, bottom, left, right
g_output_page_orientation    varchar2(10)  := null;  -- HTML to PDF option: portrait (default) or landscape
g_output_page_width          varchar2(10)  := null;  -- HTML to PDF option: width in px, mm, cm, in. No unit means px.
g_output_page_height         varchar2(10)  := null;  -- HTML to PDF option: height in px, mm, cm, in. No unit means px.
g_output_page_format         varchar2(10)  := null;  -- HTML to PDF option: a4 (default), letter
g_output_remove_last_page    boolean       := false; -- PDF option to remove the last page; e.g. when the last page is empty

--### Async call to AOP; a URL will be returned where the file can be polled from
g_async_status               varchar2(4000):= null;  -- Get the status of the async call (OK, error, false)
g_async_message              varchar2(4000):= null;  -- Get the status message of the async call
g_async_url                  varchar2(4000):= null;  -- Get the URL where you can get the file when processing is complete

--### Call a Web Service where AOP will send the file to (POST Request)
g_web_service_url            varchar2(500) := null;  -- URL to be called once AOP has created the document. AOP will do a POST request and headers can be specified
g_web_service_headers        varchar2(4000):= null;  -- The headers for the POST request e.g. {"file_id": "F123", "access_token": "A456789"}

--### Files
g_prepend_files_sql          clob          := null;  -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table
g_append_files_sql           clob          := null;  -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table
g_media_files_sql            clob          := null;  --
g_output_prepend_per_page    boolean       := false; -- Prepend one or more pages before each page in the output. E.g. logo and company details before every document
g_output_append_per_page     boolean       := false; -- Append one or more pages after each page in the output. E.g. terms of conditions after every invoice

--### Templates
g_template_start_delimiter   varchar2(2)   := null;  -- { is the default start delimiter used is a template, but you can set this variable with the following options: {, {{, <, <<
g_template_end_delimiter     varchar2(2)   := null;  -- } is the default end delimiter used in a template, but you can set this variable with the following options: }, }}, >, >>
g_cache_template             boolean       := false; -- cache the template; an hash is returned in g_template_cache_hash
g_template_cache_hash        varchar2(128) := null;  -- the hashed value of the cached version of the template on the AOP Server/Cloud
g_use_template_when_no_cache varchar2(1)   := c_n;   -- by default when a template hash is sent and it's no longer available it will raise an error.
                                                     -- when set to Y(es), AOP will first check if the template is still available and if not include the full template when available.

--### Sub-Templates
g_sub_templates_sql          clob          := null;  -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table

--### Password protected PDF
g_output_read_password       varchar2(200) := null; -- protect PDF to read
g_output_modify_password     varchar2(200) := null; -- protect PDF to write (modify)
g_output_pwd_protection_flag number(4)     := null; -- optional; default is 4.
                                                    -- Number when bit calculation is done as specified in http://pdfhummus.com/post/147451287581/hummus-1058-and-pdf-writer-updates-encryption
g_output_watermark           varchar2(4000):= null; -- Watermark in PDF
g_output_watermark_color     varchar2(500) := null; -- Watermark option color
g_output_watermark_font      varchar2(500) := null; -- Watermark option font
g_output_watermark_width     varchar2(500) := null; -- Watermark option width
g_output_watermark_height    varchar2(500) := null; -- Watermark option height
g_output_watermark_opacity   varchar2(500) := null; -- Watermark option opacity
g_output_watermark_rotation  varchar2(500) := null; -- Watermark option rotation
g_output_copies              number        := null; -- Requires output pdf, repeats the output pdf for the given number of times.

--### IG
g_ig_force_query             varchar2(1)   := null; -- force the IG to use AOPs own implementation instead of apex_region.open_query_context
g_ig_use_alternative_label   varchar2(1)   := null; -- force the IG to use the alternative label for the heading

--### JSON
g_anonymize_json             varchar2(1)   := c_n;   -- set to Y (c_y) if you want to anomyze/obfuscate the JSON that is send over. This is great for debugging of sensitive data.
g_use_data_export_pjson      varchar2(1)   := c_n;   -- instead of using the AOP specific code to generate the meta-data of reports, use apex_data_export.c_format_pjson

--### CSV
g_output_text_delimiter      varchar2(200) := null;  -- delimiter for tags
g_output_field_separator     varchar2(200) := null;  -- field separator, default is ,
g_output_character_set       varchar2(200) := null;  -- character set of CSV file

--### Word
g_update_toc                 boolean       := false; -- Update the table of contents in Word document

--### DATA EXPORT - APEX 20.2 and higher
$if wwv_flow_api.c_current >= 20201001
$then
g_data_export_component_id   number                         := null;
g_data_export_view_mode      varchar2(100)                  := null;
g_data_export_max_rows       number                         := null;
g_data_export_file_name      varchar2(255)                  := null;
g_data_export_page_size      apex_data_export.t_size        := apex_data_export.c_size_letter;
g_data_export_orientation    apex_data_export.t_orientation := apex_data_export.c_orientation_portrait;
g_data_export_data_only      boolean                        := false;
g_data_export_pdf_accessible boolean                        := false;
$end

--### OCI
g_oci_credential             varchar2(150) := null;  -- Credentials used in DBMS_CLOUD (Oracle Cloud Infrastructure credentials)
g_oci_directory_name         varchar2(150) := null;  -- Directory name used in DBMS_CLOUD

--### APEX Office Edit (AOE)
g_aoe_region_static_id       varchar2(150) := null;  -- Used when Output To is set to c_apex_office_edit
                                                     -- Specify here the Static ID of the APEX Office Edit Plug-in region
g_aoe_primary_key_items      varchar2(4000) := null; -- the primary key items defined in APEX Office Edit colon separated (will be automatically filled)
g_aoe_primary_key_values     varchar2(4000) := null; -- the primary key values of the records that where created by the procedure colon separated

--## EXCEPTIONS
/**
 * @exception
 */


--### FUNCTIONS AND PROCEDURES
-- ! package body contains documentation

-- debug function, will write to apex_debug_messages, logger (if enabled) and your own debug procedure
procedure aop_debug(p_message     in varchar2,
                    p0            in varchar2 default null,
                    p1            in varchar2 default null,
                    p2            in varchar2 default null,
                    p3            in varchar2 default null,
                    p4            in varchar2 default null,
                    p5            in varchar2 default null,
                    p6            in varchar2 default null,
                    p7            in varchar2 default null,
                    p8            in varchar2 default null,
                    p9            in varchar2 default null,
                    p10           in varchar2 default null,
                    p11           in varchar2 default null,
                    p12           in varchar2 default null,
                    p13           in varchar2 default null,
                    p14           in varchar2 default null,
                    p15           in varchar2 default null,
                    p16           in varchar2 default null,
                    p17           in varchar2 default null,
                    p18           in varchar2 default null,
                    p19           in varchar2 default null,
                    p_level       in apex_debug.t_log_level default apex_debug.c_log_level_info,
                    p_description in clob default null);

-- convert a url with for example an image to base64
function url2base64 (
  p_url in varchar2)
  return clob;

-- get the value of one of the above constants
function getconstantvalue (
  p_constant in varchar2)
  return varchar2 deterministic;

-- get the mime type of a file extention: docx, xlsx, pptx, pdf
function getmimetype (
  p_file_ext in varchar2)
  return varchar2 deterministic;

-- get the file extention of a mime type
function getfileextension (
  p_mime_type in varchar2)
  return varchar2 deterministic;

-- get the Font Awesome / APEX icon of a mime type
function geticon (
  p_mime_type in varchar2)
  return varchar2 deterministic;

-- convert a blob to a clob
function blob2clob(p_blob in blob)
  return clob;

-- convert a clob to a blob
function clob2blob(p_clob in clob)
  return blob;

-- convert a blob to a file in the database directory
procedure blob2file(p_blob      in blob,
                    p_directory in varchar2,
                    p_filename  in varchar2);

-- convert a file to a blob
function file2blob(p_directory in varchar2,
                   p_filename  in varchar2)
  return blob;

-- internal function to check a server-side condition
function is_component_used_yn(p_build_option_id         in number default null,
                              p_authorization_scheme_id in varchar2,
                              p_condition_type          in varchar2,
                              p_condition_expression1   in varchar2,
                              p_condition_expression2   in varchar2,
                              p_component               in varchar2 default null,
                              p_report_column           in varchar2 default null)
  return varchar2;

-- internal function to get the bind variables of a SQL statement
function get_binds (
    p_stmt in clob )
    return sys.dbms_sql.varchar2_table;

-- check template and output type compatibility
-- template and output type can be mime_type or file extension
function is_valid_output_type(p_template_type in varchar2,
                              p_output_type   in varchar2)
  return boolean;

-- check if the hash of the template cache is still valid and present on the AOP Server/Cloud
function is_valid_template_hash(p_aop_url in varchar2 default g_aop_url,
                                p_hash    in varchar2)
  return boolean;


/**
 * @Description: Call to AOP Server through API, used behind the scenes by the APEX plug-in, but a manual call can be done with PL/SQL too.
 *
 * @Author: Dimitri Gielis
 * @Created: 2016-8-2
 *
 * @Param: p_data_type Define where the data is coming from.
 *                     Following constants exists in aop_api_pkg: c_source_type_sql, c_source_type_plsql_sql, c_source_type_plsql, c_source_type_url, c_source_type_rpt, c_source_type_refcursor, c_source_type_sql_array, c_source_type_xml, c_source_type_json, c_source_type_json_files, c_source_type_none
 * @Param: p_data_source Depending the data type, define here the source:
 *                         - c_source_type_sql: SQL statement with cursor syntax or returning JSON
 *                         - c_source_type_plsql_sql: PL/SQL function returning SQL statement with mime type and blob
 *                         - c_source_type_plsql: PL/SQL function returning JSON with the template file base64 encoded
 *                         - c_source_type_url: URL which contains the file
 *                         - c_source_type_rpt: static id(s) or region id(s) of the APEX regions
 *                         - c_source_type_refcursor: REF Cursor
 *                         - c_source_type_sql_array: Array of SQL statements
 *                         - c_source_type_xml: XML
 *                         - c_source_type_json: JSON data part
 *                         - c_source_type_json_files: JSON including files
 *                         - c_source_type_none: leave the source blank
 * @Param: p_template_type Define where the template is stored.
 *                         Following constants exists in aop_api_pkg: c_source_type_apex, c_source_type_workspace, c_source_type_sql, c_source_type_plsql_sql, c_source_type_plsql,
 *                                                                    c_source_type_url, c_source_type_filename, c_source_type_url_aop, c_source_type_json, c_source_type_db_directory, c_source_type_oci_objs,
 *                                                                    c_source_type_aop_report, c_source_type_apex_report, c_source_type_aop_template, c_source_type_clob_base64, c_source_type_none
 * @Param: p_template_source Depending the template_type, define here the filename, SQL statement, PL/SQL function or URL:
 *                         - c_source_type_apex: file uploaded in APEX Static Application Files
 *                         - c_source_type_workspace: file uploaded in APEX Workspace Files
 *                         - c_source_type_sql: SQL statement returning mime type and blob
 *                         - c_source_type_plsql_sql: PL/SQL function returning SQL statement with mime type and blob
 *                         - c_source_type_plsql: PL/SQL function returning JSON with the template file base64 encoded
 *                         - c_source_type_url: URL which contains the file (will be read from DB server)
 *                         - c_source_type_url_aop: URL which contains the file (will be read from AOP server)
 *                         - c_source_type_filename: file specified in a directory on the AOP Server
 *                         - c_source_type_db_directory: file specified in a directory on the Database Server, use DIRECTORY:filename
 *                         - c_source_type_json: JSON with the template file base64 encoded
 *                         - c_source_type_clob_base64: BLOB in CLOB base64 encoded (user apex_web_service.blob2clobbase64)
 *                         - c_source_type_aop_template: AOP will generate a starter template
 *                         - c_source_type_aop_report: AOP will use it's own template, used to generate one or more APEX regions
 *                         - c_source_type_apex_report: APEX will generate one region (native functionality)
 *                         - c_source_type_oci_objs: Oracle Cloud Infrastructure - Object Storage
 *                         - c_source_type_none: leave the source blank
 * @Param: p_output_type Extension (pdf, xlsx, ...) or mime type (application/pdf, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, ...) of the output format.
 *                       Following constants exists in aop_api_pkg:
 *                         - c_word_docx
 *                         - c_excel_xlsx
 *                         - c_powerpoint_pptx
 *                         - c_opendocument_odt
 *                         - c_opendocument_ods
 *                         - c_opendocument_odp
 *                         - c_pdf_pdf
 *                         - c_html_html
 *                         - c_markdown_md
 *                         - c_text_txt
 *                         - c_csv_csv
 *                         - c_word_rtf
 *                         - c_onepagepdf_pdf
 *                         - c_count_tags
 *                         - c_form_fields
 *                         - c_defined_by_apex_item
 * @Param: p_output_filename Filename of the result
 * @Param: p_output_type_item_name APEX Item holding the filename
 * @Param: p_output_to Where does the blob or file need to be sent to:
 *                         - c_output_browser: the browser will open the file
 *                         - c_output_inline: the output is defined for showing inline in a region
 *                         - c_output_directory: the file is stored on the AOP Server in this directory
 *                         - c_output_db_directory: the file is stored on the Database Server in this directory
 *                         - c_output_cloud: a file is sent to the cloud (Dropbox, Amazon S3, Google Drive, Oracle Cloud) using the credentials defined in g_cloud_provider, g_cloud_location and g_cloud_access_token
 *                         - c_output_procedure: a blob will be passed to a procedure which is defined in p_procedure.
 *                           The procedure definition needs to be: proc_name(p_output_blob in blob, p_output_filename in varchar2, p_output_mime_type in varchar2)
 *                         - c_output_procedure_browser: a blob will be passed to a procedure which is defined in p_procedure and the file is sent to the browser
 *                         - c_output_procedure_inline: a blob will be passed to a procedure which is defined in p_procedure and the file is showing inline in a region
 *                         - c_output_async: the blob will be empty and a URL will be passed to g_async_url where the file will be available to download when AOP is finished. Use the poll_async_file procedure to check and download the file.
 *                           Optionally a procedure can be defined in p_procedure with the following definition: proc_name(p_async_status in varchar2, p_async_message in varchar2, p_async_url in varchar2, p_output_filename in varchar2, p_output_mime_type in varchar2)
 *                         - c_output_web_service: AOP will call the web service (a POST Request) defined in g_web_service_url once AOP is finished producing the file. Extra headers can be added to the POST request by defining them in g_web_service_headers
 *                         - c_apex_office_edit: a blob will be passed to a procedure which is defined in p_procedure and the file can be shown directly in APEX Office Edit (AOE), the editor that can show and edit Word, Excel, PowerPoint, PDF, and Text straight from the browser.
 *                           The procedure definition needs to be: proc_name(p_output_blob in blob, p_output_filename in varchar2, p_output_mime_type in varchar2)
 * @Param: p_procedure Procedure that needs to be called when the file is merged
 * @Param: p_binds Bind variable for SQL or PL/SQL Source
 * @Param: p_special Special settings defined in the APEX Plug-in concerning Reports (colon separated).
 *                   Following constants can be used:
 *                        - c_special_number_as_string
 *                        - c_special_report_as_label
 *                        - c_special_ir_filters_top
 *                        - c_special_ir_highlights_top
 *                        - c_special_ir_excel_header_f
 *                        - c_special_ir_saved_report
 *                        - c_special_ir_repeat_header
 * @Param: p_aop_remote_debug Turning debugging on will generate the JSON that is sent to the AOP Server in a file. The actual request to the AOP Server is not done. Following constants can be used:
 *                        - c_debug_remote: store the JSON in your dashboard on https://www.apexofficeprint.com
 *                        - c_debug_local: store the JSON local on your pc
 *                        - c_debug_application_item: depending the Application item AOP_DEBUG, Remote (Yes) or Local (Local) or no debugging is done
 * @Param: p_output_converter Define the PDF converter you want to use. Multiple converters can be defined in the AOP Server. e.g. officetopdf, libreoffice, libreoffice-standalone
 * @Param: p_aop_url Description: URL where the AOP Server is running. For the AOP Cloud use c_aop_url
 * @Param: p_api_key Description: API Key which can be found when you login at https://www.apexofficeprint.com
 * @Param: p_app_id APEX Application ID
 * @Param: p_page_id Page ID to call in the APEX application
 * @Param: p_user_name Username which should be used to create an APEX session
 * @Param: p_init_code Initialisation code which can be invoked in this package
 * @Param: p_output_encoding Following constants can be used: c_output_encoding_raw, c_output_encoding_base64
 * @Param: p_output_split Split PDF in multiple pages and create zip
 * @Param: p_output_merge Merge multiple files to one PDF
 * @Param: p_failover_aop_url: URL where the AOP Failover Server is running. For the AOP Cloud use c_aop_url_fallback
 * @Param: p_failover_procedure: Procedure which is called when the failover URL is being used, so you are warned the main AOP server has issues.
 * @Param: p_log_procedure: Procedure which can be defined to do your own extra logging.
 * @Param: p_prepend_files_sql: SQL statement which hold the files to include before the main report.
 *                              Format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table
 *                              Between [] is optional and one or more columns can be included
 * @Param: p_append_files_sql: SQL statement which hold the files to include after the main report.
 *                             Format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table
 *                             Between [] is optional and one or more columns can be included
 * @Param: p_media_files_sql: Coming soon (!); use AME API via https://www.apexmediaextension.com
 *                              Format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server],
 *                                             [media_width, media_max_width, media_height, media_max_height, media_watermark_text, media_watermark_image, media_properties, media_output_file_type]
 *                                        from my_table
 *                              Between [] is optional and one or more columns can be included
 * @Param: p_sub_templates_sql: SQL statement which hold the sub-template Word documents.
 *                             Format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table
 *                             Between [] is optional and one or more columns can be included
 * @Param: p_ref_cursor: when data type is c_source_type_refcursor, we will read the ref cursor specified here
 * @Param: p_sql_array:  when data type is c_source_type_sql_arrea, different SQL statements can be passed by using t_query_list
 * @Param: p_ig_selected_pks: add a json object with the regions and selected primary keys in format {"region_static_id": pk} e.g. {"customers": 1}
 * @Return: blob in defined output format containing result of merged template(s) with data and prepend and append files.
 *
 * @Example:
 *<code>
 *declare
 *  l_binds           wwv_flow_plugin_util.t_bind_list;
 *  l_return          blob;
 *  l_output_filename varchar2(100) := 'output';
 *begin
 *  -- set the output to JSON, so we see what is being sent to the AOP Server (uncomment next line)
 *  -- aop_api_pkg.g_debug := 'Local';
 *  -- set output to own custom debug table (uncomment next line)
 *  -- aop_api_pkg.g_debug_procedure := 'aop_sample_pkg.custom_debug';
 *  --
 *  -- most minimalistic example
 *  l_return := aop_api_pkg.plsql_call_to_aop (
 *                p_data_type       => aop_api_pkg.c_source_type_json,
 *                p_data_source     => '[{"hello":"world"}]',
 *                p_template_type   => aop_api_pkg.c_source_type_aop_template,
 *                p_output_type     => 'docx',
 *                p_output_filename => l_output_filename,
 *                p_aop_url         => 'http://localhost:8010');
 *  --
 *  --
 *  l_return := aop_api_pkg.plsql_call_to_aop (
 *                p_data_type       => aop_api_pkg.c_source_type_rpt,
 *                p_data_source     => 'report1',
 *                p_template_type   => null,
 *                p_template_source => '',
 *                p_output_type     => 'docx',
 *                p_output_filename => l_output_filename,
 *                p_binds           => l_binds,
 *                p_aop_url         => 'http://api.apexofficeprint.com',
 *                p_api_key         => '<your API key>', -- change the API key if you use the AOP Cloud
 *                p_app_id          => 498,              -- change to APEX app id
 *                p_page_id         => 100);             -- change to APEX page id
 *
 *  -- write output to table (uncomment next line)
 *  -- insert into aop_output (output_blob, filename) values (l_return, l_output_filename);
 *end;
*/
function plsql_call_to_aop(
  p_data_type                 in varchar2 default c_source_type_sql,
  p_data_source               in clob     default null,
  p_template_type             in varchar2 default c_source_type_apex,
  p_template_source           in clob     default null,
  p_output_type               in varchar2 default c_pdf_pdf,
  p_output_filename           in out nocopy varchar2,
  p_output_type_item_name     in varchar2 default null,
  p_output_to                 in varchar2 default null,
  p_procedure                 in varchar2 default null,
  p_binds                     in wwv_flow_plugin_util.t_bind_list default c_binds,
  p_special                   in varchar2 default null,
  p_aop_remote_debug          in varchar2 default c_no,
  p_output_converter          in varchar2 default null,
  p_aop_url                   in varchar2 default null,
  p_api_key                   in varchar2 default null,
  p_aop_mode                  in varchar2 default null,
  p_app_id                    in number   default null,
  p_page_id                   in number   default null,
  p_user_name                 in varchar2 default null,
  p_init_code                 in clob     default c_init_null,
  p_output_encoding           in varchar2 default c_output_encoding_raw,
  p_output_split              in varchar2 default c_false,
  p_output_merge              in varchar2 default c_false,
  p_output_even_page          in varchar2 default c_false,
  p_output_merge_making_even  in varchar2 default c_false,
  p_failover_aop_url          in varchar2 default null,
  p_failover_procedure        in varchar2 default null,
  p_log_procedure             in varchar2 default null,
  p_prepend_files_sql         in clob     default null,
  p_append_files_sql          in clob     default null,
  p_media_files_sql           in clob     default null,
  p_sub_templates_sql         in clob     default null,
  p_ref_cursor                in sys_refcursor default null,
  p_sql_array                 in t_query_list default c_sql_array,
  p_ig_selected_pks           in varchar2 default null)
  return blob;

-- retrieve underlaying PL/SQL code of APEX Plug-in call
function show_plsql_call_plugin(
  p_process_id            in number   default null,
  p_dynamic_action_id     in number   default null,
  p_show_api_key          in varchar2 default c_no)
  return clob;

-- check to see if the AOP Server is running (function returning boolean)
function is_aop_accessible(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null)
  return boolean;

-- check to see if the AOP Server is running (procedure returning with htp.p and dbms_output)
procedure is_aop_accessible(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null);

-- send a sample request to the AOP Server
procedure send_aop_sample(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null);

-- check the version of the AOP Server (function)
function get_aop_server_version(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null)
  return varchar2;

-- check the version of the AOP Server (procedure)
procedure show_aop_server_version(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null);

-- check the version of the AOP Server (function)
function get_aop_plsql_version
  return varchar2;

-- check the version of the AOP Server (procedure)
procedure show_aop_plsql_version;

-- get supported template types (function)
function get_aop_template_types(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null)
  return varchar2;

-- get supported template types (procedure)
procedure show_aop_template_types(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null);

-- get supported output types (function)
function get_aop_output_type_for_tmpl(
  p_url             in varchar2,
  p_template_type   in varchar2 default null,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null)
  return varchar2;

-- get supported output types (function)
procedure show_aop_output_type_for_tmpl(
  p_url             in varchar2,
  p_template_type   in varchar2 default null,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null);

-- async call to retrieve the file based on a URL
procedure poll_async_file (
  p_aop_url              in varchar2,
  p_proxy_override       in varchar2 default null,
  p_wallet_path          in varchar2 default null,
  p_wallet_pwd           in varchar2 default null,
  p_async_url            in varchar2,
  o_async_status         out varchar2,
  o_async_message        out varchar2,
  o_async_file           out blob);


-- APEX Plugins

-- Process Type Plugin
function f_process_aop(
  p_process in apex_plugin.t_process,
  p_plugin  in apex_plugin.t_plugin)
  return apex_plugin.t_process_exec_result;

-- Dynamic Action Plugin
function f_render_aop (
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_render_result;

function f_ajax_aop(
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_ajax_result;


-- Other Procedure

-- Create an APEX session from PL/SQL
-- p_enable_debug: Yes / No (default)
procedure create_apex_session(
  p_app_id       in apex_applications.application_id%type,
  p_user_name    in apex_workspace_sessions.user_name%type default 'ADMIN',
  p_page_id      in apex_application_pages.page_id%type default null,
  p_session_id   in apex_workspace_sessions.apex_session_id%type default null,
  p_enable_debug in varchar2 default 'No');

-- Get the current APEX Session
function get_apex_session
  return apex_workspace_sessions.apex_session_id%type;

-- Join an APEX Session
procedure join_apex_session(
  p_session_id   in apex_workspace_sessions.apex_session_id%type,
  p_app_id       in apex_applications.application_id%type default null,
  p_page_id      in apex_application_pages.page_id%type default null,
  p_enable_debug in varchar2 default 'No');

-- Drop the current APEX Session
procedure drop_apex_session(
  p_app_id     in apex_applications.application_id%type default null,
  p_session_id in apex_workspace_sessions.apex_session_id%type default null);

end aop_api22_pkg;
/
create or replace package sert_core.aop_plsql22_pkg
AUTHID CURRENT_USER
as

/* Copyright 2015-2022 - APEX RnD - United Codes
*/

/* AOP Version */
c_aop_version  constant varchar2(6)   := '22.1';

--
-- Pre-requisites: apex_web_service package
-- if APEX is not installed, you can use this package as your starting point
-- but you would need to change the apex_web_service calls by utl_http calls or similar
--


--
-- Change following variables for your environment
--
g_aop_url  varchar2(200) := 'http://api.apexofficeprint.com/';                  -- for https use https://api.apexofficeprint.com/
g_api_key  varchar2(200) := '';    -- change to your API key in APEX 18 or above you can use apex_app_setting.get_value('AOP_API_KEY')
g_aop_mode varchar2(15)  := null;  -- AOP Mode can be development or production; when running in development no cloud credits are used but a watermark is printed

-- Global variables
-- Call to AOP
g_proxy_override          varchar2(300) := null;  -- null=proxy defined in the application attributes
g_transfer_timeout        number(6)     := 180;   -- default is 180
g_wallet_path             varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_wallet_pwd              varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings

-- Output parameters
--### Output
g_output_directory          varchar2(200) := '.';   -- set output directory on AOP Server, if . is specified the files are saved in the default directory: outputfiles
g_output_sign_certificate   varchar2(32000) := null;-- sign PDF with signature which is base64 encoded
g_output_split              varchar2(5)   := null;  -- split file: one file per page: true/false
g_output_merge              varchar2(5)   := null;  -- merge files into one PDF true/false
g_output_icon_font          varchar2(20)  := null;  -- the icon font to use for the output, Font-APEX or Font Awesome 5 (default)
g_output_even_page          varchar2(5)   := null;  -- PDF option to always print even pages (necessary for two-sided pages): true/false
g_output_merge_making_even  varchar2(5)   := null;  -- PDF option to merge making all documents even paged (necessary for two-sided pages): true/false
g_output_page_margin        varchar2(50)  := null;  -- HTML to PDF option: margin in px, can also add top, bottom, left, right
g_output_page_orientation   varchar2(10)  := null;  -- HTML to PDF option: portrait (default) or landscape
g_output_page_width         varchar2(10)  := null;  -- HTML to PDF option: width in px, mm, cm, in. No unit means px.
g_output_page_height        varchar2(10)  := null;  -- HTML to PDF option: height in px, mm, cm, in. No unit means px.
g_output_page_format        varchar2(10)  := null;  -- HTML to PDF option: a4 (default), letter
--### PDF
g_output_read_password      varchar2(200) := null;  -- protect PDF to read
g_output_modify_password    varchar2(200) := null;  -- protect PDF to write (modify)
g_output_pwd_protection_flag number(4)    := null;  -- optional; default is 4.
                                                    -- Number when bit calculation is done as specified in http://pdfhummus.com/post/147451287581/hummus-1058-and-pdf-writer-updates-encryption
g_output_correct_page_nr    boolean        := false;-- boolean to check for AOPMergePage text to replace it with the page number.
g_output_lock_form          boolean        := false;-- boolean that determines if the pdf forms should be locked/flattened.
g_identify_form_fields      boolean        := false;-- boolean that fills in the name of the fields of a PDF Form in the field itself so it's easy to identify which field is at what position
g_output_watermark          varchar2(4000) := null; -- Watermark in PDF
g_output_watermark_color    varchar2(500)  := null; -- Watermark option color
g_output_watermark_font     varchar2(500)  := null; -- Watermark option font
g_output_watermark_width    varchar2(500)  := null; -- Watermark option width
g_output_watermark_height   varchar2(500)  := null; -- Watermark option height
g_output_watermark_opacity  varchar2(500)  := null; -- Watermark option opacity
g_output_watermark_rotation varchar2(500)  := null; -- Watermark option rotation
g_output_copies             number         := null; -- Requires output pdf, repeats the output pdf for the given number of times.
--### CSV
g_output_text_delimiter     varchar2(200) := null;  --
g_output_field_separator    varchar2(200) := null;  --
g_output_character_set      varchar2(200) := null;  --

-- Constants
c_mime_type_docx        constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
c_mime_type_xlsx        constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
c_mime_type_pptx        constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
c_mime_type_pdf         constant varchar2(100) := 'application/pdf';
c_mime_type_html        constant varchar2(9)   := 'text/html';
c_mime_type_markdown    constant varchar2(13)  := 'text/markdown';


function make_aop_request(
  p_aop_url            in varchar2 default g_aop_url,
  p_api_key            in varchar2 default g_api_key,
  p_aop_mode           in varchar2 default g_aop_mode,
  p_json               in clob,
  p_template           in blob,
  p_template_type      in varchar2 default null,
  p_output_encoding    in varchar2 default 'raw', -- change to raw to have binary, change to base64 to have base64 encoded
  p_output_type        in varchar2 default null,
  p_output_filename    in varchar2 default 'output',
  p_aop_remote_debug   in varchar2 default 'No',
  p_output_converter   in varchar2 default '',
  p_prepend_files_json in clob default null,
  p_append_files_json  in clob default null)
  return blob;

end aop_plsql22_pkg;
/
create or replace package sert_core.aop_convert22_pkg
AUTHID CURRENT_USER
as

/* Copyright 2015-2022 - APEX RnD - United Codes
*/

-- CONSTANTS

/* AOP Version */
c_aop_version             constant varchar2(6) := '22.1';
c_aop_url                 constant varchar2(50) := 'http://api.apexofficeprint.com/'; -- for https use https://api.apexofficeprint.com/
-- Mime Types
c_mime_type_docx          constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
c_mime_type_xlsx          constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
c_mime_type_pptx          constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
c_mime_type_pdf           constant varchar2(100) := 'application/pdf';
c_mime_type_html          constant varchar2(100) := 'text/html';
c_mime_type_markdown      constant varchar2(100) := 'text/markdown';
c_mime_type_rtf           constant varchar2(100) := 'application/rtf';
c_mime_type_json          constant varchar2(100) := 'application/json';
c_mime_type_text          constant varchar2(100) := 'text/plain';
c_mime_type_zip           constant varchar2(100) := 'application/zip';
c_pdf_pdf                 constant varchar2(3)  := 'pdf';
-- Output
c_output_encoding_raw     constant varchar2(3) := 'raw';
c_output_encoding_base64  constant varchar2(6) := 'base64';
/* Init */
c_init_null               constant varchar2(5) := 'null;';
c_source_type_sql         constant varchar2(3) := 'SQL';

-- VARIABLES

-- Logger
g_logger_enabled          constant boolean := false;  -- set to true to write extra debug output to logger - see https://github.com/OraOpenSource/Logger

-- Call to AOP
g_proxy_override          varchar2(300) := null;  -- null=proxy defined in the application attributes
g_https_host              varchar2(300) := null;  -- parameter for utl_http and apex_web_service
g_transfer_timeout        number(6)     := 1800;  -- default of APEX is 180
g_wallet_path             varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_wallet_pwd              varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_output_filename         varchar2(100) := null;  -- output
g_language                varchar2(2)   := 'en';  -- Language can be: en, fr, nl, de
g_logging                 clob          := '';    -- ability to add your own logging: e.g. "request_id":"123", "request_app":"APEX", "request_user":"RND"
g_debug                   varchar2(10)  := null;  -- set to 'Local' when only the JSON needs to be generated, 'Remote' for remore debug
g_debug_procedure         varchar2(4000):= null;  -- when debug in APEX is turned on, next to the normal APEX debug, this procedure will be called


--
-- Convert one or more files by using a SQL query with following syntax (between [] can be one or more columns)
-- select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table
--
function convert_files(
  p_query                 in clob,
  p_output_type           in varchar2 default c_pdf_pdf,
  p_output_encoding       in varchar2 default c_output_encoding_raw,
  p_output_to             in varchar2 default null,
  p_output_filename       in out nocopy varchar2,
  p_output_converter      in varchar2 default null,
  p_output_collection     in varchar2 default null,
  p_aop_remote_debug      in varchar2 default 'No',
  p_aop_url               in varchar2 default null,
  p_api_key               in varchar2 default null,
  p_aop_mode              in varchar2 default null,
  p_app_id                in number   default null,
  p_page_id               in number   default null,
  p_user_name             in varchar2 default null,
  p_init_code             in clob     default c_init_null,
  p_failover_aop_url      in varchar2 default null,
  p_failover_procedure    in varchar2 default null,
  p_log_procedure         in varchar2 default null,
  p_procedure             in varchar2 default null
) return blob;


-- APEX Plugins

-- Process Type Plugin
/*
function f_process_aop(
  p_process in apex_plugin.t_process,
  p_plugin  in apex_plugin.t_plugin)
  return apex_plugin.t_process_exec_result;
*/
-- Dynamic Action Plugin
function f_render_aop (
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_render_result;

function f_ajax_aop(
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_ajax_result;


end aop_convert22_pkg;
/

create or replace synonym sert_core.aop_api_pkg for sert_core.aop_api22_pkg
/

create or replace synonym sert_core.aop_plsql_pkg for sert_core.aop_plsql22_pkg
/

create or replace synonym sert_core.aop_convert_pkg for sert_core.aop_convert22_pkg
/

/**
 * @Description: Package to show how to make a manual call with PL/SQL to the AOP Server
 *               If APEX is not installed, you can use this package as your starting point but you would need to change the apex_web_service calls by utl_http calls or similar.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */

create or replace package body sert_core.aop_plsql22_pkg as


function replace_with_clob(
   p_source in clob
  ,p_search in varchar2
  ,p_replace in clob
) return clob
as
  l_pos pls_integer;
begin
  l_pos := instr(p_source, p_search);
  if l_pos > 0 then
    return substr(p_source, 1, l_pos-1)
      || p_replace
      || substr(p_source, l_pos+length(p_search));
  end if;
  return p_source;
end replace_with_clob;


/**
 * @Description: Example how to make a manual call to the AOP Server and generate the correct JSON.
 *
 * @Author: Dimitri Gielis
 * @Created: 9/1/2018
 *
 * @Param: p_aop_url URL of AOP Server
 * @Param: p_api_key API Key in case AOP Cloud is used
 * @Param: p_json Data in JSON format
 * @Param: p_template Template in blob format
 * @Param: p_output_encoding Encoding in raw or base64
 * @Param: p_output_type The extension of the output e.g. pdf, if no output type is defined, the same extension as the template is used
 * @Param: p_output_filename Filename of the result
 * @Param: p_aop_remote_debug Ability to do remote debugging in case the AOP Cloud is used
 * @Return: Resulting file where the template and data are merged and outputted in the requested format (output type).
 */
function make_aop_request(
  p_aop_url            in varchar2 default g_aop_url,
  p_api_key            in varchar2 default g_api_key,
  p_aop_mode           in varchar2 default g_aop_mode,
  p_json               in clob,
  p_template           in blob,
  p_template_type      in varchar2 default null,
  p_output_encoding    in varchar2 default 'raw',
  p_output_type        in varchar2 default null,
  p_output_filename    in varchar2 default 'output',
  p_aop_remote_debug   in varchar2 default 'No',
  p_output_converter   in varchar2 default '',
  p_prepend_files_json in clob default null,
  p_append_files_json  in clob default null)
  return blob
as
  l_aop_json          clob;
  l_template_clob     clob;
  l_template_type     varchar2(10);
  l_data_json         clob;
  l_output_type       varchar2(10);
  l_blob              blob;
  l_error_description varchar2(32767);
  l_amount                   integer := dbms_lob.lobmaxsize;
  l_dest_offset              integer := 1 ;
  l_src_offset               integer := 1 ;
  l_blob_csid                integer := dbms_lob.default_csid;
  l_lang_context             integer := dbms_lob.default_lang_ctx;
  l_warning                  integer := dbms_lob.warn_inconvertible_char;
begin
  l_template_clob := apex_web_service.blob2clobbase64(p_template);
  l_template_clob := replace(l_template_clob, chr(13) || chr(10), null);
  l_template_clob := replace(l_template_clob, '"', '\u0022');

  if p_template_type is null
  then
    if dbms_lob.instr(p_template, utl_raw.cast_to_raw('ppt/presentation'))> 0
    then
      l_template_type := 'pptx';
    elsif dbms_lob.instr(p_template, utl_raw.cast_to_raw('worksheets/'))> 0
    then
      l_template_type := 'xlsx';
    elsif dbms_lob.instr(p_template, utl_raw.cast_to_raw('word/document'))> 0
    then
      l_template_type := 'docx';
    else
      l_template_type := 'unknown';
    end if;
  else
      l_template_type := p_template_type;
  end if;

  if p_output_type is null
  then
    l_output_type := l_template_type;
  else
    l_output_type := p_output_type;
  end if;

  l_data_json := p_json;

  l_aop_json := '
  {
      "version": "***AOP_VERSION***",
      "api_key": "***AOP_API_KEY***",
      "mode": "***AOP_MODE***",
      "aop_remote_debug": "***AOP_REMOTE_DEBUG***",
      "template": {
        "file":"***AOP_TEMPLATE_BASE64***",
         "template_type": "***AOP_TEMPLATE_TYPE***"
      },
      "output": {
        "output_encoding": "***AOP_OUTPUT_ENCODING***",
        "output_type": "***AOP_OUTPUT_TYPE***",
        "output_converter": "***AOP_OUTPUT_CONVERTER***",
        "icon_font": "g_output_icon_font",
        "output_watermark": "g_output_watermark",
        "output_watermark_color": "g_output_watermark_color",
        "output_watermark_font": "g_output_watermark_font",
        "output_watermark_width": "g_output_watermark_width",
        "output_watermark_height": "g_output_watermark_height",
        "output_watermark_opacity": "g_output_watermark_opacity",
        "output_watermark_rotation": "g_output_watermark_rotation",
        "output_modify_password": "g_output_modify_password",
        "output_read_password": "g_output_read_password",
        "output_password_protection_flag": "g_output_pwd_protection_flag",
        "output_correct_page_number": g_output_correct_page_nr,
        "lock_form": g_output_lock_form,
        "identify_form_fields": g_identify_form_fields,
        "output_even_page": "g_output_even_page",
        "output_merge_making_even": "g_output_merge_making_even",
        "output_split": "g_output_split",
        "output_merge": "g_output_merge",
        "output_sign_certificate": "g_output_sign_certificate",
        "output_copies": "g_output_copies",
        "output_page_margin": "g_output_page_margin",
        "output_page_orientation": "g_output_page_orientation",
        "output_page_width": "g_output_page_width",
        "output_page_height": "g_output_page_height",
        "output_page_format": "g_output_page_format",
        "output_text_delimiter": "g_output_text_delimiter",
        "output_field_separator": "g_output_field_separator",
        "output_character_set": "g_output_character_set"
      },
      "files":
        ***AOP_DATA_JSON***,
      "prepend_files":
        ***AOP_PREPEND_FILES_JSON***,
      "append_files":
        ***AOP_APPEND_FILES_JSON***
  }';

  l_aop_json := replace(l_aop_json, '***AOP_VERSION***', c_aop_version);
  l_aop_json := replace(l_aop_json, '***AOP_API_KEY***', p_api_key);
  l_aop_json := replace(l_aop_json, '***AOP_MODE***', p_aop_mode);
  l_aop_json := replace(l_aop_json, '***AOP_REMOTE_DEBUG***', p_aop_remote_debug);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_TEMPLATE_BASE64***', l_template_clob);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_TEMPLATE_TYPE***', l_template_type);
  l_aop_json := replace(l_aop_json, '***AOP_OUTPUT_ENCODING***', p_output_encoding);
  l_aop_json := replace(l_aop_json, '***AOP_OUTPUT_TYPE***', l_output_type);
  l_aop_json := replace(l_aop_json, '***AOP_OUTPUT_CONVERTER***', p_output_converter);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_DATA_JSON***', l_data_json);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_PREPEND_FILES_JSON***', nvl(p_prepend_files_json,'[]'));
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_APPEND_FILES_JSON***', nvl(p_append_files_json,'[]'));
  l_aop_json := replace(l_aop_json, 'g_output_icon_font', g_output_icon_font);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_color', g_output_watermark_color);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_font', g_output_watermark_font);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_width', g_output_watermark_width);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_height', g_output_watermark_height);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_opacity', g_output_watermark_opacity);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_rotation', g_output_watermark_rotation);
  l_aop_json := replace(l_aop_json, 'g_output_watermark', g_output_watermark);
  l_aop_json := replace(l_aop_json, 'g_output_modify_password', g_output_modify_password);
  l_aop_json := replace(l_aop_json, 'g_output_read_password', g_output_read_password);
  l_aop_json := replace(l_aop_json, 'g_output_pwd_protection_flag', to_char(g_output_pwd_protection_flag));
  l_aop_json := replace(l_aop_json, 'g_output_correct_page_nr', case when g_output_correct_page_nr then 'true' else 'false' end);
  l_aop_json := replace(l_aop_json, 'g_output_lock_form', case when g_output_lock_form then 'true' else 'false' end);
  l_aop_json := replace(l_aop_json, 'g_identify_form_fields', case when g_identify_form_fields then 'true' else 'false' end);
  l_aop_json := replace(l_aop_json, 'g_output_even_page', g_output_even_page);
  l_aop_json := replace(l_aop_json, 'g_output_merge_making_even', g_output_merge_making_even);
  l_aop_json := replace(l_aop_json, 'g_output_split', g_output_split);
  l_aop_json := replace(l_aop_json, 'g_output_merge', g_output_merge);
  l_aop_json := replace(l_aop_json, 'g_output_sign_certificate', g_output_sign_certificate);
  l_aop_json := replace(l_aop_json, 'g_output_copies', to_char(g_output_copies));
  l_aop_json := replace(l_aop_json, 'g_output_page_margin', g_output_page_margin);
  l_aop_json := replace(l_aop_json, 'g_output_page_orientation', g_output_page_orientation);
  l_aop_json := replace(l_aop_json, 'g_output_page_width', g_output_page_width);
  l_aop_json := replace(l_aop_json, 'g_output_page_height', g_output_page_height);
  l_aop_json := replace(l_aop_json, 'g_output_page_format', g_output_page_format);
  l_aop_json := replace(l_aop_json, 'g_output_text_delimiter', g_output_text_delimiter);
  l_aop_json := replace(l_aop_json, 'g_output_field_separator', g_output_field_separator);
  l_aop_json := replace(l_aop_json, 'g_output_character_set', g_output_character_set);
  l_aop_json := replace(l_aop_json, '\\n', '\n');

  --logger.log(p_text  => 'AOP JSON: ' || p_message, p_scope => 'AOP', p_extra => l_aop_json);

  if p_aop_remote_debug = 'Local'
  then
    dbms_lob.createtemporary(l_blob, false);
    dbms_lob.converttoblob (
        dest_lob    => l_blob,
        src_clob    => l_aop_json,
        amount      => l_amount,
        dest_offset => l_dest_offset,
        src_offset  => l_src_offset,
        blob_csid   => l_blob_csid,
        lang_context=> l_lang_context,
        warning     => l_warning
    );
  else
    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := 'application/json';

    begin
      l_blob := apex_web_service.make_rest_request_b(
        p_url              => p_aop_url,
        p_http_method      => 'POST',
        p_body             => l_aop_json,
        p_proxy_override   => g_proxy_override,
        p_transfer_timeout => g_transfer_timeout,
        p_wallet_path      => g_wallet_path,
        p_wallet_pwd       => g_wallet_pwd);
    exception
    when others
    then
      raise_application_error(-20001,'Issue calling AOP Service (REST call: ' || apex_web_service.g_status_code || '): ' || CHR(10) || SQLERRM);
    end;

    -- read header variable and create error message
    -- HTTP Status Codes:
    --  200 is normal
    --  500 error received
    --  503 Service Temporarily Unavailable, the AOP server is probably not running
    if apex_web_service.g_status_code = 200
    then
      l_error_description := null;
    elsif apex_web_service.g_status_code = 503
    then
      l_error_description := 'AOP Server not running.';
    elsif apex_web_service.g_status_code = 500
    then
      for l_loop in 1.. apex_web_service.g_headers.count loop
        if apex_web_service.g_headers(l_loop).name = 'error_description'
        then
          l_error_description := apex_web_service.g_headers(l_loop).value;
          -- errors returned by AOP server are base64 encoded
          l_error_description := utl_encode.text_decode(l_error_description, 'AL32UTF8', UTL_ENCODE.BASE64);
        end if;
      end loop;
    else
      l_error_description := 'Unknown error. Check AOP server logs.';
    end if;

    -- YOU CAN STORE THE L_BLOB TO A LOCAL DEBUG TABLE AS AOP SERVER RETURNS A DOCUMENT WITH MORE INFORMATION
    --

    -- check if succesfull
    if apex_web_service.g_status_code <> 200
    then
      raise_application_error(-20002,'Issue returned by AOP Service (REST call: ' || apex_web_service.g_status_code || '): ' || CHR(10) || l_error_description);
    end if;
  end if;

  -- return print
  return l_blob;

end make_aop_request;

end aop_plsql22_pkg;
/

--rollback not required
