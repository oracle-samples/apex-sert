-- file_checksum: 6823A3B745B50A0D2C0C5C2227188BE05F6C940BF1D71425C7EE3F57E7249BEA
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/shared_components/plugins/dynamic_action/be_apexrnd_aop_da
begin
--   Manifest
--     PLUGIN: BE.APEXRND.AOP_DA
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(117779138290418355)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'BE.APEXRND.AOP_DA'
,p_display_name=>'UC - APEX Office Print (AOP) - DA'
,p_category=>'EXECUTE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','BE.APEXRND.AOP_DA'),'')
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#js/es6-promise.min.js',
'#PLUGIN_FILES#js/aop_da.min.js'))
,p_css_file_urls=>'#PLUGIN_FILES#css/spinkit.min.css'
,p_api_version=>1
,p_render_function=>'aop_api_pkg.f_render_aop'
,p_ajax_function=>'aop_api_pkg.f_ajax_aop'
,p_standard_attributes=>'ITEM:STOP_EXECUTION_ON_ERROR:WAIT_FOR_RESULT:INIT_JAVASCRIPT_CODE'
,p_substitute_attributes=>true
,p_version_scn=>44532527532031
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX Office Print (AOP) is created by United Codes to facilitate exporting data and printing documents in Oracle Application Express (APEX) based on an Office document (Word, Excel, Powerpoint) or HTML, Markdown, CSV, or Text. This plugin can only be'
||' used to print to AOP and is copyrighted by APEX R&D and United Codes. If you have any questions please contact support@apexofficeprint.com.',
'We hope you enjoy AOP!'))
,p_version_identifier=>'21.2'
,p_about_url=>'https://www.apexofficeprint.com'
,p_files_version=>265
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117779451182418356)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>1000
,p_prompt=>'AOP URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'https://localhost:8010'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'URL to APEX Office Print server. <br/>',
'When installed on the same server as the database using the default port you can use http://localhost:8010/ <br/>',
'To use AOP as a service, you can use http(s)://api.apexofficeprint.com/ <br/>',
'When using HTTPS, make sure to add the certificate to the wallet of your database. Alternatively you can setup a proxy rule in your webserver to do the HTTPS handshaking so the AOP plugin can call a local url. Instructions how to setup both options c'
||'an be found in the documentation.<br/>',
'When running AOP on the Oracle Cloud you are obliged to use HTTPS, so the url should be https://api.apexofficeprint.com/ or https://www.cloudofficeprint.com/aop/<br/>',
'You can also dynamically specify a url by an Application Item e.g. &AI_AOP_URL.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117779889307418358)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>2000
,p_prompt=>'API key'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>50
,p_max_length=>50
,p_is_translatable=>false
,p_help_text=>'Enter your API key found on your account when you login at https://www.apexofficeprint.com.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117780269840418358)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>3000
,p_prompt=>'Debug'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'No'
,p_help_text=>'By default debug is turned off.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117780655502418359)
,p_plugin_attribute_id=>wwv_flow_imp.id(117780269840418358)
,p_display_sequence=>10
,p_display_value=>'Remote'
,p_return_value=>'Yes'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling remote debug will capture the JSON and is made available in your dashboard at https://www.apexofficeprint.com.',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'This option only works when you use http(s)://www.apexofficeprint.com/api in your AOP settings.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117781209000418360)
,p_plugin_attribute_id=>wwv_flow_imp.id(117780269840418358)
,p_display_sequence=>20
,p_display_value=>'Local'
,p_return_value=>'Local'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling local debug will download the JSON that is sent to the AOP server component. ',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'Note that the output file will not be produced and the server will never be called.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117781635475418361)
,p_plugin_attribute_id=>wwv_flow_imp.id(117780269840418358)
,p_display_sequence=>30
,p_display_value=>'Derived from Application Item'
,p_return_value=>'APEX_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option is useful when you want to dynamically set AOP debugging.<br/>',
'The application item needs to be called AOP_DEBUG and can have values: No, Yes (=Remote) or Local.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117782129783418361)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>4000
,p_prompt=>'Converter'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'LibreOffice'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'To transform an Office document to PDF, APEX Office Print is using an external converter.',
'By default LibreOffice is used, but you can select another converter on request.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117782610434418362)
,p_plugin_attribute_id=>wwv_flow_imp.id(117782129783418361)
,p_display_sequence=>10
,p_display_value=>'MS Office (Windows only)'
,p_return_value=>'officetopdf'
,p_help_text=>'Uses Microsoft Office to do the conversion and following module http://officetopdf.codeplex.com'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117783038404418362)
,p_plugin_attribute_id=>wwv_flow_imp.id(117782129783418361)
,p_display_sequence=>20
,p_display_value=>'Custom'
,p_return_value=>'custom'
,p_help_text=>'Specify the name of the custom converter defined at the AOP Server.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117783574238418363)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>5
,p_display_sequence=>5000
,p_prompt=>'Settings package'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_display_length=>80
,p_max_length=>300
,p_is_translatable=>false
,p_examples=>'aop_settings_pkg'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'When you use a different AOP server in DEV, TEST, PROD it might be easier to define the package where the settings (e.g. AOP server) is defined.<br/>',
'This makes deployments seamless and you don''t need to update the plug-in component settings manually afterwards.<br/>',
'When a package is defined, we will always read those settings, regardless what is filled in above.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117783952785418363)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>6
,p_display_sequence=>1500
,p_prompt=>'AOP Failover URL'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Failover URL to APEX Office Print server incase the AOP URL fails. <br/>',
'When installed on the same server as the database using the default port you can use http://localhost:8010/ <br/>',
'To use AOP as a service, you can use http(s)://www.apexofficeprint.com/failover-api/ <br/>',
'When using HTTPS, make sure to add the certificate to the wallet of your database. Alternatively you can setup a proxy rule in your webserver to do the HTTPS handshaking so the AOP plugin can call a local url. Instructions how to setup both options c'
||'an be found in the documentation.<br/>',
'When running AOP on the Oracle Cloud you are obliged to use HTTPS, so the url should be https://www.apexofficeprint.com/failover-api/ or https://www.cloudofficeprint.com/aop/'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117784375729418364)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>7
,p_display_sequence=>9000
,p_prompt=>'Failover procedure'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117783952785418363)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_examples=>'aop_sample_pkg.failover_procedure;'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Specify the procedure that should be called when the failover url is used.',
'The procedure can for example send an email to notify the primary AOP url is not used, but the fallback url.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117784797832418364)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>8
,p_display_sequence=>8000
,p_prompt=>'Logging package'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>'see aop_log_pkg that comes with the AOP Sample app.'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If you want every request to aop_api_pkg.plsql_call_to_aop to be logged, you can specify a logging package here.<br/>',
'The logging package needs at least a function and a procedure with following definition:',
'<pre>',
'function start_request (',
'  p_data_type             in varchar2,',
'  p_data_source           in clob,',
'  p_template_type         in varchar2,',
'  p_template_source       in clob,',
'  p_output_type           in varchar2,',
'  p_output_filename       in varchar2 default null,',
'  p_output_type_item_name in varchar2 default null,',
'  p_output_to             in varchar2 default null,',
'  p_procedure             in varchar2 default null,',
'  p_binds                 in varchar2 default null,',
'  p_special               in varchar2 default null,',
'  p_aop_remote_debug      in varchar2 default null,',
'  p_output_converter      in varchar2 default null,',
'  p_aop_url               in varchar2,',
'  p_api_key               in varchar2,',
'  p_aop_mode              in varchar2 default null,',
'  p_app_id                in number   default null,',
'  p_page_id               in number   default null,',
'  p_user_name             in varchar2 default null,',
'  p_init_code             in clob     default null,',
'  p_output_encoding       in varchar2 default null,',
'  p_output_split          in varchar2 default null,',
'  p_output_merge          in varchar2 default null,',
'  p_failover_aop_url      in varchar2 default null,',
'  p_failover_procedure    in varchar2 default null,',
'  p_prepend_files_sql     in clob     default null,',
'  p_append_files_sql      in clob     default null,',
'  p_media_files_sql       in clob     default null,',
'  p_sub_templates_sql     in clob     default null',
') return number;',
'',
'',
'procedure end_request (',
'  p_aop_log_id            in number,  ',
'  p_status                in varchar2, ',
'  p_aop_json              in clob,',
'  p_aop_error             in varchar2, ',
'  p_ora_sqlcode           in number, ',
'  p_ora_sqlerrm           in varchar2',
')',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117785180199418365)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>9
,p_display_sequence=>4050
,p_prompt=>'Custom converter'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117782129783418361)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'custom'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'AOP Server config looks like this:',
'<br/>',
'<pre><code>',
'{',
'    "converters": {',
'        "abiword":{',
'            "command": "abiword --to={outputFormat} --to-name={outputFile} {inputFile}"',
'        },',
'        "other":{',
'            "command":""',
'        }',
'    }',
'}',
'</code></pre>',
'</p>',
'<p>',
'This means you can use abiword or other as the name of the custom converter.',
'</p>'))
,p_help_text=>'Specify the name of the custom converter as specified at the AOP Server e.g. abiword'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117785558142418366)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>10
,p_display_sequence=>2500
,p_prompt=>'AOP Mode'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Production'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Production (=null)',
'  Credits will be used.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117785962478418366)
,p_plugin_attribute_id=>wwv_flow_imp.id(117785558142418366)
,p_display_sequence=>10
,p_display_value=>'Development'
,p_return_value=>'development'
,p_help_text=>'In development mode no credits are used.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117786465691418367)
,p_plugin_attribute_id=>wwv_flow_imp.id(117785558142418366)
,p_display_sequence=>20
,p_display_value=>'Derived from Application Item'
,p_return_value=>'APEX_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option is useful when you want to dynamically set the AOP mode.<br/>',
'The application item needs to be called AOP_MODE and can have values: development, production  or null (=production).'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117786970164418371)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>23
,p_prompt=>'Data Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'URL,XML,JSON,JSON_FILES'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'select ',
'  ''file1'' as filename,  ',
'  cursor( ',
'    select',
'      c.cust_first_name, ',
'      c.cust_last_name, ',
'      c.cust_city, ',
'      cursor(select o.order_total, ''Order '' || rownum as order_name,',
'                cursor(select p.product_name, i.quantity, i.unit_price, APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as image ',
'                         from demo_order_items i, demo_product_info p ',
'                        where o.order_id = i.order_id ',
'                          and i.product_id = p.product_id ',
'                      ) product                 ',
'               from demo_orders o ',
'              where c.customer_id = o.customer_id ',
'            ) orders ',
'    from demo_customers c ',
'    where customer_id = :id ',
'  ) as data ',
'from dual ',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Specify the XML or JSON.',
'</p>',
'<p>For type URL:<br/>',
'Create (in for example ORDS) a new REST web service with a GET, source type "Query" and format "JSON".<br/>',
'Put the url in this text box, e.g. https://www.apexofficeprint.com/ords/aop/get_data/1',
'<br/><br/>',
'Here''s an example of a query which contains a parameter too:',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117787371358418374)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>27
,p_prompt=>'Special'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'SQL,PLSQL_SQL,IR'
,p_lov_type=>'STATIC'
,p_help_text=>'Specific features of APEX Office Print'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117787800185418375)
,p_plugin_attribute_id=>wwv_flow_imp.id(117787371358418374)
,p_display_sequence=>10
,p_display_value=>'Treat all numbers as strings'
,p_return_value=>'NUMBER_TO_STRING'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'There''s a limitation in APEX with the cursor() statement in SQL that it doesn''t remember which datatype the column is in. So when doing to_char(0.9,''990D00'') it will return 0.9 as number instead of as string ''0.90''. To resolve this, enable this check'
||'box and concatenate your number with ''!FMT!'' e.g. ''!FMT!''||to_char(35, ''990D00'') - !FMT! stands for format.',
'</p>',
'<p>',
'Alternatively if you format your number with the currency sign to_char(35,''FML990D00'') Oracle will recognise it as a string and you don''t need to use this checkbox.',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117788238251418378)
,p_plugin_attribute_id=>wwv_flow_imp.id(117787371358418374)
,p_display_sequence=>20
,p_display_value=>'Report as Labels'
,p_return_value=>'REPORT_AS_LABELS'
,p_help_text=>'Check this box in case you want to use the Classic or Interactive Report data source but print them as Labels (using the Mailings feature in Word).'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117788746305418379)
,p_plugin_attribute_id=>wwv_flow_imp.id(117787371358418374)
,p_display_sequence=>30
,p_display_value=>'IR/IG: Show Filters on top'
,p_return_value=>'FILTERS_ON_TOP'
,p_help_text=>'When there''re filters applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117789294376418381)
,p_plugin_attribute_id=>wwv_flow_imp.id(117787371358418374)
,p_display_sequence=>40
,p_display_value=>'IR/IG: Show Highlights on top'
,p_return_value=>'HIGHLIGHTS_ON_TOP'
,p_help_text=>'When there''re highlights applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117789756011418381)
,p_plugin_attribute_id=>wwv_flow_imp.id(117787371358418374)
,p_display_sequence=>50
,p_display_value=>'IR/IG: Show header with filter (Excel)'
,p_return_value=>'HEADER_WITH_FILTER'
,p_help_text=>'When exporting the Interactive Report to Excel, show the header with filter option.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117790263630418382)
,p_plugin_attribute_id=>wwv_flow_imp.id(117787371358418374)
,p_display_sequence=>60
,p_display_value=>'IR/IG: Use Saved Report instead of Report in Session'
,p_return_value=>'ALWAYS_REPORT_ALIAS'
,p_help_text=>'When defining the Interactive Report source ir1|my_saved_report, the "my_saved_report" will be used, even when the person is looking at a different report in his session session.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117790732478418383)
,p_plugin_attribute_id=>wwv_flow_imp.id(117787371358418374)
,p_display_sequence=>70
,p_display_value=>'IR/IG: Repeat header on every page'
,p_return_value=>'REPEAT_HEADER'
,p_help_text=>'When the table spans multiple pages, the header row will be repeated on every page.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117791282742418384)
,p_plugin_attribute_id=>wwv_flow_imp.id(117787371358418374)
,p_display_sequence=>80
,p_display_value=>'Obfuscate data'
,p_return_value=>'OBFUSCATE_DATA'
,p_help_text=>'Obfuscate data, so it''s easy to send examples to others.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117791762542418386)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Init PL/SQL Code'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'aop_api_pkg.g_output_filename      := ''output'';',
'aop_api_pkg.g_output_filename      := v(''P1_FILENAME'');',
'aop_api_pkg.g_rpt_header_font_size := ''12'';',
'aop_api_pkg.g_rpt_header_font_size := ''12'';',
'aop_api_pkg.g_prepend_files_sql    := q''[select filename, mime_type, template_blob as file_blob from aop_template where filename like ''PREPEND%'' order by filename]'';',
'aop_api_pkg.g_append_files_sql     := q''[select filename, mime_type, template_blob as file_blob from aop_template where filename like ''APPEND%'' order by filename]'';',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'You can define global variables of the aop_api_pkg in this area.<br/>',
'</p>',
'Available variables:',
'<pre>',
'-- Global variables',
'g_output_filename         varchar2(100) := null;',
'g_language                varchar2(2)   := ''en'';  -- Language can be: en, fr, nl, de',
'g_rpt_header_font_name    varchar2(50)  := '''';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163',
'g_rpt_header_font_size    varchar2(3)   := '''';    -- 14',
'g_rpt_header_font_color   varchar2(50)  := '''';    -- #071626',
'g_rpt_header_back_color   varchar2(50)  := '''';    -- #FAFAFA',
'g_rpt_header_border_width varchar2(50)  := '''';    -- 1 ; ''0'' = no border',
'g_rpt_header_border_color varchar2(50)  := '''';    -- #000000',
'g_rpt_data_font_name      varchar2(50)  := '''';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163',
'g_rpt_data_font_size      varchar2(3)   := '''';    -- 14',
'g_rpt_data_font_color     varchar2(50)  := '''';    -- #000000',
'g_rpt_data_back_color     varchar2(50)  := '''';    -- #FFFFFF',
'g_rpt_data_border_width   varchar2(50)  := '''';    -- 1 ; ''0'' = no border ',
'g_rpt_data_border_color   varchar2(50)  := '''';    -- #000000',
'g_rpt_data_alt_row_color  varchar2(50)  := '''';    -- #FFFFFF for no alt row color, use same color as g_rpt_data_back_color',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117792147894418387)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>31
,p_prompt=>'Output Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'docx'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117792516869418388)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>10
,p_display_value=>'Word (docx)'
,p_return_value=>'docx'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117793078029418389)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>20
,p_display_value=>'Excel (xlsx)'
,p_return_value=>'xlsx'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117793517747418390)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>30
,p_display_value=>'Powerpoint (pptx)'
,p_return_value=>'pptx'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117794097749418391)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>40
,p_display_value=>'PDF (pdf)'
,p_return_value=>'pdf'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117794556660418393)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>60
,p_display_value=>'HTML (html)'
,p_return_value=>'html'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117795114245418395)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>65
,p_display_value=>'Markdown (md)'
,p_return_value=>'md'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117795531487418396)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>66
,p_display_value=>'Text (txt)'
,p_return_value=>'txt'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117796077501418397)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>67
,p_display_value=>'Rich Text Format (rtf)'
,p_return_value=>'rtf'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117796571019418399)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>68
,p_display_value=>'CSV (csv)'
,p_return_value=>'csv'
,p_help_text=>'Comma separated values file. Text file containing information separated by commas.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117797065291418400)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>69
,p_display_value=>'One Page PDF (pdf)'
,p_return_value=>'onepagepdf'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117797541008418401)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>70
,p_display_value=>'PDF Form Fields (pdf)'
,p_return_value=>'form_fields'
,p_help_text=>'Get the form fields defined on a PDF.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117798022891418402)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>210
,p_display_value=>'Word with macros (docm)'
,p_return_value=>'docm'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117798546694418402)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>220
,p_display_value=>'Excel with macros (xlsm)'
,p_return_value=>'xlsm'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117799110173418403)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>230
,p_display_value=>'Powerpoint with macros (pptm)'
,p_return_value=>'pptm'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117799554392418404)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>240
,p_display_value=>'Calendar (ics)'
,p_return_value=>'ics'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117800086962418404)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>250
,p_display_value=>'Calendar (ifb)'
,p_return_value=>'ifb'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117800519970418405)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>520
,p_display_value=>'OpenDocument Text (odt)'
,p_return_value=>'odt'
,p_help_text=>'OpenOffice Word'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117801062645418406)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>530
,p_display_value=>'OpenDocument Spreadsheet (ods)'
,p_return_value=>'ods'
,p_help_text=>'OpenOffice Excel'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117801564291418406)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>540
,p_display_value=>'OpenDocument Presentation (odp)'
,p_return_value=>'odp'
,p_help_text=>'OpenOffice Powerpoint'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117802025819418407)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>550
,p_display_value=>'XML (xml)'
,p_return_value=>'xml'
,p_help_text=>'Extensible Markup Language is a markup language that defines a set of rules for encoding documents in a format that is both human-readable and machine-readable.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117802611771418408)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>560
,p_display_value=>'JSON (json)'
,p_return_value=>'json'
,p_help_text=>'JSON stands for JavaScript Object Notation. JSON is a lightweight data-interchange format.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117803073193418409)
,p_plugin_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_display_sequence=>900
,p_display_value=>'Defined by APEX Item'
,p_return_value=>'apex_item'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117803560551418410)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>20
,p_prompt=>'Data Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'SQL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117803946567418411)
,p_plugin_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a select statement in which you can use a cursor to do nested records. Use "" as alias for column names to force lower case column names.<br/>You can also use SQL that generates JSON.',
'<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.',
'<br/>',
'',
'<p><b>Cursor syntax:</b></p>',
'<p>Details of a customer e.g. for a letter</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor',
'    (select ',
'         c.cust_first_name as "cust_first_name",',
'         c.cust_last_name as "cust_last_name",',
'         c.cust_city as "cust_city"',
'       from demo_customers c',
'      where c.customer_id = :PXX_ITEM ',
'    ) as "data"',
'from dual',
'</pre>',
'',
'<p><b>Native JSON database functionality:</b></p>',
'<p>Details of a customer e.g. for a letter</p>',
'<pre>',
'select ',
'  json_arrayagg( ',
'    json_object( ',
'      ''filename'' value ''file1'', ',
'      ''data''     value (select ',
'                          json_arrayagg(',
'                            json_object( ',
'                              ''cust_first_name'' value c.cust_first_name, ',
'                              ''cust_last_name''  value c.cust_last_name,',
'                              ''cust_city''       value c.cust_city ',
'                            )',
'                          )  ',
'                          from demo_customers c',
'                          where c.customer_id = :PXX_ITEM',
'                        )  ',
'    )',
'  ) as aop_json',
'  from dual ',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117804482964418413)
,p_plugin_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_display_sequence=>15
,p_display_value=>'PL/SQL Function (returning SQL)'
,p_return_value=>'PLSQL_SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a PL/SQL procedure that returns as select statement in which you can use a cursor to do nested records. Use "" as alias for column names to force lower case column names.<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117804963932418414)
,p_plugin_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Function (returning JSON)'
,p_return_value=>'PLSQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Return JSON as defined in the URL example above.',
'(see example in help of Data Source)'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117805474381418416)
,p_plugin_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_display_sequence=>30
,p_display_value=>'URL (returning JSON)'
,p_return_value=>'URL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The Source should point to a URL that returns a JSON object with following format:',
'{',
'  "filename": "file1",',
'  "data":[{...}]',
'}',
'If the URL is using an APEX/ORDS REST call it will automatically be wrapped with additional JSON: {"items":[...]} This is ok as the plugin removes it for you.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117805997690418418)
,p_plugin_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_display_sequence=>40
,p_display_value=>'Region(s): Classic Report, Interactive Report/Grid, SVG, Canvas, HTML, Other'
,p_return_value=>'IR'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Enter a comma separated list of static id of one of following region types:',
'<ul>',
'<li>Classic Report</li>',
'<li>Interactive Report</li>',
'<li>Interactive Grid</li>',
'<li>JET Chart</li>',
'<li>Any other region (static html, div, plugin) which you want to include</li>',
'</ul>',
'</p>',
'<p>',
'e.g. my_classic_report,ir1,jet2,my_div',
'</p>',
'<p>',
'In your template you can include the entire Interactive Report by using the tag {&interactive_1} for the first interactive report, {&interactive_2} for the second etc.',
'<br/>',
'To include an Interactive Grid as you see on the screen you use the tag {&interactive_<static_id>}.',
'<br/>',
'If you just want to get the data and do the styling yourself, you can use for classic report: {#<static_id>}{column}{/<static_id} or for interactive report {#aopireportdata_1}{column}{/aopireportdata_1}.',
'For interactive grid use {#aopigridoptions_<static_id>} {column} {/aopigridoptions_<static_id>}',
'<br/>',
'To include the svg(s) in the div use {%region} and specify in the Custom Attributes of the region: aop-region-as="client_svg"',
'<br/>',
'To include a canvas in the div use {%region} and specify in the Custom Attributes of the region: aop-region-as="client_canvas"',
'<br/>',
'To include the html in the div use {_region} and specify in the Custom Attributes of the region: aop-region-as="server_html" or aop-region-as="client_html". AOP will translate the html into native Word styling either by passing the HTML defined in th'
||'e Region Source (server_html) or defined after rendering on the page (client_html).',
'<br/>',
'To include a screenshot of the div use {%region}, you don''t have to specify anything or you can specify in the Custom Attributes of the region: aop-region-as="client_screenshot".',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117806468956418419)
,p_plugin_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_display_sequence=>50
,p_display_value=>'XML (data part)'
,p_return_value=>'XML'
,p_help_text=>'Data in XML format. No need to specify files or filename.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117806965351418420)
,p_plugin_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_display_sequence=>60
,p_display_value=>'JSON (data part)'
,p_return_value=>'JSON'
,p_help_text=>'Data in JSON format. No need to specify files or filename.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117807498363418421)
,p_plugin_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_display_sequence=>70
,p_display_value=>'JSON (REST, GraphQL, Raw)'
,p_return_value=>'JSON_FILES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter JSON in format ',
'<code>',
'[',
'{ "filename": "xxx.docx",',
'  "datasource": "graphql",',
'  "query": "{human(id:\"1000\"){name height}",',
'  "endpoint": "https://api.graph.cool/simple/v1/",',
'  "headers": [{"Content-Type":"application/json"},{"Custom-Auth-Token":"xyz"}]',
'} ',
']',
'</code>',
'',
'The files part of the AOP structure will be filled in with the value specified here.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117807968878418423)
,p_plugin_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_display_sequence=>80
,p_display_value=>'None'
,p_return_value=>'NONE'
,p_help_text=>'To only append or prepend files or to work with PDFs, set the data type to none.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117808456705418424)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>10
,p_prompt=>'Template Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'AOP Template'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'<b>AOP Template</b>: will generate a Word document with a starting template based on the data (JSON) that is submitted. <br/>',
'Documentation is also added on the next page(s) that describe the functions AOP will understand.',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117808870489418428)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>1
,p_display_value=>'AOP Report'
,p_return_value=>'AOP_REPORT'
,p_help_text=>'AOP will generate a report for you based on the Print Attributes specified in the given region (in case multiple regions are specified, the first region is used for the Print Attributes).'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117809377112418429)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>3
,p_display_value=>'APEX Report'
,p_return_value=>'APEX_REPORT'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'From APEX 20.2 onwards, APEX supports the creation of native Excel and PDF of a region. Using APEX Report will use this feature. Note: only 1 region (static id) can be rendered.',
'An alternative to APEX Report is an AOP Report, which uses the AOP rendering and which supports also HTML expressions.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117809896823418431)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>4
,p_display_value=>'APEX Report (Data only)'
,p_return_value=>'APEX_REPORT_DO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'From APEX 20.2 onwards, APEX supports the creation of native Excel and PDF of a region. Using APEX Report will use this feature. Data only will remove highlights etc. and just export the data. Note: only 1 region (static id) can be rendered.',
'An alternative to APEX Report is an AOP Report, which uses the AOP rendering and which supports also HTML expressions.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117810379779418435)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>5
,p_display_value=>'Static Application Files'
,p_return_value=>'APEX'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Application Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117810822582418436)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>7
,p_display_value=>'Static Workspace Files'
,p_return_value=>'WORKSPACE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Workspace Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117815329746418454)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Query that returns two columns: template_type and file (in this order) <br/>',
'- template_type: docx, xlsx, pptx, html, md <br/>',
'- file: blob column'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117811383302418437)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>15
,p_display_value=>'PL/SQL Function (returning SQL)'
,p_return_value=>'PLSQL_SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a PL/SQL procedure that returns a select statement with two columns: template_type and file (in this order) <br/>',
'- template_type: docx, xlsx, pptx, html, md <br/>',
'- file: blob column',
'<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117811872553418438)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Function (returning JSON)'
,p_return_value=>'PLSQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Return JSON object with following format: ',
'<pre>',
'{',
'  "file":"clob base 64 data",',
'  "template_type":"docx,xlsx,pptx"',
'}',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117812387861418439)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>25
,p_display_value=>'JSON'
,p_return_value=>'JSON'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Add the JSON of "template" in here. <br/>',
'e.g.:',
'<pre>',
'{"filename":"aop_template_d01.docx", "template_type":"docx"}',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117812901918418440)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>30
,p_display_value=>'Filename (with path relative to AOP server)'
,p_return_value=>'FILENAME'
,p_help_text=>'Enter the path and filename of the template which is stored on the same server AOP is running at.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117813398704418443)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>35
,p_display_value=>'Filename (with database directory)'
,p_return_value=>'DB_DIRECTORY'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the Database directory colon separated with the filename. <br/>',
'e.g. AOP_TEMPLATE:my_template.docx',
'<br/><br/>',
'Example how to create Database directory: <br/>',
'CREATE DIRECTORY AOP_TEMPLATE AS ''/home/oracle/aop_template'';'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117813855021418445)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>40
,p_display_value=>'URL (call from DB)'
,p_return_value=>'URL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the url to your template in docx, xlsx or pptx. <br/>',
'e.g. https://www.apexofficeprint.com/templates/aop_template_d01.docx',
'<br/><br/>',
'Always make sure your url ends with the filename. E.g. for Google Drive add to the end of the url &aop=.docx',
'<br/><br/>',
'This call is done from the database, so the database server needs to have access to the url.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117814357598418446)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>50
,p_display_value=>'URL (call from AOP)'
,p_return_value=>'URL_AOP'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the url to your template in docx, xlsx or pptx. <br/>',
'e.g. https://www.apexofficeprint.com/templates/aop_template_d01.docx ',
'<br/><br/>',
'Always make sure your url ends with the filename. E.g. for Google Drive add to the end of the url &aop=.docx',
'<br/><br/>',
'This call is done from AOP, so the AOP server needs to have access to the url.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117814840127418452)
,p_plugin_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_display_sequence=>60
,p_display_value=>'None'
,p_return_value=>'NONE'
,p_help_text=>'To only append or prepend files or to fill PDFs, set the template type to none.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117816234313418458)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>11
,p_prompt=>'Template Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'APEX,WORKSPACE,FILENAME,URL,URL_AOP,DB_DIRECTORY,JSON'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Reference a file in Shared Components > Static Application Files or Static Workspace Files <br/>',
'<pre>',
'aop_template.docx',
'</pre>',
'In case you want to specify the template dynamically, use the SQL option with following:',
'<pre>',
'select case ',
'        when mime_type = ''application/octet-stream''',
'        then substr(file_name, instr(file_name,''.'',-1)+1) ',
'        else mime_type',
'        end as template_type, ',
'        file_content as template_blob',
'  from apex_application_static_files',
' where file_name    = :PXX_YOUR_ITEM',
'   and application_id = :APP_ID',
'</pre>',
'</p>',
'<p>',
'Reference a file on the server. Include the path relative to the AOP executable.',
'</p>',
'<p>',
'Reference a url, accessible from the database.',
'</p>',
'<p>',
'Reference a url, accessible from the AOP Server.',
'</p>',
'<p>',
'Specify the region static id where the Print Attributes are specified for the AOP Report.',
'</p>',
'<p>',
'Reference a database directory and file on the database server. Format: DIRECTORY:FILENAME e.g. AOP_TEMPLATE:my_template.docx',
'</p>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The templates need to be of format: Word (docx), Excel (xlsx), Powerpoint (pptx), HTML (html), Text (txt), CSV (csv) or Markdown (md).',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117816650458418458)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>32
,p_prompt=>'Output Type APEX Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117792147894418387)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'apex_item'
,p_help_text=>'APEX item that contains the output type. See Output Type help text for valid list of output types.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117817098372418460)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>12
,p_prompt=>'Template Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'To query your own table:',
'<pre>',
' select template_type, template_blob',
'  from aop_template  ',
' where id = :P1_TEMPLATE_ID ',
'</pre>',
'To query the APEX static application files use:',
'<pre>',
'select case ',
'        when mime_type = ''application/octet-stream''',
'        then substr(file_name, instr(file_name,''.'',-1)+1) ',
'        else mime_type',
'        end as template_type, ',
'        file_content as template_blob',
'  from apex_application_static_files',
' where file_name    = :PXX_YOUR_ITEM',
'   and application_id = :APP_ID',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'When you use your own table (or the one that is provided in the sample AOP app) to store the template documents, this select statement might help:',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117815847080418456)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>13
,p_prompt=>'Template Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117808456705418424)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL,PLSQL_SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3>PL/SQL Function (returning SQL)</h3>',
'<pre>',
'declare',
'  l_return clob;',
'begin',
'  l_return := q''[',
'    select',
'      a.TEMPLATE_TYPE as template_type,',
'      apex_web_service.blob2clobbase64(a.TEMPLATE_BLOB) as file',
'     from aop_template a',
'    where id = 1',
'  ]'';',
'  return l_return;',
'end;',
'</pre>',
'',
'<br/><br/>',
'',
'<h3>PL/SQL Function (returning JSON)</h3>',
'<pre>',
'declare ',
'  l_return        clob; ',
'  l_template      clob; ',
'  l_template_type aop_template.template_type%type; ',
'begin ',
'  select template_type, apex_web_service.blob2clobbase64(template_blob) template ',
'    into l_template_type, l_template ',
'    from aop_template ',
'   where id = :p4_template;',
'',
'  l_return := ''{ "file": "'' || replace(l_template,''"'', ''\u0022'') ',
'              || ''",'' || '' "template_type": "'' || replace(l_template_type,''"'', ''\u0022'') ',
'              || ''" }''; ',
'',
'  return l_return;',
'end;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'By using PL/SQL to create your own SQL or JSON, you''re more flexible. You can use bind variables and page items.',
'</p>',
'<p>',
'The JSON format should be file and template_type. You can use substitution variables in the PL/SQL code. <br/>',
'The structure is like this:',
'</p>',
'<pre>',
'declare ',
'  l_return        clob; ',
'begin ',
'  l_return := ''{ "file": "", "template_type": "docx" }''; ',
'',
'  return l_return; ',
'end;',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117823027322418486)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>21
,p_prompt=>'Data Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>1
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><b>Cursor syntax:</b></p>',
'<p>List of all customers e.g. to send letter to all</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor',
'    (select ',
'       cursor(select',
'                  c.cust_first_name as "cust_first_name",',
'                  c.cust_last_name as "cust_last_name",',
'                  c.cust_city as "cust_city" ',
'                from demo_customers c) as "customers"',
'       from dual) as "data"',
'from dual ',
'</pre>',
'<p>Details of all orders of a customer e.g. for invoices</p>',
'<pre>',
'select',
'  ''file1'' as "filename", ',
'  cursor(',
'    select',
'      c.cust_first_name as "cust_first_name",',
'      c.cust_last_name as "cust_last_name",',
'      c.cust_city as "cust_city",',
'      cursor(select o.order_total as "order_total", ',
'                    ''Order '' || rownum as "order_name",',
'                cursor(select p.product_name as "product_name", ',
'                              i.quantity as "quantity",',
'                              i.unit_price as "unit_price", ',
'                              APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"',
'                         from demo_order_items i, demo_product_info p',
'                        where o.order_id = i.order_id',
'                          and i.product_id = p.product_id',
'                      ) "product"',
'               from demo_orders o',
'              where c.customer_id = o.customer_id',
'            ) "orders"',
'    from demo_customers c',
'    where customer_id = :P1_CUSTOMER_ID',
'  ) as "data"',
'from dual',
'</pre>',
'',
'<p><b>Native JSON database functionality:</b></p>',
'<p>Details of a customer e.g. for a letter</p>',
'<pre>',
'select ',
'  json_arrayagg( ',
'    json_object( ',
'      ''filename'' value ''file1'', ',
'      ''data''     value (select ',
'                          json_arrayagg(',
'                            json_object( ',
'                              ''cust_first_name'' value c.cust_first_name, ',
'                              ''cust_last_name''  value c.cust_last_name,',
'                              ''cust_city''       value c.cust_city ',
'                            )',
'                          )  ',
'                          from demo_customers c',
'                          where c.customer_id = 1',
'                        )  ',
'    )',
'  ) as aop_json',
'  from dual ',
'</pre>',
'<p>Details of all orders of a customer e.g. for invoices</p>',
'<pre>',
'select ',
'json_arrayagg( ',
'json_object( ',
'''filename'' value ''file1'', ',
'''data''     value (',
'  select ',
'    json_arrayagg(',
'      json_object( ',
'        ''cust_first_name'' value c.cust_first_name, ',
'        ''cust_last_name''  value c.cust_last_name,',
'        ''cust_city''       value c.cust_city, ',
'        ''orders''          value (',
'            select ',
'              json_arrayagg(',
'                json_object(                               ',
'                  ''order_total'' value o.order_total, ',
'                  ''order_name''  value ''Order '' || rownum,',
'                  ''order_lines'' value (',
'                      select ',
'                        json_arrayagg(',
'                          json_object(                               ',
'                            ''product_name'' value p.product_name, ',
'                            ''quantity''     value i.quantity,',
'                            ''unit_price''   value i.unit_price',
'                          )',
'                        returning clob)      ',
'                        from demo_order_items i, demo_product_info p',
'                        where o.order_id = i.order_id',
'                          and i.product_id = p.product_id',
'                    )',
'                )',
'              returning clob)      ',
'              from demo_orders o',
'            where o.customer_id = c.customer_id',
'          )',
'      )',
'    returning clob)  ',
'    from demo_customers c',
'    where c.customer_id = :P1_CUSTOMER_ID',
'  )',
')',
'returning clob) as aop_json',
'from dual',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'A SQL statement is the easiest to use, either by using the cursor syntax or native JSON database functionality.<br/>',
'Images need to be base64 encoded. You can reference items by using :ITEM ',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117817449871418464)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>22
,p_prompt=>'Data Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL,PLSQL_SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3>PL/SQL Function (returning SQL)</h3>',
'<pre>',
'declare',
'  l_return clob;',
'begin',
'  l_return := q''[',
'    select',
'      ''file1'' as "filename",',
'      cursor(',
'        select',
'          c.cust_first_name as "cust_first_name",',
'          c.cust_last_name as "cust_last_name",',
'          c.cust_city as "cust_city",',
'          cursor(',
'            select',
'              o.order_total as "order_total",',
'              ''Order '' || rownum as "order_name",',
'              cursor(',
'                select',
'                  p.product_name as "product_name",',
'                  i.quantity as "quantity",',
'                  i.unit_price as "unit_price",',
'                  APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"',
'                from',
'                  demo_order_items i, demo_product_info p',
'                where',
'                  o.order_id = i.order_id',
'                  and i.product_id = p.product_id',
'                    ) "product"',
'            from',
'              demo_orders o',
'            where',
'              c.customer_id = o.customer_id',
'                ) "orders"',
'        from',
'          demo_customers c',
'        where',
'          customer_id = :P4_CUSTOMER_ID',
'            ) as "data"',
'    from dual',
'  ]'';',
'  return l_return;',
'end;',
'</pre>',
'',
'<br/><br/>',
'',
'<h3>PL/SQL Function (returning JSON)</h3>',
'<pre>',
'declare',
'  l_cursor sys_refcursor;',
'  l_return clob;',
'begin',
'  apex_json.initialize_clob_output(dbms_lob.call, true, 2) ;',
'  open l_cursor for ',
'  select ''file1'' as "filename",',
'  cursor',
'    (select',
'        c.cust_first_name as "cust_first_name",',
'        c.cust_last_name  as "cust_last_name" ,',
'        c.cust_city       as "cust_city"      ,',
'        cursor',
'        (select',
'            o.order_total      as "order_total",',
'            ''Order '' || rownum as "order_name" ,',
'            cursor',
'            (select',
'                p.product_name                                    as "product_name",',
'                i.quantity                                        as "quantity"    ,',
'                i.unit_price                                      as "unit_price"  ,',
'                apex_web_service.blob2clobbase64(p.product_image) as "image"',
'              from',
'                demo_order_items i,',
'                demo_product_info p',
'              where',
'                o.order_id       = i.order_id',
'                and i.product_id = p.product_id',
'            ) "product"',
'        from',
'          demo_orders o',
'        where',
'          c.customer_id = o.customer_id',
'        ) "orders"',
'      from',
'        demo_customers c',
'      where',
'        customer_id = :P4_CUSTOMER_ID',
'    ) as "data" ',
'  from dual;',
'  apex_json.write(l_cursor) ;',
'  l_return := apex_json.get_clob_output;',
'  return l_return;',
'end;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'By using PL/SQL to create your own SQL or JSON, you''re more flexible. You can use bind variables and page items.',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117817899862418465)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>25
,p_prompt=>'Region Static Id(s)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117803560551418410)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'IR'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Define one or more Static Id(s) of the report region. Static ids should be separated by a comma. e.g. ir1,ir2 <br/>',
'You can set the Static ID of the region in the region settings (Advanced section). Under Static ID in the Custom Attributes you can define how AOP should behave: aop-region-as="server_html / client_canvas / client_svg / client_html / client_screensho'
||'t". Depending this setting, AOP will render the HTML from the server or it will take from client the canvas, svg, html or take a screenshot of the region.',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117818257492418469)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Output To'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Browser (file)'
,p_help_text=>'By default the file that''s generated by AOP, will be downloaded by the Browser and saved on your harddrive.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117818625515418469)
,p_plugin_attribute_id=>wwv_flow_imp.id(117818257492418469)
,p_display_sequence=>10
,p_display_value=>'Procedure'
,p_return_value=>'PROCEDURE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option will call a procedure in a specific format. This option is useful in case you don''t need the file on your own harddrive, but for example you want to mail the document automatically.',
'In that case you can create a procedure that adds the generated document as an attachment to your apex_mail.send.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117819176231418471)
,p_plugin_attribute_id=>wwv_flow_imp.id(117818257492418469)
,p_display_sequence=>20
,p_display_value=>'Procedure and Browser (file)'
,p_return_value=>'PROCEDURE_BROWSER'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option allows you to call a procedure first and next download the file to your harddrive.',
'An example is when you first want to store the generated document in a table before letting the browser to download it.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117819671979418474)
,p_plugin_attribute_id=>wwv_flow_imp.id(117818257492418469)
,p_display_sequence=>30
,p_display_value=>'Inline Region (pdf/html/md/txt only)'
,p_return_value=>'BROWSER_INLINE'
,p_help_text=>'add data-aop-inline-pdf="Name of Dynamic Action" or data-aop-inline-txt="Name of Dynamic Action" to a region, div, textarea of other.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117820155582418477)
,p_plugin_attribute_id=>wwv_flow_imp.id(117818257492418469)
,p_display_sequence=>35
,p_display_value=>'Procedure and Inline Region (pdf/html/md/txt only)'
,p_return_value=>'PROCEDURE_INLINE'
,p_help_text=>'This option allows you to call a procedure first and next show the output in a region. Add data-aop-inline-pdf="Name of Dynamic Action" or data-aop-inline-txt="Name of Dynamic Action" to a region, div, textarea of other.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117820626176418478)
,p_plugin_attribute_id=>wwv_flow_imp.id(117818257492418469)
,p_display_sequence=>40
,p_display_value=>'Directory (on AOP Server)'
,p_return_value=>'DIRECTORY'
,p_help_text=>'Save the file to a directory specified with g_output_directory. The default directory on the AOP Server is outputfiles.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117821208676418479)
,p_plugin_attribute_id=>wwv_flow_imp.id(117818257492418469)
,p_display_sequence=>45
,p_display_value=>'Directory (on Database Server)'
,p_return_value=>'DB_DIRECTORY'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Save the file to a database directory specified with g_output_directory. ',
'<br/>',
'Example how to create Database directory: <br/>',
'CREATE DIRECTORY AOP_TEMPLATE AS ''/home/oracle/aop_output'';'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117821691493418482)
,p_plugin_attribute_id=>wwv_flow_imp.id(117818257492418469)
,p_display_sequence=>50
,p_display_value=>'Cloud (Dropbox, Google Drive, OneDrive, Amazon S3)'
,p_return_value=>'CLOUD'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Save the output straight in a directory on the cloud. <br/>',
'Use following global variables to define the provider and location.',
'<ul>',
'<li>g_cloud_provider (dropbox, gdrive, onedrive, amazon_s3)</li>',
'<li>g_cloud_location (directory, or bucket with directory on Amazon)</li>',
'<li>g_cloud_access_token (oauth token)</li>',
'</ul>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(117822178982418483)
,p_plugin_attribute_id=>wwv_flow_imp.id(117818257492418469)
,p_display_sequence=>60
,p_display_value=>'Defined in Post Process (e.g. Printer)'
,p_return_value=>'NA'
,p_help_text=>'Use when an external post-process command is specified and the output is only needed to be passed to that process. For example when you want to print directly to a Printer or call an OS command.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(117822669121418485)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Procedure Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(117818257492418469)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PROCEDURE,PROCEDURE_BROWSER,PROCEDURE_INLINE'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Create following procedure in the database:',
'</p>',
'<pre>',
'create procedure send_email_prc(',
'    p_output_blob      in blob,',
'    p_output_filename  in varchar2,',
'    p_output_mime_type in varchar2)',
'is',
'  l_id number;',
'begin',
'  l_id := apex_mail.send( ',
'            p_to => ''support@apexofficeprint.com'', ',
'            p_from => ''support@apexofficeprint.com'', ',
'            p_subj => ''Mail from APEX with attachment'', ',
'            p_body => ''Please review the attachment.'', ',
'            p_body_html => ''<b>Please</b> review the attachment.'') ;',
'  apex_mail.add_attachment( ',
'      p_mail_id    => l_id, ',
'      p_attachment => p_output_blob, ',
'      p_filename   => p_output_filename, ',
'      p_mime_type  => p_output_mime_type) ;',
'  commit;    ',
'end send_email_prc;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter only the procedure name in this field (so without parameters) for example "download_prc".',
'The procedure in the database needs to be structured with the parameters as in the example. ',
'The procedure name can be any name, but the parameters need to match exactly as in the example.',
'You can add other parameters with a default value.'))
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(117827555659418495)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
,p_depending_on_has_to_exist=>true
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'AOP.gAOPOptions.waitSpinner = ''three-bounce'';<br>',
'AOP.gAOPOptions.showNotification = false;<br>',
'AOP.gAOPOptions.notificatonMessage = ''An AOP error occurred'';'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<strong>Options</strong><br>',
'<strong>AOP.gAOPOptions.waitSpinner - Waiting Spinner</strong><br>',
'Available waiting spinners:<br>',
'apex (default), double-bounce, three-bounce, rotating-plane, fading-circle, folding-cube, wave, wandering-cubes, pulse, chasing-dots, circle, cube-grid<br><br>',
'<strong>AOP.gAOPOptions.showNotification - Show Notification if something went wrong</strong><br>',
'Values: true (default) / false<br><br>',
'<strong>AOP.gAOPOptions.notificatonMessage - Overrides Server-side Notification Message</strong><br>'))
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(117827970939418495)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_name=>'aop-file-error'
,p_display_name=>'AOP Print File Error'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(117828351897418496)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_name=>'aop-file-progress'
,p_display_name=>'AOP Print File Progress'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(117828778453418497)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_name=>'aop-file-success'
,p_display_name=>'AOP Print File Success'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E736B2D726F746174696E672D706C616E657B77696474683A343070783B6865696768743A343070783B6261636B67726F756E642D636F6C6F723A233333333B6D617267696E3A34307078206175746F3B2D7765626B69742D616E696D6174696F6E3A73';
wwv_flow_imp.g_varchar2_table(2) := '6B2D726F74617465506C616E6520312E327320696E66696E69746520656173652D696E2D6F75743B616E696D6174696F6E3A736B2D726F74617465506C616E6520312E327320696E66696E69746520656173652D696E2D6F75747D402D7765626B69742D';
wwv_flow_imp.g_varchar2_table(3) := '6B65796672616D657320736B2D726F74617465506C616E657B30257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831323070782920726F746174655828306465672920726F74617465592830646567293B7472616E73666F';
wwv_flow_imp.g_varchar2_table(4) := '726D3A70657273706563746976652831323070782920726F746174655828306465672920726F74617465592830646567297D3530257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D';
wwv_flow_imp.g_varchar2_table(5) := '3138302E316465672920726F74617465592830646567293B7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D3138302E316465672920726F74617465592830646567297D313030257B2D7765626B69742D74';
wwv_flow_imp.g_varchar2_table(6) := '72616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D3138306465672920726F7461746559282D3137392E39646567293B7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558';
wwv_flow_imp.g_varchar2_table(7) := '282D3138306465672920726F7461746559282D3137392E39646567297D7D406B65796672616D657320736B2D726F74617465506C616E657B30257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831323070782920726F7461';
wwv_flow_imp.g_varchar2_table(8) := '74655828306465672920726F74617465592830646567293B7472616E73666F726D3A70657273706563746976652831323070782920726F746174655828306465672920726F74617465592830646567297D3530257B2D7765626B69742D7472616E73666F';
wwv_flow_imp.g_varchar2_table(9) := '726D3A70657273706563746976652831323070782920726F7461746558282D3138302E316465672920726F74617465592830646567293B7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D3138302E316465';
wwv_flow_imp.g_varchar2_table(10) := '672920726F74617465592830646567297D313030257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D3138306465672920726F7461746559282D3137392E39646567293B7472616E73';
wwv_flow_imp.g_varchar2_table(11) := '666F726D3A70657273706563746976652831323070782920726F7461746558282D3138306465672920726F7461746559282D3137392E39646567297D7D2E736B2D646F75626C652D626F756E63657B77696474683A343070783B6865696768743A343070';
wwv_flow_imp.g_varchar2_table(12) := '783B706F736974696F6E3A72656C61746976653B6D617267696E3A34307078206175746F7D2E736B2D646F75626C652D626F756E6365202E736B2D6368696C647B77696474683A313030253B6865696768743A313030253B626F726465722D7261646975';
wwv_flow_imp.g_varchar2_table(13) := '733A3530253B6261636B67726F756E642D636F6C6F723A233333333B6F7061636974793A2E363B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B2D7765626B69742D616E696D6174696F6E3A736B2D646F75626C65426F75';
wwv_flow_imp.g_varchar2_table(14) := '6E636520327320696E66696E69746520656173652D696E2D6F75743B616E696D6174696F6E3A736B2D646F75626C65426F756E636520327320696E66696E69746520656173652D696E2D6F75747D2E736B2D646F75626C652D626F756E6365202E736B2D';
wwv_flow_imp.g_varchar2_table(15) := '646F75626C652D626F756E6365327B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D312E30733B616E696D6174696F6E2D64656C61793A2D312E30737D402D7765626B69742D6B65796672616D657320736B2D646F75626C65426F756E63';
wwv_flow_imp.g_varchar2_table(16) := '657B30252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3530257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A736361';
wwv_flow_imp.g_varchar2_table(17) := '6C652831297D7D406B65796672616D657320736B2D646F75626C65426F756E63657B30252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3530257B2D7765626B69742D';
wwv_flow_imp.g_varchar2_table(18) := '7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D2E736B2D776176657B6D617267696E3A34307078206175746F3B77696474683A353070783B6865696768743A343070783B746578742D616C69676E3A63';
wwv_flow_imp.g_varchar2_table(19) := '656E7465723B666F6E742D73697A653A313070787D2E736B2D77617665202E736B2D726563747B6261636B67726F756E642D636F6C6F723A233333333B6865696768743A313030253B77696474683A3670783B646973706C61793A696E6C696E652D626C';
wwv_flow_imp.g_varchar2_table(20) := '6F636B3B2D7765626B69742D616E696D6174696F6E3A736B2D776176655374726574636844656C617920312E327320696E66696E69746520656173652D696E2D6F75743B616E696D6174696F6E3A736B2D776176655374726574636844656C617920312E';
wwv_flow_imp.g_varchar2_table(21) := '327320696E66696E69746520656173652D696E2D6F75747D2E736B2D77617665202E736B2D72656374317B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D312E32733B616E696D6174696F6E2D64656C61793A2D312E32737D2E736B2D77';
wwv_flow_imp.g_varchar2_table(22) := '617665202E736B2D72656374327B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D312E31733B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D77617665202E736B2D72656374337B2D7765626B69742D616E696D617469';
wwv_flow_imp.g_varchar2_table(23) := '6F6E2D64656C61793A2D31733B616E696D6174696F6E2D64656C61793A2D31737D2E736B2D77617665202E736B2D72656374347B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E39733B616E696D6174696F6E2D64656C61793A2D30';
wwv_flow_imp.g_varchar2_table(24) := '2E39737D2E736B2D77617665202E736B2D72656374357B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E38733B616E696D6174696F6E2D64656C61793A2D302E38737D402D7765626B69742D6B65796672616D657320736B2D776176';
wwv_flow_imp.g_varchar2_table(25) := '655374726574636844656C61797B30252C3430252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C655928302E34293B7472616E73666F726D3A7363616C655928302E34297D3230257B2D7765626B69742D7472616E73666F726D3A';
wwv_flow_imp.g_varchar2_table(26) := '7363616C65592831293B7472616E73666F726D3A7363616C65592831297D7D406B65796672616D657320736B2D776176655374726574636844656C61797B30252C3430252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C65592830';
wwv_flow_imp.g_varchar2_table(27) := '2E34293B7472616E73666F726D3A7363616C655928302E34297D3230257B2D7765626B69742D7472616E73666F726D3A7363616C65592831293B7472616E73666F726D3A7363616C65592831297D7D2E736B2D77616E646572696E672D63756265737B6D';
wwv_flow_imp.g_varchar2_table(28) := '617267696E3A34307078206175746F3B77696474683A343070783B6865696768743A343070783B706F736974696F6E3A72656C61746976657D2E736B2D77616E646572696E672D6375626573202E736B2D637562657B6261636B67726F756E642D636F6C';
wwv_flow_imp.g_varchar2_table(29) := '6F723A233333333B77696474683A313070783B6865696768743A313070783B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B2D7765626B69742D616E696D6174696F6E3A736B2D77616E646572696E674375626520312E38';
wwv_flow_imp.g_varchar2_table(30) := '7320656173652D696E2D6F7574202D312E387320696E66696E69746520626F74683B616E696D6174696F6E3A736B2D77616E646572696E674375626520312E387320656173652D696E2D6F7574202D312E387320696E66696E69746520626F74687D2E73';
wwv_flow_imp.g_varchar2_table(31) := '6B2D77616E646572696E672D6375626573202E736B2D63756265327B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E39733B616E696D6174696F6E2D64656C61793A2D302E39737D402D7765626B69742D6B65796672616D65732073';
wwv_flow_imp.g_varchar2_table(32) := '6B2D77616E646572696E67437562657B30257B2D7765626B69742D7472616E73666F726D3A726F746174652830646567293B7472616E73666F726D3A726F746174652830646567297D3235257B2D7765626B69742D7472616E73666F726D3A7472616E73';
wwv_flow_imp.g_varchar2_table(33) := '6C6174655828333070782920726F74617465282D393064656729207363616C6528302E35293B7472616E73666F726D3A7472616E736C6174655828333070782920726F74617465282D393064656729207363616C6528302E35297D3530257B2D7765626B';
wwv_flow_imp.g_varchar2_table(34) := '69742D7472616E73666F726D3A7472616E736C61746558283330707829207472616E736C6174655928333070782920726F74617465282D313739646567293B7472616E73666F726D3A7472616E736C61746558283330707829207472616E736C61746559';
wwv_flow_imp.g_varchar2_table(35) := '28333070782920726F74617465282D313739646567297D35302E31257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746558283330707829207472616E736C6174655928333070782920726F74617465282D313830646567293B747261';
wwv_flow_imp.g_varchar2_table(36) := '6E73666F726D3A7472616E736C61746558283330707829207472616E736C6174655928333070782920726F74617465282D313830646567297D3735257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746558283029207472616E736C61';
wwv_flow_imp.g_varchar2_table(37) := '74655928333070782920726F74617465282D32373064656729207363616C6528302E35293B7472616E73666F726D3A7472616E736C61746558283029207472616E736C6174655928333070782920726F74617465282D32373064656729207363616C6528';
wwv_flow_imp.g_varchar2_table(38) := '302E35297D313030257B2D7765626B69742D7472616E73666F726D3A726F74617465282D333630646567293B7472616E73666F726D3A726F74617465282D333630646567297D7D406B65796672616D657320736B2D77616E646572696E67437562657B30';
wwv_flow_imp.g_varchar2_table(39) := '257B2D7765626B69742D7472616E73666F726D3A726F746174652830646567293B7472616E73666F726D3A726F746174652830646567297D3235257B2D7765626B69742D7472616E73666F726D3A7472616E736C6174655828333070782920726F746174';
wwv_flow_imp.g_varchar2_table(40) := '65282D393064656729207363616C6528302E35293B7472616E73666F726D3A7472616E736C6174655828333070782920726F74617465282D393064656729207363616C6528302E35297D3530257B2D7765626B69742D7472616E73666F726D3A7472616E';
wwv_flow_imp.g_varchar2_table(41) := '736C61746558283330707829207472616E736C6174655928333070782920726F74617465282D313739646567293B7472616E73666F726D3A7472616E736C61746558283330707829207472616E736C6174655928333070782920726F74617465282D3137';
wwv_flow_imp.g_varchar2_table(42) := '39646567297D35302E31257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746558283330707829207472616E736C6174655928333070782920726F74617465282D313830646567293B7472616E73666F726D3A7472616E736C61746558';
wwv_flow_imp.g_varchar2_table(43) := '283330707829207472616E736C6174655928333070782920726F74617465282D313830646567297D3735257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746558283029207472616E736C6174655928333070782920726F7461746528';
wwv_flow_imp.g_varchar2_table(44) := '2D32373064656729207363616C6528302E35293B7472616E73666F726D3A7472616E736C61746558283029207472616E736C6174655928333070782920726F74617465282D32373064656729207363616C6528302E35297D313030257B2D7765626B6974';
wwv_flow_imp.g_varchar2_table(45) := '2D7472616E73666F726D3A726F74617465282D333630646567293B7472616E73666F726D3A726F74617465282D333630646567297D7D2E736B2D7370696E6E65722D70756C73657B77696474683A343070783B6865696768743A343070783B6D61726769';
wwv_flow_imp.g_varchar2_table(46) := '6E3A34307078206175746F3B6261636B67726F756E642D636F6C6F723A233333333B626F726465722D7261646975733A313030253B2D7765626B69742D616E696D6174696F6E3A736B2D70756C73655363616C654F757420317320696E66696E69746520';
wwv_flow_imp.g_varchar2_table(47) := '656173652D696E2D6F75743B616E696D6174696F6E3A736B2D70756C73655363616C654F757420317320696E66696E69746520656173652D696E2D6F75747D402D7765626B69742D6B65796672616D657320736B2D70756C73655363616C654F75747B30';
wwv_flow_imp.g_varchar2_table(48) := '257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D313030257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831293B6F';
wwv_flow_imp.g_varchar2_table(49) := '7061636974793A307D7D406B65796672616D657320736B2D70756C73655363616C654F75747B30257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D313030257B2D7765626B69742D';
wwv_flow_imp.g_varchar2_table(50) := '7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831293B6F7061636974793A307D7D2E736B2D63686173696E672D646F74737B6D617267696E3A34307078206175746F3B77696474683A343070783B686569676874';
wwv_flow_imp.g_varchar2_table(51) := '3A343070783B706F736974696F6E3A72656C61746976653B746578742D616C69676E3A63656E7465723B2D7765626B69742D616E696D6174696F6E3A736B2D63686173696E67446F7473526F7461746520327320696E66696E697465206C696E6561723B';
wwv_flow_imp.g_varchar2_table(52) := '616E696D6174696F6E3A736B2D63686173696E67446F7473526F7461746520327320696E66696E697465206C696E6561727D2E736B2D63686173696E672D646F7473202E736B2D6368696C647B77696474683A3630253B6865696768743A3630253B6469';
wwv_flow_imp.g_varchar2_table(53) := '73706C61793A696E6C696E652D626C6F636B3B706F736974696F6E3A6162736F6C7574653B746F703A303B6261636B67726F756E642D636F6C6F723A233333333B626F726465722D7261646975733A313030253B2D7765626B69742D616E696D6174696F';
wwv_flow_imp.g_varchar2_table(54) := '6E3A736B2D63686173696E67446F7473426F756E636520327320696E66696E69746520656173652D696E2D6F75743B616E696D6174696F6E3A736B2D63686173696E67446F7473426F756E636520327320696E66696E69746520656173652D696E2D6F75';
wwv_flow_imp.g_varchar2_table(55) := '747D2E736B2D63686173696E672D646F7473202E736B2D646F74327B746F703A6175746F3B626F74746F6D3A303B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D31733B616E696D6174696F6E2D64656C61793A2D31737D402D7765626B';
wwv_flow_imp.g_varchar2_table(56) := '69742D6B65796672616D657320736B2D63686173696E67446F7473526F746174657B313030257B2D7765626B69742D7472616E73666F726D3A726F7461746528333630646567293B7472616E73666F726D3A726F7461746528333630646567297D7D406B';
wwv_flow_imp.g_varchar2_table(57) := '65796672616D657320736B2D63686173696E67446F7473526F746174657B313030257B2D7765626B69742D7472616E73666F726D3A726F7461746528333630646567293B7472616E73666F726D3A726F7461746528333630646567297D7D402D7765626B';
wwv_flow_imp.g_varchar2_table(58) := '69742D6B65796672616D657320736B2D63686173696E67446F7473426F756E63657B30252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3530257B2D7765626B69742D';
wwv_flow_imp.g_varchar2_table(59) := '7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D406B65796672616D657320736B2D63686173696E67446F7473426F756E63657B30252C313030257B2D7765626B69742D7472616E73666F726D3A736361';
wwv_flow_imp.g_varchar2_table(60) := '6C652830293B7472616E73666F726D3A7363616C652830297D3530257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D2E736B2D74687265652D626F756E63657B6D617267696E3A';
wwv_flow_imp.g_varchar2_table(61) := '34307078206175746F3B77696474683A383070783B746578742D616C69676E3A63656E7465727D2E736B2D74687265652D626F756E6365202E736B2D6368696C647B77696474683A323070783B6865696768743A323070783B6261636B67726F756E642D';
wwv_flow_imp.g_varchar2_table(62) := '636F6C6F723A233333333B626F726465722D7261646975733A313030253B646973706C61793A696E6C696E652D626C6F636B3B2D7765626B69742D616E696D6174696F6E3A736B2D74687265652D626F756E636520312E347320656173652D696E2D6F75';
wwv_flow_imp.g_varchar2_table(63) := '7420307320696E66696E69746520626F74683B616E696D6174696F6E3A736B2D74687265652D626F756E636520312E347320656173652D696E2D6F757420307320696E66696E69746520626F74687D2E736B2D74687265652D626F756E6365202E736B2D';
wwv_flow_imp.g_varchar2_table(64) := '626F756E6365317B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E3332733B616E696D6174696F6E2D64656C61793A2D302E3332737D2E736B2D74687265652D626F756E6365202E736B2D626F756E6365327B2D7765626B69742D61';
wwv_flow_imp.g_varchar2_table(65) := '6E696D6174696F6E2D64656C61793A2D302E3136733B616E696D6174696F6E2D64656C61793A2D302E3136737D402D7765626B69742D6B65796672616D657320736B2D74687265652D626F756E63657B30252C3830252C313030257B2D7765626B69742D';
wwv_flow_imp.g_varchar2_table(66) := '7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3430257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D406B65796672616D657320';
wwv_flow_imp.g_varchar2_table(67) := '736B2D74687265652D626F756E63657B30252C3830252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3430257B2D7765626B69742D7472616E73666F726D3A7363616C';
wwv_flow_imp.g_varchar2_table(68) := '652831293B7472616E73666F726D3A7363616C652831297D7D2E736B2D636972636C657B6D617267696E3A34307078206175746F3B77696474683A343070783B6865696768743A343070783B706F736974696F6E3A72656C61746976657D2E736B2D6369';
wwv_flow_imp.g_varchar2_table(69) := '72636C65202E736B2D6368696C647B77696474683A313030253B6865696768743A313030253B706F736974696F6E3A6162736F6C7574653B6C6566743A303B746F703A307D2E736B2D636972636C65202E736B2D6368696C643A6265666F72657B636F6E';
wwv_flow_imp.g_varchar2_table(70) := '74656E743A27273B646973706C61793A626C6F636B3B6D617267696E3A30206175746F3B77696474683A3135253B6865696768743A3135253B6261636B67726F756E642D636F6C6F723A233333333B626F726465722D7261646975733A313030253B2D77';
wwv_flow_imp.g_varchar2_table(71) := '65626B69742D616E696D6174696F6E3A736B2D636972636C65426F756E636544656C617920312E327320696E66696E69746520656173652D696E2D6F757420626F74683B616E696D6174696F6E3A736B2D636972636C65426F756E636544656C61792031';
wwv_flow_imp.g_varchar2_table(72) := '2E327320696E66696E69746520656173652D696E2D6F757420626F74687D2E736B2D636972636C65202E736B2D636972636C65327B2D7765626B69742D7472616E73666F726D3A726F74617465283330646567293B2D6D732D7472616E73666F726D3A72';
wwv_flow_imp.g_varchar2_table(73) := '6F74617465283330646567293B7472616E73666F726D3A726F74617465283330646567297D2E736B2D636972636C65202E736B2D636972636C65337B2D7765626B69742D7472616E73666F726D3A726F74617465283630646567293B2D6D732D7472616E';
wwv_flow_imp.g_varchar2_table(74) := '73666F726D3A726F74617465283630646567293B7472616E73666F726D3A726F74617465283630646567297D2E736B2D636972636C65202E736B2D636972636C65347B2D7765626B69742D7472616E73666F726D3A726F74617465283930646567293B2D';
wwv_flow_imp.g_varchar2_table(75) := '6D732D7472616E73666F726D3A726F74617465283930646567293B7472616E73666F726D3A726F74617465283930646567297D2E736B2D636972636C65202E736B2D636972636C65357B2D7765626B69742D7472616E73666F726D3A726F746174652831';
wwv_flow_imp.g_varchar2_table(76) := '3230646567293B2D6D732D7472616E73666F726D3A726F7461746528313230646567293B7472616E73666F726D3A726F7461746528313230646567297D2E736B2D636972636C65202E736B2D636972636C65367B2D7765626B69742D7472616E73666F72';
wwv_flow_imp.g_varchar2_table(77) := '6D3A726F7461746528313530646567293B2D6D732D7472616E73666F726D3A726F7461746528313530646567293B7472616E73666F726D3A726F7461746528313530646567297D2E736B2D636972636C65202E736B2D636972636C65377B2D7765626B69';
wwv_flow_imp.g_varchar2_table(78) := '742D7472616E73666F726D3A726F7461746528313830646567293B2D6D732D7472616E73666F726D3A726F7461746528313830646567293B7472616E73666F726D3A726F7461746528313830646567297D2E736B2D636972636C65202E736B2D63697263';
wwv_flow_imp.g_varchar2_table(79) := '6C65387B2D7765626B69742D7472616E73666F726D3A726F7461746528323130646567293B2D6D732D7472616E73666F726D3A726F7461746528323130646567293B7472616E73666F726D3A726F7461746528323130646567297D2E736B2D636972636C';
wwv_flow_imp.g_varchar2_table(80) := '65202E736B2D636972636C65397B2D7765626B69742D7472616E73666F726D3A726F7461746528323430646567293B2D6D732D7472616E73666F726D3A726F7461746528323430646567293B7472616E73666F726D3A726F746174652832343064656729';
wwv_flow_imp.g_varchar2_table(81) := '7D2E736B2D636972636C65202E736B2D636972636C6531307B2D7765626B69742D7472616E73666F726D3A726F7461746528323730646567293B2D6D732D7472616E73666F726D3A726F7461746528323730646567293B7472616E73666F726D3A726F74';
wwv_flow_imp.g_varchar2_table(82) := '61746528323730646567297D2E736B2D636972636C65202E736B2D636972636C6531317B2D7765626B69742D7472616E73666F726D3A726F7461746528333030646567293B2D6D732D7472616E73666F726D3A726F7461746528333030646567293B7472';
wwv_flow_imp.g_varchar2_table(83) := '616E73666F726D3A726F7461746528333030646567297D2E736B2D636972636C65202E736B2D636972636C6531327B2D7765626B69742D7472616E73666F726D3A726F7461746528333330646567293B2D6D732D7472616E73666F726D3A726F74617465';
wwv_flow_imp.g_varchar2_table(84) := '28333330646567293B7472616E73666F726D3A726F7461746528333330646567297D2E736B2D636972636C65202E736B2D636972636C65323A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D312E31733B616E696D6174';
wwv_flow_imp.g_varchar2_table(85) := '696F6E2D64656C61793A2D312E31737D2E736B2D636972636C65202E736B2D636972636C65333A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D31733B616E696D6174696F6E2D64656C61793A2D31737D2E736B2D6369';
wwv_flow_imp.g_varchar2_table(86) := '72636C65202E736B2D636972636C65343A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E39733B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D636972636C65202E736B2D636972636C65353A62';
wwv_flow_imp.g_varchar2_table(87) := '65666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E38733B616E696D6174696F6E2D64656C61793A2D302E38737D2E736B2D636972636C65202E736B2D636972636C65363A6265666F72657B2D7765626B69742D616E696D';
wwv_flow_imp.g_varchar2_table(88) := '6174696F6E2D64656C61793A2D302E37733B616E696D6174696F6E2D64656C61793A2D302E37737D2E736B2D636972636C65202E736B2D636972636C65373A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E36733B';
wwv_flow_imp.g_varchar2_table(89) := '616E696D6174696F6E2D64656C61793A2D302E36737D2E736B2D636972636C65202E736B2D636972636C65383A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E35733B616E696D6174696F6E2D64656C61793A2D30';
wwv_flow_imp.g_varchar2_table(90) := '2E35737D2E736B2D636972636C65202E736B2D636972636C65393A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E34733B616E696D6174696F6E2D64656C61793A2D302E34737D2E736B2D636972636C65202E736B';
wwv_flow_imp.g_varchar2_table(91) := '2D636972636C6531303A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E33733B616E696D6174696F6E2D64656C61793A2D302E33737D2E736B2D636972636C65202E736B2D636972636C6531313A6265666F72657B';
wwv_flow_imp.g_varchar2_table(92) := '2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E32733B616E696D6174696F6E2D64656C61793A2D302E32737D2E736B2D636972636C65202E736B2D636972636C6531323A6265666F72657B2D7765626B69742D616E696D6174696F6E';
wwv_flow_imp.g_varchar2_table(93) := '2D64656C61793A2D302E31733B616E696D6174696F6E2D64656C61793A2D302E31737D402D7765626B69742D6B65796672616D657320736B2D636972636C65426F756E636544656C61797B30252C3830252C313030257B2D7765626B69742D7472616E73';
wwv_flow_imp.g_varchar2_table(94) := '666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3430257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D406B65796672616D657320736B2D6369';
wwv_flow_imp.g_varchar2_table(95) := '72636C65426F756E636544656C61797B30252C3830252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3430257B2D7765626B69742D7472616E73666F726D3A7363616C';
wwv_flow_imp.g_varchar2_table(96) := '652831293B7472616E73666F726D3A7363616C652831297D7D2E736B2D637562652D677269647B77696474683A343070783B6865696768743A343070783B6D617267696E3A34307078206175746F7D2E736B2D637562652D67726964202E736B2D637562';
wwv_flow_imp.g_varchar2_table(97) := '657B77696474683A33332E3333253B6865696768743A33332E3333253B6261636B67726F756E642D636F6C6F723A233333333B666C6F61743A6C6566743B2D7765626B69742D616E696D6174696F6E3A736B2D63756265477269645363616C6544656C61';
wwv_flow_imp.g_varchar2_table(98) := '7920312E337320696E66696E69746520656173652D696E2D6F75743B616E696D6174696F6E3A736B2D63756265477269645363616C6544656C617920312E337320696E66696E69746520656173652D696E2D6F75747D2E736B2D637562652D6772696420';
wwv_flow_imp.g_varchar2_table(99) := '2E736B2D63756265317B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E32733B616E696D6174696F6E2D64656C61793A2E32737D2E736B2D637562652D67726964202E736B2D63756265327B2D7765626B69742D616E696D6174696F6E2D';
wwv_flow_imp.g_varchar2_table(100) := '64656C61793A2E33733B616E696D6174696F6E2D64656C61793A2E33737D2E736B2D637562652D67726964202E736B2D63756265337B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E34733B616E696D6174696F6E2D64656C61793A2E34';
wwv_flow_imp.g_varchar2_table(101) := '737D2E736B2D637562652D67726964202E736B2D63756265347B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E31733B616E696D6174696F6E2D64656C61793A2E31737D2E736B2D637562652D67726964202E736B2D63756265357B2D77';
wwv_flow_imp.g_varchar2_table(102) := '65626B69742D616E696D6174696F6E2D64656C61793A2E32733B616E696D6174696F6E2D64656C61793A2E32737D2E736B2D637562652D67726964202E736B2D63756265367B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E33733B616E';
wwv_flow_imp.g_varchar2_table(103) := '696D6174696F6E2D64656C61793A2E33737D2E736B2D637562652D67726964202E736B2D63756265377B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E30733B616E696D6174696F6E2D64656C61793A2E30737D2E736B2D637562652D67';
wwv_flow_imp.g_varchar2_table(104) := '726964202E736B2D63756265387B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E31733B616E696D6174696F6E2D64656C61793A2E31737D2E736B2D637562652D67726964202E736B2D63756265397B2D7765626B69742D616E696D6174';
wwv_flow_imp.g_varchar2_table(105) := '696F6E2D64656C61793A2E32733B616E696D6174696F6E2D64656C61793A2E32737D402D7765626B69742D6B65796672616D657320736B2D63756265477269645363616C6544656C61797B30252C3730252C313030257B2D7765626B69742D7472616E73';
wwv_flow_imp.g_varchar2_table(106) := '666F726D3A7363616C65334428312C312C31293B7472616E73666F726D3A7363616C65334428312C312C31297D3335257B2D7765626B69742D7472616E73666F726D3A7363616C65334428302C302C31293B7472616E73666F726D3A7363616C65334428';
wwv_flow_imp.g_varchar2_table(107) := '302C302C31297D7D406B65796672616D657320736B2D63756265477269645363616C6544656C61797B30252C3730252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C65334428312C312C31293B7472616E73666F726D3A7363616C';
wwv_flow_imp.g_varchar2_table(108) := '65334428312C312C31297D3335257B2D7765626B69742D7472616E73666F726D3A7363616C65334428302C302C31293B7472616E73666F726D3A7363616C65334428302C302C31297D7D2E736B2D666164696E672D636972636C657B6D617267696E3A34';
wwv_flow_imp.g_varchar2_table(109) := '307078206175746F3B77696474683A343070783B6865696768743A343070783B706F736974696F6E3A72656C61746976657D2E736B2D666164696E672D636972636C65202E736B2D636972636C657B77696474683A313030253B6865696768743A313030';
wwv_flow_imp.g_varchar2_table(110) := '253B706F736974696F6E3A6162736F6C7574653B6C6566743A303B746F703A307D2E736B2D666164696E672D636972636C65202E736B2D636972636C653A6265666F72657B636F6E74656E743A27273B646973706C61793A626C6F636B3B6D617267696E';
wwv_flow_imp.g_varchar2_table(111) := '3A30206175746F3B77696474683A3135253B6865696768743A3135253B6261636B67726F756E642D636F6C6F723A233333333B626F726465722D7261646975733A313030253B2D7765626B69742D616E696D6174696F6E3A736B2D636972636C65466164';
wwv_flow_imp.g_varchar2_table(112) := '6544656C617920312E327320696E66696E69746520656173652D696E2D6F757420626F74683B616E696D6174696F6E3A736B2D636972636C654661646544656C617920312E327320696E66696E69746520656173652D696E2D6F757420626F74687D2E73';
wwv_flow_imp.g_varchar2_table(113) := '6B2D666164696E672D636972636C65202E736B2D636972636C65327B2D7765626B69742D7472616E73666F726D3A726F74617465283330646567293B2D6D732D7472616E73666F726D3A726F74617465283330646567293B7472616E73666F726D3A726F';
wwv_flow_imp.g_varchar2_table(114) := '74617465283330646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C65337B2D7765626B69742D7472616E73666F726D3A726F74617465283630646567293B2D6D732D7472616E73666F726D3A726F74617465283630646567';
wwv_flow_imp.g_varchar2_table(115) := '293B7472616E73666F726D3A726F74617465283630646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C65347B2D7765626B69742D7472616E73666F726D3A726F74617465283930646567293B2D6D732D7472616E73666F72';
wwv_flow_imp.g_varchar2_table(116) := '6D3A726F74617465283930646567293B7472616E73666F726D3A726F74617465283930646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C65357B2D7765626B69742D7472616E73666F726D3A726F74617465283132306465';
wwv_flow_imp.g_varchar2_table(117) := '67293B2D6D732D7472616E73666F726D3A726F7461746528313230646567293B7472616E73666F726D3A726F7461746528313230646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C65367B2D7765626B69742D7472616E73';
wwv_flow_imp.g_varchar2_table(118) := '666F726D3A726F7461746528313530646567293B2D6D732D7472616E73666F726D3A726F7461746528313530646567293B7472616E73666F726D3A726F7461746528313530646567297D2E736B2D666164696E672D636972636C65202E736B2D63697263';
wwv_flow_imp.g_varchar2_table(119) := '6C65377B2D7765626B69742D7472616E73666F726D3A726F7461746528313830646567293B2D6D732D7472616E73666F726D3A726F7461746528313830646567293B7472616E73666F726D3A726F7461746528313830646567297D2E736B2D666164696E';
wwv_flow_imp.g_varchar2_table(120) := '672D636972636C65202E736B2D636972636C65387B2D7765626B69742D7472616E73666F726D3A726F7461746528323130646567293B2D6D732D7472616E73666F726D3A726F7461746528323130646567293B7472616E73666F726D3A726F7461746528';
wwv_flow_imp.g_varchar2_table(121) := '323130646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C65397B2D7765626B69742D7472616E73666F726D3A726F7461746528323430646567293B2D6D732D7472616E73666F726D3A726F7461746528323430646567293B';
wwv_flow_imp.g_varchar2_table(122) := '7472616E73666F726D3A726F7461746528323430646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C6531307B2D7765626B69742D7472616E73666F726D3A726F7461746528323730646567293B2D6D732D7472616E73666F';
wwv_flow_imp.g_varchar2_table(123) := '726D3A726F7461746528323730646567293B7472616E73666F726D3A726F7461746528323730646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C6531317B2D7765626B69742D7472616E73666F726D3A726F746174652833';
wwv_flow_imp.g_varchar2_table(124) := '3030646567293B2D6D732D7472616E73666F726D3A726F7461746528333030646567293B7472616E73666F726D3A726F7461746528333030646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C6531327B2D7765626B69742D';
wwv_flow_imp.g_varchar2_table(125) := '7472616E73666F726D3A726F7461746528333330646567293B2D6D732D7472616E73666F726D3A726F7461746528333330646567293B7472616E73666F726D3A726F7461746528333330646567297D2E736B2D666164696E672D636972636C65202E736B';
wwv_flow_imp.g_varchar2_table(126) := '2D636972636C65323A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D312E31733B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D666164696E672D636972636C65202E736B2D636972636C65333A6265';
wwv_flow_imp.g_varchar2_table(127) := '666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D31733B616E696D6174696F6E2D64656C61793A2D31737D2E736B2D666164696E672D636972636C65202E736B2D636972636C65343A6265666F72657B2D7765626B69742D616E';
wwv_flow_imp.g_varchar2_table(128) := '696D6174696F6E2D64656C61793A2D302E39733B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D666164696E672D636972636C65202E736B2D636972636C65353A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C';
wwv_flow_imp.g_varchar2_table(129) := '61793A2D302E38733B616E696D6174696F6E2D64656C61793A2D302E38737D2E736B2D666164696E672D636972636C65202E736B2D636972636C65363A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E37733B616E';
wwv_flow_imp.g_varchar2_table(130) := '696D6174696F6E2D64656C61793A2D302E37737D2E736B2D666164696E672D636972636C65202E736B2D636972636C65373A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E36733B616E696D6174696F6E2D64656C';
wwv_flow_imp.g_varchar2_table(131) := '61793A2D302E36737D2E736B2D666164696E672D636972636C65202E736B2D636972636C65383A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E35733B616E696D6174696F6E2D64656C61793A2D302E35737D2E73';
wwv_flow_imp.g_varchar2_table(132) := '6B2D666164696E672D636972636C65202E736B2D636972636C65393A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E34733B616E696D6174696F6E2D64656C61793A2D302E34737D2E736B2D666164696E672D6369';
wwv_flow_imp.g_varchar2_table(133) := '72636C65202E736B2D636972636C6531303A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E33733B616E696D6174696F6E2D64656C61793A2D302E33737D2E736B2D666164696E672D636972636C65202E736B2D63';
wwv_flow_imp.g_varchar2_table(134) := '6972636C6531313A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E32733B616E696D6174696F6E2D64656C61793A2D302E32737D2E736B2D666164696E672D636972636C65202E736B2D636972636C6531323A6265';
wwv_flow_imp.g_varchar2_table(135) := '666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E31733B616E696D6174696F6E2D64656C61793A2D302E31737D402D7765626B69742D6B65796672616D657320736B2D636972636C654661646544656C61797B30252C3339';
wwv_flow_imp.g_varchar2_table(136) := '252C313030257B6F7061636974793A307D3430257B6F7061636974793A317D7D406B65796672616D657320736B2D636972636C654661646544656C61797B30252C3339252C313030257B6F7061636974793A307D3430257B6F7061636974793A317D7D2E';
wwv_flow_imp.g_varchar2_table(137) := '736B2D666F6C64696E672D637562657B6D617267696E3A34307078206175746F3B77696474683A343070783B6865696768743A343070783B706F736974696F6E3A72656C61746976653B2D7765626B69742D7472616E73666F726D3A726F746174655A28';
wwv_flow_imp.g_varchar2_table(138) := '3435646567293B7472616E73666F726D3A726F746174655A283435646567297D2E736B2D666F6C64696E672D63756265202E736B2D637562657B666C6F61743A6C6566743B77696474683A3530253B6865696768743A3530253B706F736974696F6E3A72';
wwv_flow_imp.g_varchar2_table(139) := '656C61746976653B2D7765626B69742D7472616E73666F726D3A7363616C6528312E31293B2D6D732D7472616E73666F726D3A7363616C6528312E31293B7472616E73666F726D3A7363616C6528312E31297D2E736B2D666F6C64696E672D6375626520';
wwv_flow_imp.g_varchar2_table(140) := '2E736B2D637562653A6265666F72657B636F6E74656E743A27273B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B77696474683A313030253B6865696768743A313030253B6261636B67726F756E642D636F6C6F723A2333';
wwv_flow_imp.g_varchar2_table(141) := '33333B2D7765626B69742D616E696D6174696F6E3A736B2D666F6C6443756265416E676C6520322E347320696E66696E697465206C696E65617220626F74683B616E696D6174696F6E3A736B2D666F6C6443756265416E676C6520322E347320696E6669';
wwv_flow_imp.g_varchar2_table(142) := '6E697465206C696E65617220626F74683B2D7765626B69742D7472616E73666F726D2D6F726967696E3A3130302520313030253B2D6D732D7472616E73666F726D2D6F726967696E3A3130302520313030253B7472616E73666F726D2D6F726967696E3A';
wwv_flow_imp.g_varchar2_table(143) := '3130302520313030257D2E736B2D666F6C64696E672D63756265202E736B2D63756265327B2D7765626B69742D7472616E73666F726D3A7363616C6528312E312920726F746174655A283930646567293B7472616E73666F726D3A7363616C6528312E31';
wwv_flow_imp.g_varchar2_table(144) := '2920726F746174655A283930646567297D2E736B2D666F6C64696E672D63756265202E736B2D63756265337B2D7765626B69742D7472616E73666F726D3A7363616C6528312E312920726F746174655A28313830646567293B7472616E73666F726D3A73';
wwv_flow_imp.g_varchar2_table(145) := '63616C6528312E312920726F746174655A28313830646567297D2E736B2D666F6C64696E672D63756265202E736B2D63756265347B2D7765626B69742D7472616E73666F726D3A7363616C6528312E312920726F746174655A28323730646567293B7472';
wwv_flow_imp.g_varchar2_table(146) := '616E73666F726D3A7363616C6528312E312920726F746174655A28323730646567297D2E736B2D666F6C64696E672D63756265202E736B2D63756265323A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E33733B616E69';
wwv_flow_imp.g_varchar2_table(147) := '6D6174696F6E2D64656C61793A2E33737D2E736B2D666F6C64696E672D63756265202E736B2D63756265333A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E36733B616E696D6174696F6E2D64656C61793A2E36737D2E';
wwv_flow_imp.g_varchar2_table(148) := '736B2D666F6C64696E672D63756265202E736B2D63756265343A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E39733B616E696D6174696F6E2D64656C61793A2E39737D402D7765626B69742D6B65796672616D657320';
wwv_flow_imp.g_varchar2_table(149) := '736B2D666F6C6443756265416E676C657B30252C3130257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831343070782920726F7461746558282D313830646567293B7472616E73666F726D3A706572737065637469766528';
wwv_flow_imp.g_varchar2_table(150) := '31343070782920726F7461746558282D313830646567293B6F7061636974793A307D3235252C3735257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831343070782920726F74617465582830646567293B7472616E73666F';
wwv_flow_imp.g_varchar2_table(151) := '726D3A70657273706563746976652831343070782920726F74617465582830646567293B6F7061636974793A317D3930252C313030257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831343070782920726F746174655928';
wwv_flow_imp.g_varchar2_table(152) := '313830646567293B7472616E73666F726D3A70657273706563746976652831343070782920726F746174655928313830646567293B6F7061636974793A307D7D406B65796672616D657320736B2D666F6C6443756265416E676C657B30252C3130257B2D';
wwv_flow_imp.g_varchar2_table(153) := '7765626B69742D7472616E73666F726D3A70657273706563746976652831343070782920726F7461746558282D313830646567293B7472616E73666F726D3A70657273706563746976652831343070782920726F7461746558282D313830646567293B6F';
wwv_flow_imp.g_varchar2_table(154) := '7061636974793A307D3235252C3735257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831343070782920726F74617465582830646567293B7472616E73666F726D3A70657273706563746976652831343070782920726F74';
wwv_flow_imp.g_varchar2_table(155) := '617465582830646567293B6F7061636974793A317D3930252C313030257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831343070782920726F746174655928313830646567293B7472616E73666F726D3A70657273706563';
wwv_flow_imp.g_varchar2_table(156) := '746976652831343070782920726F746174655928313830646567293B6F7061636974793A307D7D2E736B2D726F746174696E672D706C616E657B77696474683A343070783B6865696768743A343070783B6261636B67726F756E642D636F6C6F723A2333';
wwv_flow_imp.g_varchar2_table(157) := '33333B6D617267696E3A34307078206175746F3B2D7765626B69742D616E696D6174696F6E3A736B2D726F74617465506C616E6520312E327320696E66696E69746520656173652D696E2D6F75743B616E696D6174696F6E3A736B2D726F74617465506C';
wwv_flow_imp.g_varchar2_table(158) := '616E6520312E327320696E66696E69746520656173652D696E2D6F75747D402D7765626B69742D6B65796672616D657320736B2D726F74617465506C616E657B30257B2D7765626B69742D7472616E73666F726D3A706572737065637469766528313230';
wwv_flow_imp.g_varchar2_table(159) := '70782920726F746174655828306465672920726F74617465592830646567293B7472616E73666F726D3A70657273706563746976652831323070782920726F746174655828306465672920726F74617465592830646567297D3530257B2D7765626B6974';
wwv_flow_imp.g_varchar2_table(160) := '2D7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D3138302E316465672920726F74617465592830646567293B7472616E73666F726D3A70657273706563746976652831323070782920726F746174655828';
wwv_flow_imp.g_varchar2_table(161) := '2D3138302E316465672920726F74617465592830646567297D313030257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D3138306465672920726F7461746559282D3137392E396465';
wwv_flow_imp.g_varchar2_table(162) := '67293B7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D3138306465672920726F7461746559282D3137392E39646567297D7D406B65796672616D657320736B2D726F74617465506C616E657B30257B2D77';
wwv_flow_imp.g_varchar2_table(163) := '65626B69742D7472616E73666F726D3A70657273706563746976652831323070782920726F746174655828306465672920726F74617465592830646567293B7472616E73666F726D3A70657273706563746976652831323070782920726F746174655828';
wwv_flow_imp.g_varchar2_table(164) := '306465672920726F74617465592830646567297D3530257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D3138302E316465672920726F74617465592830646567293B7472616E7366';
wwv_flow_imp.g_varchar2_table(165) := '6F726D3A70657273706563746976652831323070782920726F7461746558282D3138302E316465672920726F74617465592830646567297D313030257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831323070782920726F';
wwv_flow_imp.g_varchar2_table(166) := '7461746558282D3138306465672920726F7461746559282D3137392E39646567293B7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D3138306465672920726F7461746559282D3137392E39646567297D7D';
wwv_flow_imp.g_varchar2_table(167) := '2E736B2D666164696E672D636972636C657B6D617267696E3A34307078206175746F3B77696474683A343070783B6865696768743A343070783B706F736974696F6E3A72656C61746976657D2E736B2D666164696E672D636972636C65202E736B2D6369';
wwv_flow_imp.g_varchar2_table(168) := '72636C657B77696474683A313030253B6865696768743A313030253B706F736974696F6E3A6162736F6C7574653B6C6566743A303B746F703A307D2E736B2D666164696E672D636972636C65202E736B2D636972636C653A6265666F72657B636F6E7465';
wwv_flow_imp.g_varchar2_table(169) := '6E743A27273B646973706C61793A626C6F636B3B6D617267696E3A30206175746F3B77696474683A3135253B6865696768743A3135253B6261636B67726F756E642D636F6C6F723A233333333B626F726465722D7261646975733A313030253B2D776562';
wwv_flow_imp.g_varchar2_table(170) := '6B69742D616E696D6174696F6E3A736B2D636972636C654661646544656C617920312E327320696E66696E69746520656173652D696E2D6F757420626F74683B616E696D6174696F6E3A736B2D636972636C654661646544656C617920312E327320696E';
wwv_flow_imp.g_varchar2_table(171) := '66696E69746520656173652D696E2D6F757420626F74687D2E736B2D666164696E672D636972636C65202E736B2D636972636C65327B2D7765626B69742D7472616E73666F726D3A726F74617465283330646567293B2D6D732D7472616E73666F726D3A';
wwv_flow_imp.g_varchar2_table(172) := '726F74617465283330646567293B7472616E73666F726D3A726F74617465283330646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C65337B2D7765626B69742D7472616E73666F726D3A726F74617465283630646567293B';
wwv_flow_imp.g_varchar2_table(173) := '2D6D732D7472616E73666F726D3A726F74617465283630646567293B7472616E73666F726D3A726F74617465283630646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C65347B2D7765626B69742D7472616E73666F726D3A';
wwv_flow_imp.g_varchar2_table(174) := '726F74617465283930646567293B2D6D732D7472616E73666F726D3A726F74617465283930646567293B7472616E73666F726D3A726F74617465283930646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C65357B2D776562';
wwv_flow_imp.g_varchar2_table(175) := '6B69742D7472616E73666F726D3A726F7461746528313230646567293B2D6D732D7472616E73666F726D3A726F7461746528313230646567293B7472616E73666F726D3A726F7461746528313230646567297D2E736B2D666164696E672D636972636C65';
wwv_flow_imp.g_varchar2_table(176) := '202E736B2D636972636C65367B2D7765626B69742D7472616E73666F726D3A726F7461746528313530646567293B2D6D732D7472616E73666F726D3A726F7461746528313530646567293B7472616E73666F726D3A726F7461746528313530646567297D';
wwv_flow_imp.g_varchar2_table(177) := '2E736B2D666164696E672D636972636C65202E736B2D636972636C65377B2D7765626B69742D7472616E73666F726D3A726F7461746528313830646567293B2D6D732D7472616E73666F726D3A726F7461746528313830646567293B7472616E73666F72';
wwv_flow_imp.g_varchar2_table(178) := '6D3A726F7461746528313830646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C65387B2D7765626B69742D7472616E73666F726D3A726F7461746528323130646567293B2D6D732D7472616E73666F726D3A726F74617465';
wwv_flow_imp.g_varchar2_table(179) := '28323130646567293B7472616E73666F726D3A726F7461746528323130646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C65397B2D7765626B69742D7472616E73666F726D3A726F7461746528323430646567293B2D6D73';
wwv_flow_imp.g_varchar2_table(180) := '2D7472616E73666F726D3A726F7461746528323430646567293B7472616E73666F726D3A726F7461746528323430646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C6531307B2D7765626B69742D7472616E73666F726D3A';
wwv_flow_imp.g_varchar2_table(181) := '726F7461746528323730646567293B2D6D732D7472616E73666F726D3A726F7461746528323730646567293B7472616E73666F726D3A726F7461746528323730646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C6531317B';
wwv_flow_imp.g_varchar2_table(182) := '2D7765626B69742D7472616E73666F726D3A726F7461746528333030646567293B2D6D732D7472616E73666F726D3A726F7461746528333030646567293B7472616E73666F726D3A726F7461746528333030646567297D2E736B2D666164696E672D6369';
wwv_flow_imp.g_varchar2_table(183) := '72636C65202E736B2D636972636C6531327B2D7765626B69742D7472616E73666F726D3A726F7461746528333330646567293B2D6D732D7472616E73666F726D3A726F7461746528333330646567293B7472616E73666F726D3A726F7461746528333330';
wwv_flow_imp.g_varchar2_table(184) := '646567297D2E736B2D666164696E672D636972636C65202E736B2D636972636C65323A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D312E31733B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D6661';
wwv_flow_imp.g_varchar2_table(185) := '64696E672D636972636C65202E736B2D636972636C65333A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D31733B616E696D6174696F6E2D64656C61793A2D31737D2E736B2D666164696E672D636972636C65202E736B';
wwv_flow_imp.g_varchar2_table(186) := '2D636972636C65343A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E39733B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D666164696E672D636972636C65202E736B2D636972636C65353A6265';
wwv_flow_imp.g_varchar2_table(187) := '666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E38733B616E696D6174696F6E2D64656C61793A2D302E38737D2E736B2D666164696E672D636972636C65202E736B2D636972636C65363A6265666F72657B2D7765626B69';
wwv_flow_imp.g_varchar2_table(188) := '742D616E696D6174696F6E2D64656C61793A2D302E37733B616E696D6174696F6E2D64656C61793A2D302E37737D2E736B2D666164696E672D636972636C65202E736B2D636972636C65373A6265666F72657B2D7765626B69742D616E696D6174696F6E';
wwv_flow_imp.g_varchar2_table(189) := '2D64656C61793A2D302E36733B616E696D6174696F6E2D64656C61793A2D302E36737D2E736B2D666164696E672D636972636C65202E736B2D636972636C65383A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E35';
wwv_flow_imp.g_varchar2_table(190) := '733B616E696D6174696F6E2D64656C61793A2D302E35737D2E736B2D666164696E672D636972636C65202E736B2D636972636C65393A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E34733B616E696D6174696F6E';
wwv_flow_imp.g_varchar2_table(191) := '2D64656C61793A2D302E34737D2E736B2D666164696E672D636972636C65202E736B2D636972636C6531303A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E33733B616E696D6174696F6E2D64656C61793A2D302E';
wwv_flow_imp.g_varchar2_table(192) := '33737D2E736B2D666164696E672D636972636C65202E736B2D636972636C6531313A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E32733B616E696D6174696F6E2D64656C61793A2D302E32737D2E736B2D666164';
wwv_flow_imp.g_varchar2_table(193) := '696E672D636972636C65202E736B2D636972636C6531323A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E31733B616E696D6174696F6E2D64656C61793A2D302E31737D402D7765626B69742D6B65796672616D65';
wwv_flow_imp.g_varchar2_table(194) := '7320736B2D636972636C654661646544656C61797B30252C3339252C313030257B6F7061636974793A307D3430257B6F7061636974793A317D7D406B65796672616D657320736B2D636972636C654661646544656C61797B30252C3339252C313030257B';
wwv_flow_imp.g_varchar2_table(195) := '6F7061636974793A307D3430257B6F7061636974793A317D7D2E736B2D666F6C64696E672D637562657B6D617267696E3A34307078206175746F3B77696474683A343070783B6865696768743A343070783B706F736974696F6E3A72656C61746976653B';
wwv_flow_imp.g_varchar2_table(196) := '2D7765626B69742D7472616E73666F726D3A726F746174655A283435646567293B7472616E73666F726D3A726F746174655A283435646567297D2E736B2D666F6C64696E672D63756265202E736B2D637562657B666C6F61743A6C6566743B7769647468';
wwv_flow_imp.g_varchar2_table(197) := '3A3530253B6865696768743A3530253B706F736974696F6E3A72656C61746976653B2D7765626B69742D7472616E73666F726D3A7363616C6528312E31293B2D6D732D7472616E73666F726D3A7363616C6528312E31293B7472616E73666F726D3A7363';
wwv_flow_imp.g_varchar2_table(198) := '616C6528312E31297D2E736B2D666F6C64696E672D63756265202E736B2D637562653A6265666F72657B636F6E74656E743A27273B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B77696474683A313030253B6865696768';
wwv_flow_imp.g_varchar2_table(199) := '743A313030253B6261636B67726F756E642D636F6C6F723A233333333B2D7765626B69742D616E696D6174696F6E3A736B2D666F6C6443756265416E676C6520322E347320696E66696E697465206C696E65617220626F74683B616E696D6174696F6E3A';
wwv_flow_imp.g_varchar2_table(200) := '736B2D666F6C6443756265416E676C6520322E347320696E66696E697465206C696E65617220626F74683B2D7765626B69742D7472616E73666F726D2D6F726967696E3A3130302520313030253B2D6D732D7472616E73666F726D2D6F726967696E3A31';
wwv_flow_imp.g_varchar2_table(201) := '30302520313030253B7472616E73666F726D2D6F726967696E3A3130302520313030257D2E736B2D666F6C64696E672D63756265202E736B2D63756265327B2D7765626B69742D7472616E73666F726D3A7363616C6528312E312920726F746174655A28';
wwv_flow_imp.g_varchar2_table(202) := '3930646567293B7472616E73666F726D3A7363616C6528312E312920726F746174655A283930646567297D2E736B2D666F6C64696E672D63756265202E736B2D63756265337B2D7765626B69742D7472616E73666F726D3A7363616C6528312E31292072';
wwv_flow_imp.g_varchar2_table(203) := '6F746174655A28313830646567293B7472616E73666F726D3A7363616C6528312E312920726F746174655A28313830646567297D2E736B2D666F6C64696E672D63756265202E736B2D63756265347B2D7765626B69742D7472616E73666F726D3A736361';
wwv_flow_imp.g_varchar2_table(204) := '6C6528312E312920726F746174655A28323730646567293B7472616E73666F726D3A7363616C6528312E312920726F746174655A28323730646567297D2E736B2D666F6C64696E672D63756265202E736B2D63756265323A6265666F72657B2D7765626B';
wwv_flow_imp.g_varchar2_table(205) := '69742D616E696D6174696F6E2D64656C61793A2E33733B616E696D6174696F6E2D64656C61793A2E33737D2E736B2D666F6C64696E672D63756265202E736B2D63756265333A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C6179';
wwv_flow_imp.g_varchar2_table(206) := '3A2E36733B616E696D6174696F6E2D64656C61793A2E36737D2E736B2D666F6C64696E672D63756265202E736B2D63756265343A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E39733B616E696D6174696F6E2D64656C';
wwv_flow_imp.g_varchar2_table(207) := '61793A2E39737D402D7765626B69742D6B65796672616D657320736B2D666F6C6443756265416E676C657B30252C3130257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831343070782920726F7461746558282D31383064';
wwv_flow_imp.g_varchar2_table(208) := '6567293B7472616E73666F726D3A70657273706563746976652831343070782920726F7461746558282D313830646567293B6F7061636974793A307D3235252C3735257B2D7765626B69742D7472616E73666F726D3A7065727370656374697665283134';
wwv_flow_imp.g_varchar2_table(209) := '3070782920726F74617465582830646567293B7472616E73666F726D3A70657273706563746976652831343070782920726F74617465582830646567293B6F7061636974793A317D3930252C313030257B2D7765626B69742D7472616E73666F726D3A70';
wwv_flow_imp.g_varchar2_table(210) := '657273706563746976652831343070782920726F746174655928313830646567293B7472616E73666F726D3A70657273706563746976652831343070782920726F746174655928313830646567293B6F7061636974793A307D7D406B65796672616D6573';
wwv_flow_imp.g_varchar2_table(211) := '20736B2D666F6C6443756265416E676C657B30252C3130257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831343070782920726F7461746558282D313830646567293B7472616E73666F726D3A7065727370656374697665';
wwv_flow_imp.g_varchar2_table(212) := '2831343070782920726F7461746558282D313830646567293B6F7061636974793A307D3235252C3735257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831343070782920726F74617465582830646567293B7472616E7366';
wwv_flow_imp.g_varchar2_table(213) := '6F726D3A70657273706563746976652831343070782920726F74617465582830646567293B6F7061636974793A317D3930252C313030257B2D7765626B69742D7472616E73666F726D3A70657273706563746976652831343070782920726F7461746559';
wwv_flow_imp.g_varchar2_table(214) := '28313830646567293B7472616E73666F726D3A70657273706563746976652831343070782920726F746174655928313830646567293B6F7061636974793A307D7D2E736B2D646F75626C652D626F756E63657B77696474683A343070783B686569676874';
wwv_flow_imp.g_varchar2_table(215) := '3A343070783B706F736974696F6E3A72656C61746976653B6D617267696E3A34307078206175746F7D2E736B2D646F75626C652D626F756E6365202E736B2D6368696C647B77696474683A313030253B6865696768743A313030253B626F726465722D72';
wwv_flow_imp.g_varchar2_table(216) := '61646975733A3530253B6261636B67726F756E642D636F6C6F723A233333333B6F7061636974793A2E363B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B2D7765626B69742D616E696D6174696F6E3A736B2D646F75626C';
wwv_flow_imp.g_varchar2_table(217) := '65426F756E636520327320696E66696E69746520656173652D696E2D6F75743B616E696D6174696F6E3A736B2D646F75626C65426F756E636520327320696E66696E69746520656173652D696E2D6F75747D2E736B2D646F75626C652D626F756E636520';
wwv_flow_imp.g_varchar2_table(218) := '2E736B2D646F75626C652D626F756E6365327B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D312E30733B616E696D6174696F6E2D64656C61793A2D312E30737D402D7765626B69742D6B65796672616D657320736B2D646F75626C6542';
wwv_flow_imp.g_varchar2_table(219) := '6F756E63657B30252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3530257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D';
wwv_flow_imp.g_varchar2_table(220) := '3A7363616C652831297D7D406B65796672616D657320736B2D646F75626C65426F756E63657B30252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3530257B2D776562';
wwv_flow_imp.g_varchar2_table(221) := '6B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D2E736B2D776176657B6D617267696E3A34307078206175746F3B77696474683A353070783B6865696768743A343070783B746578742D616C69';
wwv_flow_imp.g_varchar2_table(222) := '676E3A63656E7465723B666F6E742D73697A653A313070787D2E736B2D77617665202E736B2D726563747B6261636B67726F756E642D636F6C6F723A233333333B6865696768743A313030253B77696474683A3670783B646973706C61793A696E6C696E';
wwv_flow_imp.g_varchar2_table(223) := '652D626C6F636B3B2D7765626B69742D616E696D6174696F6E3A736B2D776176655374726574636844656C617920312E327320696E66696E69746520656173652D696E2D6F75743B616E696D6174696F6E3A736B2D776176655374726574636844656C61';
wwv_flow_imp.g_varchar2_table(224) := '7920312E327320696E66696E69746520656173652D696E2D6F75747D2E736B2D77617665202E736B2D72656374317B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D312E32733B616E696D6174696F6E2D64656C61793A2D312E32737D2E';
wwv_flow_imp.g_varchar2_table(225) := '736B2D77617665202E736B2D72656374327B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D312E31733B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D77617665202E736B2D72656374337B2D7765626B69742D616E69';
wwv_flow_imp.g_varchar2_table(226) := '6D6174696F6E2D64656C61793A2D31733B616E696D6174696F6E2D64656C61793A2D31737D2E736B2D77617665202E736B2D72656374347B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E39733B616E696D6174696F6E2D64656C61';
wwv_flow_imp.g_varchar2_table(227) := '793A2D302E39737D2E736B2D77617665202E736B2D72656374357B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E38733B616E696D6174696F6E2D64656C61793A2D302E38737D402D7765626B69742D6B65796672616D657320736B';
wwv_flow_imp.g_varchar2_table(228) := '2D776176655374726574636844656C61797B30252C3430252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C655928302E34293B7472616E73666F726D3A7363616C655928302E34297D3230257B2D7765626B69742D7472616E7366';
wwv_flow_imp.g_varchar2_table(229) := '6F726D3A7363616C65592831293B7472616E73666F726D3A7363616C65592831297D7D406B65796672616D657320736B2D776176655374726574636844656C61797B30252C3430252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C';
wwv_flow_imp.g_varchar2_table(230) := '655928302E34293B7472616E73666F726D3A7363616C655928302E34297D3230257B2D7765626B69742D7472616E73666F726D3A7363616C65592831293B7472616E73666F726D3A7363616C65592831297D7D2E736B2D77616E646572696E672D637562';
wwv_flow_imp.g_varchar2_table(231) := '65737B6D617267696E3A34307078206175746F3B77696474683A343070783B6865696768743A343070783B706F736974696F6E3A72656C61746976657D2E736B2D77616E646572696E672D6375626573202E736B2D637562657B6261636B67726F756E64';
wwv_flow_imp.g_varchar2_table(232) := '2D636F6C6F723A233333333B77696474683A313070783B6865696768743A313070783B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B2D7765626B69742D616E696D6174696F6E3A736B2D77616E646572696E6743756265';
wwv_flow_imp.g_varchar2_table(233) := '20312E387320656173652D696E2D6F7574202D312E387320696E66696E69746520626F74683B616E696D6174696F6E3A736B2D77616E646572696E674375626520312E387320656173652D696E2D6F7574202D312E387320696E66696E69746520626F74';
wwv_flow_imp.g_varchar2_table(234) := '687D2E736B2D77616E646572696E672D6375626573202E736B2D63756265327B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E39733B616E696D6174696F6E2D64656C61793A2D302E39737D402D7765626B69742D6B65796672616D';
wwv_flow_imp.g_varchar2_table(235) := '657320736B2D77616E646572696E67437562657B30257B2D7765626B69742D7472616E73666F726D3A726F746174652830646567293B7472616E73666F726D3A726F746174652830646567297D3235257B2D7765626B69742D7472616E73666F726D3A74';
wwv_flow_imp.g_varchar2_table(236) := '72616E736C6174655828333070782920726F74617465282D393064656729207363616C6528302E35293B7472616E73666F726D3A7472616E736C6174655828333070782920726F74617465282D393064656729207363616C6528302E35297D3530257B2D';
wwv_flow_imp.g_varchar2_table(237) := '7765626B69742D7472616E73666F726D3A7472616E736C61746558283330707829207472616E736C6174655928333070782920726F74617465282D313739646567293B7472616E73666F726D3A7472616E736C61746558283330707829207472616E736C';
wwv_flow_imp.g_varchar2_table(238) := '6174655928333070782920726F74617465282D313739646567297D35302E31257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746558283330707829207472616E736C6174655928333070782920726F74617465282D31383064656729';
wwv_flow_imp.g_varchar2_table(239) := '3B7472616E73666F726D3A7472616E736C61746558283330707829207472616E736C6174655928333070782920726F74617465282D313830646567297D3735257B2D7765626B69742D7472616E73666F726D3A7472616E736C6174655828302920747261';
wwv_flow_imp.g_varchar2_table(240) := '6E736C6174655928333070782920726F74617465282D32373064656729207363616C6528302E35293B7472616E73666F726D3A7472616E736C61746558283029207472616E736C6174655928333070782920726F74617465282D32373064656729207363';
wwv_flow_imp.g_varchar2_table(241) := '616C6528302E35297D313030257B2D7765626B69742D7472616E73666F726D3A726F74617465282D333630646567293B7472616E73666F726D3A726F74617465282D333630646567297D7D406B65796672616D657320736B2D77616E646572696E674375';
wwv_flow_imp.g_varchar2_table(242) := '62657B30257B2D7765626B69742D7472616E73666F726D3A726F746174652830646567293B7472616E73666F726D3A726F746174652830646567297D3235257B2D7765626B69742D7472616E73666F726D3A7472616E736C617465582833307078292072';
wwv_flow_imp.g_varchar2_table(243) := '6F74617465282D393064656729207363616C6528302E35293B7472616E73666F726D3A7472616E736C6174655828333070782920726F74617465282D393064656729207363616C6528302E35297D3530257B2D7765626B69742D7472616E73666F726D3A';
wwv_flow_imp.g_varchar2_table(244) := '7472616E736C61746558283330707829207472616E736C6174655928333070782920726F74617465282D313739646567293B7472616E73666F726D3A7472616E736C61746558283330707829207472616E736C6174655928333070782920726F74617465';
wwv_flow_imp.g_varchar2_table(245) := '282D313739646567297D35302E31257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746558283330707829207472616E736C6174655928333070782920726F74617465282D313830646567293B7472616E73666F726D3A7472616E736C';
wwv_flow_imp.g_varchar2_table(246) := '61746558283330707829207472616E736C6174655928333070782920726F74617465282D313830646567297D3735257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746558283029207472616E736C6174655928333070782920726F74';
wwv_flow_imp.g_varchar2_table(247) := '617465282D32373064656729207363616C6528302E35293B7472616E73666F726D3A7472616E736C61746558283029207472616E736C6174655928333070782920726F74617465282D32373064656729207363616C6528302E35297D313030257B2D7765';
wwv_flow_imp.g_varchar2_table(248) := '626B69742D7472616E73666F726D3A726F74617465282D333630646567293B7472616E73666F726D3A726F74617465282D333630646567297D7D2E736B2D7370696E6E65722D70756C73657B77696474683A343070783B6865696768743A343070783B6D';
wwv_flow_imp.g_varchar2_table(249) := '617267696E3A34307078206175746F3B6261636B67726F756E642D636F6C6F723A233333333B626F726465722D7261646975733A313030253B2D7765626B69742D616E696D6174696F6E3A736B2D70756C73655363616C654F757420317320696E66696E';
wwv_flow_imp.g_varchar2_table(250) := '69746520656173652D696E2D6F75743B616E696D6174696F6E3A736B2D70756C73655363616C654F757420317320696E66696E69746520656173652D696E2D6F75747D402D7765626B69742D6B65796672616D657320736B2D70756C73655363616C654F';
wwv_flow_imp.g_varchar2_table(251) := '75747B30257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D313030257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C6528';
wwv_flow_imp.g_varchar2_table(252) := '31293B6F7061636974793A307D7D406B65796672616D657320736B2D70756C73655363616C654F75747B30257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D313030257B2D776562';
wwv_flow_imp.g_varchar2_table(253) := '6B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831293B6F7061636974793A307D7D2E736B2D63686173696E672D646F74737B6D617267696E3A34307078206175746F3B77696474683A343070783B6865';
wwv_flow_imp.g_varchar2_table(254) := '696768743A343070783B706F736974696F6E3A72656C61746976653B746578742D616C69676E3A63656E7465723B2D7765626B69742D616E696D6174696F6E3A736B2D63686173696E67446F7473526F7461746520327320696E66696E697465206C696E';
wwv_flow_imp.g_varchar2_table(255) := '6561723B616E696D6174696F6E3A736B2D63686173696E67446F7473526F7461746520327320696E66696E697465206C696E6561727D2E736B2D63686173696E672D646F7473202E736B2D6368696C647B77696474683A3630253B6865696768743A3630';
wwv_flow_imp.g_varchar2_table(256) := '253B646973706C61793A696E6C696E652D626C6F636B3B706F736974696F6E3A6162736F6C7574653B746F703A303B6261636B67726F756E642D636F6C6F723A233333333B626F726465722D7261646975733A313030253B2D7765626B69742D616E696D';
wwv_flow_imp.g_varchar2_table(257) := '6174696F6E3A736B2D63686173696E67446F7473426F756E636520327320696E66696E69746520656173652D696E2D6F75743B616E696D6174696F6E3A736B2D63686173696E67446F7473426F756E636520327320696E66696E69746520656173652D69';
wwv_flow_imp.g_varchar2_table(258) := '6E2D6F75747D2E736B2D63686173696E672D646F7473202E736B2D646F74327B746F703A6175746F3B626F74746F6D3A303B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D31733B616E696D6174696F6E2D64656C61793A2D31737D402D';
wwv_flow_imp.g_varchar2_table(259) := '7765626B69742D6B65796672616D657320736B2D63686173696E67446F7473526F746174657B313030257B2D7765626B69742D7472616E73666F726D3A726F7461746528333630646567293B7472616E73666F726D3A726F746174652833363064656729';
wwv_flow_imp.g_varchar2_table(260) := '7D7D406B65796672616D657320736B2D63686173696E67446F7473526F746174657B313030257B2D7765626B69742D7472616E73666F726D3A726F7461746528333630646567293B7472616E73666F726D3A726F7461746528333630646567297D7D402D';
wwv_flow_imp.g_varchar2_table(261) := '7765626B69742D6B65796672616D657320736B2D63686173696E67446F7473426F756E63657B30252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3530257B2D776562';
wwv_flow_imp.g_varchar2_table(262) := '6B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D406B65796672616D657320736B2D63686173696E67446F7473426F756E63657B30252C313030257B2D7765626B69742D7472616E73666F726D';
wwv_flow_imp.g_varchar2_table(263) := '3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3530257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D2E736B2D74687265652D626F756E63657B6D6172';
wwv_flow_imp.g_varchar2_table(264) := '67696E3A34307078206175746F3B77696474683A383070783B746578742D616C69676E3A63656E7465727D2E736B2D74687265652D626F756E6365202E736B2D6368696C647B77696474683A323070783B6865696768743A323070783B6261636B67726F';
wwv_flow_imp.g_varchar2_table(265) := '756E642D636F6C6F723A233333333B626F726465722D7261646975733A313030253B646973706C61793A696E6C696E652D626C6F636B3B2D7765626B69742D616E696D6174696F6E3A736B2D74687265652D626F756E636520312E347320656173652D69';
wwv_flow_imp.g_varchar2_table(266) := '6E2D6F757420307320696E66696E69746520626F74683B616E696D6174696F6E3A736B2D74687265652D626F756E636520312E347320656173652D696E2D6F757420307320696E66696E69746520626F74687D2E736B2D74687265652D626F756E636520';
wwv_flow_imp.g_varchar2_table(267) := '2E736B2D626F756E6365317B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E3332733B616E696D6174696F6E2D64656C61793A2D302E3332737D2E736B2D74687265652D626F756E6365202E736B2D626F756E6365327B2D7765626B';
wwv_flow_imp.g_varchar2_table(268) := '69742D616E696D6174696F6E2D64656C61793A2D302E3136733B616E696D6174696F6E2D64656C61793A2D302E3136737D402D7765626B69742D6B65796672616D657320736B2D74687265652D626F756E63657B30252C3830252C313030257B2D776562';
wwv_flow_imp.g_varchar2_table(269) := '6B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3430257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D406B6579667261';
wwv_flow_imp.g_varchar2_table(270) := '6D657320736B2D74687265652D626F756E63657B30252C3830252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3430257B2D7765626B69742D7472616E73666F726D3A';
wwv_flow_imp.g_varchar2_table(271) := '7363616C652831293B7472616E73666F726D3A7363616C652831297D7D2E736B2D636972636C657B6D617267696E3A34307078206175746F3B77696474683A343070783B6865696768743A343070783B706F736974696F6E3A72656C61746976657D2E73';
wwv_flow_imp.g_varchar2_table(272) := '6B2D636972636C65202E736B2D6368696C647B77696474683A313030253B6865696768743A313030253B706F736974696F6E3A6162736F6C7574653B6C6566743A303B746F703A307D2E736B2D636972636C65202E736B2D6368696C643A6265666F7265';
wwv_flow_imp.g_varchar2_table(273) := '7B636F6E74656E743A27273B646973706C61793A626C6F636B3B6D617267696E3A30206175746F3B77696474683A3135253B6865696768743A3135253B6261636B67726F756E642D636F6C6F723A233333333B626F726465722D7261646975733A313030';
wwv_flow_imp.g_varchar2_table(274) := '253B2D7765626B69742D616E696D6174696F6E3A736B2D636972636C65426F756E636544656C617920312E327320696E66696E69746520656173652D696E2D6F757420626F74683B616E696D6174696F6E3A736B2D636972636C65426F756E636544656C';
wwv_flow_imp.g_varchar2_table(275) := '617920312E327320696E66696E69746520656173652D696E2D6F757420626F74687D2E736B2D636972636C65202E736B2D636972636C65327B2D7765626B69742D7472616E73666F726D3A726F74617465283330646567293B2D6D732D7472616E73666F';
wwv_flow_imp.g_varchar2_table(276) := '726D3A726F74617465283330646567293B7472616E73666F726D3A726F74617465283330646567297D2E736B2D636972636C65202E736B2D636972636C65337B2D7765626B69742D7472616E73666F726D3A726F74617465283630646567293B2D6D732D';
wwv_flow_imp.g_varchar2_table(277) := '7472616E73666F726D3A726F74617465283630646567293B7472616E73666F726D3A726F74617465283630646567297D2E736B2D636972636C65202E736B2D636972636C65347B2D7765626B69742D7472616E73666F726D3A726F746174652839306465';
wwv_flow_imp.g_varchar2_table(278) := '67293B2D6D732D7472616E73666F726D3A726F74617465283930646567293B7472616E73666F726D3A726F74617465283930646567297D2E736B2D636972636C65202E736B2D636972636C65357B2D7765626B69742D7472616E73666F726D3A726F7461';
wwv_flow_imp.g_varchar2_table(279) := '746528313230646567293B2D6D732D7472616E73666F726D3A726F7461746528313230646567293B7472616E73666F726D3A726F7461746528313230646567297D2E736B2D636972636C65202E736B2D636972636C65367B2D7765626B69742D7472616E';
wwv_flow_imp.g_varchar2_table(280) := '73666F726D3A726F7461746528313530646567293B2D6D732D7472616E73666F726D3A726F7461746528313530646567293B7472616E73666F726D3A726F7461746528313530646567297D2E736B2D636972636C65202E736B2D636972636C65377B2D77';
wwv_flow_imp.g_varchar2_table(281) := '65626B69742D7472616E73666F726D3A726F7461746528313830646567293B2D6D732D7472616E73666F726D3A726F7461746528313830646567293B7472616E73666F726D3A726F7461746528313830646567297D2E736B2D636972636C65202E736B2D';
wwv_flow_imp.g_varchar2_table(282) := '636972636C65387B2D7765626B69742D7472616E73666F726D3A726F7461746528323130646567293B2D6D732D7472616E73666F726D3A726F7461746528323130646567293B7472616E73666F726D3A726F7461746528323130646567297D2E736B2D63';
wwv_flow_imp.g_varchar2_table(283) := '6972636C65202E736B2D636972636C65397B2D7765626B69742D7472616E73666F726D3A726F7461746528323430646567293B2D6D732D7472616E73666F726D3A726F7461746528323430646567293B7472616E73666F726D3A726F7461746528323430';
wwv_flow_imp.g_varchar2_table(284) := '646567297D2E736B2D636972636C65202E736B2D636972636C6531307B2D7765626B69742D7472616E73666F726D3A726F7461746528323730646567293B2D6D732D7472616E73666F726D3A726F7461746528323730646567293B7472616E73666F726D';
wwv_flow_imp.g_varchar2_table(285) := '3A726F7461746528323730646567297D2E736B2D636972636C65202E736B2D636972636C6531317B2D7765626B69742D7472616E73666F726D3A726F7461746528333030646567293B2D6D732D7472616E73666F726D3A726F7461746528333030646567';
wwv_flow_imp.g_varchar2_table(286) := '293B7472616E73666F726D3A726F7461746528333030646567297D2E736B2D636972636C65202E736B2D636972636C6531327B2D7765626B69742D7472616E73666F726D3A726F7461746528333330646567293B2D6D732D7472616E73666F726D3A726F';
wwv_flow_imp.g_varchar2_table(287) := '7461746528333330646567293B7472616E73666F726D3A726F7461746528333330646567297D2E736B2D636972636C65202E736B2D636972636C65323A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D312E31733B616E';
wwv_flow_imp.g_varchar2_table(288) := '696D6174696F6E2D64656C61793A2D312E31737D2E736B2D636972636C65202E736B2D636972636C65333A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D31733B616E696D6174696F6E2D64656C61793A2D31737D2E73';
wwv_flow_imp.g_varchar2_table(289) := '6B2D636972636C65202E736B2D636972636C65343A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E39733B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D636972636C65202E736B2D636972636C';
wwv_flow_imp.g_varchar2_table(290) := '65353A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E38733B616E696D6174696F6E2D64656C61793A2D302E38737D2E736B2D636972636C65202E736B2D636972636C65363A6265666F72657B2D7765626B69742D';
wwv_flow_imp.g_varchar2_table(291) := '616E696D6174696F6E2D64656C61793A2D302E37733B616E696D6174696F6E2D64656C61793A2D302E37737D2E736B2D636972636C65202E736B2D636972636C65373A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D30';
wwv_flow_imp.g_varchar2_table(292) := '2E36733B616E696D6174696F6E2D64656C61793A2D302E36737D2E736B2D636972636C65202E736B2D636972636C65383A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E35733B616E696D6174696F6E2D64656C61';
wwv_flow_imp.g_varchar2_table(293) := '793A2D302E35737D2E736B2D636972636C65202E736B2D636972636C65393A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E34733B616E696D6174696F6E2D64656C61793A2D302E34737D2E736B2D636972636C65';
wwv_flow_imp.g_varchar2_table(294) := '202E736B2D636972636C6531303A6265666F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E33733B616E696D6174696F6E2D64656C61793A2D302E33737D2E736B2D636972636C65202E736B2D636972636C6531313A626566';
wwv_flow_imp.g_varchar2_table(295) := '6F72657B2D7765626B69742D616E696D6174696F6E2D64656C61793A2D302E32733B616E696D6174696F6E2D64656C61793A2D302E32737D2E736B2D636972636C65202E736B2D636972636C6531323A6265666F72657B2D7765626B69742D616E696D61';
wwv_flow_imp.g_varchar2_table(296) := '74696F6E2D64656C61793A2D302E31733B616E696D6174696F6E2D64656C61793A2D302E31737D402D7765626B69742D6B65796672616D657320736B2D636972636C65426F756E636544656C61797B30252C3830252C313030257B2D7765626B69742D74';
wwv_flow_imp.g_varchar2_table(297) := '72616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3430257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D406B65796672616D65732073';
wwv_flow_imp.g_varchar2_table(298) := '6B2D636972636C65426F756E636544656C61797B30252C3830252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3430257B2D7765626B69742D7472616E73666F726D3A';
wwv_flow_imp.g_varchar2_table(299) := '7363616C652831293B7472616E73666F726D3A7363616C652831297D7D2E736B2D637562652D677269647B77696474683A343070783B6865696768743A343070783B6D617267696E3A34307078206175746F7D2E736B2D637562652D67726964202E736B';
wwv_flow_imp.g_varchar2_table(300) := '2D637562657B77696474683A33332E3333253B6865696768743A33332E3333253B6261636B67726F756E642D636F6C6F723A233333333B666C6F61743A6C6566743B2D7765626B69742D616E696D6174696F6E3A736B2D63756265477269645363616C65';
wwv_flow_imp.g_varchar2_table(301) := '44656C617920312E337320696E66696E69746520656173652D696E2D6F75743B616E696D6174696F6E3A736B2D63756265477269645363616C6544656C617920312E337320696E66696E69746520656173652D696E2D6F75747D2E736B2D637562652D67';
wwv_flow_imp.g_varchar2_table(302) := '726964202E736B2D63756265317B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E32733B616E696D6174696F6E2D64656C61793A2E32737D2E736B2D637562652D67726964202E736B2D63756265327B2D7765626B69742D616E696D6174';
wwv_flow_imp.g_varchar2_table(303) := '696F6E2D64656C61793A2E33733B616E696D6174696F6E2D64656C61793A2E33737D2E736B2D637562652D67726964202E736B2D63756265337B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E34733B616E696D6174696F6E2D64656C61';
wwv_flow_imp.g_varchar2_table(304) := '793A2E34737D2E736B2D637562652D67726964202E736B2D63756265347B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E31733B616E696D6174696F6E2D64656C61793A2E31737D2E736B2D637562652D67726964202E736B2D63756265';
wwv_flow_imp.g_varchar2_table(305) := '357B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E32733B616E696D6174696F6E2D64656C61793A2E32737D2E736B2D637562652D67726964202E736B2D63756265367B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E33';
wwv_flow_imp.g_varchar2_table(306) := '733B616E696D6174696F6E2D64656C61793A2E33737D2E736B2D637562652D67726964202E736B2D63756265377B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E30733B616E696D6174696F6E2D64656C61793A2E30737D2E736B2D6375';
wwv_flow_imp.g_varchar2_table(307) := '62652D67726964202E736B2D63756265387B2D7765626B69742D616E696D6174696F6E2D64656C61793A2E31733B616E696D6174696F6E2D64656C61793A2E31737D2E736B2D637562652D67726964202E736B2D63756265397B2D7765626B69742D616E';
wwv_flow_imp.g_varchar2_table(308) := '696D6174696F6E2D64656C61793A2E32733B616E696D6174696F6E2D64656C61793A2E32737D402D7765626B69742D6B65796672616D657320736B2D63756265477269645363616C6544656C61797B30252C3730252C313030257B2D7765626B69742D74';
wwv_flow_imp.g_varchar2_table(309) := '72616E73666F726D3A7363616C65334428312C312C31293B7472616E73666F726D3A7363616C65334428312C312C31297D3335257B2D7765626B69742D7472616E73666F726D3A7363616C65334428302C302C31293B7472616E73666F726D3A7363616C';
wwv_flow_imp.g_varchar2_table(310) := '65334428302C302C31297D7D406B65796672616D657320736B2D63756265477269645363616C6544656C61797B30252C3730252C313030257B2D7765626B69742D7472616E73666F726D3A7363616C65334428312C312C31293B7472616E73666F726D3A';
wwv_flow_imp.g_varchar2_table(311) := '7363616C65334428312C312C31297D3335257B2D7765626B69742D7472616E73666F726D3A7363616C65334428302C302C31293B7472616E73666F726D3A7363616C65334428302C302C31297D7D';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(117829131204418497)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_file_name=>'css/spinkit.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '76617220414F503D7B67414F504F7074696F6E733A7B616A61784964656E7469666965723A22222C74726967676572456C656D49643A22222C737461746963526567696F6E4964733A22222C6F7574707574546F3A22222C64614E616D653A22222C7761';
wwv_flow_imp.g_varchar2_table(2) := '69745370696E6E65723A2261706578222C73686F774E6F74696669636174696F6E3A21302C6E6F746966696361746F6E4D6573736167653A22222C7375626D69744974656D7341727261793A5B5D2C7375626D697456616C75657341727261793A5B5D2C';
wwv_flow_imp.g_varchar2_table(3) := '4947526567696F6E496473416E6453656C6563746564504B3A7B7D2C6630313A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630323A7B6461746141727261';
wwv_flow_imp.g_varchar2_table(4) := '793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630333A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768';
wwv_flow_imp.g_varchar2_table(5) := '743A307D2C6630343A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630353A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D';
wwv_flow_imp.g_varchar2_table(6) := '617857696474683A302C6D61784865696768743A307D2C6630363A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630373A7B6461746141727261793A5B5D2C';
wwv_flow_imp.g_varchar2_table(7) := '77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630383A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C';
wwv_flow_imp.g_varchar2_table(8) := '6630393A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631303A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D6178576964';
wwv_flow_imp.g_varchar2_table(9) := '74683A302C6D61784865696768743A307D2C6631313A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631323A7B6461746141727261793A5B5D2C7769647468';
wwv_flow_imp.g_varchar2_table(10) := '3A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631333A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631343A7B';
wwv_flow_imp.g_varchar2_table(11) := '6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631353A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C';
wwv_flow_imp.g_varchar2_table(12) := '6D61784865696768743A307D7D2C67657442726F777365724E616D653A66756E6374696F6E28297B76617220652C692C743D6E6176696761746F722E757365724167656E742C613D6E6176696761746F722E6170704E616D653B72657475726E2D31213D';
wwv_flow_imp.g_varchar2_table(13) := '28693D742E696E6465784F6628224F706572612229293F613D226F70657261223A2D31213D28693D742E696E6465784F6628224D5349452229293F613D226965223A2D31213D28693D742E696E6465784F66282254726964656E742229293F613D226965';
wwv_flow_imp.g_varchar2_table(14) := '223A2D31213D28693D742E696E6465784F662822456467652229293F613D2265646765223A2D31213D28693D742E696E6465784F6628224368726F6D652229293F613D226368726F6D65223A2D31213D28693D742E696E6465784F662822536166617269';
wwv_flow_imp.g_varchar2_table(15) := '2229293F613D22736166617269223A2D31213D28693D742E696E6465784F66282246697265666F782229293F613D2266697265666F78223A28653D742E6C617374496E6465784F6628222022292B31293C28693D742E6C617374496E6465784F6628222F';
wwv_flow_imp.g_varchar2_table(16) := '222929262628613D742E737562737472696E6728652C69292C612E746F4C6F7765724361736528293D3D612E746F5570706572436173652829262628613D6E6176696761746F722E6170704E616D6529292C617D2C73686F774572726F724D6573736167';
wwv_flow_imp.g_varchar2_table(17) := '653A66756E6374696F6E2865297B7472797B617065782E6D6573736167652E636C6561724572726F727328292C617065782E6D6573736167652E73686F774572726F7273285B7B747970653A226572726F72222C6C6F636174696F6E3A2270616765222C';
wwv_flow_imp.g_varchar2_table(18) := '6D6573736167653A652C756E736166653A21317D5D297D63617463682865297B617065782E64656275672E696E666F2822414F502073686F774572726F724D657373616765222C65297D7D2C73686F77537563636573734D6573736167653A66756E6374';
wwv_flow_imp.g_varchar2_table(19) := '696F6E2865297B7472797B617065782E6D6573736167652E73686F7750616765537563636573732865297D63617463682865297B617065782E64656275672E696E666F2822414F502073686F77537563636573734D657373616765222C65297D7D2C7368';
wwv_flow_imp.g_varchar2_table(20) := '6F774E6F74696669636174696F6E3A66756E6374696F6E28652C69297B696628414F502E67414F504F7074696F6E732E73686F774E6F74696669636174696F6E297B76617220743D414F502E67414F504F7074696F6E732E6E6F746966696361746F6E4D';
wwv_flow_imp.g_varchar2_table(21) := '6573736167657C7C693B2273756363657373223D3D653F414F502E73686F77537563636573734D6573736167652874293A226572726F72223D3D652626414F502E73686F774572726F724D6573736167652874297D7D2C73686F775370696E6E65723A66';
wwv_flow_imp.g_varchar2_table(22) := '756E6374696F6E28652C69297B76617220742C612C732C6E2C6F2C723D414F502E67414F504F7074696F6E732E776169745370696E6E65722C643D617065782E7574696C2E68746D6C4275696C64657228292C6C3D653F242865293A242822626F647922';
wwv_flow_imp.g_varchar2_table(23) := '292C633D242877696E646F77292C673D6C2E6F666673657428292C703D242E657874656E64287B616C6572743A617065782E6C616E672E6765744D6573736167652822415045582E50524F43455353494E4722292C7370696E6E6572436C6173733A2222';
wwv_flow_imp.g_varchar2_table(24) := '7D2C69292C753D7B746F703A632E7363726F6C6C546F7028292C6C6566743A632E7363726F6C6C4C65667428297D3B72657475726E20752E626F74746F6D3D752E746F702B632E68656967687428292C752E72696768743D752E6C6566742B632E776964';
wwv_flow_imp.g_varchar2_table(25) := '746828292C672E626F74746F6D3D672E746F702B6C2E6F7574657248656967687428292C672E72696768743D672E6C6566742B6C2E6F75746572576964746828292C613D672E746F703E752E746F703F672E746F703A752E746F702C733D672E626F7474';
wwv_flow_imp.g_varchar2_table(26) := '6F6D3C752E626F74746F6D3F672E626F74746F6D3A752E626F74746F6D2C6E3D28732D61292F322C6F3D752E746F702D672E746F702C6F3E302626286E2B3D6F292C2261706578223D3D3D723F642E6D61726B757028223C7370616E22292E6174747228';
wwv_flow_imp.g_varchar2_table(27) := '22636C617373222C22752D50726F63657373696E67222B28702E7370696E6E6572436C6173733F2220222B702E7370696E6E6572436C6173733A222229292E617474722822726F6C65222C22616C65727422292E6D61726B757028223E22292E6D61726B';
wwv_flow_imp.g_varchar2_table(28) := '757028223C7370616E22292E617474722822636C617373222C22752D50726F63657373696E672D7370696E6E657222292E6D61726B757028223E22292E6D61726B757028223C2F7370616E3E22292E6D61726B757028223C7370616E22292E6174747228';
wwv_flow_imp.g_varchar2_table(29) := '22636C617373222C22752D56697375616C6C7948696464656E22292E6D61726B757028223E22292E636F6E74656E7428702E616C657274292E6D61726B757028223C2F7370616E3E22292E6D61726B757028223C2F7370616E3E22293A2274687265652D';
wwv_flow_imp.g_varchar2_table(30) := '626F756E6365223D3D3D723F642E6D61726B757028273C64697620636C6173733D22736B2D74687265652D626F756E636522207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D6368696C6420';
wwv_flow_imp.g_varchar2_table(31) := '736B2D626F756E636531223E3C2F6469763E3C64697620636C6173733D22736B2D6368696C6420736B2D626F756E636532223E3C2F6469763E3C64697620636C6173733D22736B2D6368696C6420736B2D626F756E636533223E3C2F6469763E3C2F6469';
wwv_flow_imp.g_varchar2_table(32) := '763E27293A22726F746174696E672D706C616E65223D3D3D723F642E6D61726B757028273C64697620636C6173733D22736B2D726F746174696E672D706C616E65223E3C2F6469763E27293A22666164696E672D636972636C65223D3D3D723F642E6D61';
wwv_flow_imp.g_varchar2_table(33) := '726B757028273C64697620636C6173733D22736B2D666164696E672D636972636C6522207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D636972636C653120736B2D636972636C65223E3C2F';
wwv_flow_imp.g_varchar2_table(34) := '6469763E3C64697620636C6173733D22736B2D636972636C653220736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653320736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D63';
wwv_flow_imp.g_varchar2_table(35) := '6972636C653420736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653520736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653620736B2D636972636C65223E3C2F';
wwv_flow_imp.g_varchar2_table(36) := '6469763E3C64697620636C6173733D22736B2D636972636C653720736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653820736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D63';
wwv_flow_imp.g_varchar2_table(37) := '6972636C653920736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C65313020736B2D636972636C65223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C65313120736B2D636972636C65223E';
wwv_flow_imp.g_varchar2_table(38) := '3C2F6469763E3C64697620636C6173733D22736B2D636972636C65313220736B2D636972636C65223E3C2F6469763E3C2F6469763E27293A22666F6C64696E672D63756265223D3D3D723F642E6D61726B757028273C64697620636C6173733D22736B2D';
wwv_flow_imp.g_varchar2_table(39) := '666F6C64696E672D6375626522207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D637562653120736B2D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D63756265322073';
wwv_flow_imp.g_varchar2_table(40) := '6B2D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D637562653420736B2D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D637562653320736B2D63756265223E3C2F6469763E3C2F6469763E27293A22646F7562';
wwv_flow_imp.g_varchar2_table(41) := '6C652D626F756E6365223D3D3D723F642E6D61726B757028273C64697620636C6173733D22736B2D646F75626C652D626F756E636522207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D6368';
wwv_flow_imp.g_varchar2_table(42) := '696C6420736B2D646F75626C652D626F756E636531223E3C2F6469763E3C64697620636C6173733D22736B2D6368696C6420736B2D646F75626C652D626F756E636532223E3C2F6469763E3C2F6469763E27293A2277617665223D3D3D723F642E6D6172';
wwv_flow_imp.g_varchar2_table(43) := '6B757028273C64697620636C6173733D22736B2D7761766522207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D7265637420736B2D7265637431223E3C2F6469763E3C64697620636C617373';
wwv_flow_imp.g_varchar2_table(44) := '3D22736B2D7265637420736B2D7265637432223E3C2F6469763E3C64697620636C6173733D22736B2D7265637420736B2D7265637433223E3C2F6469763E3C64697620636C6173733D22736B2D7265637420736B2D7265637434223E3C2F6469763E3C64';
wwv_flow_imp.g_varchar2_table(45) := '697620636C6173733D22736B2D7265637420736B2D7265637435223E3C2F6469763E3C2F6469763E27293A2277616E646572696E672D6375626573223D3D3D723F642E6D61726B757028273C64697620636C6173733D22736B2D77616E646572696E672D';
wwv_flow_imp.g_varchar2_table(46) := '637562657322207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D6375626520736B2D6375626531223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D637562653222';
wwv_flow_imp.g_varchar2_table(47) := '3E3C2F6469763E3C2F6469763E27293A2270756C7365223D3D3D723F642E6D61726B757028273C64697620636C6173733D22736B2D7370696E6E657220736B2D7370696E6E65722D70756C736522207374796C653D227A2D696E6465783A203939393939';
wwv_flow_imp.g_varchar2_table(48) := '3939393939223E3C2F6469763E27293A2263686173696E672D646F7473223D3D3D723F642E6D61726B757028273C64697620636C6173733D22736B2D63686173696E672D646F747322207374796C653D227A2D696E6465783A2039393939393939393939';
wwv_flow_imp.g_varchar2_table(49) := '223E3C64697620636C6173733D22736B2D6368696C6420736B2D646F7431223E3C2F6469763E3C64697620636C6173733D22736B2D6368696C6420736B2D646F7432223E3C2F6469763E3C2F6469763E27293A22636972636C65223D3D3D723F642E6D61';
wwv_flow_imp.g_varchar2_table(50) := '726B757028273C64697620636C6173733D22736B2D636972636C6522207374796C653D227A2D696E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D636972636C653120736B2D6368696C64223E3C2F6469763E3C646976';
wwv_flow_imp.g_varchar2_table(51) := '20636C6173733D22736B2D636972636C653220736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653320736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653420736B2D';
wwv_flow_imp.g_varchar2_table(52) := '6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653520736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653620736B2D6368696C64223E3C2F6469763E3C64697620636C6173';
wwv_flow_imp.g_varchar2_table(53) := '733D22736B2D636972636C653720736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653820736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C653920736B2D6368696C64';
wwv_flow_imp.g_varchar2_table(54) := '223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C65313020736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C65313120736B2D6368696C64223E3C2F6469763E3C64697620636C6173733D22';
wwv_flow_imp.g_varchar2_table(55) := '736B2D636972636C65313220736B2D6368696C64223E3C2F6469763E3C2F6469763E27293A22637562652D67726964223D3D3D722626642E6D61726B757028273C64697620636C6173733D22736B2D637562652D6772696422207374796C653D227A2D69';
wwv_flow_imp.g_varchar2_table(56) := '6E6465783A2039393939393939393939223E3C64697620636C6173733D22736B2D6375626520736B2D6375626531223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626532223E3C2F6469763E3C64697620636C617373';
wwv_flow_imp.g_varchar2_table(57) := '3D22736B2D6375626520736B2D6375626533223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626534223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626535223E3C2F6469763E3C64';
wwv_flow_imp.g_varchar2_table(58) := '697620636C6173733D22736B2D6375626520736B2D6375626536223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626537223E3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626538223E';
wwv_flow_imp.g_varchar2_table(59) := '3C2F6469763E3C64697620636C6173733D22736B2D6375626520736B2D6375626539223E3C2F6469763E3C2F6469763E27292C743D2428642E746F537472696E672829292C742E617070656E64546F286C292C742E706F736974696F6E287B6D793A2263';
wwv_flow_imp.g_varchar2_table(60) := '656E746572222C61743A226C6566742B35302520746F702B222B6E2B227078222C6F663A6C2C636F6C6C6973696F6E3A22666974227D292C747D2C6173796E634C6F6F703A66756E6374696F6E28652C692C74297B76617220613D302C733D21312C6E3D';
wwv_flow_imp.g_varchar2_table(61) := '7B6E6578743A66756E6374696F6E28297B737C7C28613C3D653F28612B2B2C69286E29293A28733D21302C74282929297D2C697465726174696F6E3A66756E6374696F6E28297B72657475726E20612D317D2C627265616B3A66756E6374696F6E28297B';
wwv_flow_imp.g_varchar2_table(62) := '733D21302C7428297D7D3B72657475726E206E2E6E65787428292C6E7D2C6275696C6441666665637465644974656D41727261793A66756E6374696F6E2865297B617065782E64656275672E696E666F2822414F5020704166666563746564456C656D65';
wwv_flow_imp.g_varchar2_table(63) := '6E7473222C65293B76617220693D5B5D3B72657475726E2065262628693D652E7265706C616365282F5C732F672C2222292E73706C697428222C2229292C697D2C6275696C6441666665637465644974656D56616C756541727261793A66756E6374696F';
wwv_flow_imp.g_varchar2_table(64) := '6E2865297B617065782E64656275672E696E666F2822414F50206275696C6441666665637465644974656D56616C75654172726179222C65293B76617220693D5B5D2C743D5B5D3B69662865297B693D652E7265706C616365282F5C732F672C2222292E';
wwv_flow_imp.g_varchar2_table(65) := '73706C697428222C22293B666F722876617220613D303B613C692E6C656E6774683B612B2B29742E7075736828247628695B615D29297D72657475726E20747D2C737667456E68616E63653A66756E6374696F6E28652C69297B7472797B617065782E64';
wwv_flow_imp.g_varchar2_table(66) := '656275672E696E666F2822414F5020737667456E68616E6365222C65293B76617220743D242865292E66696E64282273766722292C613D303B617065782E64656275672E696E666F2822414F5020737667456E68616E6365222C612C742E6C656E677468';
wwv_flow_imp.g_varchar2_table(67) := '293B76617220733D66756E6374696F6E28297B612B2B2C617065782E64656275672E696E666F2822414F5020737667456E68616E636520737667446F6E65222C612C742E6C656E677468292C613D3D742E6C656E677468262628617065782E6465627567';
wwv_flow_imp.g_varchar2_table(68) := '2E696E666F2822414F5020737667456E68616E636520737667446F6E652063616C6C6261636B22292C692829297D3B742E656163682866756E6374696F6E28297B617065782E64656275672E696E666F2822414F5020737667456E68616E636520222C74';
wwv_flow_imp.g_varchar2_table(69) := '686973293B76617220653D746869732C693D242865292E696E6E6572576964746828292C743D242865292E696E6E657248656967687428293B242865292E6174747228227769647468222C69292C242865292E617474722822686569676874222C74292C';
wwv_flow_imp.g_varchar2_table(70) := '242865292E617474722822786D6C6E73222C22687474703A2F2F7777772E77332E6F72672F323030302F73766722292C242865292E617474722822786D6C6E733A786C696E6B222C22687474703A2F2F7777772E77332E6F72672F313939392F786C696E';
wwv_flow_imp.g_varchar2_table(71) := '6B22293B666F722876617220613D652E676574456C656D656E747342795461674E616D652822696D61676522292C6E3D302C6F3D66756E6374696F6E28297B617065782E64656275672E696E666F2822414F5020737667456E68616E636520696D616765';
wwv_flow_imp.g_varchar2_table(72) := '446F6E65222C6E2C612E6C656E677468292C6E2B2B2C6E3E3D612E6C656E677468262628617065782E64656275672E696E666F2822414F5020737667456E68616E636520696D616765446F6E652063616C6C696E6720737667446F6E65222C6E2C612E6C';
wwv_flow_imp.g_varchar2_table(73) := '656E677468292C732829297D2C723D303B723C612E6C656E6774683B722B2B292866756E6374696F6E28297B76617220653D615B725D3B414F502E67657442617365363446726F6D55524C28414F502E6765744162736F6C75746555726C28652E676574';
wwv_flow_imp.g_varchar2_table(74) := '41747472696275746528226872656622297C7C652E6765744174747269627574652822786C696E6B3A687265662229292C66756E6374696F6E2869297B652E7365744174747269627574652822786C696E6B3A68726566222C69292C652E736574417474';
wwv_flow_imp.g_varchar2_table(75) := '726962757465282268726566222C69292C617065782E64656275672E696E666F2822414F5020446174612052657475726E65643A222C69292C6F28297D297D2928293B303D3D3D612E6C656E67746826267328297D292C303D3D3D742E6C656E67746826';
wwv_flow_imp.g_varchar2_table(76) := '266928297D63617463682865297B617065782E64656275672E696E666F2822414F5020737667456E68616E636520636175676874206572726F72222C65292C6928297D7D2C63616E76617332446174615552493A66756E6374696F6E28652C69297B7661';
wwv_flow_imp.g_varchar2_table(77) := '7220743D652E746F4461746155524C2869293B72657475726E20747D2C64617461555249326261736536343A66756E6374696F6E2865297B76617220693D652E73756273747228652E696E6465784F6628222C22292B31293B72657475726E20697D2C63';
wwv_flow_imp.g_varchar2_table(78) := '6C6F623241727261793A66756E6374696F6E28652C692C74297B6C6F6F70436F756E743D4D6174682E666C6F6F7228652E6C656E6774682F69292B313B666F722876617220613D303B613C6C6F6F70436F756E743B612B2B29742E7075736828652E736C';
wwv_flow_imp.g_varchar2_table(79) := '69636528692A612C692A28612B312929293B72657475726E20747D2C676574496D6167654261736536343A66756E6374696F6E28652C69297B76617220742C613D242865293B6966286C57696474683D612E696E6E6572576964746828292C6C48656967';
wwv_flow_imp.g_varchar2_table(80) := '68743D612E696E6E657248656967687428292C743D617065782E64656275672E6765744C6576656C28293E302C22636C69656E745F63616E766173223D3D3D615B305D2E6765744174747269627574652822616F702D726567696F6E2D61732229296170';
wwv_flow_imp.g_varchar2_table(81) := '65782E64656275672E696E666F2822414F5020676574496D6167654261736536342063616C6C696E67207468652063616E7661732067657420696D616765206F7074696F6E20776974682073656C6563746F72222B652B222063616E766173222C242865';
wwv_flow_imp.g_varchar2_table(82) := '2B222063616E76617322295B305D2E746F4461746155524C2829292C69282428652B222063616E76617322295B305D2E746F4461746155524C28292E73706C697428223B6261736536342C22295B315D293B656C73657B617065782E64656275672E696E';
wwv_flow_imp.g_varchar2_table(83) := '666F2822414F5020676574496D6167654261736536342068746D6C3263616E76617320776974682073656C6563746F72222B652B222022293B76617220733D6E657720446174653B414F502E737667456E68616E636528652C66756E6374696F6E28297B';
wwv_flow_imp.g_varchar2_table(84) := '68746D6C3263616E76617328615B305D2C7B6261636B67726F756E64436F6C6F723A2223666666222C77696474683A6C57696474682C6865696768743A6C4865696768742C616C6C6F775461696E743A21312C6C6F6767696E673A742C757365434F5253';
wwv_flow_imp.g_varchar2_table(85) := '3A21307D292E7468656E2866756E6374696F6E2874297B76617220613D414F502E63616E766173324461746155524928742C22696D6167652F706E6722292C6E3D414F502E64617461555249326261736536342861293B617065782E64656275672E696E';
wwv_flow_imp.g_varchar2_table(86) := '666F2822414F5020676574496D6167654261736536342068746D6C3263616E76617320776974682073656C6563746F72222B652B2220746F6F6B20222B286E657720446174652D73292F3165332B22207322292C69286E297D297D297D7D2C676574496D';
wwv_flow_imp.g_varchar2_table(87) := '61676542617365363441727261793A66756E6374696F6E28652C692C74297B414F502E676574496D61676542617365363428652C66756E6374696F6E2865297B693D414F502E636C6F6232417272617928652C3365342C69292C742869297D297D2C6261';
wwv_flow_imp.g_varchar2_table(88) := '73653634746F426C6F623A66756E6374696F6E28652C69297B666F722876617220743D61746F622865292C613D692C733D6E657720417272617942756666657228742E6C656E677468292C6E3D6E65772055696E743841727261792873292C6F3D303B6F';
wwv_flow_imp.g_varchar2_table(89) := '3C742E6C656E6774683B6F2B2B296E5B6F5D3D742E63686172436F64654174286F293B7472797B72657475726E206E657720426C6F62285B735D2C7B747970653A617D297D63617463682865297B76617220723D77696E646F772E5765624B6974426C6F';
wwv_flow_imp.g_varchar2_table(90) := '624275696C6465727C7C77696E646F772E4D6F7A426C6F624275696C6465727C7C77696E646F772E4D53426C6F624275696C6465722C643D6E657720723B72657475726E20642E617070656E642873292C642E676574426C6F622861297D7D2C646F776E';
wwv_flow_imp.g_varchar2_table(91) := '6C6F61644261736536343A66756E6374696F6E28652C692C74297B617065782E64656275672E696E666F2822414F5020646F776E6C6F61644261736536342064617461222C65293B76617220613D414F502E67657442726F777365724E616D6528293B69';
wwv_flow_imp.g_varchar2_table(92) := '6628226965223D3D617C7C2265646765223D3D61297B76617220733D414F502E626173653634746F426C6F6228652C69293B77696E646F772E6E6176696761746F722E6D7353617665426C6F6228732C74297D656C73657B766172206E3D22646174613A';
wwv_flow_imp.g_varchar2_table(93) := '222B692B223B6261736536342C222B653B617065782E64656275672E696E666F2822414F50204D696D6554797065222C69293B766172206F3D646F63756D656E742E637265617465456C656D656E7428226122293B646F63756D656E742E626F64792E61';
wwv_flow_imp.g_varchar2_table(94) := '7070656E644368696C64286F292C6F2E7374796C653D22646973706C61793A206E6F6E65222C6F2E7461726765743D225F626C616E6B222C6F2E636C6173734E616D653D22616F705F6C696E6B222C6F2E687265663D6E2C226368726F6D6522213D6126';
wwv_flow_imp.g_varchar2_table(95) := '262273616661726922213D617C7C286F2E687265663D55524C2E6372656174654F626A65637455524C28414F502E626173653634746F426C6F6228652C692929292C6F2E646F776E6C6F61643D742C6F2E636C69636B28292C242822612E616F705F6C69';
wwv_flow_imp.g_varchar2_table(96) := '6E6B22292E72656D6F766528297D7D2C6765744162736F6C75746555726C3A66756E6374696F6E28297B76617220653B72657475726E2066756E6374696F6E2869297B72657475726E20653D657C7C646F63756D656E742E637265617465456C656D656E';
wwv_flow_imp.g_varchar2_table(97) := '7428226122292C652E687265663D692C652E636C6F6E654E6F6465282131292E687265667D7D28292C67657442617365363446726F6D55524C3A66756E6374696F6E28652C69297B617065782E64656275672E696E666F2822414F502067657442617365';
wwv_flow_imp.g_varchar2_table(98) := '363446726F6D55524C222C65293B76617220743D6E657720584D4C48747470526571756573743B742E6F70656E2822474554222C652C2130292C742E726573706F6E7365547970653D226172726179627566666572222C742E6F6E6C6F61643D66756E63';
wwv_flow_imp.g_varchar2_table(99) := '74696F6E2865297B76617220743D6E65772055696E7438417272617928746869732E726573706F6E7365292C613D537472696E672E66726F6D43686172436F64652E6170706C79286E756C6C2C74292C733D62746F612861292C6E3D22646174613A696D';
wwv_flow_imp.g_varchar2_table(100) := '6167652F706E673B6261736536342C222B733B69286E297D2C742E73656E6428297D2C696E6C696E654261736536343A66756E6374696F6E28652C692C74297B6C44614E616D653D414F502E67414F504F7074696F6E732E64614E616D653B7661722061';
wwv_flow_imp.g_varchar2_table(101) := '3D2428275B646174612D616F702D696E6C696E652D7064663D22272B6C44614E616D652B27225D27292C733D612E617474722822696422297C7C22616F70223B696628226965223D3D3D414F502E67657442726F777365724E616D652829297265747572';
wwv_flow_imp.g_varchar2_table(102) := '6E20414F502E646F776E6C6F616442617365363428652C692C74293B766172206E3D414F502E626173653634746F426C6F6228652C69293B6E2E6E616D653D743B766172206F3D55524C2E6372656174654F626A65637455524C286E292C723D2428273C';
wwv_flow_imp.g_varchar2_table(103) := '696672616D652069643D22696E6C696E655F7064665F6F626A6563745F272B732B2722207372633D2222207469746C653D22272B742B27222077696474683D223130302522206865696768743D22313030252220747970653D22272B692B27223E3C2F6F';
wwv_flow_imp.g_varchar2_table(104) := '626A6563743E27293B612E68746D6C2872292C722E617474722822737263222C6F297D2C696E6C696E65546578743A66756E6374696F6E28652C692C74297B76617220613D414F502E6236344465636F6465556E69636F64652865293B6C44614E616D65';
wwv_flow_imp.g_varchar2_table(105) := '3D414F502E67414F504F7074696F6E732E64614E616D653B76617220733D2428275B646174612D616F702D696E6C696E652D7478743D22272B6C44614E616D652B27225D27293B732E76616C2861297D2C6236344465636F6465556E69636F64653A6675';
wwv_flow_imp.g_varchar2_table(106) := '6E6374696F6E2865297B72657475726E206465636F6465555249436F6D706F6E656E742841727261792E70726F746F747970652E6D61702E63616C6C2861746F622865292C66756E6374696F6E2865297B72657475726E2225222B28223030222B652E63';
wwv_flow_imp.g_varchar2_table(107) := '686172436F646541742830292E746F537472696E6728313629292E736C696365282D32297D292E6A6F696E28222229297D2C676574496E646976696475616C496D61676555706C6F61644172726179733A66756E6374696F6E28652C692C74297B747279';
wwv_flow_imp.g_varchar2_table(108) := '7B76617220613D652B312C733D2266222B28613E3D31303F612E746F537472696E6728293A2230222B612E746F537472696E672829293B696628617065782E64656275672E696E666F2822414F5020676574496E646976696475616C496D61676555706C';
wwv_flow_imp.g_varchar2_table(109) := '6F616441727261797320636865636B696E6720666F722074797065206F6620726567696F6E20776974682073656C6563746F7220222B69292C766F696420303D3D3D242869295B305D2972657475726E20617065782E64656275672E696E666F2822414F';
wwv_flow_imp.g_varchar2_table(110) := '5020676574496E646976696475616C496D61676555706C6F616441727261797320726567696F6E206E6F7420666F756E642069676E6F72696E672C20222B69292C766F6964207428293B73776974636828617065782E64656275672E696E666F2822414F';
wwv_flow_imp.g_varchar2_table(111) := '5020676574496E646976696475616C496D61676555706C6F61644172726179732020222B242869295B305D2E6765744174747269627574652822616F702D726567696F6E2D617322292C242869295B305D292C242869295B305D2E676574417474726962';
wwv_flow_imp.g_varchar2_table(112) := '7574652822616F702D726567696F6E2D61732229297B63617365227365727665725F68746D6C223A6361736522636C69656E745F68746D6C223A617065782E64656275672E696E666F2822414F5020676574496E646976696475616C496D61676555706C';
wwv_flow_imp.g_varchar2_table(113) := '6F61644172726179732068746D6C20666F756E642070617373696E672069742061732069742069732E222C69293B7472797B617065782E64656275672E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179';
wwv_flow_imp.g_varchar2_table(114) := '732068746D6C2069733A222C2428692B22202E742D526567696F6E2D626F647922295B305D2E696E6E657248544D4C292C414F502E636C6F62324172726179282428692B22202E742D526567696F6E2D626F647922295B305D2E696E6E657248544D4C2C';
wwv_flow_imp.g_varchar2_table(115) := '3365332C414F502E67414F504F7074696F6E735B735D2E646174614172726179297D63617463682865297B617065782E64656275672E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179732068746D6C20';
wwv_flow_imp.g_varchar2_table(116) := '69733A222C242869295B305D2E696E6E657248544D4C292C414F502E636C6F6232417272617928242869295B305D2E696E6E657248544D4C2C3365332C414F502E67414F504F7074696F6E735B735D2E646174614172726179297D7428293B627265616B';
wwv_flow_imp.g_varchar2_table(117) := '3B6361736522636C69656E745F737667223A414F502E737667456E68616E636528692C66756E6374696F6E28297B617065782E64656275672E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F6164417272617973207376';
wwv_flow_imp.g_varchar2_table(118) := '67206265696E672073656E74222C286E657720584D4C53657269616C697A6572292E73657269616C697A65546F537472696E67282428692B222073766722295B305D29292C414F502E636C6F6232417272617928286E657720584D4C53657269616C697A';
wwv_flow_imp.g_varchar2_table(119) := '6572292E73657269616C697A65546F537472696E67282428692B222073766722295B305D292C3365332C414F502E67414F504F7074696F6E735B735D2E646174614172726179292C414F502E67414F504F7074696F6E735B735D2E77696474683D242869';
wwv_flow_imp.g_varchar2_table(120) := '292E646174612822616F702D776964746822297C7C242869292E696E6E6572576964746828292C414F502E67414F504F7074696F6E735B735D2E6865696768743D242869292E646174612822616F702D68656967687422297C7C242869292E696E6E6572';
wwv_flow_imp.g_varchar2_table(121) := '48656967687428292C414F502E67414F504F7074696F6E735B735D2E6D617857696474683D242869292E646174612822616F702D6D61782D776964746822292C414F502E67414F504F7074696F6E735B735D2E6D61784865696768743D242869292E6461';
wwv_flow_imp.g_varchar2_table(122) := '74612822616F702D6D61782D68656967687422292C7428297D293B627265616B3B64656661756C743A414F502E676574496D616765426173653634417272617928692C414F502E67414F504F7074696F6E735B735D2E6461746141727261792C66756E63';
wwv_flow_imp.g_varchar2_table(123) := '74696F6E2865297B617065782E64656275672E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179732073657474696E6720646174614172726179222C65292C414F502E67414F504F7074696F6E735B735D';
wwv_flow_imp.g_varchar2_table(124) := '2E6461746141727261793D652C414F502E67414F504F7074696F6E735B735D2E77696474683D242869292E646174612822616F702D776964746822297C7C242869292E696E6E6572576964746828292C414F502E67414F504F7074696F6E735B735D2E68';
wwv_flow_imp.g_varchar2_table(125) := '65696768743D242869292E646174612822616F702D68656967687422297C7C242869292E696E6E657248656967687428292C414F502E67414F504F7074696F6E735B735D2E6D617857696474683D242869292E646174612822616F702D6D61782D776964';
wwv_flow_imp.g_varchar2_table(126) := '746822292C414F502E67414F504F7074696F6E735B735D2E6D61784865696768743D242869292E646174612822616F702D6D61782D68656967687422292C617065782E64656275672E696E666F2822414F5020676574496E646976696475616C496D6167';
wwv_flow_imp.g_varchar2_table(127) := '6555706C6F61644172726179732063616C6C696E67206E65787420737465702061667465722067657474696E6720696D616765206461746122292C7428297D297D7D63617463682865297B617065782E64656275672E696E666F2822414F502045786365';
wwv_flow_imp.g_varchar2_table(128) := '7074696F6E3A222C65292C7428297D7D2C676574416C6C496D61676555706C6F61644172726179733A66756E6374696F6E28652C69297B617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555706C6F616441726179732052';
wwv_flow_imp.g_varchar2_table(129) := '6567696F6E204944204172726179222C65293B76617220743B743D652E6C656E6774683E31353F31353A652E6C656E6774682C617065782E64656275672E696E666F2822414F5020676574416C6C496D61676555706C6F61644172726179732052656769';
wwv_flow_imp.g_varchar2_table(130) := '6F6E204172726179204C656E677468222C74293B666F722876617220613D302C733D66756E6374696F6E28297B612B2B2C613D3D7426266928297D2C6E3D303B6E3C743B6E2B2B29617065782E64656275672E696E666F2822414F5020676574416C6C49';
wwv_flow_imp.g_varchar2_table(131) := '6D61676555706C6F616441727261797320526567696F6E204172726179204C6F6F7020697465726174696F6E222C6E292C655B6E5D2626414F502E676574496E646976696475616C496D61676555706C6F6164417272617973286E2C2223222B655B6E5D';
wwv_flow_imp.g_varchar2_table(132) := '2C73297D2C646F776E6C6F6164414F5046696C653A66756E6374696F6E2865297B617065782E64656275672E696E666F2822414F5020646F776E6C6F6164414F5046696C6520414F502E67414F504F7074696F6E73222C414F502E67414F504F7074696F';
wwv_flow_imp.g_varchar2_table(133) := '6E73293B666F722876617220693D5B5D2C743D5B5D2C613D5B5D2C733D5B5D2C6E3D7B705F7769646765745F616374696F6E3A22414F50222C705F726571756573743A22504C5547494E3D222B414F502E67414F504F7074696F6E732E616A6178496465';
wwv_flow_imp.g_varchar2_table(134) := '6E7469666965722C705F666C6F775F69643A2476282270466C6F77496422292C705F666C6F775F737465705F69643A2476282270466C6F7753746570496422292C705F696E7374616E63653A2476282270496E7374616E636522292C705F64656275673A';
wwv_flow_imp.g_varchar2_table(135) := '2476282270646562756722292C705F6172675F6E616D65733A414F502E67414F504F7074696F6E732E7375626D69744974656D7341727261792C705F6172675F76616C7565733A414F502E67414F504F7074696F6E732E7375626D697456616C75657341';
wwv_flow_imp.g_varchar2_table(136) := '727261792C7830313A414F502E67414F504F7074696F6E732E737461746963526567696F6E4964732C7830323A414F502E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B7D2C6F3D313B6F3C3D31353B6F2B2B';
wwv_flow_imp.g_varchar2_table(137) := '297B76617220723D2266222B286F3E3D31303F6F2E746F537472696E6728293A2230222B6F2E746F537472696E672829293B692E7075736828414F502E67414F504F7074696F6E735B725D2E7769647468292C742E7075736828414F502E67414F504F70';
wwv_flow_imp.g_varchar2_table(138) := '74696F6E735B725D2E686569676874292C612E7075736828414F502E67414F504F7074696F6E735B725D2E6D61785769647468292C732E7075736828414F502E67414F504F7074696F6E735B725D2E6D6178486569676874292C6E5B725D3D414F502E67';
wwv_flow_imp.g_varchar2_table(139) := '414F504F7074696F6E735B725D2E6461746141727261797D6E2E6631363D692C6E2E6631373D742C6E2E6631383D612C6E2E6631393D732C617065782E6A51756572792E616A6178287B64617461547970653A2274657874222C747970653A22504F5354';
wwv_flow_imp.g_varchar2_table(140) := '222C75726C3A77696E646F772E6C6F636174696F6E2E687265662E73756273747228302C77696E646F772E6C6F636174696F6E2E687265662E696E6465784F6628222F663F703D22292B31292B227777765F666C6F772E73686F77222C6173796E633A21';
wwv_flow_imp.g_varchar2_table(141) := '302C747261646974696F6E616C3A21302C646174613A6E2C737563636573733A66756E6374696F6E2869297B76617220743B7472797B743D6A51756572792E70617273654A534F4E2869297D63617463682865297B617065782E64656275672E6C6F6728';
wwv_flow_imp.g_varchar2_table(142) := '22414F5020646F776E6C6F6164414F5046696C6520526573706F6E73652050617273654572726F72222C65293B76617220613D2428223C6469763E3C2F6469763E22293B612E68746D6C2869293B76617220733D2428222E742D416C6572742D626F6479';
wwv_flow_imp.g_varchar2_table(143) := '206833222C61292E7465787428293B733D732E7265706C616365282F222F672C222022292C22223D3D73262628733D22414F5020414A41582043616C6C6261636B2069737375652E22292C743D6A51756572792E70617273654A534F4E28277B20227374';
wwv_flow_imp.g_varchar2_table(144) := '61747573223A20226572726F72222C20226D657373616765223A2022526573706F6E73652050617273654572726F72222C2022636F6465223A2022414A41582043616C6C6261636B20287044617461292050617273654572726F72222C20226E6F746966';
wwv_flow_imp.g_varchar2_table(145) := '69636174696F6E223A22272B732B2722207D27297D226572726F72223D3D742E7374617475733F28617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C65204572726F72222C742E6D6573736167652C742E636F646529';
wwv_flow_imp.g_varchar2_table(146) := '2C617065782E6576656E742E7472696767657228414F502E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D6572726F72222C74292C414F502E73686F774E6F74696669636174696F6E28226572726F72222C74';
wwv_flow_imp.g_varchar2_table(147) := '2E6E6F74696669636174696F6E292C652829293A2273756363657373223D3D742E737461747573262628617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C65205375636365737322292C617065782E6576656E742E74';
wwv_flow_imp.g_varchar2_table(148) := '72696767657228414F502E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D73756363657373222C74292C617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C6520446F776E6C';
wwv_flow_imp.g_varchar2_table(149) := '6F6164696E672066696C6522292C224449524543544F5259223D3D414F502E67414F504F7074696F6E732E6F7574707574546F262622746578742F706C61696E223D3D742E6D696D65747970653F28617065782E64656275672E6C6F672822414F503A20';
wwv_flow_imp.g_varchar2_table(150) := '4F757470757420746F206469726563746F727922292C414F502E73686F774E6F74696669636174696F6E282273756363657373222C742E6461746129293A2242524F57534552223D3D414F502E67414F504F7074696F6E732E6F7574707574546F7C7C22';
wwv_flow_imp.g_varchar2_table(151) := '50524F4345445552455F42524F57534552223D3D414F502E67414F504F7074696F6E732E6F7574707574546F7C7C224449524543544F5259223D3D414F502E67414F504F7074696F6E732E6F7574707574546F3F28617065782E64656275672E6C6F6728';
wwv_flow_imp.g_varchar2_table(152) := '22414F5020646F776E6C6F6164414F5046696C6520646F776E6C6F616442617365363422292C414F502E646F776E6C6F616442617365363428742E646174612C742E6D696D65747970652C742E66696C656E616D6529293A2242524F575345525F494E4C';
wwv_flow_imp.g_varchar2_table(153) := '494E4522213D414F502E67414F504F7074696F6E732E6F7574707574546F7C7C226170706C69636174696F6E2F70646622213D742E6D696D6574797065262622746578742F68746D6C22213D742E6D696D65747970653F2242524F575345525F494E4C49';
wwv_flow_imp.g_varchar2_table(154) := '4E4522213D414F502E67414F504F7074696F6E732E6F7574707574546F7C7C22746578742F6D61726B646F776E22213D742E6D696D6574797065262622746578742F706C61696E22213D742E6D696D6574797065262622746578742F63737622213D742E';
wwv_flow_imp.g_varchar2_table(155) := '6D696D65747970653F2250524F4345445552455F494E4C494E4522213D414F502E67414F504F7074696F6E732E6F7574707574546F7C7C226170706C69636174696F6E2F70646622213D742E6D696D6574797065262622746578742F68746D6C22213D74';
wwv_flow_imp.g_varchar2_table(156) := '2E6D696D65747970653F2250524F4345445552455F494E4C494E4522213D414F502E67414F504F7074696F6E732E6F7574707574546F7C7C22746578742F6D61726B646F776E22213D742E6D696D6574797065262622746578742F706C61696E22213D74';
wwv_flow_imp.g_varchar2_table(157) := '2E6D696D6574797065262622746578742F63737622213D742E6D696D65747970653F22434C4F5544223D3D414F502E67414F504F7074696F6E732E6F7574707574546F3F28617065782E64656275672E6C6F672822414F503A204F757470757420746F20';
wwv_flow_imp.g_varchar2_table(158) := '636C6F756422292C414F502E73686F774E6F74696669636174696F6E282273756363657373222C22446F63756D656E7420736176656420746F20636C6F75642E2229293A617065782E64656275672E6C6F672822414F503A204E6F20737570706F727465';
wwv_flow_imp.g_varchar2_table(159) := '64206F7574707574206D6574686F6422293A28617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E655465787422292C414F502E696E6C696E655465787428742E646174612C742E6D696D6574797065';
wwv_flow_imp.g_varchar2_table(160) := '2C742E66696C656E616D6529293A28617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E6542617365363422292C414F502E696E6C696E6542617365363428742E646174612C742E6D696D6574797065';
wwv_flow_imp.g_varchar2_table(161) := '2C742E66696C656E616D6529293A28617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E655465787422292C414F502E696E6C696E655465787428742E646174612C742E6D696D65747970652C742E66';
wwv_flow_imp.g_varchar2_table(162) := '696C656E616D6529293A28617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E6542617365363422292C414F502E696E6C696E6542617365363428742E646174612C742E6D696D65747970652C742E66';
wwv_flow_imp.g_varchar2_table(163) := '696C656E616D6529292C65287429297D2C6572726F723A66756E6374696F6E28692C74297B617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C65204572726F72222C74292C617065782E6576656E742E747269676765';
wwv_flow_imp.g_varchar2_table(164) := '7228414F502E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D6572726F72222C74292C414F502E73686F774E6F74696669636174696F6E28226572726F72222C74292C6528297D2C7868723A66756E6374696F';
wwv_flow_imp.g_varchar2_table(165) := '6E28297B72657475726E205868724F626A3D242E616A617853657474696E67732E78687228292C5868724F626A2E75706C6F61643F5868724F626A2E75706C6F61642E6164644576656E744C697374656E6572282270726F6772657373222C66756E6374';
wwv_flow_imp.g_varchar2_table(166) := '696F6E2865297B696628652E6C656E677468436F6D70757461626C65297B76617220693D652E6C6F616465642F652E746F74616C2A3130303B617065782E6576656E742E7472696767657228414F502E67414F504F7074696F6E732E7472696767657245';
wwv_flow_imp.g_varchar2_table(167) := '6C656D49642C22616F702D66696C652D70726F6772657373222C69297D7D2C2131293A617065782E64656275672E6C6F672822414F5020646F776E6C6F6164414F5046696C6520584852222C2250726F6772657373206973206E6F7420737570706F7274';
wwv_flow_imp.g_varchar2_table(168) := '65642062792042726F777365722E22292C5868724F626A7D7D297D2C63616C6C414F503A66756E6374696F6E28297B7472797B50726F6D6973657C7C2850726F6D6973653D45533650726F6D697365297D63617463682865297B50726F6D6973653D4553';
wwv_flow_imp.g_varchar2_table(169) := '3650726F6D6973657D76617220652C693D746869732C743D692E616374696F6E2E616A61784964656E7469666965722C613D692E616374696F6E2E61747472696275746530312C733D692E616374696F6E2E61747472696275746530352C6E3D692E6163';
wwv_flow_imp.g_varchar2_table(170) := '74696F6E2E61747472696275746531322C6F3D692E616374696F6E2E61747472696275746531332C723D692E616374696F6E2E61747472696275746531342C643D746869732E74726967676572696E67456C656D656E743B653D242864292E697328225B';
wwv_flow_imp.g_varchar2_table(171) := '69645D22293F2223222B242864292E617474722822696422293A22626F6479223B766172206C3D5B5D3B6F2626286C3D6F2E73706C697428222C2229293B76617220633D5B5D3B6E262628633D6E2E73706C697428222C2229292C414F502E67414F504F';
wwv_flow_imp.g_varchar2_table(172) := '7074696F6E732E616A61784964656E7469666965723D742C414F502E67414F504F7074696F6E732E74726967676572456C656D49643D652C414F502E67414F504F7074696F6E732E737461746963526567696F6E4964733D6F2C414F502E67414F504F70';
wwv_flow_imp.g_varchar2_table(173) := '74696F6E732E64614E616D653D612C414F502E67414F504F7074696F6E732E6F7574707574546F3D722C224954454D223D3D692E616374696F6E2E6166666563746564456C656D656E747354797065262628414F502E67414F504F7074696F6E732E7375';
wwv_flow_imp.g_varchar2_table(174) := '626D69744974656D7341727261793D414F502E6275696C6441666665637465644974656D417272617928692E616374696F6E2E6166666563746564456C656D656E7473292C414F502E67414F504F7074696F6E732E7375626D697456616C756573417272';
wwv_flow_imp.g_varchar2_table(175) := '61793D414F502E6275696C6441666665637465644974656D56616C7565417272617928692E616374696F6E2E6166666563746564456C656D656E747329293B666F722876617220673D313B673C3D31353B672B2B297B76617220703D2266222B28673E3D';
wwv_flow_imp.g_varchar2_table(176) := '31303F672E746F537472696E6728293A2230222B672E746F537472696E672829293B414F502E67414F504F7074696F6E735B705D2E6461746141727261793D5B5D2C414F502E67414F504F7074696F6E735B705D2E77696474683D302C414F502E67414F';
wwv_flow_imp.g_varchar2_table(177) := '504F7074696F6E735B705D2E6865696768743D302C414F502E67414F504F7074696F6E735B705D2E6D617857696474683D302C414F502E67414F504F7074696F6E735B705D2E6D61784865696768743D307D617065782E64656275672E696E666F282241';
wwv_flow_imp.g_varchar2_table(178) := '4F502076416A61784964656E746966696572222C74292C617065782E64656275672E696E666F2822414F50207654726967676572456C656D4964222C65292C617065782E64656275672E696E666F2822414F50207644614E616D65222C61292C61706578';
wwv_flow_imp.g_varchar2_table(179) := '2E64656275672E696E666F2822414F5020764461746154797065222C73292C617065782E64656275672E696E666F2822414F502076526567696F6E496473222C6F292C617065782E64656275672E696E666F2822414F5020764F7574707574546F222C72';
wwv_flow_imp.g_varchar2_table(180) := '292C617065782E64656275672E696E666F2822414F5020414F502E67414F504F7074696F6E73222C414F502E67414F504F7074696F6E73293B76617220753D414F502E73686F775370696E6E657228242822626F64792229293B752E6174747228226461';
wwv_flow_imp.g_varchar2_table(181) := '74612D68746D6C3263616E7661732D69676E6F7265222C227472756522293B7472797B617065782E64656275672E696E666F2822414F50206C4947526567696F6E4964733A222C63292C414F502E67414F504F7074696F6E732E4947526567696F6E4964';
wwv_flow_imp.g_varchar2_table(182) := '73416E6453656C6563746564504B3D7B7D2C632E666F72456163682866756E6374696F6E2865297B7472797B76617220693D652C743D617065782E726567696F6E2869292E77696467657428292C613D742E696E74657261637469766547726964282267';
wwv_flow_imp.g_varchar2_table(183) := '65745669657773222C226772696422292C733D742E696E7465726163746976654772696428226765745669657773222C226772696422292E6D6F64656C2C6E3D5B5D3B612E67657453656C65637465645265636F72647328292E666F7245616368286675';
wwv_flow_imp.g_varchar2_table(184) := '6E6374696F6E2865297B6E2E7075736828732E5F6765745072696D6172794B65792865295B305D297D292C414F502E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B5B655D3D6E2C617065782E64656275672E';
wwv_flow_imp.g_varchar2_table(185) := '696E666F2822414F5020494720526567696F6E2053656C656374696F6E3A222C652C6E297D63617463682865297B7D7D292C414F502E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B3D4A534F4E2E73747269';
wwv_flow_imp.g_varchar2_table(186) := '6E6769667928414F502E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B292C617065782E64656275672E696E666F2822414F50204947526567696F6E496473416E6453656C6563746564504B3A222C414F502E';
wwv_flow_imp.g_varchar2_table(187) := '67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B292C224952223D3D7326266F3F28617065782E64656275672E696E666F2822414F502047657474696E6720746865206461746120666F722076526567696F6E49';
wwv_flow_imp.g_varchar2_table(188) := '6473222C6F292C414F502E676574416C6C496D61676555706C6F6164417272617973286C2C66756E6374696F6E28297B414F502E646F776E6C6F6164414F5046696C652866756E6374696F6E28297B752E72656D6F766528292C617065782E64612E7265';
wwv_flow_imp.g_varchar2_table(189) := '73756D6528692E726573756D6543616C6C6261636B2C2131297D297D29293A414F502E646F776E6C6F6164414F5046696C652866756E6374696F6E28297B752E72656D6F766528292C617065782E64612E726573756D6528692E726573756D6543616C6C';
wwv_flow_imp.g_varchar2_table(190) := '6261636B2C2131297D297D63617463682865297B617065782E6576656E742E7472696767657228414F502E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D6572726F7222292C752E72656D6F766528292C6170';
wwv_flow_imp.g_varchar2_table(191) := '65782E64612E726573756D6528692E726573756D6543616C6C6261636B2C2131297D7D7D3B';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(117829537459418498)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_file_name=>'js/aop_da.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2866756E6374696F6E28742C65297B226F626A656374223D3D747970656F66206578706F727473262622756E646566696E656422213D747970656F66206D6F64756C653F6D6F64756C652E6578706F7274733D6528293A2266756E6374696F6E223D3D74';
wwv_flow_imp.g_varchar2_table(2) := '7970656F6620646566696E652626646566696E652E616D643F646566696E652865293A742E45533650726F6D6973653D6528297D2928746869732C66756E6374696F6E28297B2275736520737472696374223B66756E6374696F6E20742874297B766172';
wwv_flow_imp.g_varchar2_table(3) := '20653D747970656F6620743B72657475726E206E756C6C213D3D74262628226F626A656374223D3D3D657C7C2266756E6374696F6E223D3D3D65297D66756E6374696F6E20652874297B72657475726E2266756E6374696F6E223D3D747970656F662074';
wwv_flow_imp.g_varchar2_table(4) := '7D66756E6374696F6E206E2874297B423D747D66756E6374696F6E20722874297B473D747D66756E6374696F6E206F28297B72657475726E2066756E6374696F6E28297B72657475726E2070726F636573732E6E6578745469636B2861297D7D66756E63';
wwv_flow_imp.g_varchar2_table(5) := '74696F6E206928297B72657475726E22756E646566696E656422213D747970656F66207A3F66756E6374696F6E28297B7A2861297D3A6328297D66756E6374696F6E207328297B76617220743D302C653D6E6577204A2861292C6E3D646F63756D656E74';
wwv_flow_imp.g_varchar2_table(6) := '2E637265617465546578744E6F6465282222293B72657475726E20652E6F627365727665286E2C7B636861726163746572446174613A21307D292C66756E6374696F6E28297B6E2E646174613D743D2B2B7425327D7D66756E6374696F6E207528297B76';
wwv_flow_imp.g_varchar2_table(7) := '617220743D6E6577204D6573736167654368616E6E656C3B72657475726E20742E706F7274312E6F6E6D6573736167653D612C66756E6374696F6E28297B72657475726E20742E706F7274322E706F73744D6573736167652830297D7D66756E6374696F';
wwv_flow_imp.g_varchar2_table(8) := '6E206328297B76617220743D73657454696D656F75743B72657475726E2066756E6374696F6E28297B72657475726E207428612C31297D7D66756E6374696F6E206128297B666F722876617220743D303B743C573B742B3D32297B76617220653D565B74';
wwv_flow_imp.g_varchar2_table(9) := '5D2C6E3D565B742B315D3B65286E292C565B745D3D766F696420302C565B742B315D3D766F696420307D573D307D66756E6374696F6E206628297B7472797B76617220743D46756E6374696F6E282272657475726E2074686973222928292E7265717569';
wwv_flow_imp.g_varchar2_table(10) := '72652822766572747822293B72657475726E207A3D742E72756E4F6E4C6F6F707C7C742E72756E4F6E436F6E746578742C6928297D63617463682874297B72657475726E206328297D7D66756E6374696F6E206C28742C65297B766172206E3D74686973';
wwv_flow_imp.g_varchar2_table(11) := '2C723D6E657720746869732E636F6E7374727563746F722870293B766F696420303D3D3D725B5A5D26264F2872293B766172206F3D6E2E5F73746174653B6966286F297B76617220693D617267756D656E74735B6F2D315D3B472866756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(12) := '297B72657475726E2050286F2C722C692C6E2E5F726573756C74297D297D656C73652045286E2C722C742C65293B72657475726E20727D66756E6374696F6E20682874297B76617220653D746869733B696628742626226F626A656374223D3D74797065';
wwv_flow_imp.g_varchar2_table(13) := '6F6620742626742E636F6E7374727563746F723D3D3D652972657475726E20743B766172206E3D6E657720652870293B72657475726E2067286E2C74292C6E7D66756E6374696F6E207028297B7D66756E6374696F6E207628297B72657475726E206E65';
wwv_flow_imp.g_varchar2_table(14) := '7720547970654572726F722822596F752063616E6E6F74207265736F6C766520612070726F6D697365207769746820697473656C6622297D66756E6374696F6E206428297B72657475726E206E657720547970654572726F722822412070726F6D697365';
wwv_flow_imp.g_varchar2_table(15) := '732063616C6C6261636B2063616E6E6F742072657475726E20746861742073616D652070726F6D6973652E22297D66756E6374696F6E205F2874297B7472797B72657475726E20742E7468656E7D63617463682874297B72657475726E206E742E657272';
wwv_flow_imp.g_varchar2_table(16) := '6F723D742C6E747D7D66756E6374696F6E207928742C652C6E2C72297B7472797B742E63616C6C28652C6E2C72297D63617463682874297B72657475726E20747D7D66756E6374696F6E206D28742C652C6E297B472866756E6374696F6E2874297B7661';
wwv_flow_imp.g_varchar2_table(17) := '7220723D21312C6F3D79286E2C652C66756E6374696F6E286E297B727C7C28723D21302C65213D3D6E3F6728742C6E293A5328742C6E29297D2C66756E6374696F6E2865297B727C7C28723D21302C6A28742C6529297D2C22536574746C653A20222B28';
wwv_flow_imp.g_varchar2_table(18) := '742E5F6C6162656C7C7C2220756E6B6E6F776E2070726F6D6973652229293B217226266F262628723D21302C6A28742C6F29297D2C74297D66756E6374696F6E206228742C65297B652E5F73746174653D3D3D74743F5328742C652E5F726573756C7429';
wwv_flow_imp.g_varchar2_table(19) := '3A652E5F73746174653D3D3D65743F6A28742C652E5F726573756C74293A4528652C766F696420302C66756E6374696F6E2865297B72657475726E206728742C65297D2C66756E6374696F6E2865297B72657475726E206A28742C65297D297D66756E63';
wwv_flow_imp.g_varchar2_table(20) := '74696F6E207728742C6E2C72297B6E2E636F6E7374727563746F723D3D3D742E636F6E7374727563746F722626723D3D3D6C26266E2E636F6E7374727563746F722E7265736F6C76653D3D3D683F6228742C6E293A723D3D3D6E743F286A28742C6E742E';
wwv_flow_imp.g_varchar2_table(21) := '6572726F72292C6E742E6572726F723D6E756C6C293A766F696420303D3D3D723F5328742C6E293A652872293F6D28742C6E2C72293A5328742C6E297D66756E6374696F6E206728652C6E297B653D3D3D6E3F6A28652C762829293A74286E293F772865';
wwv_flow_imp.g_varchar2_table(22) := '2C6E2C5F286E29293A5328652C6E297D66756E6374696F6E20412874297B742E5F6F6E6572726F722626742E5F6F6E6572726F7228742E5F726573756C74292C542874297D66756E6374696F6E205328742C65297B742E5F73746174653D3D3D24262628';
wwv_flow_imp.g_varchar2_table(23) := '742E5F726573756C743D652C742E5F73746174653D74742C30213D3D742E5F73756273637269626572732E6C656E67746826264728542C7429297D66756E6374696F6E206A28742C65297B742E5F73746174653D3D3D24262628742E5F73746174653D65';
wwv_flow_imp.g_varchar2_table(24) := '742C742E5F726573756C743D652C4728412C7429297D66756E6374696F6E204528742C652C6E2C72297B766172206F3D742E5F73756273637269626572732C693D6F2E6C656E6774683B742E5F6F6E6572726F723D6E756C6C2C6F5B695D3D652C6F5B69';
wwv_flow_imp.g_varchar2_table(25) := '2B74745D3D6E2C6F5B692B65745D3D722C303D3D3D692626742E5F737461746526264728542C74297D66756E6374696F6E20542874297B76617220653D742E5F73756273637269626572732C6E3D742E5F73746174653B69662830213D3D652E6C656E67';
wwv_flow_imp.g_varchar2_table(26) := '7468297B666F722876617220723D766F696420302C6F3D766F696420302C693D742E5F726573756C742C733D303B733C652E6C656E6774683B732B3D3329723D655B735D2C6F3D655B732B6E5D2C723F50286E2C722C6F2C69293A6F2869293B742E5F73';
wwv_flow_imp.g_varchar2_table(27) := '756273637269626572732E6C656E6774683D307D7D66756E6374696F6E204D28742C65297B7472797B72657475726E20742865297D63617463682874297B72657475726E206E742E6572726F723D742C6E747D7D66756E6374696F6E205028742C6E2C72';
wwv_flow_imp.g_varchar2_table(28) := '2C6F297B76617220693D652872292C733D766F696420302C753D766F696420302C633D766F696420302C613D766F696420303B69662869297B696628733D4D28722C6F292C733D3D3D6E743F28613D21302C753D732E6572726F722C732E6572726F723D';
wwv_flow_imp.g_varchar2_table(29) := '6E756C6C293A633D21302C6E3D3D3D732972657475726E20766F6964206A286E2C642829297D656C736520733D6F2C633D21303B6E2E5F7374617465213D3D247C7C28692626633F67286E2C73293A613F6A286E2C75293A743D3D3D74743F53286E2C73';
wwv_flow_imp.g_varchar2_table(30) := '293A743D3D3D657426266A286E2C7329297D66756E6374696F6E207828742C65297B7472797B652866756E6374696F6E2865297B6728742C65297D2C66756E6374696F6E2865297B6A28742C65297D297D63617463682865297B6A28742C65297D7D6675';
wwv_flow_imp.g_varchar2_table(31) := '6E6374696F6E204328297B72657475726E2072742B2B7D66756E6374696F6E204F2874297B745B5A5D3D72742B2B2C742E5F73746174653D766F696420302C742E5F726573756C743D766F696420302C742E5F73756273637269626572733D5B5D7D6675';
wwv_flow_imp.g_varchar2_table(32) := '6E6374696F6E206B28297B72657475726E206E6577204572726F7228224172726179204D6574686F6473206D7573742062652070726F766964656420616E20417272617922297D66756E6374696F6E20462874297B72657475726E206E6577206F742874';
wwv_flow_imp.g_varchar2_table(33) := '6869732C74292E70726F6D6973657D66756E6374696F6E20592874297B76617220653D746869733B72657475726E206E6577206528552874293F66756E6374696F6E286E2C72297B666F7228766172206F3D742E6C656E6774682C693D303B693C6F3B69';
wwv_flow_imp.g_varchar2_table(34) := '2B2B29652E7265736F6C766528745B695D292E7468656E286E2C72297D3A66756E6374696F6E28742C65297B72657475726E2065286E657720547970654572726F722822596F75206D757374207061737320616E20617272617920746F20726163652E22';
wwv_flow_imp.g_varchar2_table(35) := '29297D297D66756E6374696F6E20712874297B76617220653D746869732C6E3D6E657720652870293B72657475726E206A286E2C74292C6E7D66756E6374696F6E204428297B7468726F77206E657720547970654572726F722822596F75206D75737420';
wwv_flow_imp.g_varchar2_table(36) := '706173732061207265736F6C7665722066756E6374696F6E2061732074686520666972737420617267756D656E7420746F207468652070726F6D69736520636F6E7374727563746F7222297D66756E6374696F6E204B28297B7468726F77206E65772054';
wwv_flow_imp.g_varchar2_table(37) := '7970654572726F7228224661696C656420746F20636F6E737472756374202750726F6D697365273A20506C65617365207573652074686520276E657727206F70657261746F722C2074686973206F626A65637420636F6E7374727563746F722063616E6E';
wwv_flow_imp.g_varchar2_table(38) := '6F742062652063616C6C656420617320612066756E6374696F6E2E22297D66756E6374696F6E204C28297B76617220743D766F696420303B69662822756E646566696E656422213D747970656F6620676C6F62616C29743D676C6F62616C3B656C736520';
wwv_flow_imp.g_varchar2_table(39) := '69662822756E646566696E656422213D747970656F662073656C6629743D73656C663B656C7365207472797B743D46756E6374696F6E282272657475726E2074686973222928297D63617463682874297B7468726F77206E6577204572726F722822706F';
wwv_flow_imp.g_varchar2_table(40) := '6C7966696C6C206661696C6564206265636175736520676C6F62616C206F626A65637420697320756E617661696C61626C6520696E207468697320656E7669726F6E6D656E7422297D76617220653D742E50726F6D6973653B69662865297B766172206E';
wwv_flow_imp.g_varchar2_table(41) := '3D6E756C6C3B7472797B6E3D4F626A6563742E70726F746F747970652E746F537472696E672E63616C6C28652E7265736F6C76652829297D63617463682874297B7D696628225B6F626A6563742050726F6D6973655D223D3D3D6E262621652E63617374';
wwv_flow_imp.g_varchar2_table(42) := '2972657475726E7D742E50726F6D6973653D69747D766172204E3D766F696420303B4E3D41727261792E697341727261793F41727261792E697341727261793A66756E6374696F6E2874297B72657475726E225B6F626A6563742041727261795D223D3D';
wwv_flow_imp.g_varchar2_table(43) := '3D4F626A6563742E70726F746F747970652E746F537472696E672E63616C6C2874297D3B76617220553D4E2C573D302C7A3D766F696420302C423D766F696420302C473D66756E6374696F6E28742C65297B565B575D3D742C565B572B315D3D652C572B';
wwv_flow_imp.g_varchar2_table(44) := '3D322C323D3D3D57262628423F422861293A582829297D2C483D22756E646566696E656422213D747970656F662077696E646F773F77696E646F773A766F696420302C493D487C7C7B7D2C4A3D492E4D75746174696F6E4F627365727665727C7C492E57';
wwv_flow_imp.g_varchar2_table(45) := '65624B69744D75746174696F6E4F627365727665722C513D22756E646566696E6564223D3D747970656F662073656C66262622756E646566696E656422213D747970656F662070726F636573732626225B6F626A6563742070726F636573735D223D3D3D';
wwv_flow_imp.g_varchar2_table(46) := '7B7D2E746F537472696E672E63616C6C2870726F63657373292C523D22756E646566696E656422213D747970656F662055696E7438436C616D7065644172726179262622756E646566696E656422213D747970656F6620696D706F727453637269707473';
wwv_flow_imp.g_varchar2_table(47) := '262622756E646566696E656422213D747970656F66204D6573736167654368616E6E656C2C563D6E657720417272617928316533292C583D766F696420303B583D513F6F28293A4A3F7328293A523F7528293A766F696420303D3D3D4826262266756E63';
wwv_flow_imp.g_varchar2_table(48) := '74696F6E223D3D747970656F6620726571756972653F6628293A6328293B766172205A3D4D6174682E72616E646F6D28292E746F537472696E67283336292E737562737472696E672832292C243D766F696420302C74743D312C65743D322C6E743D7B65';
wwv_flow_imp.g_varchar2_table(49) := '72726F723A6E756C6C7D2C72743D302C6F743D66756E6374696F6E28297B66756E6374696F6E207428742C65297B746869732E5F696E7374616E6365436F6E7374727563746F723D742C746869732E70726F6D6973653D6E657720742870292C74686973';
wwv_flow_imp.g_varchar2_table(50) := '2E70726F6D6973655B5A5D7C7C4F28746869732E70726F6D697365292C552865293F28746869732E6C656E6774683D652E6C656E6774682C746869732E5F72656D61696E696E673D652E6C656E6774682C746869732E5F726573756C743D6E6577204172';
wwv_flow_imp.g_varchar2_table(51) := '72617928746869732E6C656E677468292C303D3D3D746869732E6C656E6774683F5328746869732E70726F6D6973652C746869732E5F726573756C74293A28746869732E6C656E6774683D746869732E6C656E6774687C7C302C746869732E5F656E756D';
wwv_flow_imp.g_varchar2_table(52) := '65726174652865292C303D3D3D746869732E5F72656D61696E696E6726265328746869732E70726F6D6973652C746869732E5F726573756C742929293A6A28746869732E70726F6D6973652C6B2829297D72657475726E20742E70726F746F747970652E';
wwv_flow_imp.g_varchar2_table(53) := '5F656E756D65726174653D66756E6374696F6E2874297B666F722876617220653D303B746869732E5F73746174653D3D3D242626653C742E6C656E6774683B652B2B29746869732E5F65616368456E74727928745B655D2C65297D2C742E70726F746F74';
wwv_flow_imp.g_varchar2_table(54) := '7970652E5F65616368456E7472793D66756E6374696F6E28742C65297B766172206E3D746869732E5F696E7374616E6365436F6E7374727563746F722C723D6E2E7265736F6C76653B696628723D3D3D68297B766172206F3D5F2874293B6966286F3D3D';
wwv_flow_imp.g_varchar2_table(55) := '3D6C2626742E5F7374617465213D3D2429746869732E5F736574746C6564417428742E5F73746174652C652C742E5F726573756C74293B656C7365206966282266756E6374696F6E22213D747970656F66206F29746869732E5F72656D61696E696E672D';
wwv_flow_imp.g_varchar2_table(56) := '2D2C746869732E5F726573756C745B655D3D743B656C7365206966286E3D3D3D6974297B76617220693D6E6577206E2870293B7728692C742C6F292C746869732E5F77696C6C536574746C65417428692C65297D656C736520746869732E5F77696C6C53';
wwv_flow_imp.g_varchar2_table(57) := '6574746C654174286E6577206E2866756E6374696F6E2865297B72657475726E20652874297D292C65297D656C736520746869732E5F77696C6C536574746C65417428722874292C65297D2C742E70726F746F747970652E5F736574746C656441743D66';
wwv_flow_imp.g_varchar2_table(58) := '756E6374696F6E28742C652C6E297B76617220723D746869732E70726F6D6973653B722E5F73746174653D3D3D24262628746869732E5F72656D61696E696E672D2D2C743D3D3D65743F6A28722C6E293A746869732E5F726573756C745B655D3D6E292C';
wwv_flow_imp.g_varchar2_table(59) := '303D3D3D746869732E5F72656D61696E696E6726265328722C746869732E5F726573756C74297D2C742E70726F746F747970652E5F77696C6C536574746C6541743D66756E6374696F6E28742C65297B766172206E3D746869733B4528742C766F696420';
wwv_flow_imp.g_varchar2_table(60) := '302C66756E6374696F6E2874297B72657475726E206E2E5F736574746C656441742874742C652C74297D2C66756E6374696F6E2874297B72657475726E206E2E5F736574746C656441742865742C652C74297D297D2C747D28292C69743D66756E637469';
wwv_flow_imp.g_varchar2_table(61) := '6F6E28297B66756E6374696F6E20742865297B746869735B5A5D3D4328292C746869732E5F726573756C743D746869732E5F73746174653D766F696420302C746869732E5F73756273637269626572733D5B5D2C70213D3D652626282266756E6374696F';
wwv_flow_imp.g_varchar2_table(62) := '6E22213D747970656F66206526264428292C7468697320696E7374616E63656F6620743F7828746869732C65293A4B2829297D72657475726E20742E70726F746F747970652E63617463683D66756E6374696F6E2874297B72657475726E20746869732E';
wwv_flow_imp.g_varchar2_table(63) := '7468656E286E756C6C2C74297D2C742E70726F746F747970652E66696E616C6C793D66756E6374696F6E2874297B76617220653D746869732C6E3D652E636F6E7374727563746F723B72657475726E20652E7468656E2866756E6374696F6E2865297B72';
wwv_flow_imp.g_varchar2_table(64) := '657475726E206E2E7265736F6C766528742829292E7468656E2866756E6374696F6E28297B72657475726E20657D297D2C66756E6374696F6E2865297B72657475726E206E2E7265736F6C766528742829292E7468656E2866756E6374696F6E28297B74';
wwv_flow_imp.g_varchar2_table(65) := '68726F7720657D297D297D2C747D28293B72657475726E2069742E70726F746F747970652E7468656E3D6C2C69742E616C6C3D462C69742E726163653D592C69742E7265736F6C76653D682C69742E72656A6563743D712C69742E5F7365745363686564';
wwv_flow_imp.g_varchar2_table(66) := '756C65723D6E2C69742E5F736574417361703D722C69742E5F617361703D472C69742E706F6C7966696C6C3D4C2C69742E50726F6D6973653D69742C69747D293B';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(117829952605418498)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_file_name=>'js/es6-promise.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A210A202A2068746D6C3263616E76617320312E312E33203C68747470733A2F2F68746D6C3263616E7661732E686572747A656E2E636F6D3E0A202A20436F70797269676874202863292032303231204E696B6C617320766F6E20486572747A656E20';
wwv_flow_imp.g_varchar2_table(2) := '3C68747470733A2F2F686572747A656E2E636F6D3E0A202A2052656C656173656420756E646572204D4954204C6963656E73650A202A2F0A2166756E6374696F6E28412C65297B226F626A656374223D3D747970656F66206578706F727473262622756E';
wwv_flow_imp.g_varchar2_table(3) := '646566696E656422213D747970656F66206D6F64756C653F6D6F64756C652E6578706F7274733D6528293A2266756E6374696F6E223D3D747970656F6620646566696E652626646566696E652E616D643F646566696E652865293A28413D22756E646566';
wwv_flow_imp.g_varchar2_table(4) := '696E656422213D747970656F6620676C6F62616C546869733F676C6F62616C546869733A417C7C73656C66292E68746D6C3263616E7661733D6528297D28746869732C66756E6374696F6E28297B2275736520737472696374223B0A2F2A21202A2A2A2A';
wwv_flow_imp.g_varchar2_table(5) := '2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A0A20202020436F7079726967687420286329204D6963726F736F66';
wwv_flow_imp.g_varchar2_table(6) := '7420436F72706F726174696F6E2E0A0A202020205065726D697373696F6E20746F207573652C20636F70792C206D6F646966792C20616E642F6F722064697374726962757465207468697320736F66747761726520666F7220616E790A20202020707572';
wwv_flow_imp.g_varchar2_table(7) := '706F73652077697468206F7220776974686F75742066656520697320686572656279206772616E7465642E0A0A2020202054484520534F4654574152452049532050524F5649444544202241532049532220414E442054484520415554484F5220444953';
wwv_flow_imp.g_varchar2_table(8) := '434C41494D5320414C4C2057415252414E5449455320574954480A2020202052454741524420544F205448495320534F46545741524520494E434C5544494E4720414C4C20494D504C4945442057415252414E54494553204F46204D45524348414E5441';
wwv_flow_imp.g_varchar2_table(9) := '42494C4954590A20202020414E44204649544E4553532E20494E204E4F204556454E54205348414C4C2054484520415554484F52204245204C4941424C4520464F5220414E59205350454349414C2C204449524543542C0A20202020494E444952454354';
wwv_flow_imp.g_varchar2_table(10) := '2C204F5220434F4E53455155454E5449414C2044414D41474553204F5220414E592044414D414745532057484154534F4556455220524553554C54494E472046524F4D0A202020204C4F5353204F46205553452C2044415441204F522050524F46495453';
wwv_flow_imp.g_varchar2_table(11) := '2C205748455448455220494E20414E20414354494F4E204F4620434F4E54524143542C204E45474C4947454E4345204F520A202020204F5448455220544F5254494F555320414354494F4E2C2041524953494E47204F5554204F46204F5220494E20434F';
wwv_flow_imp.g_varchar2_table(12) := '4E4E454354494F4E20574954482054484520555345204F520A20202020504552464F524D414E4345204F46205448495320534F4654574152452E0A202020202A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A';
wwv_flow_imp.g_varchar2_table(13) := '2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A202A2F76617220723D66756E6374696F6E28412C65297B72657475726E28723D4F626A6563742E73657450726F746F747970654F667C7C7B5F5F7072';
wwv_flow_imp.g_varchar2_table(14) := '6F746F5F5F3A5B5D7D696E7374616E63656F66204172726179262666756E6374696F6E28412C65297B412E5F5F70726F746F5F5F3D657D7C7C66756E6374696F6E28412C65297B666F7228766172207420696E2065294F626A6563742E70726F746F7479';
wwv_flow_imp.g_varchar2_table(15) := '70652E6861734F776E50726F70657274792E63616C6C28652C7429262628415B745D3D655B745D297D2928412C65297D3B66756E6374696F6E204128412C65297B6966282266756E6374696F6E22213D747970656F66206526266E756C6C213D3D652974';
wwv_flow_imp.g_varchar2_table(16) := '68726F77206E657720547970654572726F722822436C61737320657874656E64732076616C756520222B537472696E672865292B22206973206E6F74206120636F6E7374727563746F72206F72206E756C6C22293B66756E6374696F6E207428297B7468';
wwv_flow_imp.g_varchar2_table(17) := '69732E636F6E7374727563746F723D417D7228412C65292C412E70726F746F747970653D6E756C6C3D3D3D653F4F626A6563742E6372656174652865293A28742E70726F746F747970653D652E70726F746F747970652C6E65772074297D76617220433D';
wwv_flow_imp.g_varchar2_table(18) := '66756E6374696F6E28297B72657475726E28433D4F626A6563742E61737369676E7C7C66756E6374696F6E2841297B666F722876617220652C743D312C723D617267756D656E74732E6C656E6774683B743C723B742B2B29666F7228766172204220696E';
wwv_flow_imp.g_varchar2_table(19) := '20653D617267756D656E74735B745D294F626A6563742E70726F746F747970652E6861734F776E50726F70657274792E63616C6C28652C4229262628415B425D3D655B425D293B72657475726E20417D292E6170706C7928746869732C617267756D656E';
wwv_flow_imp.g_varchar2_table(20) := '7473297D3B66756E6374696F6E206128412C732C6F2C69297B72657475726E206E6577286F3D6F7C7C50726F6D697365292866756E6374696F6E28742C65297B66756E6374696F6E20722841297B7472797B6E28692E6E657874284129297D6361746368';
wwv_flow_imp.g_varchar2_table(21) := '2841297B652841297D7D66756E6374696F6E20422841297B7472797B6E28692E7468726F77284129297D63617463682841297B652841297D7D66756E6374696F6E206E2841297B76617220653B412E646F6E653F7428412E76616C7565293A2828653D41';
wwv_flow_imp.g_varchar2_table(22) := '2E76616C756529696E7374616E63656F66206F3F653A6E6577206F2866756E6374696F6E2841297B412865297D29292E7468656E28722C42297D6E2828693D692E6170706C7928412C737C7C5B5D29292E6E6578742829297D297D66756E6374696F6E20';
wwv_flow_imp.g_varchar2_table(23) := '4828742C72297B76617220422C6E2C732C6F3D7B6C6162656C3A302C73656E743A66756E6374696F6E28297B6966283126735B305D297468726F7720735B315D3B72657475726E20735B315D7D2C747279733A5B5D2C6F70733A5B5D7D2C413D7B6E6578';
wwv_flow_imp.g_varchar2_table(24) := '743A652830292C7468726F773A652831292C72657475726E3A652832297D3B72657475726E2266756E6374696F6E223D3D747970656F662053796D626F6C262628415B53796D626F6C2E6974657261746F725D3D66756E6374696F6E28297B7265747572';
wwv_flow_imp.g_varchar2_table(25) := '6E20746869737D292C413B66756E6374696F6E20652865297B72657475726E2066756E6374696F6E2841297B72657475726E2066756E6374696F6E2865297B69662842297468726F77206E657720547970654572726F72282247656E657261746F722069';
wwv_flow_imp.g_varchar2_table(26) := '7320616C726561647920657865637574696E672E22293B666F72283B6F3B297472797B696628423D312C6E262628733D3226655B305D3F6E2E72657475726E3A655B305D3F6E2E7468726F777C7C2828733D6E2E72657475726E292626732E63616C6C28';
wwv_flow_imp.g_varchar2_table(27) := '6E292C30293A6E2E6E6578742926262128733D732E63616C6C286E2C655B315D29292E646F6E652972657475726E20733B737769746368286E3D302C28653D733F5B3226655B305D2C732E76616C75655D3A65295B305D297B6361736520303A63617365';
wwv_flow_imp.g_varchar2_table(28) := '20313A733D653B627265616B3B6361736520343A72657475726E206F2E6C6162656C2B2B2C7B76616C75653A655B315D2C646F6E653A21317D3B6361736520353A6F2E6C6162656C2B2B2C6E3D655B315D2C653D5B305D3B636F6E74696E75653B636173';
wwv_flow_imp.g_varchar2_table(29) := '6520373A653D6F2E6F70732E706F7028292C6F2E747279732E706F7028293B636F6E74696E75653B64656661756C743A6966282128733D303C28733D6F2E74727973292E6C656E6774682626735B732E6C656E6774682D315D29262628363D3D3D655B30';
wwv_flow_imp.g_varchar2_table(30) := '5D7C7C323D3D3D655B305D29297B6F3D303B636F6E74696E75657D696628333D3D3D655B305D26262821737C7C655B315D3E735B305D2626655B315D3C735B335D29297B6F2E6C6162656C3D655B315D3B627265616B7D696628363D3D3D655B305D2626';
wwv_flow_imp.g_varchar2_table(31) := '6F2E6C6162656C3C735B315D297B6F2E6C6162656C3D735B315D2C733D653B627265616B7D6966287326266F2E6C6162656C3C735B325D297B6F2E6C6162656C3D735B325D2C6F2E6F70732E707573682865293B627265616B7D735B325D26266F2E6F70';
wwv_flow_imp.g_varchar2_table(32) := '732E706F7028292C6F2E747279732E706F7028293B636F6E74696E75657D653D722E63616C6C28742C6F297D63617463682841297B653D5B362C415D2C6E3D307D66696E616C6C797B423D733D307D6966283526655B305D297468726F7720655B315D3B';
wwv_flow_imp.g_varchar2_table(33) := '72657475726E7B76616C75653A655B305D3F655B315D3A766F696420302C646F6E653A21307D7D285B652C415D297D7D7D66756E6374696F6E207428412C652C74297B696628747C7C323D3D3D617267756D656E74732E6C656E67746829666F72287661';
wwv_flow_imp.g_varchar2_table(34) := '7220722C423D302C6E3D652E6C656E6774683B423C6E3B422B2B29217226264220696E20657C7C2828723D727C7C41727261792E70726F746F747970652E736C6963652E63616C6C28652C302C4229295B425D3D655B425D293B72657475726E20412E63';
wwv_flow_imp.g_varchar2_table(35) := '6F6E63617428727C7C65297D76617220683D28422E70726F746F747970652E6164643D66756E6374696F6E28412C652C742C72297B72657475726E206E6577204228746869732E6C6566742B412C746869732E746F702B652C746869732E77696474682B';
wwv_flow_imp.g_varchar2_table(36) := '742C746869732E6865696768742B72297D2C422E66726F6D436C69656E74526563743D66756E6374696F6E2841297B72657475726E206E6577204228412E6C6566742C412E746F702C412E77696474682C412E686569676874297D2C42293B66756E6374';
wwv_flow_imp.g_varchar2_table(37) := '696F6E204228412C652C742C72297B746869732E6C6566743D412C746869732E746F703D652C746869732E77696474683D742C746869732E6865696768743D727D666F722876617220673D66756E6374696F6E2841297B72657475726E20682E66726F6D';
wwv_flow_imp.g_varchar2_table(38) := '436C69656E745265637428412E676574426F756E64696E67436C69656E74526563742829297D2C633D66756E6374696F6E2841297B666F722876617220653D5B5D2C743D302C723D412E6C656E6774683B743C723B297B76617220422C6E3D412E636861';
wwv_flow_imp.g_varchar2_table(39) := '72436F6465417428742B2B293B35353239363C3D6E26266E3C3D35363331392626743C723F35363332303D3D2836343531322628423D412E63686172436F6465417428742B2B2929293F652E7075736828282831303233266E293C3C3130292B28313032';
wwv_flow_imp.g_varchar2_table(40) := '332642292B3635353336293A28652E70757368286E292C742D2D293A652E70757368286E297D72657475726E20657D2C513D66756E6374696F6E28297B666F722876617220413D5B5D2C653D303B653C617267756D656E74732E6C656E6774683B652B2B';
wwv_flow_imp.g_varchar2_table(41) := '29415B655D3D617267756D656E74735B655D3B696628537472696E672E66726F6D436F6465506F696E742972657475726E20537472696E672E66726F6D436F6465506F696E742E6170706C7928537472696E672C41293B76617220743D412E6C656E6774';
wwv_flow_imp.g_varchar2_table(42) := '683B69662821742972657475726E22223B666F722876617220723D5B5D2C423D2D312C6E3D22223B2B2B423C743B297B76617220733D415B425D3B733C3D36353533353F722E707573682873293A28732D3D36353533362C722E70757368283535323936';
wwv_flow_imp.g_varchar2_table(43) := '2B28733E3E3130292C7325313032342B353633323029292C28422B313D3D3D747C7C31363338343C722E6C656E677468292626286E2B3D537472696E672E66726F6D43686172436F64652E6170706C7928537472696E672C72292C722E6C656E6774683D';
wwv_flow_imp.g_varchar2_table(44) := '30297D72657475726E206E7D2C653D224142434445464748494A4B4C4D4E4F505152535455565758595A6162636465666768696A6B6C6D6E6F707172737475767778797A303132333435363738392B2F222C753D22756E646566696E6564223D3D747970';
wwv_flow_imp.g_varchar2_table(45) := '656F662055696E743841727261793F5B5D3A6E65772055696E7438417272617928323536292C6E3D303B6E3C652E6C656E6774683B6E2B2B29755B652E63686172436F64654174286E295D3D6E3B66756E6374696F6E207328412C652C74297B72657475';
wwv_flow_imp.g_varchar2_table(46) := '726E20412E736C6963653F412E736C69636528652C74293A6E65772055696E74313641727261792841727261792E70726F746F747970652E736C6963652E63616C6C28412C652C7429297D766172206F3D28692E70726F746F747970652E6765743D6675';
wwv_flow_imp.g_varchar2_table(47) := '6E6374696F6E2841297B76617220653B696628303C3D41297B696628413C35353239367C7C35363331393C412626413C3D36353533352972657475726E20653D746869732E696E6465785B413E3E355D2C746869732E646174615B653D28653C3C32292B';
wwv_flow_imp.g_varchar2_table(48) := '2833312641295D3B696628413C3D36353533352972657475726E20653D746869732E696E6465785B323034382B28412D35353239363E3E35295D2C746869732E646174615B653D28653C3C32292B2833312641295D3B696628413C746869732E68696768';
wwv_flow_imp.g_varchar2_table(49) := '53746172742972657475726E20653D746869732E696E6465785B653D323038302B28413E3E3131295D2C653D746869732E696E6465785B652B3D413E3E352636335D2C746869732E646174615B653D28653C3C32292B2833312641295D3B696628413C3D';
wwv_flow_imp.g_varchar2_table(50) := '313131343131312972657475726E20746869732E646174615B746869732E6869676856616C7565496E6465785D7D72657475726E20746869732E6572726F7256616C75657D2C69293B66756E6374696F6E206928412C652C742C722C422C6E297B746869';
wwv_flow_imp.g_varchar2_table(51) := '732E696E697469616C56616C75653D412C746869732E6572726F7256616C75653D652C746869732E6869676853746172743D742C746869732E6869676856616C7565496E6465783D722C746869732E696E6465783D422C746869732E646174613D6E7D66';
wwv_flow_imp.g_varchar2_table(52) := '756E6374696F6E207728412C652C742C72297B76617220423D725B745D3B69662841727261792E697341727261792841293F2D31213D3D412E696E6465784F662842293A413D3D3D4229666F7228766172206E3D743B6E3C3D722E6C656E6774683B297B';
wwv_flow_imp.g_varchar2_table(53) := '696628286F3D725B2B2B6E5D293D3D3D652972657475726E20313B6966286F213D3D4E29627265616B7D696628423D3D3D4E29666F72286E3D743B303C6E3B297B76617220733D725B2D2D6E5D3B69662841727261792E697341727261792841293F2D31';
wwv_flow_imp.g_varchar2_table(54) := '213D3D412E696E6465784F662873293A413D3D3D7329666F7228766172206F2C693D743B693C3D722E6C656E6774683B297B696628286F3D725B2B2B695D293D3D3D652972657475726E20313B6966286F213D3D4E29627265616B7D69662873213D3D4E';
wwv_flow_imp.g_varchar2_table(55) := '29627265616B7D7D66756E6374696F6E205528412C65297B666F722876617220743D413B303C3D743B297B76617220723D655B745D3B69662872213D3D4E2972657475726E20723B742D2D7D72657475726E20307D66756E6374696F6E206C28742C4129';
wwv_flow_imp.g_varchar2_table(56) := '7B76617220653D28423D66756E6374696F6E28412C72297B766F696420303D3D3D72262628723D2273747269637422293B76617220423D5B5D2C6E3D5B5D2C733D5B5D3B72657475726E20412E666F72456163682866756E6374696F6E28412C65297B76';
wwv_flow_imp.g_varchar2_table(57) := '617220743D712E6765742841293B69662835303C743F28732E70757368282130292C742D3D3530293A732E70757368282131292C2D31213D3D5B226E6F726D616C222C226175746F222C226C6F6F7365225D2E696E6465784F6628722926262D31213D3D';
wwv_flow_imp.g_varchar2_table(58) := '5B383230382C383231312C31323331362C31323434385D2E696E6465784F662841292972657475726E206E2E707573682865292C422E70757368283136293B69662834213D3D7426263131213D3D742972657475726E206E2E707573682865292C33313D';
wwv_flow_imp.g_varchar2_table(59) := '3D3D743F422E707573682822737472696374223D3D3D723F4F3A58293A743D3D3D577C7C32393D3D3D743F422E70757368285F293A34333D3D3D743F3133313037323C3D412626413C3D3139363630357C7C3139363630383C3D412626413C3D32363231';
wwv_flow_imp.g_varchar2_table(60) := '34313F422E707573682858293A422E70757368285F293A766F696420422E707573682874293B696628303D3D3D652972657475726E206E2E707573682865292C422E70757368285F293B743D425B652D315D3B72657475726E2D313D3D3D65412E696E64';
wwv_flow_imp.g_varchar2_table(61) := '65784F662874293F286E2E70757368286E5B652D315D292C422E70757368287429293A286E2E707573682865292C422E70757368285F29297D292C5B6E2C422C735D7D28742C28413D417C7C7B6C696E65427265616B3A226E6F726D616C222C776F7264';
wwv_flow_imp.g_varchar2_table(62) := '427265616B3A226E6F726D616C227D292E6C696E65427265616B29295B305D2C723D425B315D2C423D425B325D3B72657475726E5B652C723D22627265616B2D616C6C223D3D3D412E776F7264427265616B7C7C22627265616B2D776F7264223D3D3D41';
wwv_flow_imp.g_varchar2_table(63) := '2E776F7264427265616B3F722E6D61702866756E6374696F6E2841297B72657475726E2D31213D3D5B532C5F2C575D2E696E6465784F662841293F583A417D293A722C226B6565702D616C6C223D3D3D412E776F7264427265616B3F422E6D6170286675';
wwv_flow_imp.g_varchar2_table(64) := '6E6374696F6E28412C65297B72657475726E2041262631393936383C3D745B655D2626745B655D3C3D34303935397D293A766F696420305D7D76617220452C462C642C662C702C4E3D31302C4B3D31332C493D31352C543D31372C6D3D31382C523D3139';
wwv_flow_imp.g_varchar2_table(65) := '2C4C3D32302C4F3D32312C443D32322C623D32342C533D32352C4D3D32362C763D32372C793D32382C5F3D33302C783D33322C503D33332C563D33342C7A3D33352C583D33372C473D33382C4A3D33392C6B3D34302C573D34322C593D22C397222C713D';
wwv_flow_imp.g_varchar2_table(66) := '28643D66756E6374696F6E2841297B76617220652C742C722C422C6E3D2E37352A412E6C656E6774682C733D412E6C656E6774682C6F3D303B223D223D3D3D415B412E6C656E6774682D315D2626286E2D2D2C223D223D3D3D415B412E6C656E6774682D';
wwv_flow_imp.g_varchar2_table(67) := '325D26266E2D2D293B666F7228766172206E3D6E65772822756E646566696E656422213D747970656F66204172726179427566666572262622756E646566696E656422213D747970656F662055696E743841727261792626766F69642030213D3D55696E';
wwv_flow_imp.g_varchar2_table(68) := '743841727261792E70726F746F747970652E736C6963653F41727261794275666665723A417272617929286E292C693D41727261792E69734172726179286E293F6E3A6E65772055696E74384172726179286E292C613D303B613C733B612B3D3429653D';
wwv_flow_imp.g_varchar2_table(69) := '755B412E63686172436F646541742861295D2C743D755B412E63686172436F6465417428612B31295D2C723D755B412E63686172436F6465417428612B32295D2C423D755B412E63686172436F6465417428612B33295D2C695B6F2B2B5D3D653C3C327C';
wwv_flow_imp.g_varchar2_table(70) := '743E3E342C695B6F2B2B5D3D2831352674293C3C347C723E3E322C695B6F2B2B5D3D28332672293C3C367C363326423B72657475726E206E7D28453D224B77414141414141414141414341344149446F4141504166414141434141414141414149414241';
wwv_flow_imp.g_varchar2_table(71) := '41474142414145674155414259414634415A674265414759415941426F414841416541426541475941664143454149414169414351414A67416F41436F414B304174514339414D55415867426D414634415A674265414759417A514456414634415A6744';
wwv_flow_imp.g_varchar2_table(72) := '52414E6B413367446D414F774139414438414151424441455541526F4249674741414967414A77457641546342507746464155304254414655415677425A41467341584D42657747444154414169774754415A73426F67476B4161774274414738416349';
wwv_flow_imp.g_varchar2_table(73) := '427967485341646F423441486F416641422B41482B4151594344674957417634424867496D416934434E67492B416B554354514A54416C734359774A72416E454365514B42416B304369514B5241706B436F514B6F4172414375414C41417351437A4149';
wwv_flow_imp.g_varchar2_table(74) := '77414E514333414C6B416A414137414C304176774341514D4A4178414447414D77414341444A674D75417A594450674F414145594453674E534131494455674E6141316F4459414E69413249446741434141476F44674142794133594466674F41414951';
wwv_flow_imp.g_varchar2_table(75) := '446741434B413549446D674F41414941416F674F71413441416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414B384474774F414149414176775048413838443177506641794144357750';
wwv_flow_imp.g_varchar2_table(76) := '73412F51442F414F41414941414241514D4242494567414157424234454A67517542444D4549414D37424545455867424A424341445551525A4247454561515177414441416351512B41586B456751534A424A454567414359424941416F41536F424B38';
wwv_flow_imp.g_varchar2_table(77) := '4574775177414C38457851534141494141674143414149414167414367414D30455867426541463441586742654146344158674265414E55455867445A424F454558674470425045452B51514242516B464551555A425345464B51557842545546505156';
wwv_flow_imp.g_varchar2_table(78) := '4642557746564156634256344159775665414773466377563742594D4669775753425634416D67576742616346586742654146344158674265414B734658674379426245467567573742634946776758494263494677675851426451463341586B426573';
wwv_flow_imp.g_varchar2_table(79) := '463877583742514D47437759544268734749775972426A4D474F775A654144384752775A4E426C344156415A62426C34415867426541463441586742654146344158674265414634415867426541474D4758674271426E45475867426541463441586742';
wwv_flow_imp.g_varchar2_table(80) := '6541463441586742654146344158674235426F414734775347426F34476B77614141494144486752354146344158674265414A734767414247413441416F77617242724D4773776167414C73477777624C426A41413077626142746F473351626142746F';
wwv_flow_imp.g_varchar2_table(81) := '473267626142746F473267626C427573473877623742674D4843776354427873484377636A427973484D416331427A55484F67644342396F475367645342316F4859416661426C6F4861416661426C49483267626142746F473267626142746F47326762';
wwv_flow_imp.g_varchar2_table(82) := '61426A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(83) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(84) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(85) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(86) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(87) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A554862516465414634414E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(88) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(89) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(90) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(91) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(92) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(93) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(94) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(95) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(96) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(97) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(98) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(99) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(100) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(101) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(102) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(103) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(104) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(105) := '484E516431423330484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(106) := '3142344D483267614B423638456741434141494141674143414149414167414341414938486C776465414A3848707765414149414172776533423134415867432F4238554879676377414E4148324166674234414136416677427A34422B416341434677';
wwv_flow_imp.g_varchar2_table(107) := '4243416750434263496F674559415238494A776941414338494E77672F4343414452776850434663495877686E43456F44476753414149414167414276434863496541683543486F4965776838434830496477683443486B496567683743487749665168';
wwv_flow_imp.g_varchar2_table(108) := '3343486749655168364348734966416839434863496541683543486F4965776838434830496477683443486B4965676837434877496651683343486749655168364348734966416839434863496541683543486F4965776838434830496477683443486B';
wwv_flow_imp.g_varchar2_table(109) := '4965676837434877496651683343486749655168364348734966416839434863496541683543486F4965776838434830496477683443486B4965676837434877496651683343486749655168364348734966416839434863496541683543486F49657768';
wwv_flow_imp.g_varchar2_table(110) := '38434830496477683443486B4965676837434877496651683343486749655168364348734966416839434863496541683543486F4965776838434830496477683443486B4965676837434877496651683343486749655168364348734966416839434863';
wwv_flow_imp.g_varchar2_table(111) := '496541683543486F4965776838434830496477683443486B4965676837434877496651683343486749655168364348734966416839434863496541683543486F4965776838434830496477683443486B4965676837434877496651683343486749655168';
wwv_flow_imp.g_varchar2_table(112) := '364348734966416839434863496541683543486F4965776838434830496477683443486B4965676837434877496651683343486749655168364348734966416839434863496541683543486F4965776838434830496477683443486B4965676837434877';
wwv_flow_imp.g_varchar2_table(113) := '496651683343486749655168364348734966416839434863496541683543486F4965776838434830496477683443486B4965676837434877496651683343486749655168364348734966416839434863496541683543486F496577683843483049647768';
wwv_flow_imp.g_varchar2_table(114) := '3443486B4965676837434877496651683343486749655168364348734966416839434863496541683543486F4965776838434830496477683443486B4965676837434877496651683343486749655168364348734966416839434863496541683543486F';
wwv_flow_imp.g_varchar2_table(115) := '4965776838434830496477683443486B4965676837434877496651683343486749655168364348734966416839434863496541683543486F4965776838434830496477683443486B49656768374348774966516833434867496551683643487349664168';
wwv_flow_imp.g_varchar2_table(116) := '39434863496541683543486F4965776838434830496477683443486B4965676837434877496651683343486749655168364348734966416839434863496541683543486F4965776838434830496477683443486B4965676837434877496841694C434934';
wwv_flow_imp.g_varchar2_table(117) := '494D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414A59496C676957434A59496C6769';
wwv_flow_imp.g_varchar2_table(118) := '57434A59496C676957434A59496C676957434A59496C676957434A59496C676957434A59496C676957434A59496C676957434A59496C676957434A59496C676957434A59496C676777414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(119) := '414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(120) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(121) := '414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(122) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(123) := '414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(124) := '77414441414E516331427A55484E516331427A55484E516331427A55484E516331423534494E5163314236494932676171434C4949756769414149414176676A474349414167414341414941416741434141494141674143414149414179776948415941';
wwv_flow_imp.g_varchar2_table(125) := '4130776941414E6B4933516A6C434F304939416A3843494141674143414141494A43676B5343526F4A49676B6E435459484C776B33435A59496C676957434A59496C676957434A59496C676957434A59496C676957434A59496C676957434A59496C6769';
wwv_flow_imp.g_varchar2_table(126) := '57434A59496C676957434A59496C676957434A59496C676957434A59496C676957434A59496C6769414149414141414641415867426541474141634142654148774151414351414B414172514339414A3441586742654145304133674252414E34413741';
wwv_flow_imp.g_varchar2_table(127) := '4438414D774247674541414B63424E7745464155774258414634516B68436D454B6E4172634367414848417341427A344C41416341427741484141642B433641426F41472B432F344C41416341427741484141632B4446344D414163414235344D336777';
wwv_flow_imp.g_varchar2_table(128) := '654456344E6E673365446141426F414767416141426F414767416141426F414767416141426F414767416141426F414767416141426F414767416141426F4145654471414256673657447141426F513667416141426F4148584476634F4E772F33447663';
wwv_flow_imp.g_varchar2_table(129) := '4F397737334476634F397737334476634F397737334476634F397737334476634F397737334476634F397737334476634F397737334476634F397737334476634F397737334476634F39773733446E635041416341427741484141634142774148414163';
wwv_flow_imp.g_varchar2_table(130) := '41427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741';
wwv_flow_imp.g_varchar2_table(131) := '48414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163';
wwv_flow_imp.g_varchar2_table(132) := '41427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741';
wwv_flow_imp.g_varchar2_table(133) := '48414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163';
wwv_flow_imp.g_varchar2_table(134) := '41427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741';
wwv_flow_imp.g_varchar2_table(135) := '48414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163';
wwv_flow_imp.g_varchar2_table(136) := '41427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741';
wwv_flow_imp.g_varchar2_table(137) := '48414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163';
wwv_flow_imp.g_varchar2_table(138) := '4142774148414163414277414841416341427741484141634142774148414163414237635050776C474355344A4D41434141494141674142574356344A59516D4141476B4A63416C344358774A67416B77414441414D4141774149674A6741434C435A4D';
wwv_flow_imp.g_varchar2_table(139) := '4A6741435A435A384A6F776D724359414173776B7741463441586742384149414175776B41424D4D4A79516D41414D344A67414456435441414D4141774144414167414341414941416741434141494141674143414149414171775957424E6B494D4141';
wwv_flow_imp.g_varchar2_table(140) := '77414441414D4144644365414A36416E754352344539676B774150344A42516F4E436A41414D4143414142554B307769414142304B4A416F73436A514B674141774144774B517771414145734B76516D6443564D4B57776F774144414167414341414C63';
wwv_flow_imp.g_varchar2_table(141) := '454D41434141474D4B67414272436A41414D414177414441414D414177414441414D414177414441414D414165424441414D414177414441414D414177414441414D414177414441414D41417741496B455051467A436E6F4B69515343436F6F4B6B4171';
wwv_flow_imp.g_varchar2_table(142) := '4A424A674B6F41716B436F6B45474147734372514B76417242436A41414D41444A4374454B4651485A4375454B2F6748704376454B4D414177414441414D414341414977452B516F774149414150774542437A41414D414177414441414D41434141416B';
wwv_flow_imp.g_varchar2_table(143) := '4C45517377414941415077455A4379454C6741414F43436B4C4D414178437A6B4C4D414177414441414D41417741444141586742654145454C4D414177414441414D414177414441414D41417741456B4C54517456433441415841746B4334414169516B';
wwv_flow_imp.g_varchar2_table(144) := '77414441414D414177414441414D414177414441416241747843336B4C674175464334734C4D414177414A4D4C6C777566437A41414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(145) := '414D4141774149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414170777377414441414D41434141494141674143';
wwv_flow_imp.g_varchar2_table(146) := '7643344141674143414149414167414341414C634C4D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(147) := '4167414341414941416741434141494141674143414149414176777541414D634C674143414149414167414341414941417967754141494141674143414149414130517377414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(148) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D41417741444141674143414149414167414341414941416741434141494141674143414149414167414341414E6B4C67414341414941';
wwv_flow_imp.g_varchar2_table(149) := '4134417377414441414D414177414441414D414177414441414D414177414441414D41417741494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434A435234453641737741444141687748';
wwv_flow_imp.g_varchar2_table(150) := '77433441412B4173414441674D45417777414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4143414149414147417764444355';
wwv_flow_imp.g_varchar2_table(151) := '4D4D4141774143304D4E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(152) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E517731427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(153) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A554850517777414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(154) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414455484E516331427A55484E516331427A55484E516332427A41414D414135444455484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(155) := '484E516331427A55484E516446444441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(156) := '77414441414D414177414441414D4141774144414167414341414941415451785344466F4D4D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(157) := '414D41417741463441586742654146344158674265414634415967786541476F4D5867427844486B4D667778654149554D586742654149304D4D414177414441414D4141774146344158674356444A304D4D414177414441414D41426541463441705178';
wwv_flow_imp.g_varchar2_table(158) := '65414B734D737779374446344177677939444D6F4D58674265414634415867426541463441586742654146344158674452444E6B4D655142714365414D33417838414F594D37417A304450674D5867426541463441586742654146344158674265414634';
wwv_flow_imp.g_varchar2_table(159) := '4158674265414634415867426541463441586743674141414E6F4141484451344E46673077414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(160) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141654453594E4D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(161) := '414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(162) := '77414441414D414177414441414D414177414941416741434141494141674143414143344E4D414265414634414E673077414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(163) := '414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141774144344E5267314F4456594E5867316D4454414162513077414441414D414177414441414D414177414441413267626142746F47326762';
wwv_flow_imp.g_varchar2_table(164) := '6142746F4732676261426E554E656733434259414E7767574644646F476A41336142746F473267626142746F473267626142746F473267626142746F4732676155445A774E7041326F44646F47326761774462634E7677334844646F4732676250446459';
wwv_flow_imp.g_varchar2_table(165) := '4E334133664465594E3267627344664D4E3267626142766F4E2F6733614267594F44673761426C3441586742654142594F586742654143554732675965446C34414A4135654143774F3277336142746F474D51343544746F473267626142746F47515137';
wwv_flow_imp.g_varchar2_table(166) := '6142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F';
wwv_flow_imp.g_varchar2_table(167) := '473267626142746F473267626142746F473267626142746F4732675A4A446A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(168) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163314231454F32675931427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(169) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(170) := '31427A55484E516331427A55484E516331427A55484E516331427A55484E51645A446A55484E516331427A55484E5163314232454F4E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(171) := '484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E5163';
wwv_flow_imp.g_varchar2_table(172) := '31427A55484E516331427A55484E516331427A554861413431427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(173) := '484E5163314233414F3267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F47326762';
wwv_flow_imp.g_varchar2_table(174) := '6142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F4732675931427A55484E516331427A55484E516331427A55';
wwv_flow_imp.g_varchar2_table(175) := '484E516331427A55484E516331427A55484E5163314232454F3267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F47326762';
wwv_flow_imp.g_varchar2_table(176) := '6142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F4732675A4A44746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F';
wwv_flow_imp.g_varchar2_table(177) := '473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F473267626142746F47326762';
wwv_flow_imp.g_varchar2_table(178) := '6142746F473267626142746F4732676261426B6B4F65413667414B41416F414177414441414D414177414B41416F414367414B41416F414367414B414167413477414441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(179) := '414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D41442F2F775141424141';
wwv_flow_imp.g_varchar2_table(180) := '45414151414241414541415141424141454141304141774142414145414167414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414B41424D41467741654142734147674165414263';
wwv_flow_imp.g_varchar2_table(181) := '414667415341423441477741594141384147414163414573415377424C414573415377424C414573415377424C4145734147414159414234414867416541424D414867425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(182) := '51414641415541425141464141554142514146414155414251414641415541425141464141466741624142494148674165414234415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(183) := '41554142514146414155414251414641415541425141425941445141524142344142414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(184) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(185) := '4141414141414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(186) := '72414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414241414541415141424141454141554142414145414151';
wwv_flow_imp.g_varchar2_table(187) := '4142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541416B414667416141427341477741624142344148514164414234415477415841423441445141';
wwv_flow_imp.g_varchar2_table(188) := '654142344147674162414538415477414F4146414148514164414230415477425041426341547742504145384146674251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(189) := '41554142514146414148514165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423041486741';
wwv_flow_imp.g_varchar2_table(190) := '65414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(191) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486742514142344148674165414234415541425141464141554141';
wwv_flow_imp.g_varchar2_table(192) := '65414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(193) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(194) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(195) := '41554142514146414155414251414641415541425141464141554142514146414155414165414234414867416541464141547742414145384154774250414541415477425141464141547742514142344148674165414234414867416541423041485141';
wwv_flow_imp.g_varchar2_table(196) := '64414230414867416441423441446742514146414155414251414641414867416541423441486741654142344148674251414234415541416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(197) := '41424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(198) := '45414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414A41415141424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(199) := '4142414145414151414241414541416B414351414A41416B414351414A41416B4142414145414151414241414541415141424141454141514142414145414151414241416541423441486741654146414148674165414234414B77417241464141554142';
wwv_flow_imp.g_varchar2_table(200) := '514146414147414251414373414B774172414373414867416541464141486742514146414155414172414641414B774165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(201) := '414B7741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414241414541415141424141';
wwv_flow_imp.g_varchar2_table(202) := '45414151414241416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(203) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741724146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(204) := '51414641415541425141464141554142514146414155414172414373415541416541423441486741654142344148674172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(205) := '4155414251414641415541425141464141554142514146414155414251414641414B774159414130414B77417241423441486741624143734142414145414151414241414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(206) := '4541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141445141454142344142414145414234414241414541424D';
wwv_flow_imp.g_varchar2_table(207) := '4142414172414373414B774172414373414B774172414373415667425741465941566742574146594156674257414659415667425741465941566742574146594156674257414659415667425741465941566742574146594156674257414659414B7741';
wwv_flow_imp.g_varchar2_table(208) := '72414373414B77417241465941566742574142344148674172414373414B774172414373414B774172414373414B774172414373414867416541423441486741654142344148674165414234414767416141426F41474141594142344148674145414151';
wwv_flow_imp.g_varchar2_table(209) := '41424141454141514142414145414151414241414541415141457741454143734145774154414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(210) := '514146414155414251414641415541425141464141554142514146414155414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241424C414573415377424C414573';
wwv_flow_imp.g_varchar2_table(211) := '415377424C414573415377424C41426F414751415A41423441554142514141514155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141424D41554141';
wwv_flow_imp.g_varchar2_table(212) := '4541415141424141454141514142414145414234414867414541415141424141454141514142414251414641414241414541423441424141454141514142414251414641415377424C414573415377424C414573415377424C4145734153774251414641';
wwv_flow_imp.g_varchar2_table(213) := '415541416541423441554141654142344148674165414234414867416541423441486741654142344148674165414234414B7741654146414142414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(214) := '5141464141554142514146414155414251414641415541425141464141554142514146414155414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414373414B774251414641';
wwv_flow_imp.g_varchar2_table(215) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(216) := '5141464141554142514146414155414251414641415541425141464141554142514146414142414145414151414241414541415141424141454141514142414145414641414B774172414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(217) := '414B774172414573415377424C414573415377424C414573415377424C4145734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(218) := '51414641415541425141464141554142514146414142414145414151414241414541415141424141454141514155414251414234414867415941424D4155414172414373414B774172414373415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(219) := '41554142514146414155414251414641415541425141464141554142514146414155414145414151414241414541464141424141454141514142414145414641414241414541415141554141454141514142414145414151414B77417241423441486741';
wwv_flow_imp.g_varchar2_table(220) := '65414234414867416541423441486741654142344148674165414234414867416541437341554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(221) := '4155414145414151414241417241437341486741724146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(222) := '72414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414641415541425141464141554142514146414155414172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(223) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B77417241415141424141454141514142414145414151414241414541415141424141454141514142414165414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(224) := '45414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(225) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541414541415141424142514141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(226) := '45414641414241414541415141424141454141514142414251414641415541425141464141554142514146414155414251414151414241414E414130415377424C414573415377424C414573415377424C41457341537741654146414155414251414641';
wwv_flow_imp.g_varchar2_table(227) := '41554142514146414155414251414641415541425141464141554142514146414142414145414151414B77425141464141554142514146414155414251414641414B77417241464141554141724143734155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(228) := '5141464141554142514146414155414251414373415541425141464141554142514146414155414172414641414B77417241437341554142514146414155414172414373414241425141415141424141454141514142414145414151414B774172414151';
wwv_flow_imp.g_varchar2_table(229) := '414241417241437341424141454141514155414172414373414B774172414373414B7741724143734142414172414373414B774172414641415541417241464141554142514141514142414172414373415377424C414573415377424C41457341537742';
wwv_flow_imp.g_varchar2_table(230) := '4C414573415377425141464141476741614146414155414251414641415541424D4142344147774251414234414B7741724143734142414145414151414B77425141464141554142514146414155414172414373414B7741724146414155414172414373';
wwv_flow_imp.g_varchar2_table(231) := '41554142514146414155414251414641415541425141464141554142514146414155414251414373415541425141464141554142514146414155414172414641415541417241464141554141724146414155414172414373414241417241415141424141';
wwv_flow_imp.g_varchar2_table(232) := '454141514142414172414373414B77417241415141424141724143734142414145414151414B7741724143734142414172414373414B774172414373414B7741724146414155414251414641414B774251414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(233) := '415377424C414573415377424C414573415377424C414573415377414541415141554142514146414142414172414373414B774172414373414B774172414373414B7741724143734142414145414151414B774251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(234) := '51414641415541417241464141554142514143734155414251414641415541425141464141554142514146414155414251414641415541425141437341554142514146414155414251414641415541417241464141554141724146414155414251414641';
wwv_flow_imp.g_varchar2_table(235) := '4155414172414373414241425141415141424141454141514142414145414151414241417241415141424141454143734142414145414151414B774172414641414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(236) := '7241437341554142514141514142414172414373415377424C414573415377424C414573415377424C4145734153774165414273414B774172414373414B774172414373414B774251414151414241414541415141424141454143734142414145414151';
wwv_flow_imp.g_varchar2_table(237) := '414B77425141464141554142514146414155414251414641414B7741724146414155414172414373415541425141464141554142514146414155414251414641415541425141464141554141454141514142414145414151414B77417241415141424141';
wwv_flow_imp.g_varchar2_table(238) := '724143734142414145414151414B774172414373414B774172414373414B7741724141514142414172414373414B774172414641415541417241464141554142514141514142414172414373415377424C414573415377424C414573415377424C414573';
wwv_flow_imp.g_varchar2_table(239) := '415377416541464141554142514146414155414251414641414B774172414373414B774172414373414B774172414373414B774145414641414B77425141464141554142514146414155414172414373414B774251414641415541417241464141554142';
wwv_flow_imp.g_varchar2_table(240) := '51414641414B774172414373415541425141437341554141724146414155414172414373414B774251414641414B7741724143734155414251414641414B7741724143734155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(241) := '414B774172414373414B7741454141514142414145414151414B7741724143734142414145414151414B7741454141514142414145414373414B774251414373414B774172414373414B774172414151414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(242) := '72414373414B77424C414573415377424C414573415377424C414573415377424C4146414155414251414234414867416541423441486741654142734148674172414373414B774172414373414241414541415141424141724146414155414251414641';
wwv_flow_imp.g_varchar2_table(243) := '41554142514146414155414172414641415541425141437341554142514146414155414251414641415541425141464141554142514146414155414251414641414B77425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(244) := '514146414155414251414373414B774172414641414241414541415141424141454141514142414172414151414241414541437341424141454141514142414172414373414B774172414373414B77417241415141424141724146414155414251414373';
wwv_flow_imp.g_varchar2_table(245) := '414B774172414373414B7742514146414142414145414373414B77424C414573415377424C414573415377424C414573415377424C414373414B774172414373414B774172414373414B7742514146414155414251414641415541425141423441554141';
wwv_flow_imp.g_varchar2_table(246) := '454141514142414172414641415541425141464141554142514146414155414172414641415541425141437341554142514146414155414251414641415541425141464141554142514146414155414251414641414B7742514146414155414251414641';
wwv_flow_imp.g_varchar2_table(247) := '4155414251414641415541425141437341554142514146414155414251414373414B774145414641414241414541415141424141454141514142414172414151414241414541437341424141454141514142414172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(248) := '724141514142414172414373414B774172414373414B774172414641414B7742514146414142414145414373414B77424C414573415377424C414573415377424C414573415377424C4143734155414251414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(249) := '414B774172414373414B774172414373415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414241414541464141424141';
wwv_flow_imp.g_varchar2_table(250) := '4541415141424141454141514142414172414151414241414541437341424141454141514142414251414234414B774172414373414B77425141464141554141454146414155414251414641415541425141464141554142514146414142414145414373';
wwv_flow_imp.g_varchar2_table(251) := '414B77424C414573415377424C414573415377424C414573415377424C41464141554142514146414155414251414641415541425141426F41554142514146414155414251414641414B7741724141514142414172414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(252) := '514146414155414251414641415541425141464141554142514146414155414251414373414B7741724146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414641';
wwv_flow_imp.g_varchar2_table(253) := '4155414251414641415541425141464141554142514143734155414172414373415541425141464141554142514146414155414172414373414B774145414373414B77417241437341424141454141514142414145414151414B77414541437341424141';
wwv_flow_imp.g_varchar2_table(254) := '4541415141424141454141514142414145414373414B774172414373414B774172414573415377424C414573415377424C414573415377424C414573414B7741724141514142414165414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(255) := '414B7741724146774158414263414677415841426341467741584142634146774158414263414677415841426341467741584142634146774158414263414677415841426341467741584142634146774158414263414677415841417141467741584141';
wwv_flow_imp.g_varchar2_table(256) := '7141436F414B67417141436F414B674171414373414B77417241437341477742634146774158414263414677415841426341436F414B67417141436F414B67417141436F414B674165414573415377424C414573415377424C414573415377424C414573';
wwv_flow_imp.g_varchar2_table(257) := '414451414E414373414B774172414373414B774263414677414B774263414373414B774263414677414B774263414373414B774263414373414B774172414373414B7741724146774158414263414677414B774263414677415841426341467741584142';
wwv_flow_imp.g_varchar2_table(258) := '634143734158414263414677414B7742634143734158414172414373415841426341437341584142634146774158414171414677415841417141436F414B67417141436F414B67417241436F414B674263414373414B7742634146774158414263414677';
wwv_flow_imp.g_varchar2_table(259) := '414B774263414373414B67417141436F414B67417141436F414B774172414573415377424C414573415377424C414573415377424C414573414B7741724146774158414263414677415541414F414134414467414F414234414467414F41416B41446741';
wwv_flow_imp.g_varchar2_table(260) := '4F414130414351415441424D414577415441424D414351416541424D4148674165414234414241414541423441486741654142344148674165414573415377424C414573415377424C414573415377424C41457341554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(261) := '4155414251414641415541414E414151414867414541423441424141574142454146674152414151414241425141464141554142514146414155414251414641414B77425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(262) := '514146414155414251414641415541425141464141554142514146414155414172414373414B7741724141514142414145414151414241414541415141424141454141514142414145414151414241414E4141514142414145414151414241414E414151';
wwv_flow_imp.g_varchar2_table(263) := '41424142514146414155414251414641414241414541415141424141454141514142414145414151414241414541437341424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(264) := '454141514142414145414151414241414541415141424141454141514142414145414373414451414E4142344148674165414234414867416541415141486741654142344148674165414234414B774165414234414467414F4141304144674165414234';
wwv_flow_imp.g_varchar2_table(265) := '4148674165414234414351414A414373414B774172414373414B7742634146774158414263414677415841426341467741584142634146774158414263414677415841426341467741584142634146774158414263414677415841426341467741584142';
wwv_flow_imp.g_varchar2_table(266) := '6341467741584142634146774158414263414677414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B674171414677415377424C414573415377424C414573415377424C414573';
wwv_flow_imp.g_varchar2_table(267) := '415377414E414130414867416541423441486742634146774158414263414677415841417141436F414B6741714146774158414263414677414B67417141436F415841417141436F414B674263414677414B67417141436F414B67417141436F414B6742';
wwv_flow_imp.g_varchar2_table(268) := '63414677415841417141436F414B6741714146774158414263414677415841426341467741584142634146774158414263414677414B67417141436F414B67417141436F414B67417141436F414B67417141436F4158414171414573415377424C414573';
wwv_flow_imp.g_varchar2_table(269) := '415377424C414573415377424C414573414B67417141436F414B67417141436F41554142514146414155414251414641414B774251414373414B774172414373414B774251414373414B7742514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(270) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414165414641415541425141464141574142594146674157414259414667415741425941466741574142594146674157414259414667';
wwv_flow_imp.g_varchar2_table(271) := '41574142594146674157414259414667415741425941466741574142594146674157414259414667415741425941466B415751425A41466B415751425A41466B415751425A41466B415751425A41466B415751425A41466B415751425A41466B41575142';
wwv_flow_imp.g_varchar2_table(272) := '5A41466B415751425A41466B415751425A41466B415751425A41466B415751426141466F415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F';
wwv_flow_imp.g_varchar2_table(273) := '415767426141466F415767426141466F415541425141464141554142514146414155414251414641414B7742514146414155414251414373414B7742514146414155414251414641415541425141437341554141724146414155414251414641414B7741';
wwv_flow_imp.g_varchar2_table(274) := '72414641415541425141464141554142514146414155414251414373415541425141464141554141724143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514143734155414251414641';
wwv_flow_imp.g_varchar2_table(275) := '4155414172414373415541425141464141554142514146414155414172414641414B7742514146414155414251414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641415541417241464141554142';
wwv_flow_imp.g_varchar2_table(276) := '51414641415541425141464141554142514146414155414251414641415541425141464141554141724146414155414251414641414B77417241464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(277) := '4155414251414641415541425141464141554142514146414155414251414373414B774145414151414241416541413041486741654142344148674165414234414867425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(278) := '5141464141554142514146414155414251414641414B774172414373415541425141464141554142514146414155414251414641415541425141464141554142514146414155414165414234414867416541423441486741654142344148674165414373';
wwv_flow_imp.g_varchar2_table(279) := '414B774172414373414B7741724146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B77417241464141554142514146414155414251414373414B7741';
wwv_flow_imp.g_varchar2_table(280) := '4E414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554141654142344155414251414641';
wwv_flow_imp.g_varchar2_table(281) := '41554142514146414155414251414641415541425141464141554142514146414155414251414130415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(282) := '5141464141554142514142594145514172414373414B774251414641415541425141464141554142514146414155414251414641414451414E4141304155414251414641415541425141464141554142514146414155414251414373414B774172414373';
wwv_flow_imp.g_varchar2_table(283) := '414B7741724143734155414251414641415541425141464141554142514146414155414251414641415541417241464141554142514146414142414145414151414B774172414373414B774172414373414B774172414373414B77417241464141554142';
wwv_flow_imp.g_varchar2_table(284) := '514146414155414251414641415541425141464141554142514146414155414251414641415541425141415141424141454141304144514172414373414B774172414373414B774172414373414B77425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(285) := '4155414251414641415541425141464141554142514146414155414145414151414B774172414373414B774172414373414B774172414373414B774172414373415541425141464141554142514146414155414251414641415541425141464141554141';
wwv_flow_imp.g_varchar2_table(286) := '7241464141554142514143734142414145414373414B774172414373414B774172414373414B774172414373414B774172414677415841426341467741584142634146774158414263414677415841426341467741584142634146774158414263414677';
wwv_flow_imp.g_varchar2_table(287) := '415841417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414451414E414255415841414E4142344144514162414677414B674172414373415377424C41457341537742';
wwv_flow_imp.g_varchar2_table(288) := '4C414573415377424C4145734153774172414373414B774172414373414B774251414641415541425141464141554142514146414155414251414373414B774172414373414B774172414234414867415441424D414451414E414134414867415441424D';
wwv_flow_imp.g_varchar2_table(289) := '4148674145414151414241414A414373415377424C414573415377424C414573415377424C4145734153774172414373414B774172414373414B774251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(290) := '51414641415541425141464141554142514146414155414172414373414B774172414373414B7741724143734155414251414641415541425141415141424142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(291) := '41554142514146414155414251414641415541425141464141554142514146414142414251414373414B774172414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(292) := '514146414155414251414373414B774172414373414B774172414373414B77417241437341554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(293) := '4155414251414641415541425141464141554141724141514142414145414151414241414541415141424141454141514142414145414373414B7741724143734142414145414151414241414541415141424141454141514142414145414151414B7741';
wwv_flow_imp.g_varchar2_table(294) := '72414373414B774165414373414B77417241424D414577424C414573415377424C414573415377424C414573415377424C414677415841426341467741584142634146774158414263414677415841426341467741584142634146774158414263414373';
wwv_flow_imp.g_varchar2_table(295) := '414B7742634146774158414263414677414B774172414373414B774172414373414B774172414373414B7741724146774158414263414677415841426341467741584142634146774158414263414373414B774172414373415841426341467741584142';
wwv_flow_imp.g_varchar2_table(296) := '634146774158414263414677415841426341467741584142634146774158414263414677414B774172414373414B774172414373415377424C414573415377424C414573415377424C4145734153774263414373414B77417241436F414B674251414641';
wwv_flow_imp.g_varchar2_table(297) := '415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141424141454141514142414145414373414B7741654142344158414263414677415841426341467741584142';
wwv_flow_imp.g_varchar2_table(298) := '634146774158414263414677415841426341467741584142634146774158414263414677414B67417141436F414B67417141436F414B67417141436F414B67417241436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F';
wwv_flow_imp.g_varchar2_table(299) := '414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B674172414373414241424C414573415377424C414573415377424C414573415377424C414373414B774172414373414B77417241457341537742';
wwv_flow_imp.g_varchar2_table(300) := '4C414573415377424C414573415377424C414573414B774172414373414B774172414373414B67417141436F414B67417141436F414B67426341436F414B67417141436F414B674171414373414B77414541415141424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(301) := '41424141454141514142414145414151414241417241415141424141454141514142414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(302) := '5141464141554141454141514142414145414151415541425141464141554142514146414155414172414373414B774172414573415377424C414573415377424C414573415377424C414573414451414E414234414451414E4141304144514165414234';
wwv_flow_imp.g_varchar2_table(303) := '414867416541423441486741654142344148674165414151414241414541415141424141454141514142414145414234414867416541423441486741654142344148674165414373414B7741724141514142414145414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(304) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514141514142414145414151414241414541415141424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(305) := '4155414251414573415377424C414573415377424C414573415377424C41457341554142514146414155414251414641415541425141415141424141454141514142414145414151414241414541415141424141454141514142414172414373414B7741';
wwv_flow_imp.g_varchar2_table(306) := '72414373414B7741724143734148674165414234414867425141464141554142514141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414172414373414B77414E414130';
wwv_flow_imp.g_varchar2_table(307) := '414451414E414130415377424C414573415377424C414573415377424C4145734153774172414373414B774251414641415541424C414573415377424C414573415377424C414573415377424C4146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(308) := '514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541414E414130415541425141464141554142514146414155414251414641414B774172414373';
wwv_flow_imp.g_varchar2_table(309) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414234414867416541423441486741654142344148674172414373414B774172414373414B77417241437341424141';
wwv_flow_imp.g_varchar2_table(310) := '4541415141486741454141514142414145414151414241414541415141424141454141514142414145414641415541425141464141424142514146414155414251414151414241414541464141554141454141514142414172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(311) := '414B77414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414B7741454141514142414145414151414867416541423441486741';
wwv_flow_imp.g_varchar2_table(312) := '6541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867417241437341554142514146414155414251414641414B774172414641415541425141464141554142514146414155414172414641';
wwv_flow_imp.g_varchar2_table(313) := '414B77425141437341554141724142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414B7741';
wwv_flow_imp.g_varchar2_table(314) := '72414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541437341486741654142344148674165414234414867416541464141486741654142344155414251414641';
wwv_flow_imp.g_varchar2_table(315) := '414B7741654142344148674165414234414867416541423441486741654146414155414251414641414B77417241423441486741654142344148674165414373414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(316) := '65414234414867416541423441486741724143734155414251414641414B774165414234414867416541423441486741654141344148674172414130414451414E414130414451414E414130414351414E41413041445141494141514143774145414151';
wwv_flow_imp.g_varchar2_table(317) := '414451414A414130414451414D41423041485141654142634146774157414263414677415841425941467741644142304148674165414251414641415541413041415141424141514142414145414151414241414A41426F414767416141426F41476741';
wwv_flow_imp.g_varchar2_table(318) := '6141426F4147674165414263414677416441425541465141654142344148674165414234414867415941425941455141564142554146514165414234414867416541423441486741654142344148674165414234414867414E414234414451414E414130';
wwv_flow_imp.g_varchar2_table(319) := '4144514165414130414451414E414163414867416541423441486741724141514142414145414151414241414541415141424141454141514155414251414373414B77425041464141554142514146414155414165414234414867415741424541547742';
wwv_flow_imp.g_varchar2_table(320) := '51414538415477425041453841554142514146414155414251414234414867416541425941455141724146414155414251414641415541425141464141554142514146414155414251414641414B77417241437341477741624142734147774162414273';
wwv_flow_imp.g_varchar2_table(321) := '41477741614142734147774162414273414777416241427341477741624142734147774162414273414777416141427341477741624142734147674162414273414767416241427341477741624142734147774162414273414777416241427341477741';
wwv_flow_imp.g_varchar2_table(322) := '624142734147774162414273414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414234';
wwv_flow_imp.g_varchar2_table(323) := '414867425141426F4148674164414234415541416541426F41486741654142344148674165414234414867416541423441547741654146414147774165414234415541425141464141554142514142344148674165414230414851416541464141486742';
wwv_flow_imp.g_varchar2_table(324) := '51414234415541416541464141547742514146414148674165414234414867416541423441486742514146414155414251414641414867416541423441486741654142344148674165414234414867416541423441486741654142344148674251414234';
wwv_flow_imp.g_varchar2_table(325) := '41554142514146414155414250414538415541425141464141554142514145384155414251414538415541425041453841547742504145384154774250414538415477425041453841547742514146414155414251414538415477425041453841547742';
wwv_flow_imp.g_varchar2_table(326) := '504145384154774250414538415541425141464141554142514146414155414251414641414867416541464141554142514146414154774165414234414B774172414373414B774164414230414851416441423041485141644142304148514164414234';
wwv_flow_imp.g_varchar2_table(327) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741644142344148514165414234414867416541423441486741654142344148674165414234414851416541423041485141';
wwv_flow_imp.g_varchar2_table(328) := '65414234414867416441423041486741654142304148674165414234414851416541423041477741624142344148514165414234414867416541423041486741654142304148514164414230414867416541423041486741644142344148514164414230';
wwv_flow_imp.g_varchar2_table(329) := '41485141644142304148674164414234414867416541423441486741644142304148514164414234414867416541423441485141644142344148674165414234414867416541423441486741654142344148514165414234414867416441423441486741';
wwv_flow_imp.g_varchar2_table(330) := '65414234414867416441423441486741654142344148674165414234414867416541423441486741654142344148514164414234414867416441423041485141644142344148674164414230414867416541423041485141654142344148674165414234';
wwv_flow_imp.g_varchar2_table(331) := '41486741654142344148674165414234414867416541423441486741654142344148674164414230414867416541423041485141654142344148674165414234414867416541423441486741654142344148674165414230414867416541423441485141';
wwv_flow_imp.g_varchar2_table(332) := '65414234414867416541423441486741654142304148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741644142344148674165414234';
wwv_flow_imp.g_varchar2_table(333) := '41486741654142344148674165414234414867416541423441486741654142514148674165414234414867416541423441486741654142344148674165414234414867416541423441486741574142454146674152414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(334) := '6541423041486741654142344148674165414234414867416C414355414867416541423441486741654142344148674165414234414667415241423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(335) := '41486741654142344148674165414355414A51416C41435541486741654142344148674165414234414867416541423441486741654142344148674165414234414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(336) := '72414373414B774172414373414B774172414373414B774172414373414B77425041453841547742504145384154774250414538415477425041453841547742504145384154774250414538415477425041453841547742504145384154774250414538';
wwv_flow_imp.g_varchar2_table(337) := '41547742504145384154774250414538414851416441423041485141644142304148514164414230414851416441423041485141644142304148514164414230414851416441423041485141644142304148514164414230414851416441423041485141';
wwv_flow_imp.g_varchar2_table(338) := '64414230414851425041453841547742504145384154774250414538415477425041453841547742504145384154774250414538415477425041453841547742514142304148514164414230414851416441423041485141644142304148514164414234';
wwv_flow_imp.g_varchar2_table(339) := '41486741654142344148514164414230414851416441423041485141644142304148514164414230414851416441423041485141644142304148514164414230414867416541423441486741654142344148674165414234414867416541423041485141';
wwv_flow_imp.g_varchar2_table(340) := '64414230414851416441423041485141644142304148514164414230414851416441423041486741654142304148514164414230414867416541423441486741654142344148674165414234414867416441423041486741644142304148514164414230';
wwv_flow_imp.g_varchar2_table(341) := '41485141644142344148674165414234414867416541423441486741644142304148674165414230414851416541423441486741654142304148514165414234414867416541423041485141644142344148674164414234414867416441423041485141';
wwv_flow_imp.g_varchar2_table(342) := '64414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148514164414230414851416541423441486741654142344148674165414234414867416441423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(343) := '414867416541423441486741654142344148674165414234414A51416C414355414A51416541423041485141654142344148514165414234414867416541423041485141654142344148674165414355414A514164414230414A514165414355414A5141';
wwv_flow_imp.g_varchar2_table(344) := '6C414341414A51416C41423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414A51416C41435541486741654142344148674164414234';
wwv_flow_imp.g_varchar2_table(345) := '41485141654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148514164414234414851416441423041486741';
wwv_flow_imp.g_varchar2_table(346) := '644143554148514164414234414851416441423441485141654142344148674165414234414867416541423441486741654142344148674165414234414867416C4142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(347) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423041485141654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(348) := '65414234414867416541423441486741654142344148674165414234414A51416C414355414A51416C414355414A51416C414355414A51416C4143554148514164414230414851416C414234414A51416C414355414851416C4143554148514164414230';
wwv_flow_imp.g_varchar2_table(349) := '414A51416C414230414851416C414230414851416C414355414A51416541423041486741654142344148674164414230414A5141644142304148514164414230414851416C414355414A51416C414355414851416C414355414941416C41423041485141';
wwv_flow_imp.g_varchar2_table(350) := '6C414355414A51416C414355414A51416C4143554148674165414234414A51416C41434141494141674143414148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(351) := '41486741654142344148674164414234414867416541426341467741584142634146774158414234414577415441435541486741654142344146674152414259414551415741424541466741524142594145514157414245414667415241453841547742';
wwv_flow_imp.g_varchar2_table(352) := '50414538415477425041453841547742504145384154774250414538415477425041453841547742504145384154774250414538414867416541423441486741654142344148674165414234414867416541423441486741574142454148674165414234';
wwv_flow_imp.g_varchar2_table(353) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414667415241425941455141574142454146674152414259414551416541423441486741';
wwv_flow_imp.g_varchar2_table(354) := '65414234414867416541423441486741654142344148674165414234414867416541423441486741654142594145514157414245414667415241425941455141574142454146674152414259414551415741424541466741524142594145514157414245';
wwv_flow_imp.g_varchar2_table(355) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441466741524142594145514165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(356) := '65414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541425941455141654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(357) := '414867416541423441486741654142344148674165414234414851416441423041485141644142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414B7741';
wwv_flow_imp.g_varchar2_table(358) := '72414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414B77417241437341486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(359) := '41486741654142344148674165414234414B774165414234414867416541423441486741654142344148674172414373414B774172414373414B774172414373414B774172414373414B7741724142344148674165414234414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(360) := '72414373414B774172414373414B774172414373414B774172414373414B774165414234414867416541423441486741654142344148674165414234414867416541423441486741454141514142414165414234414B774172414373414B77417241424D';
wwv_flow_imp.g_varchar2_table(361) := '414451414E4141304155414154414130415541425141464141554142514146414155414251414373414B774172414373414B774172414373415541414E414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(362) := '4541464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B7742514146414155414251414641';
wwv_flow_imp.g_varchar2_table(363) := '415541425141437341554142514146414155414251414641415541417241464141554142514146414155414251414641414B7742514146414155414251414641415541425141437341467741584142634146774158414263414677415841426341467741';
wwv_flow_imp.g_varchar2_table(364) := '584142634146774158414130414451414E414130414451414E4141304144514165414130414667414E41423441486741584142634148674165414263414677415741424541466741524142594145514157414245414451414E4141304144514154414641';
wwv_flow_imp.g_varchar2_table(365) := '414451414E414234414451414E4142344148674165414234414867414D414177414451414E414130414867414E414130414667414E414130414451414E414130414451414E414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(366) := '72414373414B774172414373414B774172414373414B774172414373414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414373';
wwv_flow_imp.g_varchar2_table(367) := '414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(368) := '72414373414B774172414373414B774172414373414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A514172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(369) := '414B774172414373414B774172414373414B774172414373414B77416C414355414A51416C414355414A51416C414355414A51416C414355414A514172414373414B7741724141304145514152414355414A514248414663415677415741424541466741';
wwv_flow_imp.g_varchar2_table(370) := '5241425941455141574142454146674152414355414A514157414245414667415241425941455141574142454146514157414245414551416C41466341567742584146634156774258414663415677425841415141424141454141514142414145414355';
wwv_flow_imp.g_varchar2_table(371) := '41567742584146634156774132414355414A5142584146634156774248414563414A51416C414355414B77425241466341555142584146454156774252414663415551425841466341567742584146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(372) := '58414663415677425841466341567742584146634156774258414663415677425841464541567742584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(373) := '415677425841466341567742584146634156774252414663415551425841464541567742584146634156774258414663415551425841466341567742584146634156774252414645414B7741724141514142414156414255415277424841466341465142';
wwv_flow_imp.g_varchar2_table(374) := '52414663415551425841464541567742524146634155514258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146454156774252414663';
wwv_flow_imp.g_varchar2_table(375) := '415551425841466341567742584146634156774252414663415677425841466341567742584146454155514258414663415677425841425541555142484145634156774172414373414B7741724143734156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(376) := '584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663414B7741724146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(377) := '415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774172414355414A5142584146634156774258414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(378) := '6C414355414A51416C414355415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663414B774172414373414B774172414355';
wwv_flow_imp.g_varchar2_table(379) := '414A51416C414355414B774172414373414B774172414373414B774172414373414B77417241437341555142524146454155514252414645415551425241464541555142524146454155514252414645415551416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(380) := '6C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414373415677425841466341567742584146634156774258414663415677416C414355';
wwv_flow_imp.g_varchar2_table(381) := '414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C41453841547742504145384154774250414538415477416C4146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(382) := '5841466341567742584146634156774258414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A5142584146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(383) := '4156774258414663415677425841466341567742584146634156774258414355414A51416C414355414A51416C414355414A51416C4143554156774258414663415677425841466341567742584146634156774258414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(384) := '6C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C4146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414563';
wwv_flow_imp.g_varchar2_table(385) := '41567742584146634156774258414663415677425841466341567742584146634156774258414663414B774172414373414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(386) := '72414373414B774172414373414B774172414373414B774251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414144514154414130415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(387) := '41554142514146414155414251414641415541424C414573415377424C414573415377424C414573415377424C4146414155414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(388) := '72414373414867416541423441486741654142344148674165414234414867416541423441486741654146414142414145414151414241416541415141424141454141514142414145414151414241414541415141486742514142344148674165414234';
wwv_flow_imp.g_varchar2_table(389) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234415541425141415141424142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(390) := '51414641415541425141464141554142514141514142414165414130414451414E4141304144514172414373414B774172414373414B77417241437341486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(391) := '41486741654142344148674165414234414867416541464141554142514146414155414251414641415541425141423441486741654142344148674165414234414867416541423441486741654142344148674165414234415541416541423441486741';
wwv_flow_imp.g_varchar2_table(392) := '65414234414867416541423441486741654142344148674165414234414867425141423441486741654142344148674165414641414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(393) := '4148674172414234414867416541423441486741654142344148674172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373415541425141464141554142';
wwv_flow_imp.g_varchar2_table(394) := '51414641415541425141464141554142514141514155414251414641414241425141464141554142514141514155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(395) := '4155414251414151414241414541415141424141654142344148674165414373414B77417241437341554142514146414155414251414641414867416541426F4148674172414373414B774172414373414B774251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(396) := '514146414155414251414641415541425141464141554142514146414155414251414641414467414F41424D4145774172414373414B774172414373414B7741724143734142414145414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(397) := '415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141415141424141454141514142414145414373414B774172414373414B774172414373414B77414E41413041537742';
wwv_flow_imp.g_varchar2_table(398) := '4C414573415377424C414573415377424C4145734153774172414373414B774172414373414B7741454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(399) := '41554141654142344148674251414134415541417241437341554142514146414155414251414641414241414541415141424141454141514142414145414130414451425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(400) := '51414641415541425141464141554142514141514142414145414151414241414541415141424141454141514142414145414151414B774172414373414B774172414373414B774172414373414B77417241423441574142594146674157414259414667';
wwv_flow_imp.g_varchar2_table(401) := '41574142594146674157414259414667415741425941466741574142594146674157414259414667415741425941466741574142594146674157414259414373414B77417241415141486741654142344148674165414234414451414E41413041486741';
wwv_flow_imp.g_varchar2_table(402) := '654142344148674172414641415377424C414573415377424C414573415377424C4145734153774172414373414B77417241423441486742634146774158414263414677414B674263414677415841426341467741584142634146774158414263414573';
wwv_flow_imp.g_varchar2_table(403) := '415377424C414573415377424C414573415377424C41457341584142634146774158414263414373415541425141464141554142514146414155414251414641414241414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(404) := '45414373414B774172414373414B774172414373414B77417241464141554142514141514155414251414641415541425141464141554142514141514142414172414373415377424C414573415377424C414573415377424C4145734153774172414373';
wwv_flow_imp.g_varchar2_table(405) := '414867414E41413041445142634146774158414263414677415841426341467741584142634146774158414263414677415841426341467741584142634146774158414263414677414B67417141436F415841417141436F414B67426341467741584142';
wwv_flow_imp.g_varchar2_table(406) := '6341467741584142634146774158414263414677415841426341467741584142634146774158414171414677414B67417141436F415841426341436F414B6742634146774158414263414677414B674171414677414B674263414373414B774172414373';
wwv_flow_imp.g_varchar2_table(407) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414677415841426341436F414B67425141464141554142514146414155414251414641415541425141464141424141';
wwv_flow_imp.g_varchar2_table(408) := '45414151414241414541413041445142514146414155414145414151414B774172414373414B774172414373414B774172414373414B7742514146414155414251414641415541417241437341554142514146414155414251414641414B774172414641';
wwv_flow_imp.g_varchar2_table(409) := '41554142514146414155414251414373414B774172414373414B774172414373414B77417241464141554142514146414155414251414641414B774251414641415541425141464141554142514143734155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(410) := '514146414155414251414641415541425141464141554142514146414155414145414151414241414541415141424141454141514144514145414151414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373';
wwv_flow_imp.g_varchar2_table(411) := '414B7741724143734156414256414655415651425641465541565142564146554156514256414655415651425641465541565142564146554156514256414655415651425641465541565142564146554156514255414655415651425641465541565142';
wwv_flow_imp.g_varchar2_table(412) := '564146554156514256414655415651425641465541565142564146554156514256414655415651425641465541565142564146554156514256414373414B774172414373414B774172414373414B774172414373414B77417241466B415751425A41466B';
wwv_flow_imp.g_varchar2_table(413) := '415751425A41466B415751425A41466B415751425A41466B415751425A41466B415751425A41466B414B774172414373414B77426141466F415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F41576742';
wwv_flow_imp.g_varchar2_table(414) := '6141466F415767426141466F415767426141466F415767426141466F414B774172414373414B7741474141594142674147414159414267414741415941426741474141594142674147414159414267414741415941426741474141594142674147414159';
wwv_flow_imp.g_varchar2_table(415) := '41426741474141594142674147414159414267414741415941567742584146634156774258414663415677425841466341567742584146634156774258414355414A51425841466341567742584146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(416) := '584146634156774258414663415677425841466341567742584146634156774258414663414A51416C414355414A51416C414355415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(417) := '414B7742514146414155414251414641414B774172414373414B7741724146594142414257414659415667425741465941566742574146594156674257414234415667425741465941566742574146594156674257414659415667425741465941566741';
wwv_flow_imp.g_varchar2_table(418) := '7241465941566742574146594156674172414659414B774257414659414B774257414659414B7742574146594156674257414659415667425741465941566742574146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(419) := '4155414251414641415541425141423441486741654142344148674165414234414867416541423441486741654142344148674165414234414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(420) := '72414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141455141574146414155414251414641';
wwv_flow_imp.g_varchar2_table(421) := '4155414251414641415541425141464141554142514146414155414251414641414B77417241464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(422) := '72414373414B774172414373414B774172414373414B774172414373414B774172414373414B7742514146414155414251414641415541425141464141554142514146414155414161414234414B77417241415141424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(423) := '4142414145414151414241414541415141424141454141514147414152414245414741415941424D41457741574142454146414172414373414B774172414373414B77414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(424) := '454141514142414145414355414A51416C414355414A514157414245414667415241425941455141574142454146674152414259414551416C4143554146674152414355414A51416C414355414A51416C414355414551416C414245414B774156414255';
wwv_flow_imp.g_varchar2_table(425) := '414577415441435541466741524142594145514157414245414A51416C414355414A51416C414355414A51416C414373414A51416241426F414A514172414373414B77417241464141554142514146414155414172414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(426) := '5141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414163414B774154414355414A51416241426F414A51416C414259';
wwv_flow_imp.g_varchar2_table(427) := '414551416C414355414551416C414245414A514258414663415677425841466341567742584146634156774258414255414651416C414355414A514154414355415677425841466341567742584146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(428) := '584146634156774258414663415677425841466341567742584146634156774258414259414A514152414355414A51416C414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(429) := '415677425841466341567742584146634156774157414355414551416C4142594145514152414259414551415241425541567742524146454155514252414645415551425241464541555142524146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(430) := '5841466341567742584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414563415277417241437341567742584146634156774258414663414B774172414663';
wwv_flow_imp.g_varchar2_table(431) := '41567742584146634156774258414373414B774258414663415677425841466341567741724143734156774258414663414B7741724143734147674162414355414A51416C414273414777417241423441486741654142344148674165414234414B7741';
wwv_flow_imp.g_varchar2_table(432) := '72414373414B774172414373414B774172414373414B7741454141514142414151414230414B7741724146414155414251414641415541425141464141554142514146414155414251414373415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(433) := '41554142514146414155414251414641415541425141464141554142514146414155414172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774251414641414B7742';
wwv_flow_imp.g_varchar2_table(434) := '514146414155414251414641415541425141464141554142514146414155414251414641415541417241437341554142514146414155414251414641415541425141464141554142514146414155414251414373414B7742514146414155414251414641';
wwv_flow_imp.g_varchar2_table(435) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414451414E414130414B774172414373414B77425141464141554142';
wwv_flow_imp.g_varchar2_table(436) := '514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B7741724142344148674165414234414867416541423441486741654146414155414251414641';
wwv_flow_imp.g_varchar2_table(437) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414148674165414234414867416541423441486741654142344148674165414234414867425141464141486741';
wwv_flow_imp.g_varchar2_table(438) := '65414234414B7741654142344148674165414234414867416541423441486741654142344148674172414373414B774172414234414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(439) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(440) := '65414234414867416541423441424141724143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373';
wwv_flow_imp.g_varchar2_table(441) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414151415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(442) := '514146414155414251414641414B774172414373414B774172414373414B77417241437341554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373';
wwv_flow_imp.g_varchar2_table(443) := '414B774172414373415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554141454141514142414145414151414B774172414373414B77417241464141554142';
wwv_flow_imp.g_varchar2_table(444) := '5141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141437341445142514146414155414251414373414B774172414373';
wwv_flow_imp.g_varchar2_table(445) := '41554142514146414155414251414641415541425141413041554142514146414155414251414373414B774172414373414B774172414373414B774172414373415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(446) := '5141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(447) := '4155414172414373414B774172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(448) := '72414373414B77417241464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B774172414373414B774172414373414B774172414234414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(449) := '414B774172414373414B774172414373414B774172414373414B7742514146414155414251414641415541417241437341554141724146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(450) := '51414641415541425141464141554142514143734155414251414373414B774172414641414B7741724146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(451) := '415541417241413041554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414234414867425141464141554142514146414155414251414373414B7741';
wwv_flow_imp.g_varchar2_table(452) := '72414373414B774172414373415541425141464141554142514146414155414251414641414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B77425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(453) := '41554142514146414155414251414641415541425141464141554142514143734155414251414373414B774172414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(454) := '51414641415541425141464141554142514146414155414251414641414B77417241437341445142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(455) := '4155414251414641414B774172414373414B77417241423441554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B7742';
wwv_flow_imp.g_varchar2_table(456) := '5141464141554142514146414142414145414151414B774145414151414B774172414373414B7741724141514142414145414151415541425141464141554141724146414155414251414373415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(457) := '41554142514146414155414251414641415541425141464141554142514146414155414251414373414B7741724143734142414145414151414B774172414373414B774145414641415541425141464141554142514146414155414172414373414B7741';
wwv_flow_imp.g_varchar2_table(458) := '72414373414B774172414373414451414E414130414451414E414130414451414E414234414B774172414373414B774172414373414B77425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(459) := '41554142514146414155414251414641415541425141464141554142514146414155414251414234415541425141464141554142514146414155414251414234415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(460) := '514146414155414251414641415541425141464141554142514146414142414145414373414B77417241437341554142514146414155414251414130414451414E414130414451414E414251414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(461) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B77414E414130414451414E414130414451414E414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(462) := '514146414155414251414641415541425141464141554142514146414155414251414373414B774172414373414B77417241437341486741654142344148674172414373414B774172414373414B774172414373414B774172414373414B774251414641';
wwv_flow_imp.g_varchar2_table(463) := '41554142514146414155414251414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741724143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(464) := '514146414155414172414373414B774172414373414B774172414373414B774172414373414B774172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373';
wwv_flow_imp.g_varchar2_table(465) := '414B774172414373414B774251414641415541425141464141554141454141514142414145414151414241414541413041445141654142344148674165414234414B774172414373414B7742514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(466) := '5141464141554142514146414155414251414573415377424C414573415377424C414573415377424C414573414B774172414373414B774172414373414B774172414373414B774172414373414B77417241437341424142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(467) := '41554142514146414155414251414641415541425141464141554142514141514142414145414151414241414541415141424141454141514142414165414234414867414E414130414451414E414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(468) := '72414373414B774172414373414B77425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B774172414373414B77424C414573415377424C414573415377424C414573';
wwv_flow_imp.g_varchar2_table(469) := '415377424C414373414B774172414373414B7741724146414155414251414641415541425141464141424141454141514142414145414151414241414541415141424141454141514142414145414373415377424C414573415377424C41457341537742';
wwv_flow_imp.g_varchar2_table(470) := '4C414573415377414E414130414451414E414373414B774172414373414B774172414373414B774172414373414B774172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(471) := '41424141654141344155414172414373414B774172414373414B774172414373414B7741454146414155414251414641414451414E41423441445141654141514142414145414234414B774172414573415377424C414573415377424C41457341537742';
wwv_flow_imp.g_varchar2_table(472) := '4C414573415541414F414641414451414E414130414B774251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(473) := '414B7741724146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514143734155414251414641415541425141464141554142514146414155414251414641415541414541415141424141';
wwv_flow_imp.g_varchar2_table(474) := '4541415141424141454141514142414145414151414241414E414130414867414E4141304148674145414373415541425141464141554142514146414155414172414641414B774251414641415541425141437341554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(475) := '415541425141464141554142514146414155414251414641414B774251414641415541425141464141554142514146414155414251414130414B774172414373414B77417241437341554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(476) := '5141464141554142514146414155414145414151414241414541415141424141454141514142414145414151414B774172414373414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(477) := '414241414541415141424141724146414155414251414641415541425141464141554141724143734155414251414373414B7742514146414155414251414641415541425141464141554142514146414155414251414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(478) := '724143734142414145414373414B77414541415141424141724143734155414172414373414B774172414373414B774145414373414B774172414373414B77425141464141554142514146414142414145414373414B7741454141514142414145414151';
wwv_flow_imp.g_varchar2_table(479) := '4142414145414373414B77417241415141424141454141514142414172414373414B774172414373414B774172414373414B7741724143734142414145414151414241414541415141424142514146414155414251414130414451414E41413041486742';
wwv_flow_imp.g_varchar2_table(480) := '4C414573415377424C414573415377424C414573415377424C4143734144514172414234414B774172414151414241414541415141554142514142344155414172414373414B774172414373414B774172414373415377424C414573415377424C414573';
wwv_flow_imp.g_varchar2_table(481) := '415377424C4145734153774172414373414B774172414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641415541414541415141424141454141514142414145414373414B77414541415141424141';
wwv_flow_imp.g_varchar2_table(482) := '454141514142414145414151414241414F414130414451415441424D4148674165414234414451414E414130414451414E414130414451414E414130414451414E414130414451414E41413041554142514146414155414145414151414B774172414151';
wwv_flow_imp.g_varchar2_table(483) := '414451414E4142344155414172414373414B774172414373414B774172414373414B774172414373415377424C414573415377424C414573415377424C4145734153774172414373414B774172414373414B77414F414134414467414F41413441446741';
wwv_flow_imp.g_varchar2_table(484) := '4F414134414467414F414134414467414F414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373415377424C414573415377424C414573415377424C4145734153774172414373';
wwv_flow_imp.g_varchar2_table(485) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741724146774158414263414677415841426341467741584142634146774158414263414677415841426341467741584142';
wwv_flow_imp.g_varchar2_table(486) := '63414677415841426341467741584142634146774158414172414373414B77417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B674172414373414B774172414573415377424C414573415377424C414573';
wwv_flow_imp.g_varchar2_table(487) := '415377424C4145734158414263414130414451414E41436F415377424C414573415377424C414573415377424C4145734153774251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(488) := '72414373414B77425141464141424141454141514142414145414151414241414541415141424142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(489) := '4155414145414151414241414541415141424141454146414142414145414151414241414F414234414451414E414130414451414F4142344142414172414373414B774172414373414B7741724143734155414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(490) := '454141514142414145414151415541425141464141554141724143734155414251414641415541414541415141424141454141514142414145414151414241414541415141424141454141514142414145414130414451414E414373414467414F414134';
wwv_flow_imp.g_varchar2_table(491) := '414451414E414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(492) := '51414641415541417241464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414241414541415141424141454141514142414145414373';
wwv_flow_imp.g_varchar2_table(493) := '414241414541415141424141454141514142414145414641414451414E414130414451414E414373414B774172414373414B774172414373414B774172414373415377424C414573415377424C414573415377424C414573415377425141464141554142';
wwv_flow_imp.g_varchar2_table(494) := '514146414155414251414641415541425141464141554142514146414155414172414373414B77414F41424D415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414151';
wwv_flow_imp.g_varchar2_table(495) := '4142414145414151414241414541415141424141454141514142414145414151414241417241415141424141454141514142414145414151414241414541415141424141454141514142414172414373414B774172414373414B774172414373414B7742';
wwv_flow_imp.g_varchar2_table(496) := '51414641415541425141464141554142514143734155414251414373415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(497) := '4142414172414373414B7741454143734142414145414373414241414541415141424141454141514142414251414151414B774172414373414B774172414373414B774172414573415377424C414573415377424C414573415377424C414573414B7741';
wwv_flow_imp.g_varchar2_table(498) := '72414373414B774172414373415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B774172414373414B774172414641';
wwv_flow_imp.g_varchar2_table(499) := '41554142514146414155414251414641415541425141464141554142514146414155414251414373414451414E414130414451414E414373414B774172414373414B774172414373414B774172414373414B7742514146414155414251414373414B7741';
wwv_flow_imp.g_varchar2_table(500) := '72414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741724143734155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(501) := '41554142514146414155414251414641415541425141464141554142514146414153414249414567415177424441454D415541425141464141554142444146414155414251414567415177424941454D4155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(502) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415341424441454D41554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(503) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741724146414155414251414641415541425141464141554142514146414155414251414641415541424941454D415541425141464141554142';
wwv_flow_imp.g_varchar2_table(504) := '5141464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(505) := '414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373414B77414E414130414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B77425141464141554142';
wwv_flow_imp.g_varchar2_table(506) := '51414641415541425141464141554142514146414155414251414641414B7741724141514142414145414151414241414E414373414B774172414373414B774172414373414B774172414373415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(507) := '41554142514146414155414251414641415541414541415141424141454141514142414145414130414451414E4142344148674165414234414867416541464141554142514146414144514165414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(508) := '72414373415377424C414573415377424C414573415377424C414573415377417241464141554142514146414155414251414641414B77425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(509) := '41554142514146414155414172414373414B7741724143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(510) := '72414373414B774172414373414B77417241464141554142514146414155414172414373414B774172414373414B774172414373414B77417241437341554141454141514142414145414151414241414541415141424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(511) := '4142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414373414B774172414373414B774172414373414B774172414373414B774172414373414B77417241437341424141';
wwv_flow_imp.g_varchar2_table(512) := '45414151414241425141464141554142514146414155414251414641415541425141464141554142514145634152774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(513) := '414B774172414373414B774172414373414B774172414373414B7742584146634156774258414663415677425841466341567742584146634156774258414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(514) := '72414373414B7741724143734156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774172414373414B774172414373414B774172414373414B774172414373414B774172414663';
wwv_flow_imp.g_varchar2_table(515) := '415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663414B774172414373414B774251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(516) := '514146414155414251414641414B774172414373414B7741724146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B774172414373414B77425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(517) := '4155414251414373414B774165414151414241414E4141514142414145414151414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(518) := '72414373414B7741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414373414B774172414373414B774172414373414B7741724143734148674165414234';
wwv_flow_imp.g_varchar2_table(519) := '41486741654142344148674172414373414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344142414145414151414241414541423441486741';
wwv_flow_imp.g_varchar2_table(520) := '65414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141486741654141514142414145414151414241414541415141486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(521) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867414541415141424141454142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(522) := '65414234414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B77417241423441486741454141514142414165414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(523) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(524) := '654142344148674165414234414B774172414373414B774172414373414B774172414373415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(525) := '414B774172414373414B774172414373414B77417241423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654143734148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(526) := '6541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674172414641415541417241437341554141724143734155414251414373414B774251414641';
wwv_flow_imp.g_varchar2_table(527) := '41554142514143734148674165414234414867416541423441486741654142344148674165414234414B77425141437341554142514146414155414251414641415541417241423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(528) := '654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741724146414155414251414641414B7741724146414155414251414641415541425141464141554141724146414155414251414641';
wwv_flow_imp.g_varchar2_table(529) := '4155414251414641414B774165414234415541425141464141554142514143734155414172414373414B77425141464141554142514146414155414251414373414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(530) := '65414234414867417241437341554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541416541464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(531) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(532) := '65414234414867416541464141554142514146414155414251414641415541425141464141554141654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(533) := '414867416541464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414867416541423441486741654142344148674165414234414B7741';
wwv_flow_imp.g_varchar2_table(534) := '72414573415377424C414573415377424C414573415377424C414573415377424C414573415377424C414573415377424C414573415377424C414573415377424C414573415377424C414573415377424C414573415377424C4145734142414145414151';
wwv_flow_imp.g_varchar2_table(535) := '41424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454142344148674165414234414241414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(536) := '454142344148674165414234414867416541423441486741454142344148674165414234414867416541423441486741654142344142414165414234414451414E4141304144514165414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(537) := '414B774172414373414B7741724141514142414145414151414241417241415141424141454141514142414145414151414241414541415141424141454141514142414145414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(538) := '72414373414B77417241437341424141454141514142414145414151414241417241415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241417241437341424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(539) := '4142414172414151414241417241415141424141454141514142414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7742514146414155414251414641414B7741';
wwv_flow_imp.g_varchar2_table(540) := '7241464141554142514146414155414251414641415541425141415141424141454141514142414145414151414B774172414373414B774172414373414B7741724143734148674165414234414867414541415141424141454141514142414145414373';
wwv_flow_imp.g_varchar2_table(541) := '414B774172414373414B77424C414573415377424C414573415377424C414573415377424C414373414B77417241437341466741574146414155414251414641414B77425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(542) := '51414641415541425141464141554142514146414155414251414641415541425141464141554141724146414155414172414641414B774172414641414B7742514146414155414251414641415541425141464141554142514143734155414251414641';
wwv_flow_imp.g_varchar2_table(543) := '4155414172414641414B774251414373414B774172414373414B774172414641414B774172414373414B7742514143734155414172414641414B77425141464141554141724146414155414172414641414B774172414641414B77425141437341554141';
wwv_flow_imp.g_varchar2_table(544) := '72414641414B774251414373415541425141437341554141724143734155414251414641415541417241464141554142514146414155414251414641414B774251414641415541425141437341554142514146414155414172414641414B774251414641';
wwv_flow_imp.g_varchar2_table(545) := '415541425141464141554142514146414155414251414373415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B774172414373414B774251414641415541417241464141554142';
wwv_flow_imp.g_varchar2_table(546) := '514146414155414172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414234';
wwv_flow_imp.g_varchar2_table(547) := '4148674172414373414B774172414373414B774172414373414B774172414373414B7741724143734154774250414538415477425041453841547742504145384154774250414538415477416C414355414A514164414230414851416441423041485141';
wwv_flow_imp.g_varchar2_table(548) := '6441423041485141644142304148514164414230414851416441423041485141654143554148514164414230414851416441423041485141644142304148514164414230414851416441423041485141644142304148674165414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(549) := '414851416441423041485141644142304148514164414230414851416441423041485141644142304148514164414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(550) := '6C41436B414B51417041436B414B51417041436B414B51417041436B414B51417041436B414B51417041436B414B51417041436B414B51417041436B414B51417041436B414B51416C414355414A51416C414355414941416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(551) := '414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414234414867416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(552) := '6C414355414A51416C4143554148674165414355414A51416C414355414A514165414355414A51416C414355414A514167414341414941416C414355414941416C4143554149414167414341414A51416C414355414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(553) := '414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C41435541495141684143454149514168414355414A514167414341414A51416C414341414941416741434141494141';
wwv_flow_imp.g_varchar2_table(554) := '674143414149414167414341414941416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C4143554149414167414341414941416C414355414A51416C414341414A5141674143414149414167414341';
wwv_flow_imp.g_varchar2_table(555) := '4149414167414341414941416C414355414A514167414355414A51416C4143554149414167414341414A514167414341414941416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(556) := '6C414355414A51416C414355414A514165414355414867416C414234414A51416C414355414A51416C414341414A51416C414355414A5141654143554148674165414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(557) := '41486741654142344148674165414234414867416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414234414867416541423441486741654142344148674165414234414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(558) := '6C414355414A51416C414355414A51416C414355414A51416541423441486741654142344148674165414234414867416541423441486741654142344148674165414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(559) := '414A51416C414355414A51416C414355414A51416C4143554149414167414355414A51416C414355414941416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414941416C414355414A5141';
wwv_flow_imp.g_varchar2_table(560) := '6C414341414941416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416541423441486741654142344148674165414234414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(561) := '414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C41423441486741654142344148674165414355414A51416C414355414A51416C4143554149414167414341414A51416C414355414941416741434141494141';
wwv_flow_imp.g_varchar2_table(562) := '674142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414677415841426341465141564142554148674165414234414867416C414355414A514167414355';
wwv_flow_imp.g_varchar2_table(563) := '414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C4143554149414167414341414A51416C414355414A51416C414355414A51416C414355414941416C414355414A51416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(564) := '6C414355414941416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C41423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(565) := '4148674165414234414867416C414355414A51416C414355414A51416C414355414A51416C414355414A514165414234414867416541423441486741654142344148674165414234414867416C414355414A51416C414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(566) := '65414234414867416541423441486741654142344148674165414234414A51416C414355414A51416C414355414A51416C414234414867416541423441486741654142344148674165414234414A51416C414355414A51416C4143554148674165414234';
wwv_flow_imp.g_varchar2_table(567) := '41486741654142344148674165414355414A51416C414355414A51416C414355414A51416541423441486741654142344148674165414234414867416541423441486741654142344148674165414355414A51416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(568) := '6C414355414A51416C4143414149414167414341414941416C414341414941416C414355414A51416C414355414A514167414355414A51416C414355414A51416C414355414A51416C414341414941416741434141494141674143414149414167414341';
wwv_flow_imp.g_varchar2_table(569) := '414A51416C4143554149414167414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C4143414149414167414341414941416741434141494141674143414149414167414341414A5141';
wwv_flow_imp.g_varchar2_table(570) := '6C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414373414B7742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(571) := '415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663414A51416C414355414A51416C414355414A51416C41435541567742584146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(572) := '58414663415677425841466341567742584146634156774258414663414A51416C414355414A51416C414355414A51416C414355414A51416C41466341567742584146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(573) := '41567742584146634156774258414663415677425841466341567742584146634156774258414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A5142584146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(574) := '5841466341567742584146634156774258414663414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(575) := '414A514172414151414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414241414541415141424141';
wwv_flow_imp.g_varchar2_table(576) := '454141514142414145414151414241414541415141424141454141514142414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741724143734122292C663D41727261792E69734172';
wwv_flow_imp.g_varchar2_table(577) := '7261792864293F66756E6374696F6E2841297B666F722876617220653D412E6C656E6774682C743D5B5D2C723D303B723C653B722B3D3429742E7075736828415B722B335D3C3C32347C415B722B325D3C3C31367C415B722B315D3C3C387C415B725D29';
wwv_flow_imp.g_varchar2_table(578) := '3B72657475726E20747D2864293A6E65772055696E74333241727261792864292C703D41727261792E697341727261792864293F66756E6374696F6E2841297B666F722876617220653D412E6C656E6774682C743D5B5D2C723D303B723C653B722B3D32';
wwv_flow_imp.g_varchar2_table(579) := '29742E7075736828415B722B315D3C3C387C415B725D293B72657475726E20747D2864293A6E65772055696E74313641727261792864292C453D7328702C31322C665B345D2F32292C463D323D3D3D665B355D3F7328702C2832342B665B345D292F3229';
wwv_flow_imp.g_varchar2_table(580) := '3A28643D662C703D4D6174682E6365696C282832342B665B345D292F34292C642E736C6963653F642E736C69636528702C46293A6E65772055696E74333241727261792841727261792E70726F746F747970652E736C6963652E63616C6C28642C702C46';
wwv_flow_imp.g_varchar2_table(581) := '2929292C6E6577206F28665B305D2C665B315D2C665B325D2C665B335D2C452C4629292C5A3D5B5F2C33365D2C6A3D5B312C322C332C355D2C243D5B4E2C385D2C41413D5B762C4D5D2C65413D6A2E636F6E6361742824292C74413D5B472C4A2C6B2C56';
wwv_flow_imp.g_varchar2_table(582) := '2C7A5D2C72413D5B492C4B5D2C42413D286E412E70726F746F747970652E736C6963653D66756E6374696F6E28297B72657475726E20512E6170706C7928766F696420302C746869732E636F6465506F696E74732E736C69636528746869732E73746172';
wwv_flow_imp.g_varchar2_table(583) := '742C746869732E656E6429297D2C6E41293B66756E6374696F6E206E4128412C652C742C72297B746869732E636F6465506F696E74733D412C746869732E72657175697265643D2221223D3D3D652C746869732E73746172743D742C746869732E656E64';
wwv_flow_imp.g_varchar2_table(584) := '3D727D66756E6374696F6E20734128412C65297B76617220743D632841292C723D28653D6C28742C6529295B305D2C423D655B315D2C6E3D655B325D2C733D742E6C656E6774682C6F3D302C693D303B72657475726E7B6E6578743A66756E6374696F6E';
wwv_flow_imp.g_varchar2_table(585) := '28297B696628733C3D692972657475726E7B646F6E653A21302C76616C75653A6E756C6C7D3B666F722876617220413D593B693C73262628413D66756E6374696F6E28412C652C742C722C42297B696628303D3D3D745B725D2972657475726E20593B76';
wwv_flow_imp.g_varchar2_table(586) := '6172206E3D722D313B69662841727261792E69734172726179284229262621303D3D3D425B6E5D2972657475726E20593B76617220733D6E2D312C6F3D312B6E2C693D655B6E5D2C723D303C3D733F655B735D3A302C423D655B6F5D3B696628323D3D3D';
wwv_flow_imp.g_varchar2_table(587) := '692626333D3D3D422972657475726E20593B6966282D31213D3D6A2E696E6465784F662869292972657475726E2221223B6966282D31213D3D6A2E696E6465784F662842292972657475726E20593B6966282D31213D3D242E696E6465784F6628422929';
wwv_flow_imp.g_varchar2_table(588) := '72657475726E20593B696628383D3D3D55286E2C65292972657475726E22C3B7223B69662831313D3D3D712E67657428415B6E5D29262628423D3D3D587C7C423D3D3D787C7C423D3D3D50292972657475726E20593B696628373D3D3D697C7C373D3D3D';
wwv_flow_imp.g_varchar2_table(589) := '422972657475726E20593B696628393D3D3D692972657475726E20593B6966282D313D3D3D5B4E2C4B2C495D2E696E6465784F662869292626393D3D3D422972657475726E20593B6966282D31213D3D5B542C6D2C522C622C795D2E696E6465784F6628';
wwv_flow_imp.g_varchar2_table(590) := '42292972657475726E20593B69662855286E2C65293D3D3D442972657475726E20593B696628772832332C442C6E2C65292972657475726E20593B69662877285B542C6D5D2C4F2C6E2C65292972657475726E20593B696628772831322C31322C6E2C65';
wwv_flow_imp.g_varchar2_table(591) := '292972657475726E20593B696628693D3D3D4E2972657475726E22C3B7223B69662832333D3D3D697C7C32333D3D3D422972657475726E20593B69662831363D3D3D427C7C31363D3D3D692972657475726E22C3B7223B6966282D31213D3D5B4B2C492C';
wwv_flow_imp.g_varchar2_table(592) := '4F5D2E696E6465784F662842297C7C31343D3D3D692972657475726E20593B69662833363D3D3D7226262D31213D3D72412E696E6465784F662869292972657475726E20593B696628693D3D3D79262633363D3D3D422972657475726E20593B69662842';
wwv_flow_imp.g_varchar2_table(593) := '3D3D3D4C26262D31213D3D5A2E636F6E636174284C2C522C532C582C782C50292E696E6465784F662869292972657475726E20593B6966282D31213D3D5A2E696E6465784F662842292626693D3D3D537C7C2D31213D3D5A2E696E6465784F6628692926';
wwv_flow_imp.g_varchar2_table(594) := '26423D3D3D532972657475726E20593B696628693D3D3D7626262D31213D3D5B582C782C505D2E696E6465784F662842297C7C2D31213D3D5B582C782C505D2E696E6465784F662869292626423D3D3D4D2972657475726E20593B6966282D31213D3D5A';
wwv_flow_imp.g_varchar2_table(595) := '2E696E6465784F6628692926262D31213D3D41412E696E6465784F662842297C7C2D31213D3D41412E696E6465784F6628692926262D31213D3D5A2E696E6465784F662842292972657475726E20593B6966282D31213D3D5B762C4D5D2E696E6465784F';
wwv_flow_imp.g_varchar2_table(596) := '66286929262628423D3D3D537C7C2D31213D3D5B442C495D2E696E6465784F662842292626655B312B6F5D3D3D3D53297C7C2D31213D3D5B442C495D2E696E6465784F662869292626423D3D3D537C7C693D3D3D5326262D31213D3D5B532C792C625D2E';
wwv_flow_imp.g_varchar2_table(597) := '696E6465784F662842292972657475726E20593B6966282D31213D3D5B532C792C622C542C6D5D2E696E6465784F6628422929666F722876617220613D6E3B303C3D613B297B69662828633D655B615D293D3D3D532972657475726E20593B6966282D31';
wwv_flow_imp.g_varchar2_table(598) := '3D3D3D5B792C625D2E696E6465784F6628632929627265616B3B612D2D7D6966282D31213D3D5B762C4D5D2E696E6465784F6628422929666F722876617220632C613D2D31213D3D5B542C6D5D2E696E6465784F662869293F733A6E3B303C3D613B297B';
wwv_flow_imp.g_varchar2_table(599) := '69662828633D655B615D293D3D3D532972657475726E20593B6966282D313D3D3D5B792C625D2E696E6465784F6628632929627265616B3B612D2D7D696628473D3D3D6926262D31213D3D5B472C4A2C562C7A5D2E696E6465784F662842297C7C2D3121';
wwv_flow_imp.g_varchar2_table(600) := '3D3D5B4A2C565D2E696E6465784F6628692926262D31213D3D5B4A2C6B5D2E696E6465784F662842297C7C2D31213D3D5B6B2C7A5D2E696E6465784F662869292626423D3D3D6B2972657475726E20593B6966282D31213D3D74412E696E6465784F6628';
wwv_flow_imp.g_varchar2_table(601) := '692926262D31213D3D5B4C2C4D5D2E696E6465784F662842297C7C2D31213D3D74412E696E6465784F662842292626693D3D3D762972657475726E20593B6966282D31213D3D5A2E696E6465784F6628692926262D31213D3D5A2E696E6465784F662842';
wwv_flow_imp.g_varchar2_table(602) := '292972657475726E20593B696628693D3D3D6226262D31213D3D5A2E696E6465784F662842292972657475726E20593B6966282D31213D3D5A2E636F6E6361742853292E696E6465784F662869292626423D3D3D447C7C2D31213D3D5A2E636F6E636174';
wwv_flow_imp.g_varchar2_table(603) := '2853292E696E6465784F662842292626693D3D3D6D2972657475726E20593B69662834313D3D3D69262634313D3D3D42297B666F722876617220513D745B6E5D2C753D313B303C51262634313D3D3D655B2D2D515D3B29752B2B3B696628752532213D30';
wwv_flow_imp.g_varchar2_table(604) := '2972657475726E20597D72657475726E20693D3D3D782626423D3D3D503F593A22C3B7227D28742C422C722C2B2B692C6E29293D3D3D593B293B696628413D3D3D59262669213D3D732972657475726E7B646F6E653A21302C76616C75653A6E756C6C7D';
wwv_flow_imp.g_varchar2_table(605) := '3B76617220653D6E657720424128742C412C6F2C69293B72657475726E206F3D692C7B76616C75653A652C646F6E653A21317D7D7D7D766172206F413B286A653D6F413D6F417C7C7B7D295B6A652E535452494E475F544F4B454E3D305D3D2253545249';
wwv_flow_imp.g_varchar2_table(606) := '4E475F544F4B454E222C6A655B6A652E4241445F535452494E475F544F4B454E3D315D3D224241445F535452494E475F544F4B454E222C6A655B6A652E4C4546545F504152454E5448455349535F544F4B454E3D325D3D224C4546545F504152454E5448';
wwv_flow_imp.g_varchar2_table(607) := '455349535F544F4B454E222C6A655B6A652E52494748545F504152454E5448455349535F544F4B454E3D335D3D2252494748545F504152454E5448455349535F544F4B454E222C6A655B6A652E434F4D4D415F544F4B454E3D345D3D22434F4D4D415F54';
wwv_flow_imp.g_varchar2_table(608) := '4F4B454E222C6A655B6A652E484153485F544F4B454E3D355D3D22484153485F544F4B454E222C6A655B6A652E44454C494D5F544F4B454E3D365D3D2244454C494D5F544F4B454E222C6A655B6A652E41545F4B4559574F52445F544F4B454E3D375D3D';
wwv_flow_imp.g_varchar2_table(609) := '2241545F4B4559574F52445F544F4B454E222C6A655B6A652E5052454649585F4D415443485F544F4B454E3D385D3D225052454649585F4D415443485F544F4B454E222C6A655B6A652E444153485F4D415443485F544F4B454E3D395D3D22444153485F';
wwv_flow_imp.g_varchar2_table(610) := '4D415443485F544F4B454E222C6A655B6A652E494E434C5544455F4D415443485F544F4B454E3D31305D3D22494E434C5544455F4D415443485F544F4B454E222C6A655B6A652E4C4546545F4355524C595F425241434B45545F544F4B454E3D31315D3D';
wwv_flow_imp.g_varchar2_table(611) := '224C4546545F4355524C595F425241434B45545F544F4B454E222C6A655B6A652E52494748545F4355524C595F425241434B45545F544F4B454E3D31325D3D2252494748545F4355524C595F425241434B45545F544F4B454E222C6A655B6A652E535546';
wwv_flow_imp.g_varchar2_table(612) := '4649585F4D415443485F544F4B454E3D31335D3D225355464649585F4D415443485F544F4B454E222C6A655B6A652E535542535452494E475F4D415443485F544F4B454E3D31345D3D22535542535452494E475F4D415443485F544F4B454E222C6A655B';
wwv_flow_imp.g_varchar2_table(613) := '6A652E44494D454E53494F4E5F544F4B454E3D31355D3D2244494D454E53494F4E5F544F4B454E222C6A655B6A652E50455243454E544147455F544F4B454E3D31365D3D2250455243454E544147455F544F4B454E222C6A655B6A652E4E554D4245525F';
wwv_flow_imp.g_varchar2_table(614) := '544F4B454E3D31375D3D224E554D4245525F544F4B454E222C6A655B6A652E46554E4354494F4E3D31385D3D2246554E4354494F4E222C6A655B6A652E46554E4354494F4E5F544F4B454E3D31395D3D2246554E4354494F4E5F544F4B454E222C6A655B';
wwv_flow_imp.g_varchar2_table(615) := '6A652E4944454E545F544F4B454E3D32305D3D224944454E545F544F4B454E222C6A655B6A652E434F4C554D4E5F544F4B454E3D32315D3D22434F4C554D4E5F544F4B454E222C6A655B6A652E55524C5F544F4B454E3D32325D3D2255524C5F544F4B45';
wwv_flow_imp.g_varchar2_table(616) := '4E222C6A655B6A652E4241445F55524C5F544F4B454E3D32335D3D224241445F55524C5F544F4B454E222C6A655B6A652E4344435F544F4B454E3D32345D3D224344435F544F4B454E222C6A655B6A652E43444F5F544F4B454E3D32355D3D2243444F5F';
wwv_flow_imp.g_varchar2_table(617) := '544F4B454E222C6A655B6A652E434F4C4F4E5F544F4B454E3D32365D3D22434F4C4F4E5F544F4B454E222C6A655B6A652E53454D49434F4C4F4E5F544F4B454E3D32375D3D2253454D49434F4C4F4E5F544F4B454E222C6A655B6A652E4C4546545F5351';
wwv_flow_imp.g_varchar2_table(618) := '554152455F425241434B45545F544F4B454E3D32385D3D224C4546545F5351554152455F425241434B45545F544F4B454E222C6A655B6A652E52494748545F5351554152455F425241434B45545F544F4B454E3D32395D3D2252494748545F5351554152';
wwv_flow_imp.g_varchar2_table(619) := '455F425241434B45545F544F4B454E222C6A655B6A652E554E49434F44455F52414E47455F544F4B454E3D33305D3D22554E49434F44455F52414E47455F544F4B454E222C6A655B6A652E574849544553504143455F544F4B454E3D33315D3D22574849';
wwv_flow_imp.g_varchar2_table(620) := '544553504143455F544F4B454E222C6A655B6A652E454F465F544F4B454E3D33325D3D22454F465F544F4B454E223B66756E6374696F6E2069412841297B72657475726E2034383C3D412626413C3D35377D66756E6374696F6E2061412841297B726574';
wwv_flow_imp.g_varchar2_table(621) := '75726E2069412841297C7C36353C3D412626413C3D37307C7C39373C3D412626413C3D3130327D66756E6374696F6E2063412841297B72657475726E2031303D3D3D417C7C393D3D3D417C7C33323D3D3D417D66756E6374696F6E2051412841297B7265';
wwv_flow_imp.g_varchar2_table(622) := '7475726E2039373C3D28743D653D41292626743C3D3132327C7C36353C3D28653D65292626653C3D39307C7C3132383C3D417C7C39353D3D3D413B76617220652C747D66756E6374696F6E2075412841297B72657475726E2051412841297C7C69412841';
wwv_flow_imp.g_varchar2_table(623) := '297C7C34353D3D3D417D66756E6374696F6E20774128412C65297B72657475726E2039323D3D3D4126263130213D3D657D66756E6374696F6E20554128412C652C74297B72657475726E2034353D3D3D413F51412865297C7C774128652C74293A212151';
wwv_flow_imp.g_varchar2_table(624) := '412841297C7C39323D3D3D4126263130213D3D657D66756E6374696F6E206C4128412C652C74297B72657475726E2034333D3D3D417C7C34353D3D3D413F212169412865297C7C34363D3D3D65262669412874293A69412834363D3D3D413F653A41297D';
wwv_flow_imp.g_varchar2_table(625) := '7661722043413D7B747970653A6F412E4C4546545F504152454E5448455349535F544F4B454E7D2C67413D7B747970653A6F412E52494748545F504152454E5448455349535F544F4B454E7D2C45413D7B747970653A6F412E434F4D4D415F544F4B454E';
wwv_flow_imp.g_varchar2_table(626) := '7D2C68413D7B747970653A6F412E5355464649585F4D415443485F544F4B454E7D2C46413D7B747970653A6F412E5052454649585F4D415443485F544F4B454E7D2C64413D7B747970653A6F412E434F4C554D4E5F544F4B454E7D2C48413D7B74797065';
wwv_flow_imp.g_varchar2_table(627) := '3A6F412E444153485F4D415443485F544F4B454E7D2C66413D7B747970653A6F412E494E434C5544455F4D415443485F544F4B454E7D2C70413D7B747970653A6F412E4C4546545F4355524C595F425241434B45545F544F4B454E7D2C4E413D7B747970';
wwv_flow_imp.g_varchar2_table(628) := '653A6F412E52494748545F4355524C595F425241434B45545F544F4B454E7D2C4B413D7B747970653A6F412E535542535452494E475F4D415443485F544F4B454E7D2C49413D7B747970653A6F412E4241445F55524C5F544F4B454E7D2C54413D7B7479';
wwv_flow_imp.g_varchar2_table(629) := '70653A6F412E4241445F535452494E475F544F4B454E7D2C6D413D7B747970653A6F412E43444F5F544F4B454E7D2C52413D7B747970653A6F412E4344435F544F4B454E7D2C4C413D7B747970653A6F412E434F4C4F4E5F544F4B454E7D2C4F413D7B74';
wwv_flow_imp.g_varchar2_table(630) := '7970653A6F412E53454D49434F4C4F4E5F544F4B454E7D2C44413D7B747970653A6F412E4C4546545F5351554152455F425241434B45545F544F4B454E7D2C62413D7B747970653A6F412E52494748545F5351554152455F425241434B45545F544F4B45';
wwv_flow_imp.g_varchar2_table(631) := '4E7D2C53413D7B747970653A6F412E574849544553504143455F544F4B454E7D2C4D413D7B747970653A6F412E454F465F544F4B454E7D2C76413D2879412E70726F746F747970652E77726974653D66756E6374696F6E2841297B746869732E5F76616C';
wwv_flow_imp.g_varchar2_table(632) := '75653D746869732E5F76616C75652E636F6E6361742863284129297D2C79412E70726F746F747970652E726561643D66756E6374696F6E28297B666F722876617220413D5B5D2C653D746869732E636F6E73756D65546F6B656E28293B65213D3D4D413B';
wwv_flow_imp.g_varchar2_table(633) := '29412E707573682865292C653D746869732E636F6E73756D65546F6B656E28293B72657475726E20417D2C79412E70726F746F747970652E636F6E73756D65546F6B656E3D66756E6374696F6E28297B76617220413D746869732E636F6E73756D65436F';
wwv_flow_imp.g_varchar2_table(634) := '6465506F696E7428293B7377697463682841297B636173652033343A72657475726E20746869732E636F6E73756D65537472696E67546F6B656E283334293B636173652033353A76617220653D746869732E7065656B436F6465506F696E742830292C74';
wwv_flow_imp.g_varchar2_table(635) := '3D746869732E7065656B436F6465506F696E742831292C723D746869732E7065656B436F6465506F696E742832293B69662875412865297C7C774128742C7229297B76617220423D554128652C742C72293F323A312C6E3D746869732E636F6E73756D65';
wwv_flow_imp.g_varchar2_table(636) := '4E616D6528293B72657475726E7B747970653A6F412E484153485F544F4B454E2C76616C75653A6E2C666C6167733A427D7D627265616B3B636173652033363A69662836313D3D3D746869732E7065656B436F6465506F696E742830292972657475726E';
wwv_flow_imp.g_varchar2_table(637) := '20746869732E636F6E73756D65436F6465506F696E7428292C68413B627265616B3B636173652033393A72657475726E20746869732E636F6E73756D65537472696E67546F6B656E283339293B636173652034303A72657475726E2043413B6361736520';
wwv_flow_imp.g_varchar2_table(638) := '34313A72657475726E2067413B636173652034323A69662836313D3D3D746869732E7065656B436F6465506F696E742830292972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C4B413B627265616B3B636173652034333A69';
wwv_flow_imp.g_varchar2_table(639) := '66286C4128412C746869732E7065656B436F6465506F696E742830292C746869732E7065656B436F6465506F696E74283129292972657475726E20746869732E7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654E75';
wwv_flow_imp.g_varchar2_table(640) := '6D65726963546F6B656E28293B627265616B3B636173652034343A72657475726E2045413B636173652034353A76617220423D412C733D746869732E7065656B436F6465506F696E742830292C6F3D746869732E7065656B436F6465506F696E74283129';
wwv_flow_imp.g_varchar2_table(641) := '3B6966286C4128422C732C6F292972657475726E20746869732E7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654E756D65726963546F6B656E28293B696628554128422C732C6F292972657475726E20746869732E';
wwv_flow_imp.g_varchar2_table(642) := '7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654964656E744C696B65546F6B656E28293B69662834353D3D3D73262636323D3D3D6F2972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C';
wwv_flow_imp.g_varchar2_table(643) := '746869732E636F6E73756D65436F6465506F696E7428292C52413B627265616B3B636173652034363A6966286C4128412C746869732E7065656B436F6465506F696E742830292C746869732E7065656B436F6465506F696E74283129292972657475726E';
wwv_flow_imp.g_varchar2_table(644) := '20746869732E7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654E756D65726963546F6B656E28293B627265616B3B636173652034373A69662834323D3D3D746869732E7065656B436F6465506F696E742830292966';
wwv_flow_imp.g_varchar2_table(645) := '6F7228746869732E636F6E73756D65436F6465506F696E7428293B3B297B76617220693D746869732E636F6E73756D65436F6465506F696E7428293B69662834323D3D3D69262634373D3D3D28693D746869732E636F6E73756D65436F6465506F696E74';
wwv_flow_imp.g_varchar2_table(646) := '2829292972657475726E20746869732E636F6E73756D65546F6B656E28293B6966282D313D3D3D692972657475726E20746869732E636F6E73756D65546F6B656E28297D627265616B3B636173652035383A72657475726E204C413B636173652035393A';
wwv_flow_imp.g_varchar2_table(647) := '72657475726E204F413B636173652036303A69662833333D3D3D746869732E7065656B436F6465506F696E74283029262634353D3D3D746869732E7065656B436F6465506F696E74283129262634353D3D3D746869732E7065656B436F6465506F696E74';
wwv_flow_imp.g_varchar2_table(648) := '2832292972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C746869732E636F6E73756D65436F6465506F696E7428292C6D413B627265616B3B636173652036343A76617220733D746869732E7065656B436F6465506F696E74';
wwv_flow_imp.g_varchar2_table(649) := '2830292C6F3D746869732E7065656B436F6465506F696E742831292C613D746869732E7065656B436F6465506F696E742832293B696628554128732C6F2C6129297B6E3D746869732E636F6E73756D654E616D6528293B72657475726E7B747970653A6F';
wwv_flow_imp.g_varchar2_table(650) := '412E41545F4B4559574F52445F544F4B454E2C76616C75653A6E7D7D627265616B3B636173652039313A72657475726E2044413B636173652039323A696628774128412C746869732E7065656B436F6465506F696E74283029292972657475726E207468';
wwv_flow_imp.g_varchar2_table(651) := '69732E7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654964656E744C696B65546F6B656E28293B627265616B3B636173652039333A72657475726E2062413B636173652036313A69662836313D3D3D746869732E70';
wwv_flow_imp.g_varchar2_table(652) := '65656B436F6465506F696E742830292972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C46413B627265616B3B63617365203132333A72657475726E2070413B63617365203132353A72657475726E204E413B636173652031';
wwv_flow_imp.g_varchar2_table(653) := '31373A636173652038353A613D746869732E7065656B436F6465506F696E742830292C6E3D746869732E7065656B436F6465506F696E742831293B72657475726E203433213D3D617C7C216141286E2926263633213D3D6E7C7C28746869732E636F6E73';
wwv_flow_imp.g_varchar2_table(654) := '756D65436F6465506F696E7428292C746869732E636F6E73756D65556E69636F646552616E6765546F6B656E2829292C746869732E7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654964656E744C696B65546F6B65';
wwv_flow_imp.g_varchar2_table(655) := '6E28293B63617365203132343A69662836313D3D3D746869732E7065656B436F6465506F696E742830292972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C48413B6966283132343D3D3D746869732E7065656B436F646550';
wwv_flow_imp.g_varchar2_table(656) := '6F696E742830292972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C64413B627265616B3B63617365203132363A69662836313D3D3D746869732E7065656B436F6465506F696E742830292972657475726E20746869732E63';
wwv_flow_imp.g_varchar2_table(657) := '6F6E73756D65436F6465506F696E7428292C66413B627265616B3B636173652D313A72657475726E204D417D72657475726E2063412841293F28746869732E636F6E73756D655768697465537061636528292C5341293A69412841293F28746869732E72';
wwv_flow_imp.g_varchar2_table(658) := '65636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654E756D65726963546F6B656E2829293A51412841293F28746869732E7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654964656E74';
wwv_flow_imp.g_varchar2_table(659) := '4C696B65546F6B656E2829293A7B747970653A6F412E44454C494D5F544F4B454E2C76616C75653A512841297D7D2C79412E70726F746F747970652E636F6E73756D65436F6465506F696E743D66756E6374696F6E28297B76617220413D746869732E5F';
wwv_flow_imp.g_varchar2_table(660) := '76616C75652E736869667428293B72657475726E20766F696420303D3D3D413F2D313A417D2C79412E70726F746F747970652E7265636F6E73756D65436F6465506F696E743D66756E6374696F6E2841297B746869732E5F76616C75652E756E73686966';
wwv_flow_imp.g_varchar2_table(661) := '742841297D2C79412E70726F746F747970652E7065656B436F6465506F696E743D66756E6374696F6E2841297B72657475726E20413E3D746869732E5F76616C75652E6C656E6774683F2D313A746869732E5F76616C75655B415D7D2C79412E70726F74';
wwv_flow_imp.g_varchar2_table(662) := '6F747970652E636F6E73756D65556E69636F646552616E6765546F6B656E3D66756E6374696F6E28297B666F722876617220413D5B5D2C653D746869732E636F6E73756D65436F6465506F696E7428293B61412865292626412E6C656E6774683C363B29';
wwv_flow_imp.g_varchar2_table(663) := '412E707573682865292C653D746869732E636F6E73756D65436F6465506F696E7428293B666F722876617220743D21313B36333D3D3D652626412E6C656E6774683C363B29412E707573682865292C653D746869732E636F6E73756D65436F6465506F69';
wwv_flow_imp.g_varchar2_table(664) := '6E7428292C743D21303B69662874297B76617220723D7061727365496E7428512E6170706C7928766F696420302C412E6D61702866756E6374696F6E2841297B72657475726E2036333D3D3D413F34383A417D29292C3136292C423D7061727365496E74';
wwv_flow_imp.g_varchar2_table(665) := '28512E6170706C7928766F696420302C412E6D61702866756E6374696F6E2841297B72657475726E2036333D3D3D413F37303A417D29292C3136293B72657475726E7B747970653A6F412E554E49434F44455F52414E47455F544F4B454E2C7374617274';
wwv_flow_imp.g_varchar2_table(666) := '3A722C656E643A427D7D723D7061727365496E7428512E6170706C7928766F696420302C41292C3136293B69662834353D3D3D746869732E7065656B436F6465506F696E742830292626614128746869732E7065656B436F6465506F696E742831292929';
wwv_flow_imp.g_varchar2_table(667) := '7B746869732E636F6E73756D65436F6465506F696E7428293B666F722876617220653D746869732E636F6E73756D65436F6465506F696E7428292C6E3D5B5D3B614128652926266E2E6C656E6774683C363B296E2E707573682865292C653D746869732E';
wwv_flow_imp.g_varchar2_table(668) := '636F6E73756D65436F6465506F696E7428293B423D7061727365496E7428512E6170706C7928766F696420302C6E292C3136293B72657475726E7B747970653A6F412E554E49434F44455F52414E47455F544F4B454E2C73746172743A722C656E643A42';
wwv_flow_imp.g_varchar2_table(669) := '7D7D72657475726E7B747970653A6F412E554E49434F44455F52414E47455F544F4B454E2C73746172743A722C656E643A727D7D2C79412E70726F746F747970652E636F6E73756D654964656E744C696B65546F6B656E3D66756E6374696F6E28297B76';
wwv_flow_imp.g_varchar2_table(670) := '617220413D746869732E636F6E73756D654E616D6528293B72657475726E2275726C223D3D3D412E746F4C6F776572436173652829262634303D3D3D746869732E7065656B436F6465506F696E742830293F28746869732E636F6E73756D65436F646550';
wwv_flow_imp.g_varchar2_table(671) := '6F696E7428292C746869732E636F6E73756D6555726C546F6B656E2829293A34303D3D3D746869732E7065656B436F6465506F696E742830293F28746869732E636F6E73756D65436F6465506F696E7428292C7B747970653A6F412E46554E4354494F4E';
wwv_flow_imp.g_varchar2_table(672) := '5F544F4B454E2C76616C75653A417D293A7B747970653A6F412E4944454E545F544F4B454E2C76616C75653A417D7D2C79412E70726F746F747970652E636F6E73756D6555726C546F6B656E3D66756E6374696F6E28297B76617220413D5B5D3B696628';
wwv_flow_imp.g_varchar2_table(673) := '746869732E636F6E73756D655768697465537061636528292C2D313D3D3D746869732E7065656B436F6465506F696E742830292972657475726E7B747970653A6F412E55524C5F544F4B454E2C76616C75653A22227D3B76617220652C743D746869732E';
wwv_flow_imp.g_varchar2_table(674) := '7065656B436F6465506F696E742830293B69662833393D3D3D747C7C33343D3D3D74297B743D746869732E636F6E73756D65537472696E67546F6B656E28746869732E636F6E73756D65436F6465506F696E742829293B72657475726E20742E74797065';
wwv_flow_imp.g_varchar2_table(675) := '3D3D3D6F412E535452494E475F544F4B454E262628746869732E636F6E73756D655768697465537061636528292C2D313D3D3D746869732E7065656B436F6465506F696E742830297C7C34313D3D3D746869732E7065656B436F6465506F696E74283029';
wwv_flow_imp.g_varchar2_table(676) := '293F28746869732E636F6E73756D65436F6465506F696E7428292C7B747970653A6F412E55524C5F544F4B454E2C76616C75653A742E76616C75657D293A28746869732E636F6E73756D6542616455726C52656D6E616E747328292C4941297D666F7228';
wwv_flow_imp.g_varchar2_table(677) := '3B3B297B76617220723D746869732E636F6E73756D65436F6465506F696E7428293B6966282D313D3D3D727C7C34313D3D3D722972657475726E7B747970653A6F412E55524C5F544F4B454E2C76616C75653A512E6170706C7928766F696420302C4129';
wwv_flow_imp.g_varchar2_table(678) := '7D3B69662863412872292972657475726E20746869732E636F6E73756D655768697465537061636528292C2D313D3D3D746869732E7065656B436F6465506F696E742830297C7C34313D3D3D746869732E7065656B436F6465506F696E742830293F2874';
wwv_flow_imp.g_varchar2_table(679) := '6869732E636F6E73756D65436F6465506F696E7428292C7B747970653A6F412E55524C5F544F4B454E2C76616C75653A512E6170706C7928766F696420302C41297D293A28746869732E636F6E73756D6542616455726C52656D6E616E747328292C4941';
wwv_flow_imp.g_varchar2_table(680) := '293B69662833343D3D3D727C7C33393D3D3D727C7C34303D3D3D727C7C28303C3D28653D72292626653C3D387C7C31313D3D3D657C7C31343C3D652626653C3D33317C7C3132373D3D3D65292972657475726E20746869732E636F6E73756D6542616455';
wwv_flow_imp.g_varchar2_table(681) := '726C52656D6E616E747328292C49413B69662839323D3D3D72297B69662821774128722C746869732E7065656B436F6465506F696E74283029292972657475726E20746869732E636F6E73756D6542616455726C52656D6E616E747328292C49413B412E';
wwv_flow_imp.g_varchar2_table(682) := '7075736828746869732E636F6E73756D6545736361706564436F6465506F696E742829297D656C736520412E707573682872297D7D2C79412E70726F746F747970652E636F6E73756D65576869746553706163653D66756E6374696F6E28297B666F7228';
wwv_flow_imp.g_varchar2_table(683) := '3B634128746869732E7065656B436F6465506F696E74283029293B29746869732E636F6E73756D65436F6465506F696E7428297D2C79412E70726F746F747970652E636F6E73756D6542616455726C52656D6E616E74733D66756E6374696F6E28297B66';
wwv_flow_imp.g_varchar2_table(684) := '6F72283B3B297B76617220413D746869732E636F6E73756D65436F6465506F696E7428293B69662834313D3D3D417C7C2D313D3D3D412972657475726E3B774128412C746869732E7065656B436F6465506F696E74283029292626746869732E636F6E73';
wwv_flow_imp.g_varchar2_table(685) := '756D6545736361706564436F6465506F696E7428297D7D2C79412E70726F746F747970652E636F6E73756D65537472696E67536C6963653D66756E6374696F6E2841297B666F722876617220653D22223B303C413B297B76617220743D4D6174682E6D69';
wwv_flow_imp.g_varchar2_table(686) := '6E283665342C41293B652B3D512E6170706C7928766F696420302C746869732E5F76616C75652E73706C69636528302C7429292C412D3D747D72657475726E20746869732E5F76616C75652E736869667428292C657D2C79412E70726F746F747970652E';
wwv_flow_imp.g_varchar2_table(687) := '636F6E73756D65537472696E67546F6B656E3D66756E6374696F6E2841297B666F722876617220653D22222C743D303B3B297B76617220722C423D746869732E5F76616C75655B745D3B6966282D313D3D3D427C7C766F696420303D3D3D427C7C423D3D';
wwv_flow_imp.g_varchar2_table(688) := '3D412972657475726E20652B3D746869732E636F6E73756D65537472696E67536C6963652874292C7B747970653A6F412E535452494E475F544F4B454E2C76616C75653A657D3B69662831303D3D3D422972657475726E20746869732E5F76616C75652E';
wwv_flow_imp.g_varchar2_table(689) := '73706C69636528302C74292C54413B3932213D3D427C7C2D31213D3D28723D746869732E5F76616C75655B742B315D292626766F69642030213D3D7226262831303D3D3D723F28652B3D746869732E636F6E73756D65537472696E67536C696365287429';
wwv_flow_imp.g_varchar2_table(690) := '2C743D2D312C746869732E5F76616C75652E73686966742829293A774128422C7229262628652B3D746869732E636F6E73756D65537472696E67536C6963652874292C652B3D5128746869732E636F6E73756D6545736361706564436F6465506F696E74';
wwv_flow_imp.g_varchar2_table(691) := '2829292C743D2D3129292C742B2B7D7D2C79412E70726F746F747970652E636F6E73756D654E756D6265723D66756E6374696F6E28297B76617220413D5B5D2C653D343B666F72283433213D3D28743D746869732E7065656B436F6465506F696E742830';
wwv_flow_imp.g_varchar2_table(692) := '292926263435213D3D747C7C412E7075736828746869732E636F6E73756D65436F6465506F696E742829293B694128746869732E7065656B436F6465506F696E74283029293B29412E7075736828746869732E636F6E73756D65436F6465506F696E7428';
wwv_flow_imp.g_varchar2_table(693) := '29293B76617220743D746869732E7065656B436F6465506F696E742830292C723D746869732E7065656B436F6465506F696E742831293B69662834363D3D3D742626694128722929666F7228412E7075736828746869732E636F6E73756D65436F646550';
wwv_flow_imp.g_varchar2_table(694) := '6F696E7428292C746869732E636F6E73756D65436F6465506F696E742829292C653D383B694128746869732E7065656B436F6465506F696E74283029293B29412E7075736828746869732E636F6E73756D65436F6465506F696E742829293B743D746869';
wwv_flow_imp.g_varchar2_table(695) := '732E7065656B436F6465506F696E742830293B76617220723D746869732E7065656B436F6465506F696E742831292C423D746869732E7065656B436F6465506F696E742832293B6966282836393D3D3D747C7C3130313D3D3D74292626282834333D3D3D';
wwv_flow_imp.g_varchar2_table(696) := '727C7C34353D3D3D7229262669412842297C7C69412872292929666F7228412E7075736828746869732E636F6E73756D65436F6465506F696E7428292C746869732E636F6E73756D65436F6465506F696E742829292C653D383B694128746869732E7065';
wwv_flow_imp.g_varchar2_table(697) := '656B436F6465506F696E74283029293B29412E7075736828746869732E636F6E73756D65436F6465506F696E742829293B72657475726E5B66756E6374696F6E2841297B76617220653D302C743D313B3433213D3D415B655D26263435213D3D415B655D';
wwv_flow_imp.g_varchar2_table(698) := '7C7C2834353D3D3D415B655D262628743D2D31292C652B2B293B666F722876617220723D5B5D3B694128415B655D293B29722E7075736828415B652B2B5D293B76617220423D722E6C656E6774683F7061727365496E7428512E6170706C7928766F6964';
wwv_flow_imp.g_varchar2_table(699) := '20302C72292C3130293A303B34363D3D3D415B655D2626652B2B3B666F7228766172206E3D5B5D3B694128415B655D293B296E2E7075736828415B652B2B5D293B76617220733D6E2E6C656E6774682C6F3D733F7061727365496E7428512E6170706C79';
wwv_flow_imp.g_varchar2_table(700) := '28766F696420302C6E292C3130293A303B3639213D3D415B655D2626313031213D3D415B655D7C7C652B2B3B76617220693D313B3433213D3D415B655D26263435213D3D415B655D7C7C2834353D3D3D415B655D262628693D2D31292C652B2B293B666F';
wwv_flow_imp.g_varchar2_table(701) := '722876617220613D5B5D3B694128415B655D293B29612E7075736828415B652B2B5D293B76617220633D612E6C656E6774683F7061727365496E7428512E6170706C7928766F696420302C61292C3130293A303B72657475726E20742A28422B6F2A4D61';
wwv_flow_imp.g_varchar2_table(702) := '74682E706F772831302C2D7329292A4D6174682E706F772831302C692A63297D2841292C655D7D2C79412E70726F746F747970652E636F6E73756D654E756D65726963546F6B656E3D66756E6374696F6E28297B76617220413D746869732E636F6E7375';
wwv_flow_imp.g_varchar2_table(703) := '6D654E756D62657228292C653D415B305D2C743D415B315D2C723D746869732E7065656B436F6465506F696E742830292C423D746869732E7065656B436F6465506F696E742831292C413D746869732E7065656B436F6465506F696E742832293B696628';
wwv_flow_imp.g_varchar2_table(704) := '554128722C422C4129297B413D746869732E636F6E73756D654E616D6528293B72657475726E7B747970653A6F412E44494D454E53494F4E5F544F4B454E2C6E756D6265723A652C666C6167733A742C756E69743A417D7D72657475726E2033373D3D3D';
wwv_flow_imp.g_varchar2_table(705) := '723F28746869732E636F6E73756D65436F6465506F696E7428292C7B747970653A6F412E50455243454E544147455F544F4B454E2C6E756D6265723A652C666C6167733A747D293A7B747970653A6F412E4E554D4245525F544F4B454E2C6E756D626572';
wwv_flow_imp.g_varchar2_table(706) := '3A652C666C6167733A747D7D2C79412E70726F746F747970652E636F6E73756D6545736361706564436F6465506F696E743D66756E6374696F6E28297B76617220412C653D746869732E636F6E73756D65436F6465506F696E7428293B69662861412865';
wwv_flow_imp.g_varchar2_table(707) := '29297B666F722876617220743D512865293B614128746869732E7065656B436F6465506F696E74283029292626742E6C656E6774683C363B29742B3D5128746869732E636F6E73756D65436F6465506F696E742829293B634128746869732E7065656B43';
wwv_flow_imp.g_varchar2_table(708) := '6F6465506F696E74283029292626746869732E636F6E73756D65436F6465506F696E7428293B76617220723D7061727365496E7428742C3136293B72657475726E20303D3D3D727C7C35353239363C3D28413D72292626413C3D35373334337C7C313131';
wwv_flow_imp.g_varchar2_table(709) := '343131313C723F36353533333A727D72657475726E2D313D3D3D653F36353533333A657D2C79412E70726F746F747970652E636F6E73756D654E616D653D66756E6374696F6E28297B666F722876617220413D22223B3B297B76617220653D746869732E';
wwv_flow_imp.g_varchar2_table(710) := '636F6E73756D65436F6465506F696E7428293B696628754128652929412B3D512865293B656C73657B69662821774128652C746869732E7065656B436F6465506F696E74283029292972657475726E20746869732E7265636F6E73756D65436F6465506F';
wwv_flow_imp.g_varchar2_table(711) := '696E742865292C413B412B3D5128746869732E636F6E73756D6545736361706564436F6465506F696E742829297D7D7D2C7941293B66756E6374696F6E20794128297B746869732E5F76616C75653D5B5D7D766172205F413D2878412E6372656174653D';
wwv_flow_imp.g_varchar2_table(712) := '66756E6374696F6E2841297B76617220653D6E65772076413B72657475726E20652E77726974652841292C6E657720784128652E726561642829297D2C78412E706172736556616C75653D66756E6374696F6E2841297B72657475726E2078412E637265';
wwv_flow_imp.g_varchar2_table(713) := '6174652841292E7061727365436F6D706F6E656E7456616C756528297D2C78412E706172736556616C7565733D66756E6374696F6E2841297B72657475726E2078412E6372656174652841292E7061727365436F6D706F6E656E7456616C75657328297D';
wwv_flow_imp.g_varchar2_table(714) := '2C78412E70726F746F747970652E7061727365436F6D706F6E656E7456616C75653D66756E6374696F6E28297B666F722876617220413D746869732E636F6E73756D65546F6B656E28293B412E747970653D3D3D6F412E574849544553504143455F544F';
wwv_flow_imp.g_varchar2_table(715) := '4B454E3B29413D746869732E636F6E73756D65546F6B656E28293B696628412E747970653D3D3D6F412E454F465F544F4B454E297468726F77206E65772053796E7461784572726F7228224572726F722070617273696E672043535320636F6D706F6E65';
wwv_flow_imp.g_varchar2_table(716) := '6E742076616C75652C20756E657870656374656420454F4622293B746869732E7265636F6E73756D65546F6B656E2841293B666F722876617220653D746869732E636F6E73756D65436F6D706F6E656E7456616C756528293B28413D746869732E636F6E';
wwv_flow_imp.g_varchar2_table(717) := '73756D65546F6B656E2829292E747970653D3D3D6F412E574849544553504143455F544F4B454E3B293B696628412E747970653D3D3D6F412E454F465F544F4B454E2972657475726E20653B7468726F77206E65772053796E7461784572726F72282245';
wwv_flow_imp.g_varchar2_table(718) := '72726F722070617273696E672043535320636F6D706F6E656E742076616C75652C206D756C7469706C652076616C75657320666F756E64207768656E20657870656374696E67206F6E6C79206F6E6522297D2C78412E70726F746F747970652E70617273';
wwv_flow_imp.g_varchar2_table(719) := '65436F6D706F6E656E7456616C7565733D66756E6374696F6E28297B666F722876617220413D5B5D3B3B297B76617220653D746869732E636F6E73756D65436F6D706F6E656E7456616C756528293B696628652E747970653D3D3D6F412E454F465F544F';
wwv_flow_imp.g_varchar2_table(720) := '4B454E2972657475726E20413B412E707573682865292C412E7075736828297D7D2C78412E70726F746F747970652E636F6E73756D65436F6D706F6E656E7456616C75653D66756E6374696F6E28297B76617220413D746869732E636F6E73756D65546F';
wwv_flow_imp.g_varchar2_table(721) := '6B656E28293B73776974636828412E74797065297B63617365206F412E4C4546545F4355524C595F425241434B45545F544F4B454E3A63617365206F412E4C4546545F5351554152455F425241434B45545F544F4B454E3A63617365206F412E4C454654';
wwv_flow_imp.g_varchar2_table(722) := '5F504152454E5448455349535F544F4B454E3A72657475726E20746869732E636F6E73756D6553696D706C65426C6F636B28412E74797065293B63617365206F412E46554E4354494F4E5F544F4B454E3A72657475726E20746869732E636F6E73756D65';
wwv_flow_imp.g_varchar2_table(723) := '46756E6374696F6E2841297D72657475726E20417D2C78412E70726F746F747970652E636F6E73756D6553696D706C65426C6F636B3D66756E6374696F6E2841297B666F722876617220653D7B747970653A412C76616C7565733A5B5D7D2C743D746869';
wwv_flow_imp.g_varchar2_table(724) := '732E636F6E73756D65546F6B656E28293B3B297B696628742E747970653D3D3D6F412E454F465F544F4B454E7C7C426528742C41292972657475726E20653B746869732E7265636F6E73756D65546F6B656E2874292C652E76616C7565732E7075736828';
wwv_flow_imp.g_varchar2_table(725) := '746869732E636F6E73756D65436F6D706F6E656E7456616C75652829292C743D746869732E636F6E73756D65546F6B656E28297D7D2C78412E70726F746F747970652E636F6E73756D6546756E6374696F6E3D66756E6374696F6E2841297B666F722876';
wwv_flow_imp.g_varchar2_table(726) := '617220653D7B6E616D653A412E76616C75652C76616C7565733A5B5D2C747970653A6F412E46554E4354494F4E7D3B3B297B76617220743D746869732E636F6E73756D65546F6B656E28293B696628742E747970653D3D3D6F412E454F465F544F4B454E';
wwv_flow_imp.g_varchar2_table(727) := '7C7C742E747970653D3D3D6F412E52494748545F504152454E5448455349535F544F4B454E2972657475726E20653B746869732E7265636F6E73756D65546F6B656E2874292C652E76616C7565732E7075736828746869732E636F6E73756D65436F6D70';
wwv_flow_imp.g_varchar2_table(728) := '6F6E656E7456616C75652829297D7D2C78412E70726F746F747970652E636F6E73756D65546F6B656E3D66756E6374696F6E28297B76617220413D746869732E5F746F6B656E732E736869667428293B72657475726E20766F696420303D3D3D413F4D41';
wwv_flow_imp.g_varchar2_table(729) := '3A417D2C78412E70726F746F747970652E7265636F6E73756D65546F6B656E3D66756E6374696F6E2841297B746869732E5F746F6B656E732E756E73686966742841297D2C7841293B66756E6374696F6E2078412841297B746869732E5F746F6B656E73';
wwv_flow_imp.g_varchar2_table(730) := '3D417D66756E6374696F6E2050412841297B72657475726E20412E747970653D3D3D6F412E44494D454E53494F4E5F544F4B454E7D66756E6374696F6E2056412841297B72657475726E20412E747970653D3D3D6F412E4E554D4245525F544F4B454E7D';
wwv_flow_imp.g_varchar2_table(731) := '66756E6374696F6E207A412841297B72657475726E20412E747970653D3D3D6F412E4944454E545F544F4B454E7D66756E6374696F6E2058412841297B72657475726E20412E747970653D3D3D6F412E535452494E475F544F4B454E7D66756E6374696F';
wwv_flow_imp.g_varchar2_table(732) := '6E20474128412C65297B72657475726E207A412841292626412E76616C75653D3D3D657D66756E6374696F6E204A412841297B72657475726E20412E74797065213D3D6F412E574849544553504143455F544F4B454E7D66756E6374696F6E206B412841';
wwv_flow_imp.g_varchar2_table(733) := '297B72657475726E20412E74797065213D3D6F412E574849544553504143455F544F4B454E2626412E74797065213D3D6F412E434F4D4D415F544F4B454E7D66756E6374696F6E2057412841297B76617220653D5B5D2C743D5B5D3B72657475726E2041';
wwv_flow_imp.g_varchar2_table(734) := '2E666F72456163682866756E6374696F6E2841297B696628412E747970653D3D3D6F412E434F4D4D415F544F4B454E297B696628303D3D3D742E6C656E677468297468726F77206E6577204572726F7228224572726F722070617273696E672066756E63';
wwv_flow_imp.g_varchar2_table(735) := '74696F6E20617267732C207A65726F20746F6B656E7320666F722061726722293B72657475726E20652E707573682874292C766F696428743D5B5D297D412E74797065213D3D6F412E574849544553504143455F544F4B454E2626742E70757368284129';
wwv_flow_imp.g_varchar2_table(736) := '7D292C742E6C656E6774682626652E707573682874292C657D66756E6374696F6E2059412841297B72657475726E20412E747970653D3D3D6F412E4E554D4245525F544F4B454E7C7C412E747970653D3D3D6F412E44494D454E53494F4E5F544F4B454E';
wwv_flow_imp.g_varchar2_table(737) := '7D66756E6374696F6E2071412841297B72657475726E20412E747970653D3D3D6F412E50455243454E544147455F544F4B454E7C7C59412841297D66756E6374696F6E205A412841297B72657475726E20313C412E6C656E6774683F5B415B305D2C415B';
wwv_flow_imp.g_varchar2_table(738) := '315D5D3A5B415B305D5D7D66756E6374696F6E206A4128412C652C74297B76617220723D415B305D2C413D415B315D3B72657475726E5B696528722C65292C696528766F69642030213D3D413F413A722C74295D7D66756E6374696F6E2024412841297B';
wwv_flow_imp.g_varchar2_table(739) := '72657475726E20412E747970653D3D3D6F412E44494D454E53494F4E5F544F4B454E26262822646567223D3D3D412E756E69747C7C2267726164223D3D3D412E756E69747C7C22726164223D3D3D412E756E69747C7C227475726E223D3D3D412E756E69';
wwv_flow_imp.g_varchar2_table(740) := '74297D66756E6374696F6E2041652841297B73776974636828412E66696C746572287A41292E6D61702866756E6374696F6E2841297B72657475726E20412E76616C75657D292E6A6F696E2822202229297B6361736522746F20626F74746F6D20726967';
wwv_flow_imp.g_varchar2_table(741) := '6874223A6361736522746F20726967687420626F74746F6D223A63617365226C65667420746F70223A6361736522746F70206C656674223A72657475726E5B6E652C6E655D3B6361736522746F20746F70223A6361736522626F74746F6D223A72657475';
wwv_flow_imp.g_varchar2_table(742) := '726E2063652830293B6361736522746F20626F74746F6D206C656674223A6361736522746F206C65667420626F74746F6D223A6361736522726967687420746F70223A6361736522746F70207269676874223A72657475726E5B6E652C6F655D3B636173';
wwv_flow_imp.g_varchar2_table(743) := '6522746F207269676874223A63617365226C656674223A72657475726E206365283930293B6361736522746F20746F70206C656674223A6361736522746F206C65667420746F70223A6361736522726967687420626F74746F6D223A6361736522626F74';
wwv_flow_imp.g_varchar2_table(744) := '746F6D207269676874223A72657475726E5B6F652C6F655D3B6361736522746F20626F74746F6D223A6361736522746F70223A72657475726E20636528313830293B6361736522746F20746F70207269676874223A6361736522746F2072696768742074';
wwv_flow_imp.g_varchar2_table(745) := '6F70223A63617365226C65667420626F74746F6D223A6361736522626F74746F6D206C656674223A72657475726E5B6F652C6E655D3B6361736522746F206C656674223A63617365227269676874223A72657475726E20636528323730297D7265747572';
wwv_flow_imp.g_varchar2_table(746) := '6E20307D66756E6374696F6E2065652841297B72657475726E20303D3D283235352641297D66756E6374696F6E2074652841297B76617220653D32353526412C743D32353526413E3E382C723D32353526413E3E31362C413D32353526413E3E32343B72';
wwv_flow_imp.g_varchar2_table(747) := '657475726E20653C3235353F227267626128222B412B222C222B722B222C222B742B222C222B652F3235352B2229223A2272676228222B412B222C222B722B222C222B742B2229227D66756E6374696F6E20726528412C65297B696628412E747970653D';
wwv_flow_imp.g_varchar2_table(748) := '3D3D6F412E4E554D4245525F544F4B454E2972657475726E20412E6E756D6265723B696628412E74797065213D3D6F412E50455243454E544147455F544F4B454E2972657475726E20303B76617220743D333D3D3D653F313A3235353B72657475726E20';
wwv_flow_imp.g_varchar2_table(749) := '333D3D3D653F412E6E756D6265722F3130302A743A4D6174682E726F756E6428412E6E756D6265722F3130302A74297D7661722042653D66756E6374696F6E28412C65297B72657475726E20653D3D3D6F412E4C4546545F4355524C595F425241434B45';
wwv_flow_imp.g_varchar2_table(750) := '545F544F4B454E2626412E747970653D3D3D6F412E52494748545F4355524C595F425241434B45545F544F4B454E7C7C28653D3D3D6F412E4C4546545F5351554152455F425241434B45545F544F4B454E2626412E747970653D3D3D6F412E5249474854';
wwv_flow_imp.g_varchar2_table(751) := '5F5351554152455F425241434B45545F544F4B454E7C7C653D3D3D6F412E4C4546545F504152454E5448455349535F544F4B454E2626412E747970653D3D3D6F412E52494748545F504152454E5448455349535F544F4B454E297D2C6E653D7B74797065';
wwv_flow_imp.g_varchar2_table(752) := '3A6F412E4E554D4245525F544F4B454E2C6E756D6265723A302C666C6167733A347D2C73653D7B747970653A6F412E50455243454E544147455F544F4B454E2C6E756D6265723A35302C666C6167733A347D2C6F653D7B747970653A6F412E5045524345';
wwv_flow_imp.g_varchar2_table(753) := '4E544147455F544F4B454E2C6E756D6265723A3130302C666C6167733A347D2C69653D66756E6374696F6E28412C65297B696628412E747970653D3D3D6F412E50455243454E544147455F544F4B454E2972657475726E20412E6E756D6265722F313030';
wwv_flow_imp.g_varchar2_table(754) := '2A653B69662850412841292973776974636828412E756E6974297B636173652272656D223A6361736522656D223A72657475726E2031362A412E6E756D6265723B64656661756C743A72657475726E20412E6E756D6265727D72657475726E20412E6E75';
wwv_flow_imp.g_varchar2_table(755) := '6D6265727D2C61653D66756E6374696F6E2841297B696628412E747970653D3D3D6F412E44494D454E53494F4E5F544F4B454E2973776974636828412E756E6974297B6361736522646567223A72657475726E204D6174682E50492A412E6E756D626572';
wwv_flow_imp.g_varchar2_table(756) := '2F3138303B636173652267726164223A72657475726E204D6174682E50492F3230302A412E6E756D6265723B6361736522726164223A72657475726E20412E6E756D6265723B63617365227475726E223A72657475726E20322A4D6174682E50492A412E';
wwv_flow_imp.g_varchar2_table(757) := '6E756D6265727D7468726F77206E6577204572726F722822556E737570706F7274656420616E676C65207479706522297D2C63653D66756E6374696F6E2841297B72657475726E204D6174682E50492A412F3138307D2C51653D66756E6374696F6E2841';
wwv_flow_imp.g_varchar2_table(758) := '297B696628412E747970653D3D3D6F412E46554E4354494F4E297B76617220653D45655B412E6E616D655D3B696628766F696420303D3D3D65297468726F77206E6577204572726F722827417474656D7074696E6720746F20706172736520616E20756E';
wwv_flow_imp.g_varchar2_table(759) := '737570706F7274656420636F6C6F722066756E6374696F6E2022272B412E6E616D652B272227293B72657475726E206528412E76616C756573297D696628412E747970653D3D3D6F412E484153485F544F4B454E297B696628333D3D3D412E76616C7565';
wwv_flow_imp.g_varchar2_table(760) := '2E6C656E677468297B76617220743D412E76616C75652E737562737472696E6728302C31292C723D412E76616C75652E737562737472696E6728312C32292C423D412E76616C75652E737562737472696E6728322C33293B72657475726E207565287061';
wwv_flow_imp.g_varchar2_table(761) := '727365496E7428742B742C3136292C7061727365496E7428722B722C3136292C7061727365496E7428422B422C3136292C31297D696628343D3D3D412E76616C75652E6C656E677468297B76617220743D412E76616C75652E737562737472696E672830';
wwv_flow_imp.g_varchar2_table(762) := '2C31292C723D412E76616C75652E737562737472696E6728312C32292C423D412E76616C75652E737562737472696E6728322C33292C6E3D412E76616C75652E737562737472696E6728332C34293B72657475726E207565287061727365496E7428742B';
wwv_flow_imp.g_varchar2_table(763) := '742C3136292C7061727365496E7428722B722C3136292C7061727365496E7428422B422C3136292C7061727365496E74286E2B6E2C3136292F323535297D696628363D3D3D412E76616C75652E6C656E677468297B743D412E76616C75652E7375627374';
wwv_flow_imp.g_varchar2_table(764) := '72696E6728302C32292C723D412E76616C75652E737562737472696E6728322C34292C423D412E76616C75652E737562737472696E6728342C36293B72657475726E207565287061727365496E7428742C3136292C7061727365496E7428722C3136292C';
wwv_flow_imp.g_varchar2_table(765) := '7061727365496E7428422C3136292C31297D696628383D3D3D412E76616C75652E6C656E677468297B743D412E76616C75652E737562737472696E6728302C32292C723D412E76616C75652E737562737472696E6728322C34292C423D412E76616C7565';
wwv_flow_imp.g_varchar2_table(766) := '2E737562737472696E6728342C36292C6E3D412E76616C75652E737562737472696E6728362C38293B72657475726E207565287061727365496E7428742C3136292C7061727365496E7428722C3136292C7061727365496E7428422C3136292C70617273';
wwv_flow_imp.g_varchar2_table(767) := '65496E74286E2C3136292F323535297D7D696628412E747970653D3D3D6F412E4944454E545F544F4B454E297B413D68655B412E76616C75652E746F55707065724361736528295D3B696628766F69642030213D3D412972657475726E20417D72657475';
wwv_flow_imp.g_varchar2_table(768) := '726E2068652E5452414E53504152454E547D2C75653D66756E6374696F6E28412C652C742C72297B72657475726E28413C3C32347C653C3C31367C743C3C387C4D6174682E726F756E64283235352A72293C3C30293E3E3E307D2C77653D66756E637469';
wwv_flow_imp.g_varchar2_table(769) := '6F6E2841297B413D412E66696C746572286B41293B696628333D3D3D412E6C656E677468297B76617220653D412E6D6170287265292C743D655B305D2C723D655B315D2C653D655B325D3B72657475726E20756528742C722C652C31297D69662834213D';
wwv_flow_imp.g_varchar2_table(770) := '3D412E6C656E6774682972657475726E20303B413D412E6D6170287265292C743D415B305D2C723D415B315D2C653D415B325D2C413D415B335D3B72657475726E20756528742C722C652C41297D3B66756E6374696F6E20556528412C652C74297B7265';
wwv_flow_imp.g_varchar2_table(771) := '7475726E20743C30262628742B3D31292C313C3D7426262D2D742C743C312F363F28652D41292A742A362B413A743C2E353F653A743C322F333F362A28652D41292A28322F332D74292B413A417D766172206C652C43652C67653D66756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(772) := '41297B76617220653D412E66696C746572286B41292C743D655B305D2C723D655B315D2C423D655B325D2C6E3D655B335D2C413D28742E747970653D3D3D6F412E4E554D4245525F544F4B454E3F636528742E6E756D626572293A6165287429292F2832';
wwv_flow_imp.g_varchar2_table(773) := '2A4D6174682E5049292C653D71412872293F722E6E756D6265722F3130303A302C743D71412842293F422E6E756D6265722F3130303A302C723D766F69642030213D3D6E26267141286E293F6965286E2C31293A313B696628303D3D652972657475726E';
wwv_flow_imp.g_varchar2_table(774) := '207565283235352A742C3235352A742C3235352A742C31293B423D743C3D2E353F742A28312B65293A742B652D742A652C6E3D322A742D422C653D5565286E2C422C412B312F33292C743D5565286E2C422C41292C413D5565286E2C422C412D312F3329';
wwv_flow_imp.g_varchar2_table(775) := '3B72657475726E207565283235352A652C3235352A742C3235352A412C72297D2C45653D7B68736C3A67652C68736C613A67652C7267623A77652C726762613A77657D2C68653D7B414C494345424C55453A343034323835303330332C414E5449515545';
wwv_flow_imp.g_varchar2_table(776) := '57484954453A343230393736303235352C415155413A31363737373231352C415155414D4152494E453A323134373437323633392C415A5552453A343034333330393035352C42454947453A343132363533303831352C4249535155453A343239333138';
wwv_flow_imp.g_varchar2_table(777) := '323731392C424C41434B3A3235352C424C414E43484544414C4D4F4E443A343239333634333737352C424C55453A36353533352C424C554556494F4C45543A323331383133313936372C42524F574E3A323737313030343135392C4255524C59574F4F44';
wwv_flow_imp.g_varchar2_table(778) := '3A333733363633353339312C4341444554424C55453A313630343233313432332C434841525452455553453A323134373431383336372C43484F434F4C4154453A333533303130343537352C434F52414C3A343238363533333838372C434F524E464C4F';
wwv_flow_imp.g_varchar2_table(779) := '574552424C55453A313638373534373339312C434F524E53494C4B3A343239343439393538332C4352494D534F4E3A333639323331333835352C4359414E3A31363737373231352C4441524B424C55453A33353833392C4441524B4359414E3A39313435';
wwv_flow_imp.g_varchar2_table(780) := '3334332C4441524B474F4C44454E524F443A333039353833373639352C4441524B475241593A323834363436383630372C4441524B475245454E3A363535333835352C4441524B475245593A323834363436383630372C4441524B4B48414B493A333138';
wwv_flow_imp.g_varchar2_table(781) := '323931343535392C4441524B4D4147454E54413A323333323036383836332C4441524B4F4C495645475245454E3A313433333038373939392C4441524B4F52414E47453A343238373336353337352C4441524B4F52434849443A32353730323433333237';
wwv_flow_imp.g_varchar2_table(782) := '2C4441524B5245443A323333323033333237392C4441524B53414C4D4F4E3A333931383935333231352C4441524B534541475245454E3A323431313439393531392C4441524B534C415445424C55453A313231313939333038372C4441524B534C415445';
wwv_flow_imp.g_varchar2_table(783) := '475241593A3739333732363937352C4441524B534C415445475245593A3739333732363937352C4441524B54555251554F4953453A31333535343137352C4441524B56494F4C45543A323438333038323233392C4445455050494E4B3A34323739353338';
wwv_flow_imp.g_varchar2_table(784) := '3638372C44454550534B59424C55453A31323538323931312C44494D475241593A313736383531363039352C44494D475245593A313736383531363039352C444F44474552424C55453A3531323831393139392C46495245425249434B3A323938383538';
wwv_flow_imp.g_varchar2_table(785) := '313633312C464C4F52414C57484954453A343239343633353737352C464F52455354475245454E3A3537393534333830372C465543485349413A343237383235353631352C4741494E53424F524F3A333730353436323031352C47484F53545748495445';
wwv_flow_imp.g_varchar2_table(786) := '3A343137373036383033312C474F4C443A343239323238303537352C474F4C44454E524F443A333636383235343937352C475241593A323135353930353237392C475245454E3A383338383836332C475245454E59454C4C4F573A323931393138323333';
wwv_flow_imp.g_varchar2_table(787) := '352C475245593A323135353930353237392C484F4E45594445573A343034333330353231352C484F5450494E4B3A343238353131373639352C494E4449414E5245443A333434353338323339392C494E4449474F3A313235383332343733352C49564F52';
wwv_flow_imp.g_varchar2_table(788) := '593A343239343936333435352C4B48414B493A343034313634313231352C4C4156454E4445523A333837333839373231352C4C4156454E444552424C5553483A343239333938313639352C4C41574E475245454E3A323039363839303131312C4C454D4F';
wwv_flow_imp.g_varchar2_table(789) := '4E43484946464F4E3A343239343632363831352C4C49474854424C55453A323931363637333237392C4C49474854434F52414C3A343033343935333437312C4C494748544359414E3A333737343837333539392C4C49474854474F4C44454E524F445945';
wwv_flow_imp.g_varchar2_table(790) := '4C4C4F573A343231303734323031352C4C49474854475241593A333535333837343934332C4C49474854475245454E3A323433313535333739312C4C49474854475245593A333535333837343934332C4C4947485450494E4B3A34323930313637323935';
wwv_flow_imp.g_varchar2_table(791) := '2C4C4947485453414C4D4F4E3A343238383730373332372C4C49474854534541475245454E3A3534383538303039352C4C49474854534B59424C55453A323237383438383833312C4C49474854534C415445475241593A323030353434313032332C4C49';
wwv_flow_imp.g_varchar2_table(792) := '474854534C415445475245593A323030353434313032332C4C49474854535445454C424C55453A323936353639323135392C4C4947485459454C4C4F573A343239343935393335392C4C494D453A31363731313933352C4C494D45475245454E3A383532';
wwv_flow_imp.g_varchar2_table(793) := '3330383733352C4C494E454E3A343231303039313737352C4D4147454E54413A343237383235353631352C4D41524F4F4E3A323134373438333930332C4D454449554D415155414D4152494E453A313732343735343638372C4D454449554D424C55453A';
wwv_flow_imp.g_varchar2_table(794) := '35323733352C4D454449554D4F52434849443A333132363138373030372C4D454449554D505552504C453A323437333634373130332C4D454449554D534541475245454E3A313031383339333038372C4D454449554D534C415445424C55453A32303730';
wwv_flow_imp.g_varchar2_table(795) := '3437343439352C4D454449554D535052494E47475245454E3A31363432333637392C4D454449554D54555251554F4953453A313232313730393035352C4D454449554D56494F4C45545245443A333334303037363534332C4D49444E49474854424C5545';
wwv_flow_imp.g_varchar2_table(796) := '3A3432313039373732372C4D494E54435245414D3A343132373139333835352C4D49535459524F53453A343239333139303134332C4D4F43434153494E3A343239333137383837392C4E4156414A4F57484954453A343239323738333631352C4E415659';
wwv_flow_imp.g_varchar2_table(797) := '3A33333032332C4F4C444C4143453A343236303735313130332C4F4C4956453A323135353837323531312C4F4C495645445241423A313830343437373433392C4F52414E47453A343238393030333737352C4F52414E47455245443A3432383237313233';
wwv_flow_imp.g_varchar2_table(798) := '31392C4F52434849443A333636343832383135392C50414C45474F4C44454E524F443A343030383232353533352C50414C45475245454E3A323536363632353533352C50414C4554555251554F4953453A323935313637313535312C50414C4556494F4C';
wwv_flow_imp.g_varchar2_table(799) := '45545245443A333638313538383232332C504150415941574849503A343239333930373936372C5045414348505546463A343239323532343534332C504552553A333434383036313935312C50494E4B3A343239303832353231352C504C554D3A333731';
wwv_flow_imp.g_varchar2_table(800) := '383330373332372C504F57444552424C55453A323936373532393231352C505552504C453A323134373531363637312C52454245434341505552504C453A313731343635373739312C5245443A343237383139303333352C524F535942524F574E3A3331';
wwv_flow_imp.g_varchar2_table(801) := '36333532353131392C524F59414C424C55453A313039373435383137352C534144444C4542524F574E3A323333363536303132372C53414C4D4F4E3A343230323732323034372C53414E445942524F574E3A343130343431333433392C53454147524545';
wwv_flow_imp.g_varchar2_table(802) := '4E3A3738303838333936372C5345415348454C4C3A343239343330373538332C5349454E4E413A323638393734303238372C53494C5645523A333233333835373739312C534B59424C55453A323237383438343939312C534C415445424C55453A313738';
wwv_flow_imp.g_varchar2_table(803) := '343333353837312C534C415445475241593A313838373437333931392C534C415445475245593A313838373437333931392C534E4F573A343239343633383333352C535052494E47475245454E3A31363734343434372C535445454C424C55453A313138';
wwv_flow_imp.g_varchar2_table(804) := '323937313133352C54414E3A333533353034373933352C5445414C3A383432313633312C54484953544C453A333633363435313538332C544F4D41544F3A343238343639363537352C5452414E53504152454E543A302C54555251554F4953453A313038';
wwv_flow_imp.g_varchar2_table(805) := '383437353339312C56494F4C45543A343030313535383237312C57484541543A343132353031323939312C57484954453A343239343936373239352C5748495445534D4F4B453A343132363533373231352C59454C4C4F573A343239343930323031352C';
wwv_flow_imp.g_varchar2_table(806) := '59454C4C4F57475245454E3A323539373133393139397D3B286A653D6C653D6C657C7C7B7D295B6A652E56414C55453D305D3D2256414C5545222C6A655B6A652E4C4953543D315D3D224C495354222C6A655B6A652E4944454E545F56414C55453D325D';
wwv_flow_imp.g_varchar2_table(807) := '3D224944454E545F56414C5545222C6A655B6A652E545950455F56414C55453D335D3D22545950455F56414C5545222C6A655B6A652E544F4B454E5F56414C55453D345D3D22544F4B454E5F56414C5545222C2867653D43653D43657C7C7B7D295B6765';
wwv_flow_imp.g_varchar2_table(808) := '2E424F524445525F424F583D305D3D22424F524445525F424F58222C67655B67652E50414444494E475F424F583D315D3D2250414444494E475F424F58223B66756E6374696F6E2046652841297B76617220653D516528415B305D293B72657475726E28';
wwv_flow_imp.g_varchar2_table(809) := '413D415B315D29262671412841293F7B636F6C6F723A652C73746F703A417D3A7B636F6C6F723A652C73746F703A6E756C6C7D7D66756E6374696F6E20646528412C74297B76617220653D415B305D2C723D415B412E6C656E6774682D315D3B6E756C6C';
wwv_flow_imp.g_varchar2_table(810) := '3D3D3D652E73746F70262628652E73746F703D6E65292C6E756C6C3D3D3D722E73746F70262628722E73746F703D6F65293B666F722876617220423D5B5D2C6E3D302C733D303B733C412E6C656E6774683B732B2B297B766172206F3D415B735D2E7374';
wwv_flow_imp.g_varchar2_table(811) := '6F703B6E756C6C213D3D6F3F286E3C286F3D6965286F2C7429293F422E70757368286F293A422E70757368286E292C6E3D6F293A422E70757368286E756C6C297D666F722876617220693D6E756C6C2C733D303B733C422E6C656E6774683B732B2B297B';
wwv_flow_imp.g_varchar2_table(812) := '76617220613D425B735D3B6966286E756C6C3D3D3D61296E756C6C3D3D3D69262628693D73293B656C7365206966286E756C6C213D3D69297B666F722876617220633D732D692C513D28612D425B692D315D292F28312B63292C753D313B753C3D633B75';
wwv_flow_imp.g_varchar2_table(813) := '2B2B29425B692B752D315D3D512A753B693D6E756C6C7D7D72657475726E20412E6D61702866756E6374696F6E28412C65297B72657475726E7B636F6C6F723A412E636F6C6F722C73746F703A4D6174682E6D6178284D6174682E6D696E28312C425B65';
wwv_flow_imp.g_varchar2_table(814) := '5D2F74292C30297D7D297D66756E6374696F6E20486528412C652C74297B76617220723D226E756D626572223D3D747970656F6620413F413A28733D652F322C723D286E3D74292F322C733D69652828423D41295B305D2C65292D732C6E3D722D696528';
wwv_flow_imp.g_varchar2_table(815) := '425B315D2C6E292C284D6174682E6174616E32286E2C73292B322A4D6174682E5049292528322A4D6174682E504929292C423D4D6174682E61627328652A4D6174682E73696E287229292B4D6174682E61627328742A4D6174682E636F73287229292C6E';
wwv_flow_imp.g_varchar2_table(816) := '3D652F322C733D742F322C653D422F322C743D4D6174682E73696E28722D4D6174682E50492F32292A652C653D4D6174682E636F7328722D4D6174682E50492F32292A653B72657475726E5B422C6E2D652C6E2B652C732D742C732B745D7D66756E6374';
wwv_flow_imp.g_varchar2_table(817) := '696F6E20666528412C65297B72657475726E204D6174682E7371727428412A412B652A65297D66756E6374696F6E20706528412C652C422C6E2C73297B72657475726E5B5B302C305D2C5B302C655D2C5B412C305D2C5B412C655D5D2E72656475636528';
wwv_flow_imp.g_varchar2_table(818) := '66756E6374696F6E28412C65297B76617220743D655B305D2C723D655B315D2C723D666528422D742C6E2D72293B72657475726E28733F723C412E6F7074696D756D44697374616E63653A723E412E6F7074696D756D44697374616E6365293F7B6F7074';
wwv_flow_imp.g_varchar2_table(819) := '696D756D436F726E65723A652C6F7074696D756D44697374616E63653A727D3A417D2C7B6F7074696D756D44697374616E63653A733F312F303A2D312F302C6F7074696D756D436F726E65723A6E756C6C7D292E6F7074696D756D436F726E65727D6675';
wwv_flow_imp.g_varchar2_table(820) := '6E6374696F6E204E652841297B72657475726E20303D3D3D415B305D26263235353D3D3D415B315D2626303D3D3D415B325D26263235353D3D3D415B335D7D766172204B653D7B6E616D653A226261636B67726F756E642D636C6970222C696E69746961';
wwv_flow_imp.g_varchar2_table(821) := '6C56616C75653A22626F726465722D626F78222C7072656669783A212867655B67652E434F4E54454E545F424F583D325D3D22434F4E54454E545F424F5822292C747970653A6C652E4C4953542C70617273653A66756E6374696F6E2841297B72657475';
wwv_flow_imp.g_varchar2_table(822) := '726E20412E6D61702866756E6374696F6E2841297B6966287A412841292973776974636828412E76616C7565297B636173652270616464696E672D626F78223A72657475726E2043652E50414444494E475F424F583B6361736522636F6E74656E742D62';
wwv_flow_imp.g_varchar2_table(823) := '6F78223A72657475726E2043652E434F4E54454E545F424F587D72657475726E2043652E424F524445525F424F587D297D7D2C49653D7B6E616D653A226261636B67726F756E642D636F6C6F72222C696E697469616C56616C75653A227472616E737061';
wwv_flow_imp.g_varchar2_table(824) := '72656E74222C7072656669783A21312C747970653A6C652E545950455F56414C55452C666F726D61743A22636F6C6F72227D2C77653D66756E6374696F6E2841297B76617220743D636528313830292C723D5B5D3B72657475726E2057412841292E666F';
wwv_flow_imp.g_varchar2_table(825) := '72456163682866756E6374696F6E28412C65297B696628303D3D3D65297B653D415B305D3B696628652E747970653D3D3D6F412E4944454E545F544F4B454E26262D31213D3D5B22746F70222C226C656674222C227269676874222C22626F74746F6D22';
wwv_flow_imp.g_varchar2_table(826) := '5D2E696E6465784F6628652E76616C7565292972657475726E20766F696428743D4165284129293B69662824412865292972657475726E20766F696428743D2861652865292B63652832373029292563652833363029297D413D46652841293B722E7075';
wwv_flow_imp.g_varchar2_table(827) := '73682841297D292C7B616E676C653A742C73746F70733A722C747970653A76652E4C494E4541525F4752414449454E547D7D2C54653D66756E6374696F6E28412C652C742C722C42297B766172206E3D22687474703A2F2F7777772E77332E6F72672F32';
wwv_flow_imp.g_varchar2_table(828) := '3030302F737667222C733D646F63756D656E742E637265617465456C656D656E744E53286E2C2273766722292C6E3D646F63756D656E742E637265617465456C656D656E744E53286E2C22666F726569676E4F626A65637422293B72657475726E20732E';
wwv_flow_imp.g_varchar2_table(829) := '7365744174747269627574654E53286E756C6C2C227769647468222C412E746F537472696E672829292C732E7365744174747269627574654E53286E756C6C2C22686569676874222C652E746F537472696E672829292C6E2E7365744174747269627574';
wwv_flow_imp.g_varchar2_table(830) := '654E53286E756C6C2C227769647468222C223130302522292C6E2E7365744174747269627574654E53286E756C6C2C22686569676874222C223130302522292C6E2E7365744174747269627574654E53286E756C6C2C2278222C742E746F537472696E67';
wwv_flow_imp.g_varchar2_table(831) := '2829292C6E2E7365744174747269627574654E53286E756C6C2C2279222C722E746F537472696E672829292C6E2E7365744174747269627574654E53286E756C6C2C2265787465726E616C5265736F75726365735265717569726564222C227472756522';
wwv_flow_imp.g_varchar2_table(832) := '292C732E617070656E644368696C64286E292C6E2E617070656E644368696C642842292C737D2C6D653D66756E6374696F6E2872297B72657475726E206E65772050726F6D6973652866756E6374696F6E28412C65297B76617220743D6E657720496D61';
wwv_flow_imp.g_varchar2_table(833) := '67653B742E6F6E6C6F61643D66756E6374696F6E28297B72657475726E20412874297D2C742E6F6E6572726F723D652C742E7372633D22646174613A696D6167652F7376672B786D6C3B636861727365743D7574662D382C222B656E636F646555524943';
wwv_flow_imp.g_varchar2_table(834) := '6F6D706F6E656E7428286E657720584D4C53657269616C697A6572292E73657269616C697A65546F537472696E67287229297D297D2C52653D7B67657420535550504F52545F52414E47455F424F554E445328297B76617220413D66756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(835) := '41297B696628412E63726561746552616E6765297B76617220653D412E63726561746552616E676528293B696628652E676574426F756E64696E67436C69656E7452656374297B76617220743D412E637265617465456C656D656E742822626F756E6474';
wwv_flow_imp.g_varchar2_table(836) := '65737422293B742E7374796C652E6865696768743D223132337078222C742E7374796C652E646973706C61793D22626C6F636B222C412E626F64792E617070656E644368696C642874292C652E73656C6563744E6F64652874293B653D652E676574426F';
wwv_flow_imp.g_varchar2_table(837) := '756E64696E67436C69656E745265637428292C653D4D6174682E726F756E6428652E686569676874293B696628412E626F64792E72656D6F76654368696C642874292C3132333D3D3D652972657475726E21307D7D72657475726E21317D28646F63756D';
wwv_flow_imp.g_varchar2_table(838) := '656E74293B72657475726E204F626A6563742E646566696E6550726F70657274792852652C22535550504F52545F52414E47455F424F554E4453222C7B76616C75653A417D292C417D2C67657420535550504F52545F5356475F44524157494E4728297B';
wwv_flow_imp.g_varchar2_table(839) := '76617220413D66756E6374696F6E2841297B76617220653D6E657720496D6167652C743D412E637265617465456C656D656E74282263616E76617322292C413D742E676574436F6E746578742822326422293B69662821412972657475726E21313B652E';
wwv_flow_imp.g_varchar2_table(840) := '7372633D22646174613A696D6167652F7376672B786D6C2C3C73766720786D6C6E733D27687474703A2F2F7777772E77332E6F72672F323030302F737667273E3C2F7376673E223B7472797B412E64726177496D61676528652C302C30292C742E746F44';
wwv_flow_imp.g_varchar2_table(841) := '61746155524C28297D63617463682841297B72657475726E21317D72657475726E21307D28646F63756D656E74293B72657475726E204F626A6563742E646566696E6550726F70657274792852652C22535550504F52545F5356475F44524157494E4722';
wwv_flow_imp.g_varchar2_table(842) := '2C7B76616C75653A417D292C417D2C67657420535550504F52545F464F524549474E4F424A4543545F44524157494E4728297B76617220413D2266756E6374696F6E223D3D747970656F662041727261792E66726F6D26262266756E6374696F6E223D3D';
wwv_flow_imp.g_varchar2_table(843) := '747970656F662077696E646F772E66657463683F66756E6374696F6E2874297B76617220413D742E637265617465456C656D656E74282263616E76617322292C723D3130303B412E77696474683D722C412E6865696768743D723B76617220423D412E67';
wwv_flow_imp.g_varchar2_table(844) := '6574436F6E746578742822326422293B69662821422972657475726E2050726F6D6973652E72656A656374282131293B422E66696C6C5374796C653D2272676228302C203235352C203029222C422E66696C6C5265637428302C302C722C72293B766172';
wwv_flow_imp.g_varchar2_table(845) := '20653D6E657720496D6167652C6E3D412E746F4461746155524C28293B652E7372633D6E3B653D546528722C722C302C302C65293B72657475726E20422E66696C6C5374796C653D22726564222C422E66696C6C5265637428302C302C722C72292C6D65';
wwv_flow_imp.g_varchar2_table(846) := '2865292E7468656E2866756E6374696F6E2841297B422E64726177496D61676528412C302C30293B76617220653D422E676574496D6167654461746128302C302C722C72292E646174613B422E66696C6C5374796C653D22726564222C422E66696C6C52';
wwv_flow_imp.g_varchar2_table(847) := '65637428302C302C722C72293B413D742E637265617465456C656D656E74282264697622293B72657475726E20412E7374796C652E6261636B67726F756E64496D6167653D2275726C28222B6E2B2229222C412E7374796C652E6865696768743D223130';
wwv_flow_imp.g_varchar2_table(848) := '307078222C4E652865293F6D6528546528722C722C302C302C4129293A50726F6D6973652E72656A656374282131297D292E7468656E2866756E6374696F6E2841297B72657475726E20422E64726177496D61676528412C302C30292C4E6528422E6765';
wwv_flow_imp.g_varchar2_table(849) := '74496D6167654461746128302C302C722C72292E64617461297D292E63617463682866756E6374696F6E28297B72657475726E21317D297D28646F63756D656E74293A50726F6D6973652E7265736F6C7665282131293B72657475726E204F626A656374';
wwv_flow_imp.g_varchar2_table(850) := '2E646566696E6550726F70657274792852652C22535550504F52545F464F524549474E4F424A4543545F44524157494E47222C7B76616C75653A417D292C417D2C67657420535550504F52545F434F52535F494D4147455328297B76617220413D766F69';
wwv_flow_imp.g_varchar2_table(851) := '642030213D3D286E657720496D616765292E63726F73734F726967696E3B72657475726E204F626A6563742E646566696E6550726F70657274792852652C22535550504F52545F434F52535F494D41474553222C7B76616C75653A417D292C417D2C6765';
wwv_flow_imp.g_varchar2_table(852) := '7420535550504F52545F524553504F4E53455F5459504528297B76617220413D22737472696E67223D3D747970656F66286E657720584D4C4874747052657175657374292E726573706F6E7365547970653B72657475726E204F626A6563742E64656669';
wwv_flow_imp.g_varchar2_table(853) := '6E6550726F70657274792852652C22535550504F52545F524553504F4E53455F54595045222C7B76616C75653A417D292C417D2C67657420535550504F52545F434F52535F58485228297B76617220413D227769746843726564656E7469616C7322696E';
wwv_flow_imp.g_varchar2_table(854) := '206E657720584D4C48747470526571756573743B72657475726E204F626A6563742E646566696E6550726F70657274792852652C22535550504F52545F434F52535F584852222C7B76616C75653A417D292C417D7D2C4C653D284F652E70726F746F7479';
wwv_flow_imp.g_varchar2_table(855) := '70652E64656275673D66756E6374696F6E28297B666F722876617220413D5B5D2C653D303B653C617267756D656E74732E6C656E6774683B652B2B29415B655D3D617267756D656E74735B655D3B746869732E656E61626C656426262822756E64656669';
wwv_flow_imp.g_varchar2_table(856) := '6E656422213D747970656F662077696E646F77262677696E646F772E636F6E736F6C6526262266756E6374696F6E223D3D747970656F6620636F6E736F6C652E64656275673F636F6E736F6C652E64656275672E6170706C7928636F6E736F6C652C7428';
wwv_flow_imp.g_varchar2_table(857) := '5B746869732E69642C746869732E67657454696D6528292B226D73225D2C4129293A746869732E696E666F2E6170706C7928746869732C4129297D2C4F652E70726F746F747970652E67657454696D653D66756E6374696F6E28297B72657475726E2044';
wwv_flow_imp.g_varchar2_table(858) := '6174652E6E6F7728292D746869732E73746172747D2C4F652E6372656174653D66756E6374696F6E2841297B4F652E696E7374616E6365735B412E69645D3D6E6577204F652841297D2C4F652E64657374726F793D66756E6374696F6E2841297B64656C';
wwv_flow_imp.g_varchar2_table(859) := '657465204F652E696E7374616E6365735B415D7D2C4F652E676574496E7374616E63653D66756E6374696F6E2841297B76617220653D4F652E696E7374616E6365735B415D3B696628766F696420303D3D3D65297468726F77206E6577204572726F7228';
wwv_flow_imp.g_varchar2_table(860) := '224E6F206C6F6767657220696E7374616E636520666F756E64207769746820696420222B41293B72657475726E20657D2C4F652E70726F746F747970652E696E666F3D66756E6374696F6E28297B666F722876617220413D5B5D2C653D303B653C617267';
wwv_flow_imp.g_varchar2_table(861) := '756D656E74732E6C656E6774683B652B2B29415B655D3D617267756D656E74735B655D3B746869732E656E61626C6564262622756E646566696E656422213D747970656F662077696E646F77262677696E646F772E636F6E736F6C6526262266756E6374';
wwv_flow_imp.g_varchar2_table(862) := '696F6E223D3D747970656F6620636F6E736F6C652E696E666F2626636F6E736F6C652E696E666F2E6170706C7928636F6E736F6C652C74285B746869732E69642C746869732E67657454696D6528292B226D73225D2C4129297D2C4F652E70726F746F74';
wwv_flow_imp.g_varchar2_table(863) := '7970652E6572726F723D66756E6374696F6E28297B666F722876617220413D5B5D2C653D303B653C617267756D656E74732E6C656E6774683B652B2B29415B655D3D617267756D656E74735B655D3B746869732E656E61626C656426262822756E646566';
wwv_flow_imp.g_varchar2_table(864) := '696E656422213D747970656F662077696E646F77262677696E646F772E636F6E736F6C6526262266756E6374696F6E223D3D747970656F6620636F6E736F6C652E6572726F723F636F6E736F6C652E6572726F722E6170706C7928636F6E736F6C652C74';
wwv_flow_imp.g_varchar2_table(865) := '285B746869732E69642C746869732E67657454696D6528292B226D73225D2C4129293A746869732E696E666F2E6170706C7928746869732C4129297D2C4F652E696E7374616E6365733D7B7D2C4F65293B66756E6374696F6E204F652841297B76617220';
wwv_flow_imp.g_varchar2_table(866) := '653D412E69642C413D412E656E61626C65643B746869732E69643D652C746869732E656E61626C65643D412C746869732E73746172743D446174652E6E6F7728297D7661722044653D2862652E6372656174653D66756E6374696F6E28412C65297B7265';
wwv_flow_imp.g_varchar2_table(867) := '7475726E2062652E5F6361636865735B415D3D6E657720536528412C65297D2C62652E64657374726F793D66756E6374696F6E2841297B64656C6574652062652E5F6361636865735B415D7D2C62652E6F70656E3D66756E6374696F6E2841297B766172';
wwv_flow_imp.g_varchar2_table(868) := '20653D62652E5F6361636865735B415D3B696628766F69642030213D3D652972657475726E20653B7468726F77206E6577204572726F72282743616368652077697468206B65792022272B412B2722206E6F7420666F756E6427297D2C62652E6765744F';
wwv_flow_imp.g_varchar2_table(869) := '726967696E3D66756E6374696F6E2841297B76617220653D62652E5F6C696E6B3B72657475726E20653F28652E687265663D412C652E687265663D652E687265662C652E70726F746F636F6C2B652E686F73746E616D652B652E706F7274293A2261626F';
wwv_flow_imp.g_varchar2_table(870) := '75743A626C616E6B227D2C62652E697353616D654F726967696E3D66756E6374696F6E2841297B72657475726E2062652E6765744F726967696E2841293D3D3D62652E5F6F726967696E7D2C62652E736574436F6E746578743D66756E6374696F6E2841';
wwv_flow_imp.g_varchar2_table(871) := '297B62652E5F6C696E6B3D412E646F63756D656E742E637265617465456C656D656E7428226122292C62652E5F6F726967696E3D62652E6765744F726967696E28412E6C6F636174696F6E2E68726566297D2C62652E676574496E7374616E63653D6675';
wwv_flow_imp.g_varchar2_table(872) := '6E6374696F6E28297B76617220413D62652E5F63757272656E743B6966286E756C6C3D3D3D41297468726F77206E6577204572726F7228224E6F20636163686520696E7374616E636520617474616368656422293B72657475726E20417D2C62652E6174';
wwv_flow_imp.g_varchar2_table(873) := '74616368496E7374616E63653D66756E6374696F6E2841297B62652E5F63757272656E743D417D2C62652E646574616368496E7374616E63653D66756E6374696F6E28297B62652E5F63757272656E743D6E756C6C7D2C62652E5F6361636865733D7B7D';
wwv_flow_imp.g_varchar2_table(874) := '2C62652E5F6F726967696E3D2261626F75743A626C616E6B222C62652E5F63757272656E743D6E756C6C2C6265293B66756E6374696F6E20626528297B7D7661722053653D284D652E70726F746F747970652E616464496D6167653D66756E6374696F6E';
wwv_flow_imp.g_varchar2_table(875) := '2841297B76617220653D50726F6D6973652E7265736F6C766528293B72657475726E20746869732E6861732841297C7C2858652841297C7C506528412929262628746869732E5F63616368655B415D3D746869732E6C6F6164496D616765284129292E63';
wwv_flow_imp.g_varchar2_table(876) := '617463682866756E6374696F6E28297B7D292C657D2C4D652E70726F746F747970652E6D617463683D66756E6374696F6E2841297B72657475726E20746869732E5F63616368655B415D7D2C4D652E70726F746F747970652E6C6F6164496D6167653D66';
wwv_flow_imp.g_varchar2_table(877) := '756E6374696F6E2873297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B76617220652C722C742C422C6E3D746869733B72657475726E204828746869732C66756E6374696F6E2841297B7377697463';
wwv_flow_imp.g_varchar2_table(878) := '6828412E6C6162656C297B6361736520303A72657475726E28653D44652E697353616D654F726967696E2873292C723D215665287329262621303D3D3D746869732E5F6F7074696F6E732E757365434F5253262652652E535550504F52545F434F52535F';
wwv_flow_imp.g_varchar2_table(879) := '494D41474553262621652C743D215665287329262621652626215865287329262622737472696E67223D3D747970656F6620746869732E5F6F7074696F6E732E70726F7879262652652E535550504F52545F434F52535F584852262621722C657C7C2131';
wwv_flow_imp.g_varchar2_table(880) := '213D3D746869732E5F6F7074696F6E732E616C6C6F775461696E747C7C56652873297C7C58652873297C7C747C7C72293F28423D732C743F5B342C746869732E70726F78792842295D3A5B332C325D293A5B325D3B6361736520313A423D412E73656E74';
wwv_flow_imp.g_varchar2_table(881) := '28292C412E6C6162656C3D323B6361736520323A72657475726E204C652E676574496E7374616E636528746869732E6964292E64656275672822416464656420696D61676520222B732E737562737472696E6728302C32353629292C5B342C6E65772050';
wwv_flow_imp.g_varchar2_table(882) := '726F6D6973652866756E6374696F6E28412C65297B76617220743D6E657720496D6167653B742E6F6E6C6F61643D66756E6374696F6E28297B72657475726E20412874297D2C742E6F6E6572726F723D652C287A652842297C7C7229262628742E63726F';
wwv_flow_imp.g_varchar2_table(883) := '73734F726967696E3D22616E6F6E796D6F757322292C742E7372633D422C21303D3D3D742E636F6D706C657465262673657454696D656F75742866756E6374696F6E28297B72657475726E20412874297D2C353030292C303C6E2E5F6F7074696F6E732E';
wwv_flow_imp.g_varchar2_table(884) := '696D61676554696D656F7574262673657454696D656F75742866756E6374696F6E28297B72657475726E2065282254696D6564206F75742028222B6E2E5F6F7074696F6E732E696D61676554696D656F75742B226D7329206C6F6164696E6720696D6167';
wwv_flow_imp.g_varchar2_table(885) := '6522297D2C6E2E5F6F7074696F6E732E696D61676554696D656F7574297D295D3B6361736520333A72657475726E5B322C412E73656E7428295D7D7D297D297D2C4D652E70726F746F747970652E6861733D66756E6374696F6E2841297B72657475726E';
wwv_flow_imp.g_varchar2_table(886) := '20766F69642030213D3D746869732E5F63616368655B415D7D2C4D652E70726F746F747970652E6B6579733D66756E6374696F6E28297B72657475726E2050726F6D6973652E7265736F6C7665284F626A6563742E6B65797328746869732E5F63616368';
wwv_flow_imp.g_varchar2_table(887) := '6529297D2C4D652E70726F746F747970652E70726F78793D66756E6374696F6E2873297B766172206F3D746869732C693D746869732E5F6F7074696F6E732E70726F78793B6966282169297468726F77206E6577204572726F7228224E6F2070726F7879';
wwv_flow_imp.g_varchar2_table(888) := '20646566696E656422293B76617220613D732E737562737472696E6728302C323536293B72657475726E206E65772050726F6D6973652866756E6374696F6E28652C74297B76617220723D52652E535550504F52545F524553504F4E53455F545950453F';
wwv_flow_imp.g_varchar2_table(889) := '22626C6F62223A2274657874222C423D6E657720584D4C48747470526571756573743B422E6F6E6C6F61643D66756E6374696F6E28297B76617220413B3230303D3D3D422E7374617475733F2274657874223D3D723F6528422E726573706F6E7365293A';
wwv_flow_imp.g_varchar2_table(890) := '2828413D6E65772046696C65526561646572292E6164644576656E744C697374656E657228226C6F6164222C66756E6374696F6E28297B72657475726E206528412E726573756C74297D2C2131292C412E6164644576656E744C697374656E6572282265';
wwv_flow_imp.g_varchar2_table(891) := '72726F72222C66756E6374696F6E2841297B72657475726E20742841297D2C2131292C412E7265616441734461746155524C28422E726573706F6E736529293A7428224661696C656420746F2070726F7879207265736F7572636520222B612B22207769';
wwv_flow_imp.g_varchar2_table(892) := '74682073746174757320636F646520222B422E737461747573297D2C422E6F6E6572726F723D743B76617220412C6E3D2D313C692E696E6465784F6628223F22293F2226223A223F223B422E6F70656E2822474554222C692B6E2B2275726C3D222B656E';
wwv_flow_imp.g_varchar2_table(893) := '636F6465555249436F6D706F6E656E742873292B2226726573706F6E7365547970653D222B72292C227465787422213D7226264220696E7374616E63656F6620584D4C4874747052657175657374262628422E726573706F6E7365547970653D72292C6F';
wwv_flow_imp.g_varchar2_table(894) := '2E5F6F7074696F6E732E696D61676554696D656F7574262628413D6F2E5F6F7074696F6E732E696D61676554696D656F75742C422E74696D656F75743D412C422E6F6E74696D656F75743D66756E6374696F6E28297B72657475726E2074282254696D65';
wwv_flow_imp.g_varchar2_table(895) := '64206F75742028222B412B226D73292070726F7879696E6720222B61297D292C422E73656E6428297D297D2C4D65293B66756E6374696F6E204D6528412C65297B746869732E69643D412C746869732E5F6F7074696F6E733D652C746869732E5F636163';
wwv_flow_imp.g_varchar2_table(896) := '68653D7B7D7D7661722076652C79653D2F5E646174613A696D6167655C2F7376675C2B786D6C2F692C5F653D2F5E646174613A696D6167655C2F2E2A3B6261736536342C2F692C78653D2F5E646174613A696D6167655C2F2E2A2F692C50653D66756E63';
wwv_flow_imp.g_varchar2_table(897) := '74696F6E2841297B72657475726E2052652E535550504F52545F5356475F44524157494E477C7C2147652841297D2C56653D66756E6374696F6E2841297B72657475726E2078652E746573742841297D2C7A653D66756E6374696F6E2841297B72657475';
wwv_flow_imp.g_varchar2_table(898) := '726E205F652E746573742841297D2C58653D66756E6374696F6E2841297B72657475726E22626C6F62223D3D3D412E73756273747228302C34297D2C47653D66756E6374696F6E2841297B72657475726E22737667223D3D3D412E737562737472282D33';
wwv_flow_imp.g_varchar2_table(899) := '292E746F4C6F7765724361736528297C7C79652E746573742841297D2C4A653D22636C6F736573742D73696465222C6B653D2266617274686573742D73696465222C57653D22636C6F736573742D636F726E6572222C59653D2266617274686573742D63';
wwv_flow_imp.g_varchar2_table(900) := '6F726E6572222C71653D22656C6C69707365222C5A653D22636F6E7461696E222C6A653D66756E6374696F6E2841297B76617220723D24652E434952434C452C423D41742E46415254484553545F434F524E45522C6E3D5B5D2C733D5B5D3B7265747572';
wwv_flow_imp.g_varchar2_table(901) := '6E2057412841292E666F72456163682866756E6374696F6E28412C65297B76617220743D21303B303D3D3D653F743D412E7265647563652866756E6374696F6E28412C65297B6966287A412865292973776974636828652E76616C7565297B6361736522';
wwv_flow_imp.g_varchar2_table(902) := '63656E746572223A72657475726E20732E70757368287365292C21313B6361736522746F70223A63617365226C656674223A72657475726E20732E70757368286E65292C21313B63617365227269676874223A6361736522626F74746F6D223A72657475';
wwv_flow_imp.g_varchar2_table(903) := '726E20732E70757368286F65292C21317D656C73652069662871412865297C7C59412865292972657475726E20732E707573682865292C21313B72657475726E20417D2C74293A313D3D3D65262628743D412E7265647563652866756E6374696F6E2841';
wwv_flow_imp.g_varchar2_table(904) := '2C65297B6966287A412865292973776974636828652E76616C7565297B6361736522636972636C65223A72657475726E20723D24652E434952434C452C21313B636173652071653A72657475726E20723D24652E454C4C495053452C21313B6361736520';
wwv_flow_imp.g_varchar2_table(905) := '5A653A63617365204A653A72657475726E20423D41742E434C4F534553545F534944452C21313B63617365206B653A72657475726E20423D41742E46415254484553545F534944452C21313B636173652057653A72657475726E20423D41742E434C4F53';
wwv_flow_imp.g_varchar2_table(906) := '4553545F434F524E45522C21313B6361736522636F766572223A636173652059653A72657475726E20423D41742E46415254484553545F434F524E45522C21317D656C73652069662859412865297C7C71412865292972657475726E28423D2141727261';
wwv_flow_imp.g_varchar2_table(907) := '792E697341727261792842293F5B5D3A42292E707573682865292C21313B72657475726E20417D2C7429292C74262628413D46652841292C6E2E70757368284129297D292C7B73697A653A422C73686170653A722C73746F70733A6E2C706F736974696F';
wwv_flow_imp.g_varchar2_table(908) := '6E3A732C747970653A76652E52414449414C5F4752414449454E547D7D3B2867653D76653D76657C7C7B7D295B67652E55524C3D305D3D2255524C222C67655B67652E4C494E4541525F4752414449454E543D315D3D224C494E4541525F475241444945';
wwv_flow_imp.g_varchar2_table(909) := '4E54222C67655B67652E52414449414C5F4752414449454E543D325D3D2252414449414C5F4752414449454E54223B7661722024652C41743B2867653D24653D24657C7C7B7D295B67652E434952434C453D305D3D22434952434C45222C67655B67652E';
wwv_flow_imp.g_varchar2_table(910) := '454C4C495053453D315D3D22454C4C49505345222C2867653D41743D41747C7C7B7D295B67652E434C4F534553545F534944453D305D3D22434C4F534553545F53494445222C67655B67652E46415254484553545F534944453D315D3D22464152544845';
wwv_flow_imp.g_varchar2_table(911) := '53545F53494445222C67655B67652E434C4F534553545F434F524E45523D325D3D22434C4F534553545F434F524E4552222C67655B67652E46415254484553545F434F524E45523D335D3D2246415254484553545F434F524E4552223B7661722065743D';
wwv_flow_imp.g_varchar2_table(912) := '66756E6374696F6E2841297B696628412E747970653D3D3D6F412E55524C5F544F4B454E297B76617220653D7B75726C3A412E76616C75652C747970653A76652E55524C7D3B72657475726E2044652E676574496E7374616E636528292E616464496D61';
wwv_flow_imp.g_varchar2_table(913) := '676528412E76616C7565292C657D696628412E74797065213D3D6F412E46554E4354494F4E297468726F77206E6577204572726F722822556E737570706F7274656420696D616765207479706522293B653D72745B412E6E616D655D3B696628766F6964';
wwv_flow_imp.g_varchar2_table(914) := '20303D3D3D65297468726F77206E6577204572726F722827417474656D7074696E6720746F20706172736520616E20756E737570706F7274656420696D6167652066756E6374696F6E2022272B412E6E616D652B272227293B72657475726E206528412E';
wwv_flow_imp.g_varchar2_table(915) := '76616C756573297D3B7661722074742C72743D7B226C696E6561722D6772616469656E74223A66756E6374696F6E2841297B76617220743D636528313830292C723D5B5D3B72657475726E2057412841292E666F72456163682866756E6374696F6E2841';
wwv_flow_imp.g_varchar2_table(916) := '2C65297B696628303D3D3D65297B653D415B305D3B696628652E747970653D3D3D6F412E4944454E545F544F4B454E262622746F223D3D3D652E76616C75652972657475726E20766F696428743D4165284129293B69662824412865292972657475726E';
wwv_flow_imp.g_varchar2_table(917) := '20766F696428743D6165286529297D413D46652841293B722E707573682841297D292C7B616E676C653A742C73746F70733A722C747970653A76652E4C494E4541525F4752414449454E547D7D2C222D6D6F7A2D6C696E6561722D6772616469656E7422';
wwv_flow_imp.g_varchar2_table(918) := '3A77652C222D6D732D6C696E6561722D6772616469656E74223A77652C222D6F2D6C696E6561722D6772616469656E74223A77652C222D7765626B69742D6C696E6561722D6772616469656E74223A77652C2272616469616C2D6772616469656E74223A';
wwv_flow_imp.g_varchar2_table(919) := '66756E6374696F6E2841297B76617220423D24652E434952434C452C6E3D41742E46415254484553545F434F524E45522C733D5B5D2C6F3D5B5D3B72657475726E2057412841292E666F72456163682866756E6374696F6E28412C65297B76617220742C';
wwv_flow_imp.g_varchar2_table(920) := '723D21303B303D3D3D65262628743D21312C723D412E7265647563652866756E6374696F6E28412C65297B69662874296966287A412865292973776974636828652E76616C7565297B636173652263656E746572223A72657475726E206F2E7075736828';
wwv_flow_imp.g_varchar2_table(921) := '7365292C413B6361736522746F70223A63617365226C656674223A72657475726E206F2E70757368286E65292C413B63617365227269676874223A6361736522626F74746F6D223A72657475726E206F2E70757368286F65292C417D656C736528714128';
wwv_flow_imp.g_varchar2_table(922) := '65297C7C59412865292926266F2E707573682865293B656C7365206966287A412865292973776974636828652E76616C7565297B6361736522636972636C65223A72657475726E20423D24652E434952434C452C21313B636173652071653A7265747572';
wwv_flow_imp.g_varchar2_table(923) := '6E20423D24652E454C4C495053452C21313B63617365226174223A72657475726E2128743D2130293B63617365204A653A72657475726E206E3D41742E434C4F534553545F534944452C21313B6361736522636F766572223A63617365206B653A726574';
wwv_flow_imp.g_varchar2_table(924) := '75726E206E3D41742E46415254484553545F534944452C21313B63617365205A653A636173652057653A72657475726E206E3D41742E434C4F534553545F434F524E45522C21313B636173652059653A72657475726E206E3D41742E4641525448455354';
wwv_flow_imp.g_varchar2_table(925) := '5F434F524E45522C21317D656C73652069662859412865297C7C71412865292972657475726E286E3D2141727261792E69734172726179286E293F5B5D3A6E292E707573682865292C21313B72657475726E20417D2C7229292C72262628413D46652841';
wwv_flow_imp.g_varchar2_table(926) := '292C732E70757368284129297D292C7B73697A653A6E2C73686170653A422C73746F70733A732C706F736974696F6E3A6F2C747970653A76652E52414449414C5F4752414449454E547D7D2C222D6D6F7A2D72616469616C2D6772616469656E74223A6A';
wwv_flow_imp.g_varchar2_table(927) := '652C222D6D732D72616469616C2D6772616469656E74223A6A652C222D6F2D72616469616C2D6772616469656E74223A6A652C222D7765626B69742D72616469616C2D6772616469656E74223A6A652C222D7765626B69742D6772616469656E74223A66';
wwv_flow_imp.g_varchar2_table(928) := '756E6374696F6E2841297B76617220653D636528313830292C723D5B5D2C423D76652E4C494E4541525F4752414449454E542C743D24652E434952434C452C6E3D41742E46415254484553545F434F524E45523B72657475726E2057412841292E666F72';
wwv_flow_imp.g_varchar2_table(929) := '456163682866756E6374696F6E28412C65297B76617220742C413D415B305D3B696628303D3D3D65297B6966287A412841292626226C696E656172223D3D3D412E76616C75652972657475726E20766F696428423D76652E4C494E4541525F4752414449';
wwv_flow_imp.g_varchar2_table(930) := '454E54293B6966287A4128412926262272616469616C223D3D3D412E76616C75652972657475726E20766F696428423D76652E52414449414C5F4752414449454E54297D412E747970653D3D3D6F412E46554E4354494F4E2626282266726F6D223D3D3D';
wwv_flow_imp.g_varchar2_table(931) := '412E6E616D653F28743D516528412E76616C7565735B305D292C722E70757368287B73746F703A6E652C636F6C6F723A747D29293A22746F223D3D3D412E6E616D653F28743D516528412E76616C7565735B305D292C722E70757368287B73746F703A6F';
wwv_flow_imp.g_varchar2_table(932) := '652C636F6C6F723A747D29293A22636F6C6F722D73746F7022213D3D412E6E616D657C7C323D3D3D28413D412E76616C7565732E66696C746572286B4129292E6C656E677468262628743D516528415B315D292C413D415B305D2C56412841292626722E';
wwv_flow_imp.g_varchar2_table(933) := '70757368287B73746F703A7B747970653A6F412E50455243454E544147455F544F4B454E2C6E756D6265723A3130302A412E6E756D6265722C666C6167733A412E666C6167737D2C636F6C6F723A747D2929297D292C423D3D3D76652E4C494E4541525F';
wwv_flow_imp.g_varchar2_table(934) := '4752414449454E543F7B616E676C653A28652B636528313830292925636528333630292C73746F70733A722C747970653A427D3A7B73697A653A6E2C73686170653A742C73746F70733A722C706F736974696F6E3A5B5D2C747970653A427D7D7D2C4274';
wwv_flow_imp.g_varchar2_table(935) := '3D7B6E616D653A226261636B67726F756E642D696D616765222C696E697469616C56616C75653A226E6F6E65222C747970653A6C652E4C4953542C7072656669783A21312C70617273653A66756E6374696F6E2841297B696628303D3D3D412E6C656E67';
wwv_flow_imp.g_varchar2_table(936) := '74682972657475726E5B5D3B76617220653D415B305D3B72657475726E20652E747970653D3D3D6F412E4944454E545F544F4B454E2626226E6F6E65223D3D3D652E76616C75653F5B5D3A412E66696C7465722866756E6374696F6E2841297B72657475';
wwv_flow_imp.g_varchar2_table(937) := '726E206B4128412926262828413D41292E74797065213D3D6F412E46554E4354494F4E7C7C212172745B412E6E616D655D297D292E6D6170286574297D7D2C6E743D7B6E616D653A226261636B67726F756E642D6F726967696E222C696E697469616C56';
wwv_flow_imp.g_varchar2_table(938) := '616C75653A22626F726465722D626F78222C7072656669783A21312C747970653A6C652E4C4953542C70617273653A66756E6374696F6E2841297B72657475726E20412E6D61702866756E6374696F6E2841297B6966287A412841292973776974636828';
wwv_flow_imp.g_varchar2_table(939) := '412E76616C7565297B636173652270616464696E672D626F78223A72657475726E20313B6361736522636F6E74656E742D626F78223A72657475726E20327D72657475726E20307D297D7D2C73743D7B6E616D653A226261636B67726F756E642D706F73';
wwv_flow_imp.g_varchar2_table(940) := '6974696F6E222C696E697469616C56616C75653A223025203025222C747970653A6C652E4C4953542C7072656669783A21312C70617273653A66756E6374696F6E2841297B72657475726E2057412841292E6D61702866756E6374696F6E2841297B7265';
wwv_flow_imp.g_varchar2_table(941) := '7475726E20412E66696C746572287141297D292E6D6170285A41297D7D3B286A653D74743D74747C7C7B7D295B6A652E5245504541543D305D3D22524550454154222C6A655B6A652E4E4F5F5245504541543D315D3D224E4F5F524550454154222C6A65';
wwv_flow_imp.g_varchar2_table(942) := '5B6A652E5245504541545F583D325D3D225245504541545F58223B766172206F742C69743D7B6E616D653A226261636B67726F756E642D726570656174222C696E697469616C56616C75653A22726570656174222C7072656669783A21286A655B6A652E';
wwv_flow_imp.g_varchar2_table(943) := '5245504541545F593D335D3D225245504541545F5922292C747970653A6C652E4C4953542C70617273653A66756E6374696F6E2841297B72657475726E2057412841292E6D61702866756E6374696F6E2841297B72657475726E20412E66696C74657228';
wwv_flow_imp.g_varchar2_table(944) := '7A41292E6D61702866756E6374696F6E2841297B72657475726E20412E76616C75657D292E6A6F696E28222022297D292E6D6170286174297D7D2C61743D66756E6374696F6E2841297B7377697463682841297B63617365226E6F2D726570656174223A';
wwv_flow_imp.g_varchar2_table(945) := '72657475726E2074742E4E4F5F5245504541543B63617365227265706561742D78223A6361736522726570656174206E6F2D726570656174223A72657475726E2074742E5245504541545F583B63617365227265706561742D79223A63617365226E6F2D';
wwv_flow_imp.g_varchar2_table(946) := '72657065617420726570656174223A72657475726E2074742E5245504541545F593B64656661756C743A72657475726E2074742E5245504541547D7D3B286A653D6F743D6F747C7C7B7D292E4155544F3D226175746F222C6A652E434F4E5441494E3D22';
wwv_flow_imp.g_varchar2_table(947) := '636F6E7461696E223B7661722063742C51743D7B6E616D653A226261636B67726F756E642D73697A65222C696E697469616C56616C75653A2230222C7072656669783A21286A652E434F5645523D22636F76657222292C747970653A6C652E4C4953542C';
wwv_flow_imp.g_varchar2_table(948) := '70617273653A66756E6374696F6E2841297B72657475726E2057412841292E6D61702866756E6374696F6E2841297B72657475726E20412E66696C746572287574297D297D7D2C75743D66756E6374696F6E2841297B72657475726E207A412841297C7C';
wwv_flow_imp.g_varchar2_table(949) := '71412841297D2C6A653D66756E6374696F6E2841297B72657475726E7B6E616D653A22626F726465722D222B412B222D636F6C6F72222C696E697469616C56616C75653A227472616E73706172656E74222C7072656669783A21312C747970653A6C652E';
wwv_flow_imp.g_varchar2_table(950) := '545950455F56414C55452C666F726D61743A22636F6C6F72227D7D2C77743D6A652822746F7022292C55743D6A652822726967687422292C6C743D6A652822626F74746F6D22292C43743D6A6528226C65667422292C6A653D66756E6374696F6E284129';
wwv_flow_imp.g_varchar2_table(951) := '7B72657475726E7B6E616D653A22626F726465722D7261646975732D222B412C696E697469616C56616C75653A22302030222C7072656669783A21312C747970653A6C652E4C4953542C70617273653A66756E6374696F6E2841297B72657475726E205A';
wwv_flow_imp.g_varchar2_table(952) := '4128412E66696C74657228714129297D7D7D2C67743D6A652822746F702D6C65667422292C45743D6A652822746F702D726967687422292C68743D6A652822626F74746F6D2D726967687422292C46743D6A652822626F74746F6D2D6C65667422293B28';
wwv_flow_imp.g_varchar2_table(953) := '6A653D63743D63747C7C7B7D295B6A652E4E4F4E453D305D3D224E4F4E45222C6A655B6A652E534F4C49443D315D3D22534F4C4944222C6A655B6A652E4441534845443D325D3D22444153484544222C6A655B6A652E444F545445443D335D3D22444F54';
wwv_flow_imp.g_varchar2_table(954) := '544544222C6A655B6A652E444F55424C453D345D3D22444F55424C45223B7661722064742C6A653D66756E6374696F6E2841297B72657475726E7B6E616D653A22626F726465722D222B412B222D7374796C65222C696E697469616C56616C75653A2273';
wwv_flow_imp.g_varchar2_table(955) := '6F6C6964222C7072656669783A21312C747970653A6C652E4944454E545F56414C55452C70617273653A66756E6374696F6E2841297B7377697463682841297B63617365226E6F6E65223A72657475726E2063742E4E4F4E453B63617365226461736865';
wwv_flow_imp.g_varchar2_table(956) := '64223A72657475726E2063742E4441534845443B6361736522646F74746564223A72657475726E2063742E444F545445443B6361736522646F75626C65223A72657475726E2063742E444F55424C457D72657475726E2063742E534F4C49447D7D7D2C48';
wwv_flow_imp.g_varchar2_table(957) := '743D6A652822746F7022292C66743D6A652822726967687422292C70743D6A652822626F74746F6D22292C4E743D6A6528226C65667422292C6A653D66756E6374696F6E2841297B72657475726E7B6E616D653A22626F726465722D222B412B222D7769';
wwv_flow_imp.g_varchar2_table(958) := '647468222C696E697469616C56616C75653A2230222C747970653A6C652E56414C55452C7072656669783A21312C70617273653A66756E6374696F6E2841297B72657475726E2050412841293F412E6E756D6265723A307D7D7D2C4B743D6A652822746F';
wwv_flow_imp.g_varchar2_table(959) := '7022292C49743D6A652822726967687422292C54743D6A652822626F74746F6D22292C6D743D6A6528226C65667422292C52743D7B6E616D653A22636F6C6F72222C696E697469616C56616C75653A227472616E73706172656E74222C7072656669783A';
wwv_flow_imp.g_varchar2_table(960) := '21312C747970653A6C652E545950455F56414C55452C666F726D61743A22636F6C6F72227D2C4C743D7B6E616D653A22646973706C6179222C696E697469616C56616C75653A22696E6C696E652D626C6F636B222C7072656669783A21312C747970653A';
wwv_flow_imp.g_varchar2_table(961) := '6C652E4C4953542C70617273653A66756E6374696F6E2841297B72657475726E20412E66696C746572287A41292E7265647563652866756E6374696F6E28412C65297B72657475726E20417C4F7428652E76616C7565297D2C30297D7D2C4F743D66756E';
wwv_flow_imp.g_varchar2_table(962) := '6374696F6E2841297B7377697463682841297B6361736522626C6F636B223A63617365222D7765626B69742D626F78223A72657475726E20323B6361736522696E6C696E65223A72657475726E20343B636173652272756E2D696E223A72657475726E20';
wwv_flow_imp.g_varchar2_table(963) := '383B6361736522666C6F77223A72657475726E2031363B6361736522666C6F772D726F6F74223A72657475726E2033323B63617365227461626C65223A72657475726E2036343B6361736522666C6578223A63617365222D7765626B69742D666C657822';
wwv_flow_imp.g_varchar2_table(964) := '3A72657475726E203132383B636173652267726964223A63617365222D6D732D67726964223A72657475726E203235363B636173652272756279223A72657475726E203531323B636173652273756267726964223A72657475726E20313032343B636173';
wwv_flow_imp.g_varchar2_table(965) := '65226C6973742D6974656D223A72657475726E20323034383B63617365227461626C652D726F772D67726F7570223A72657475726E20343039363B63617365227461626C652D6865616465722D67726F7570223A72657475726E20383139323B63617365';
wwv_flow_imp.g_varchar2_table(966) := '227461626C652D666F6F7465722D67726F7570223A72657475726E2031363338343B63617365227461626C652D726F77223A72657475726E2033323736383B63617365227461626C652D63656C6C223A72657475726E2036353533363B63617365227461';
wwv_flow_imp.g_varchar2_table(967) := '626C652D636F6C756D6E2D67726F7570223A72657475726E203133313037323B63617365227461626C652D636F6C756D6E223A72657475726E203236323134343B63617365227461626C652D63617074696F6E223A72657475726E203532343238383B63';
wwv_flow_imp.g_varchar2_table(968) := '61736522727562792D62617365223A72657475726E20313034383537363B6361736522727562792D74657874223A72657475726E20323039373135323B6361736522727562792D626173652D636F6E7461696E6572223A72657475726E20343139343330';
wwv_flow_imp.g_varchar2_table(969) := '343B6361736522727562792D746578742D636F6E7461696E6572223A72657475726E20383338383630383B6361736522636F6E74656E7473223A72657475726E2031363737373231363B6361736522696E6C696E652D626C6F636B223A72657475726E20';
wwv_flow_imp.g_varchar2_table(970) := '33333535343433323B6361736522696E6C696E652D6C6973742D6974656D223A72657475726E2036373130383836343B6361736522696E6C696E652D7461626C65223A72657475726E203133343231373732383B6361736522696E6C696E652D666C6578';
wwv_flow_imp.g_varchar2_table(971) := '223A72657475726E203236383433353435363B6361736522696E6C696E652D67726964223A72657475726E203533363837303931327D72657475726E20307D3B286A653D64743D64747C7C7B7D295B6A652E4E4F4E453D305D3D224E4F4E45222C6A655B';
wwv_flow_imp.g_varchar2_table(972) := '6A652E4C4546543D315D3D224C454654222C6A655B6A652E52494748543D325D3D225249474854222C6A655B6A652E494E4C494E455F53544152543D335D3D22494E4C494E455F5354415254223B7661722044742C62742C53743D7B6E616D653A22666C';
wwv_flow_imp.g_varchar2_table(973) := '6F6174222C696E697469616C56616C75653A226E6F6E65222C7072656669783A21286A655B6A652E494E4C494E455F454E443D345D3D22494E4C494E455F454E4422292C747970653A6C652E4944454E545F56414C55452C70617273653A66756E637469';
wwv_flow_imp.g_varchar2_table(974) := '6F6E2841297B7377697463682841297B63617365226C656674223A72657475726E2064742E4C4546543B63617365227269676874223A72657475726E2064742E52494748543B6361736522696E6C696E652D7374617274223A72657475726E2064742E49';
wwv_flow_imp.g_varchar2_table(975) := '4E4C494E455F53544152543B6361736522696E6C696E652D656E64223A72657475726E2064742E494E4C494E455F454E447D72657475726E2064742E4E4F4E457D7D2C4D743D7B6E616D653A226C65747465722D73706163696E67222C696E697469616C';
wwv_flow_imp.g_varchar2_table(976) := '56616C75653A2230222C7072656669783A21312C747970653A6C652E56414C55452C70617273653A66756E6374696F6E2841297B72657475726E2128412E747970653D3D3D6F412E4944454E545F544F4B454E2626226E6F726D616C223D3D3D412E7661';
wwv_flow_imp.g_varchar2_table(977) := '6C75657C7C412E74797065213D3D6F412E4E554D4245525F544F4B454E2626412E74797065213D3D6F412E44494D454E53494F4E5F544F4B454E293F412E6E756D6265723A307D7D2C76743D7B6E616D653A226C696E652D627265616B222C696E697469';
wwv_flow_imp.g_varchar2_table(978) := '616C56616C75653A286A653D44743D44747C7C7B7D292E4E4F524D414C3D226E6F726D616C222C7072656669783A21286A652E5354524943543D2273747269637422292C747970653A6C652E4944454E545F56414C55452C70617273653A66756E637469';
wwv_flow_imp.g_varchar2_table(979) := '6F6E2841297B72657475726E2273747269637422213D3D413F44742E4E4F524D414C3A44742E5354524943547D7D2C79743D7B6E616D653A226C696E652D686569676874222C696E697469616C56616C75653A226E6F726D616C222C7072656669783A21';
wwv_flow_imp.g_varchar2_table(980) := '312C747970653A6C652E544F4B454E5F56414C55457D2C5F743D7B6E616D653A226C6973742D7374796C652D696D616765222C696E697469616C56616C75653A226E6F6E65222C747970653A6C652E56414C55452C7072656669783A21312C7061727365';
wwv_flow_imp.g_varchar2_table(981) := '3A66756E6374696F6E2841297B72657475726E20412E747970653D3D3D6F412E4944454E545F544F4B454E2626226E6F6E65223D3D3D412E76616C75653F6E756C6C3A65742841297D7D3B286A653D62743D62747C7C7B7D295B6A652E494E534944453D';
wwv_flow_imp.g_varchar2_table(982) := '305D3D22494E53494445223B7661722078742C50743D7B6E616D653A226C6973742D7374796C652D706F736974696F6E222C696E697469616C56616C75653A226F757473696465222C7072656669783A21286A655B6A652E4F5554534944453D315D3D22';
wwv_flow_imp.g_varchar2_table(983) := '4F55545349444522292C747970653A6C652E4944454E545F56414C55452C70617273653A66756E6374696F6E2841297B72657475726E22696E7369646522213D3D413F62742E4F5554534944453A62742E494E534944457D7D3B286A653D78743D78747C';
wwv_flow_imp.g_varchar2_table(984) := '7C7B7D295B6A652E4E4F4E453D2D315D3D224E4F4E45222C6A655B6A652E444953433D305D3D2244495343222C6A655B6A652E434952434C453D315D3D22434952434C45222C6A655B6A652E5351554152453D325D3D22535155415245222C6A655B6A65';
wwv_flow_imp.g_varchar2_table(985) := '2E444543494D414C3D335D3D22444543494D414C222C6A655B6A652E434A4B5F444543494D414C3D345D3D22434A4B5F444543494D414C222C6A655B6A652E444543494D414C5F4C454144494E475F5A45524F3D355D3D22444543494D414C5F4C454144';
wwv_flow_imp.g_varchar2_table(986) := '494E475F5A45524F222C6A655B6A652E4C4F5745525F524F4D414E3D365D3D224C4F5745525F524F4D414E222C6A655B6A652E55505045525F524F4D414E3D375D3D2255505045525F524F4D414E222C6A655B6A652E4C4F5745525F475245454B3D385D';
wwv_flow_imp.g_varchar2_table(987) := '3D224C4F5745525F475245454B222C6A655B6A652E4C4F5745525F414C5048413D395D3D224C4F5745525F414C504841222C6A655B6A652E55505045525F414C5048413D31305D3D2255505045525F414C504841222C6A655B6A652E4152414249435F49';
wwv_flow_imp.g_varchar2_table(988) := '4E4449433D31315D3D224152414249435F494E444943222C6A655B6A652E41524D454E49414E3D31325D3D2241524D454E49414E222C6A655B6A652E42454E47414C493D31335D3D2242454E47414C49222C6A655B6A652E43414D424F4449414E3D3134';
wwv_flow_imp.g_varchar2_table(989) := '5D3D2243414D424F4449414E222C6A655B6A652E434A4B5F45415254484C595F4252414E43483D31355D3D22434A4B5F45415254484C595F4252414E4348222C6A655B6A652E434A4B5F48454156454E4C595F5354454D3D31365D3D22434A4B5F484541';
wwv_flow_imp.g_varchar2_table(990) := '56454E4C595F5354454D222C6A655B6A652E434A4B5F4944454F475241504849433D31375D3D22434A4B5F4944454F47524150484943222C6A655B6A652E444556414E41474152493D31385D3D22444556414E4147415249222C6A655B6A652E45544849';
wwv_flow_imp.g_varchar2_table(991) := '4F5049435F4E554D455249433D31395D3D22455448494F5049435F4E554D45524943222C6A655B6A652E47454F524749414E3D32305D3D2247454F524749414E222C6A655B6A652E47554A41524154493D32315D3D2247554A4152415449222C6A655B6A';
wwv_flow_imp.g_varchar2_table(992) := '652E4755524D554B48493D32325D3D224755524D554B4849222C6A655B6A652E4845425245573D32325D3D22484542524557222C6A655B6A652E4849524147414E413D32335D3D224849524147414E41222C6A655B6A652E4849524147414E415F49524F';
wwv_flow_imp.g_varchar2_table(993) := '48413D32345D3D224849524147414E415F49524F4841222C6A655B6A652E4A4150414E4553455F464F524D414C3D32355D3D224A4150414E4553455F464F524D414C222C6A655B6A652E4A4150414E4553455F494E464F524D414C3D32365D3D224A4150';
wwv_flow_imp.g_varchar2_table(994) := '414E4553455F494E464F524D414C222C6A655B6A652E4B414E4E4144413D32375D3D224B414E4E414441222C6A655B6A652E4B4154414B414E413D32385D3D224B4154414B414E41222C6A655B6A652E4B4154414B414E415F49524F48413D32395D3D22';
wwv_flow_imp.g_varchar2_table(995) := '4B4154414B414E415F49524F4841222C6A655B6A652E4B484D45523D33305D3D224B484D4552222C6A655B6A652E4B4F5245414E5F48414E47554C5F464F524D414C3D33315D3D224B4F5245414E5F48414E47554C5F464F524D414C222C6A655B6A652E';
wwv_flow_imp.g_varchar2_table(996) := '4B4F5245414E5F48414E4A415F464F524D414C3D33325D3D224B4F5245414E5F48414E4A415F464F524D414C222C6A655B6A652E4B4F5245414E5F48414E4A415F494E464F524D414C3D33335D3D224B4F5245414E5F48414E4A415F494E464F524D414C';
wwv_flow_imp.g_varchar2_table(997) := '222C6A655B6A652E4C414F3D33345D3D224C414F222C6A655B6A652E4C4F5745525F41524D454E49414E3D33355D3D224C4F5745525F41524D454E49414E222C6A655B6A652E4D414C4159414C414D3D33365D3D224D414C4159414C414D222C6A655B6A';
wwv_flow_imp.g_varchar2_table(998) := '652E4D4F4E474F4C49414E3D33375D3D224D4F4E474F4C49414E222C6A655B6A652E4D59414E4D41523D33385D3D224D59414E4D4152222C6A655B6A652E4F524959413D33395D3D224F52495941222C6A655B6A652E5045525349414E3D34305D3D2250';
wwv_flow_imp.g_varchar2_table(999) := '45525349414E222C6A655B6A652E53494D505F4348494E4553455F464F524D414C3D34315D3D2253494D505F4348494E4553455F464F524D414C222C6A655B6A652E53494D505F4348494E4553455F494E464F524D414C3D34325D3D2253494D505F4348';
wwv_flow_imp.g_varchar2_table(1000) := '494E4553455F494E464F524D414C222C6A655B6A652E54414D494C3D34335D3D2254414D494C222C6A655B6A652E54454C5547553D34345D3D2254454C554755222C6A655B6A652E544841493D34355D3D2254484149222C6A655B6A652E544942455441';
wwv_flow_imp.g_varchar2_table(1001) := '4E3D34365D3D225449424554414E222C6A655B6A652E545241445F4348494E4553455F464F524D414C3D34375D3D22545241445F4348494E4553455F464F524D414C222C6A655B6A652E545241445F4348494E4553455F494E464F524D414C3D34385D3D';
wwv_flow_imp.g_varchar2_table(1002) := '22545241445F4348494E4553455F494E464F524D414C222C6A655B6A652E55505045525F41524D454E49414E3D34395D3D2255505045525F41524D454E49414E222C6A655B6A652E444953434C4F535552455F4F50454E3D35305D3D22444953434C4F53';
wwv_flow_imp.g_varchar2_table(1003) := '5552455F4F50454E223B7661722056742C7A743D7B6E616D653A226C6973742D7374796C652D74797065222C696E697469616C56616C75653A226E6F6E65222C7072656669783A21286A655B6A652E444953434C4F535552455F434C4F5345443D35315D';
wwv_flow_imp.g_varchar2_table(1004) := '3D22444953434C4F535552455F434C4F53454422292C747970653A6C652E4944454E545F56414C55452C70617273653A66756E6374696F6E2841297B7377697463682841297B636173652264697363223A72657475726E2078742E444953433B63617365';
wwv_flow_imp.g_varchar2_table(1005) := '22636972636C65223A72657475726E2078742E434952434C453B6361736522737175617265223A72657475726E2078742E5351554152453B6361736522646563696D616C223A72657475726E2078742E444543494D414C3B6361736522636A6B2D646563';
wwv_flow_imp.g_varchar2_table(1006) := '696D616C223A72657475726E2078742E434A4B5F444543494D414C3B6361736522646563696D616C2D6C656164696E672D7A65726F223A72657475726E2078742E444543494D414C5F4C454144494E475F5A45524F3B63617365226C6F7765722D726F6D';
wwv_flow_imp.g_varchar2_table(1007) := '616E223A72657475726E2078742E4C4F5745525F524F4D414E3B636173652275707065722D726F6D616E223A72657475726E2078742E55505045525F524F4D414E3B63617365226C6F7765722D677265656B223A72657475726E2078742E4C4F5745525F';
wwv_flow_imp.g_varchar2_table(1008) := '475245454B3B63617365226C6F7765722D616C706861223A72657475726E2078742E4C4F5745525F414C5048413B636173652275707065722D616C706861223A72657475726E2078742E55505045525F414C5048413B63617365226172616269632D696E';
wwv_flow_imp.g_varchar2_table(1009) := '646963223A72657475726E2078742E4152414249435F494E4449433B636173652261726D656E69616E223A72657475726E2078742E41524D454E49414E3B636173652262656E67616C69223A72657475726E2078742E42454E47414C493B636173652263';
wwv_flow_imp.g_varchar2_table(1010) := '616D626F6469616E223A72657475726E2078742E43414D424F4449414E3B6361736522636A6B2D65617274686C792D6272616E6368223A72657475726E2078742E434A4B5F45415254484C595F4252414E43483B6361736522636A6B2D68656176656E6C';
wwv_flow_imp.g_varchar2_table(1011) := '792D7374656D223A72657475726E2078742E434A4B5F48454156454E4C595F5354454D3B6361736522636A6B2D6964656F67726170686963223A72657475726E2078742E434A4B5F4944454F475241504849433B6361736522646576616E616761726922';
wwv_flow_imp.g_varchar2_table(1012) := '3A72657475726E2078742E444556414E41474152493B6361736522657468696F7069632D6E756D65726963223A72657475726E2078742E455448494F5049435F4E554D455249433B636173652267656F726769616E223A72657475726E2078742E47454F';
wwv_flow_imp.g_varchar2_table(1013) := '524749414E3B636173652267756A6172617469223A72657475726E2078742E47554A41524154493B63617365226775726D756B6869223A72657475726E2078742E4755524D554B48493B6361736522686562726577223A72657475726E2078742E484542';
wwv_flow_imp.g_varchar2_table(1014) := '5245573B63617365226869726167616E61223A72657475726E2078742E4849524147414E413B63617365226869726167616E612D69726F6861223A72657475726E2078742E4849524147414E415F49524F48413B63617365226A6170616E6573652D666F';
wwv_flow_imp.g_varchar2_table(1015) := '726D616C223A72657475726E2078742E4A4150414E4553455F464F524D414C3B63617365226A6170616E6573652D696E666F726D616C223A72657475726E2078742E4A4150414E4553455F494E464F524D414C3B63617365226B616E6E616461223A7265';
wwv_flow_imp.g_varchar2_table(1016) := '7475726E2078742E4B414E4E4144413B63617365226B6174616B616E61223A72657475726E2078742E4B4154414B414E413B63617365226B6174616B616E612D69726F6861223A72657475726E2078742E4B4154414B414E415F49524F48413B63617365';
wwv_flow_imp.g_varchar2_table(1017) := '226B686D6572223A72657475726E2078742E4B484D45523B63617365226B6F7265616E2D68616E67756C2D666F726D616C223A72657475726E2078742E4B4F5245414E5F48414E47554C5F464F524D414C3B63617365226B6F7265616E2D68616E6A612D';
wwv_flow_imp.g_varchar2_table(1018) := '666F726D616C223A72657475726E2078742E4B4F5245414E5F48414E4A415F464F524D414C3B63617365226B6F7265616E2D68616E6A612D696E666F726D616C223A72657475726E2078742E4B4F5245414E5F48414E4A415F494E464F524D414C3B6361';
wwv_flow_imp.g_varchar2_table(1019) := '7365226C616F223A72657475726E2078742E4C414F3B63617365226C6F7765722D61726D656E69616E223A72657475726E2078742E4C4F5745525F41524D454E49414E3B63617365226D616C6179616C616D223A72657475726E2078742E4D414C415941';
wwv_flow_imp.g_varchar2_table(1020) := '4C414D3B63617365226D6F6E676F6C69616E223A72657475726E2078742E4D4F4E474F4C49414E3B63617365226D79616E6D6172223A72657475726E2078742E4D59414E4D41523B63617365226F72697961223A72657475726E2078742E4F524959413B';
wwv_flow_imp.g_varchar2_table(1021) := '63617365227065727369616E223A72657475726E2078742E5045525349414E3B636173652273696D702D6368696E6573652D666F726D616C223A72657475726E2078742E53494D505F4348494E4553455F464F524D414C3B636173652273696D702D6368';
wwv_flow_imp.g_varchar2_table(1022) := '696E6573652D696E666F726D616C223A72657475726E2078742E53494D505F4348494E4553455F494E464F524D414C3B636173652274616D696C223A72657475726E2078742E54414D494C3B636173652274656C756775223A72657475726E2078742E54';
wwv_flow_imp.g_varchar2_table(1023) := '454C5547553B636173652274686169223A72657475726E2078742E544841493B63617365227469626574616E223A72657475726E2078742E5449424554414E3B6361736522747261642D6368696E6573652D666F726D616C223A72657475726E2078742E';
wwv_flow_imp.g_varchar2_table(1024) := '545241445F4348494E4553455F464F524D414C3B6361736522747261642D6368696E6573652D696E666F726D616C223A72657475726E2078742E545241445F4348494E4553455F494E464F524D414C3B636173652275707065722D61726D656E69616E22';
wwv_flow_imp.g_varchar2_table(1025) := '3A72657475726E2078742E55505045525F41524D454E49414E3B6361736522646973636C6F737572652D6F70656E223A72657475726E2078742E444953434C4F535552455F4F50454E3B6361736522646973636C6F737572652D636C6F736564223A7265';
wwv_flow_imp.g_varchar2_table(1026) := '7475726E2078742E444953434C4F535552455F434C4F5345443B64656661756C743A72657475726E2078742E4E4F4E457D7D7D2C6A653D66756E6374696F6E2841297B72657475726E7B6E616D653A226D617267696E2D222B412C696E697469616C5661';
wwv_flow_imp.g_varchar2_table(1027) := '6C75653A2230222C7072656669783A21312C747970653A6C652E544F4B454E5F56414C55457D7D2C58743D6A652822746F7022292C47743D6A652822726967687422292C4A743D6A652822626F74746F6D22292C6B743D6A6528226C65667422293B286A';
wwv_flow_imp.g_varchar2_table(1028) := '653D56743D56747C7C7B7D295B6A652E56495349424C453D305D3D2256495349424C45222C6A655B6A652E48494444454E3D315D3D2248494444454E222C6A655B6A652E5343524F4C4C3D325D3D225343524F4C4C223B7661722057742C59742C71743D';
wwv_flow_imp.g_varchar2_table(1029) := '7B6E616D653A226F766572666C6F77222C696E697469616C56616C75653A2276697369626C65222C7072656669783A21286A655B6A652E4155544F3D335D3D224155544F22292C747970653A6C652E4C4953542C70617273653A66756E6374696F6E2841';
wwv_flow_imp.g_varchar2_table(1030) := '297B72657475726E20412E66696C746572287A41292E6D61702866756E6374696F6E2841297B73776974636828412E76616C7565297B636173652268696464656E223A72657475726E2056742E48494444454E3B63617365227363726F6C6C223A726574';
wwv_flow_imp.g_varchar2_table(1031) := '75726E2056742E5343524F4C4C3B63617365226175746F223A72657475726E2056742E4155544F3B64656661756C743A72657475726E2056742E56495349424C457D7D297D7D2C5A743D7B6E616D653A226F766572666C6F772D77726170222C696E6974';
wwv_flow_imp.g_varchar2_table(1032) := '69616C56616C75653A286A653D57743D57747C7C7B7D292E4E4F524D414C3D226E6F726D616C222C7072656669783A21286A652E425245414B5F574F52443D22627265616B2D776F726422292C747970653A6C652E4944454E545F56414C55452C706172';
wwv_flow_imp.g_varchar2_table(1033) := '73653A66756E6374696F6E2841297B72657475726E22627265616B2D776F726422213D3D413F57742E4E4F524D414C3A57742E425245414B5F574F52447D7D2C6A653D66756E6374696F6E2841297B72657475726E7B6E616D653A2270616464696E672D';
wwv_flow_imp.g_varchar2_table(1034) := '222B412C696E697469616C56616C75653A2230222C7072656669783A21312C747970653A6C652E545950455F56414C55452C666F726D61743A226C656E6774682D70657263656E74616765227D7D2C6A743D6A652822746F7022292C24743D6A65282272';
wwv_flow_imp.g_varchar2_table(1035) := '6967687422292C41723D6A652822626F74746F6D22292C65723D6A6528226C65667422293B286A653D59743D59747C7C7B7D295B6A652E4C4546543D305D3D224C454654222C6A655B6A652E43454E5445523D315D3D2243454E544552223B7661722074';
wwv_flow_imp.g_varchar2_table(1036) := '722C72723D7B6E616D653A22746578742D616C69676E222C696E697469616C56616C75653A226C656674222C7072656669783A21286A655B6A652E52494748543D325D3D22524947485422292C747970653A6C652E4944454E545F56414C55452C706172';
wwv_flow_imp.g_varchar2_table(1037) := '73653A66756E6374696F6E2841297B7377697463682841297B63617365227269676874223A72657475726E2059742E52494748543B636173652263656E746572223A63617365226A757374696679223A72657475726E2059742E43454E5445523B646566';
wwv_flow_imp.g_varchar2_table(1038) := '61756C743A72657475726E2059742E4C4546547D7D7D3B286A653D74723D74727C7C7B7D295B6A652E5354415449433D305D3D22535441544943222C6A655B6A652E52454C41544956453D315D3D2252454C4154495645222C6A655B6A652E4142534F4C';
wwv_flow_imp.g_varchar2_table(1039) := '5554453D325D3D224142534F4C555445222C6A655B6A652E46495845443D335D3D224649584544223B7661722042722C6E723D7B6E616D653A22706F736974696F6E222C696E697469616C56616C75653A22737461746963222C7072656669783A21286A';
wwv_flow_imp.g_varchar2_table(1040) := '655B6A652E535449434B593D345D3D22535449434B5922292C747970653A6C652E4944454E545F56414C55452C70617273653A66756E6374696F6E2841297B7377697463682841297B636173652272656C6174697665223A72657475726E2074722E5245';
wwv_flow_imp.g_varchar2_table(1041) := '4C41544956453B63617365226162736F6C757465223A72657475726E2074722E4142534F4C5554453B63617365226669786564223A72657475726E2074722E46495845443B6361736522737469636B79223A72657475726E2074722E535449434B597D72';
wwv_flow_imp.g_varchar2_table(1042) := '657475726E2074722E5354415449437D7D2C73723D7B6E616D653A22746578742D736861646F77222C696E697469616C56616C75653A226E6F6E65222C747970653A6C652E4C4953542C7072656669783A21312C70617273653A66756E6374696F6E2841';
wwv_flow_imp.g_varchar2_table(1043) := '297B72657475726E20313D3D3D412E6C656E6774682626474128415B305D2C226E6F6E6522293F5B5D3A57412841292E6D61702866756E6374696F6E2841297B666F722876617220653D7B636F6C6F723A68652E5452414E53504152454E542C6F666673';
wwv_flow_imp.g_varchar2_table(1044) := '6574583A6E652C6F6666736574593A6E652C626C75723A6E657D2C743D302C723D303B723C412E6C656E6774683B722B2B297B76617220423D415B725D3B59412842293F28303D3D3D743F652E6F6666736574583D423A313D3D3D743F652E6F66667365';
wwv_flow_imp.g_varchar2_table(1045) := '74593D423A652E626C75723D422C742B2B293A652E636F6C6F723D51652842297D72657475726E20657D297D7D3B286A653D42723D42727C7C7B7D295B6A652E4E4F4E453D305D3D224E4F4E45222C6A655B6A652E4C4F574552434153453D315D3D224C';
wwv_flow_imp.g_varchar2_table(1046) := '4F57455243415345222C6A655B6A652E5550504552434153453D325D3D22555050455243415345223B766172206F722C69723D7B6E616D653A22746578742D7472616E73666F726D222C696E697469616C56616C75653A226E6F6E65222C707265666978';
wwv_flow_imp.g_varchar2_table(1047) := '3A21286A655B6A652E4341504954414C495A453D335D3D224341504954414C495A4522292C747970653A6C652E4944454E545F56414C55452C70617273653A66756E6374696F6E2841297B7377697463682841297B636173652275707065726361736522';
wwv_flow_imp.g_varchar2_table(1048) := '3A72657475726E2042722E5550504552434153453B63617365226C6F77657263617365223A72657475726E2042722E4C4F574552434153453B63617365226361706974616C697A65223A72657475726E2042722E4341504954414C495A457D7265747572';
wwv_flow_imp.g_varchar2_table(1049) := '6E2042722E4E4F4E457D7D2C61723D7B6E616D653A227472616E73666F726D222C696E697469616C56616C75653A226E6F6E65222C7072656669783A21302C747970653A6C652E56414C55452C70617273653A66756E6374696F6E2841297B696628412E';
wwv_flow_imp.g_varchar2_table(1050) := '747970653D3D3D6F412E4944454E545F544F4B454E2626226E6F6E65223D3D3D412E76616C75652972657475726E206E756C6C3B696628412E74797065213D3D6F412E46554E4354494F4E2972657475726E206E756C6C3B76617220653D63725B412E6E';
wwv_flow_imp.g_varchar2_table(1051) := '616D655D3B696628766F696420303D3D3D65297468726F77206E6577204572726F722827417474656D7074696E6720746F20706172736520616E20756E737570706F72746564207472616E73666F726D2066756E6374696F6E2022272B412E6E616D652B';
wwv_flow_imp.g_varchar2_table(1052) := '272227293B72657475726E206528412E76616C756573297D7D2C63723D7B6D61747269783A66756E6374696F6E2841297B413D412E66696C7465722866756E6374696F6E2841297B72657475726E20412E747970653D3D3D6F412E4E554D4245525F544F';
wwv_flow_imp.g_varchar2_table(1053) := '4B454E7D292E6D61702866756E6374696F6E2841297B72657475726E20412E6E756D6265727D293B72657475726E20363D3D3D412E6C656E6774683F413A6E756C6C7D2C6D617472697833643A66756E6374696F6E2841297B76617220653D412E66696C';
wwv_flow_imp.g_varchar2_table(1054) := '7465722866756E6374696F6E2841297B72657475726E20412E747970653D3D3D6F412E4E554D4245525F544F4B454E7D292E6D61702866756E6374696F6E2841297B72657475726E20412E6E756D6265727D292C743D655B305D2C723D655B315D3B655B';
wwv_flow_imp.g_varchar2_table(1055) := '325D2C655B335D3B76617220423D655B345D2C6E3D655B355D3B655B365D2C655B375D2C655B385D2C655B395D2C655B31305D2C655B31315D3B76617220733D655B31325D2C413D655B31335D3B72657475726E20655B31345D2C655B31355D2C31363D';
wwv_flow_imp.g_varchar2_table(1056) := '3D3D652E6C656E6774683F5B742C722C422C6E2C732C415D3A6E756C6C7D7D2C6A653D7B747970653A6F412E50455243454E544147455F544F4B454E2C6E756D6265723A35302C666C6167733A347D2C51723D5B6A652C6A655D2C75723D7B6E616D653A';
wwv_flow_imp.g_varchar2_table(1057) := '227472616E73666F726D2D6F726967696E222C696E697469616C56616C75653A2235302520353025222C7072656669783A21302C747970653A6C652E4C4953542C70617273653A66756E6374696F6E2841297B413D412E66696C746572287141293B7265';
wwv_flow_imp.g_varchar2_table(1058) := '7475726E2032213D3D412E6C656E6774683F51723A5B415B305D2C415B315D5D7D7D3B286A653D6F723D6F727C7C7B7D295B6A652E56495349424C453D305D3D2256495349424C45222C6A655B6A652E48494444454E3D315D3D2248494444454E223B76';
wwv_flow_imp.g_varchar2_table(1059) := '61722077722C55723D7B6E616D653A2276697369626C65222C696E697469616C56616C75653A226E6F6E65222C7072656669783A21286A655B6A652E434F4C4C415053453D325D3D22434F4C4C4150534522292C747970653A6C652E4944454E545F5641';
wwv_flow_imp.g_varchar2_table(1060) := '4C55452C70617273653A66756E6374696F6E2841297B7377697463682841297B636173652268696464656E223A72657475726E206F722E48494444454E3B6361736522636F6C6C61707365223A72657475726E206F722E434F4C4C415053453B64656661';
wwv_flow_imp.g_varchar2_table(1061) := '756C743A72657475726E206F722E56495349424C457D7D7D3B286A653D77723D77727C7C7B7D292E4E4F524D414C3D226E6F726D616C222C6A652E425245414B5F414C4C3D22627265616B2D616C6C223B766172206C722C43723D7B6E616D653A22776F';
wwv_flow_imp.g_varchar2_table(1062) := '72642D627265616B222C696E697469616C56616C75653A226E6F726D616C222C7072656669783A21286A652E4B4545505F414C4C3D226B6565702D616C6C22292C747970653A6C652E4944454E545F56414C55452C70617273653A66756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(1063) := '41297B7377697463682841297B6361736522627265616B2D616C6C223A72657475726E2077722E425245414B5F414C4C3B63617365226B6565702D616C6C223A72657475726E2077722E4B4545505F414C4C3B64656661756C743A72657475726E207772';
wwv_flow_imp.g_varchar2_table(1064) := '2E4E4F524D414C7D7D7D2C67723D7B6E616D653A227A2D696E646578222C696E697469616C56616C75653A226175746F222C7072656669783A21312C747970653A6C652E56414C55452C70617273653A66756E6374696F6E2841297B696628412E747970';
wwv_flow_imp.g_varchar2_table(1065) := '653D3D3D6F412E4944454E545F544F4B454E2972657475726E7B6175746F3A21302C6F726465723A307D3B69662856412841292972657475726E7B6175746F3A21312C6F726465723A412E6E756D6265727D3B7468726F77206E6577204572726F722822';
wwv_flow_imp.g_varchar2_table(1066) := '496E76616C6964207A2D696E646578206E756D6265722070617273656422297D7D2C45723D7B6E616D653A226F706163697479222C696E697469616C56616C75653A2231222C747970653A6C652E56414C55452C7072656669783A21312C70617273653A';
wwv_flow_imp.g_varchar2_table(1067) := '66756E6374696F6E2841297B72657475726E2056412841293F412E6E756D6265723A317D7D2C68723D7B6E616D653A22746578742D6465636F726174696F6E2D636F6C6F72222C696E697469616C56616C75653A227472616E73706172656E74222C7072';
wwv_flow_imp.g_varchar2_table(1068) := '656669783A21312C747970653A6C652E545950455F56414C55452C666F726D61743A22636F6C6F72227D2C46723D7B6E616D653A22746578742D6465636F726174696F6E2D6C696E65222C696E697469616C56616C75653A226E6F6E65222C7072656669';
wwv_flow_imp.g_varchar2_table(1069) := '783A21312C747970653A6C652E4C4953542C70617273653A66756E6374696F6E2841297B72657475726E20412E66696C746572287A41292E6D61702866756E6374696F6E2841297B73776974636828412E76616C7565297B6361736522756E6465726C69';
wwv_flow_imp.g_varchar2_table(1070) := '6E65223A72657475726E20313B63617365226F7665726C696E65223A72657475726E20323B63617365226C696E652D7468726F756768223A72657475726E20333B63617365226E6F6E65223A72657475726E20347D72657475726E20307D292E66696C74';
wwv_flow_imp.g_varchar2_table(1071) := '65722866756E6374696F6E2841297B72657475726E2030213D3D417D297D7D2C64723D7B6E616D653A22666F6E742D66616D696C79222C696E697469616C56616C75653A22222C7072656669783A21312C747970653A6C652E4C4953542C70617273653A';
wwv_flow_imp.g_varchar2_table(1072) := '66756E6374696F6E2841297B76617220653D5B5D2C743D5B5D3B72657475726E20412E666F72456163682866756E6374696F6E2841297B73776974636828412E74797065297B63617365206F412E4944454E545F544F4B454E3A63617365206F412E5354';
wwv_flow_imp.g_varchar2_table(1073) := '52494E475F544F4B454E3A652E7075736828412E76616C7565293B627265616B3B63617365206F412E4E554D4245525F544F4B454E3A652E7075736828412E6E756D6265722E746F537472696E672829293B627265616B3B63617365206F412E434F4D4D';
wwv_flow_imp.g_varchar2_table(1074) := '415F544F4B454E3A742E7075736828652E6A6F696E2822202229292C652E6C656E6774683D307D7D292C652E6C656E6774682626742E7075736828652E6A6F696E2822202229292C742E6D61702866756E6374696F6E2841297B72657475726E2D313D3D';
wwv_flow_imp.g_varchar2_table(1075) := '3D412E696E6465784F6628222022293F413A2227222B412B2227227D297D7D2C48723D7B6E616D653A22666F6E742D73697A65222C696E697469616C56616C75653A2230222C7072656669783A21312C747970653A6C652E545950455F56414C55452C66';
wwv_flow_imp.g_varchar2_table(1076) := '6F726D61743A226C656E677468227D2C66723D7B6E616D653A22666F6E742D776569676874222C696E697469616C56616C75653A226E6F726D616C222C747970653A6C652E56414C55452C7072656669783A21312C70617273653A66756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(1077) := '41297B72657475726E2056412841293F412E6E756D6265723A217A412841297C7C22626F6C6422213D3D412E76616C75653F3430303A3730307D7D2C70723D7B6E616D653A22666F6E742D76617269616E74222C696E697469616C56616C75653A226E6F';
wwv_flow_imp.g_varchar2_table(1078) := '6E65222C747970653A6C652E4C4953542C7072656669783A21312C70617273653A66756E6374696F6E2841297B72657475726E20412E66696C746572287A41292E6D61702866756E6374696F6E2841297B72657475726E20412E76616C75657D297D7D3B';
wwv_flow_imp.g_varchar2_table(1079) := '286A653D6C723D6C727C7C7B7D292E4E4F524D414C3D226E6F726D616C222C6A652E4954414C49433D226974616C6963223B66756E6374696F6E204E7228412C65297B72657475726E2030213D28412665297D66756E6374696F6E204B7228412C652C74';
wwv_flow_imp.g_varchar2_table(1080) := '297B72657475726E28413D412626415B4D6174682E6D696E28652C412E6C656E6774682D31295D293F743F412E6F70656E3A412E636C6F73653A22227D7661722049723D7B6E616D653A22666F6E742D7374796C65222C696E697469616C56616C75653A';
wwv_flow_imp.g_varchar2_table(1081) := '226E6F726D616C222C7072656669783A21286A652E4F424C495155453D226F626C6971756522292C747970653A6C652E4944454E545F56414C55452C70617273653A66756E6374696F6E2841297B7377697463682841297B63617365226F626C69717565';
wwv_flow_imp.g_varchar2_table(1082) := '223A72657475726E206C722E4F424C495155453B63617365226974616C6963223A72657475726E206C722E4954414C49433B64656661756C743A72657475726E206C722E4E4F524D414C7D7D7D2C54723D7B6E616D653A22636F6E74656E74222C696E69';
wwv_flow_imp.g_varchar2_table(1083) := '7469616C56616C75653A226E6F6E65222C747970653A6C652E4C4953542C7072656669783A21312C70617273653A66756E6374696F6E2841297B696628303D3D3D412E6C656E6774682972657475726E5B5D3B76617220653D415B305D3B72657475726E';
wwv_flow_imp.g_varchar2_table(1084) := '20652E747970653D3D3D6F412E4944454E545F544F4B454E2626226E6F6E65223D3D3D652E76616C75653F5B5D3A417D7D2C6D723D7B6E616D653A22636F756E7465722D696E6372656D656E74222C696E697469616C56616C75653A226E6F6E65222C70';
wwv_flow_imp.g_varchar2_table(1085) := '72656669783A21302C747970653A6C652E4C4953542C70617273653A66756E6374696F6E2841297B696628303D3D3D412E6C656E6774682972657475726E206E756C6C3B76617220653D415B305D3B696628652E747970653D3D3D6F412E4944454E545F';
wwv_flow_imp.g_varchar2_table(1086) := '544F4B454E2626226E6F6E65223D3D3D652E76616C75652972657475726E206E756C6C3B666F722876617220743D5B5D2C723D412E66696C746572284A41292C423D303B423C722E6C656E6774683B422B2B297B766172206E3D725B425D2C733D725B42';
wwv_flow_imp.g_varchar2_table(1087) := '2B315D3B6E2E747970653D3D3D6F412E4944454E545F544F4B454E262628733D73262656412873293F732E6E756D6265723A312C742E70757368287B636F756E7465723A6E2E76616C75652C696E6372656D656E743A737D29297D72657475726E20747D';
wwv_flow_imp.g_varchar2_table(1088) := '7D2C52723D7B6E616D653A22636F756E7465722D7265736574222C696E697469616C56616C75653A226E6F6E65222C7072656669783A21302C747970653A6C652E4C4953542C70617273653A66756E6374696F6E2841297B696628303D3D3D412E6C656E';
wwv_flow_imp.g_varchar2_table(1089) := '6774682972657475726E5B5D3B666F722876617220653D5B5D2C743D412E66696C746572284A41292C723D303B723C742E6C656E6774683B722B2B297B76617220423D745B725D2C6E3D745B722B315D3B7A412842292626226E6F6E6522213D3D422E76';
wwv_flow_imp.g_varchar2_table(1090) := '616C75652626286E3D6E26265641286E293F6E2E6E756D6265723A302C652E70757368287B636F756E7465723A422E76616C75652C72657365743A6E7D29297D72657475726E20657D7D2C4C723D7B6E616D653A2271756F746573222C696E697469616C';
wwv_flow_imp.g_varchar2_table(1091) := '56616C75653A226E6F6E65222C7072656669783A21302C747970653A6C652E4C4953542C70617273653A66756E6374696F6E2841297B696628303D3D3D412E6C656E6774682972657475726E206E756C6C3B76617220653D415B305D3B696628652E7479';
wwv_flow_imp.g_varchar2_table(1092) := '70653D3D3D6F412E4944454E545F544F4B454E2626226E6F6E65223D3D3D652E76616C75652972657475726E206E756C6C3B76617220743D5B5D2C723D412E66696C746572285841293B696628722E6C656E6774682532213D302972657475726E206E75';
wwv_flow_imp.g_varchar2_table(1093) := '6C6C3B666F722876617220423D303B423C722E6C656E6774683B422B3D32297B766172206E3D725B425D2E76616C75652C733D725B422B315D2E76616C75653B742E70757368287B6F70656E3A6E2C636C6F73653A737D297D72657475726E20747D7D2C';
wwv_flow_imp.g_varchar2_table(1094) := '4F723D7B6E616D653A22626F782D736861646F77222C696E697469616C56616C75653A226E6F6E65222C747970653A6C652E4C4953542C7072656669783A21312C70617273653A66756E6374696F6E2841297B72657475726E20313D3D3D412E6C656E67';
wwv_flow_imp.g_varchar2_table(1095) := '74682626474128415B305D2C226E6F6E6522293F5B5D3A57412841292E6D61702866756E6374696F6E2841297B666F722876617220653D7B636F6C6F723A3235352C6F6666736574583A6E652C6F6666736574593A6E652C626C75723A6E652C73707265';
wwv_flow_imp.g_varchar2_table(1096) := '61643A6E652C696E7365743A21317D2C743D302C723D303B723C412E6C656E6774683B722B2B297B76617220423D415B725D3B474128422C22696E73657422293F652E696E7365743D21303A59412842293F28303D3D3D743F652E6F6666736574583D42';
wwv_flow_imp.g_varchar2_table(1097) := '3A313D3D3D743F652E6F6666736574593D423A323D3D3D743F652E626C75723D423A652E7370726561643D422C742B2B293A652E636F6C6F723D51652842297D72657475726E20657D297D7D2C44723D2862722E70726F746F747970652E697356697369';
wwv_flow_imp.g_varchar2_table(1098) := '626C653D66756E6374696F6E28297B72657475726E20303C746869732E646973706C61792626303C746869732E6F7061636974792626746869732E7669736962696C6974793D3D3D6F722E56495349424C457D2C62722E70726F746F747970652E697354';
wwv_flow_imp.g_varchar2_table(1099) := '72616E73706172656E743D66756E6374696F6E28297B72657475726E20656528746869732E6261636B67726F756E64436F6C6F72297D2C62722E70726F746F747970652E69735472616E73666F726D65643D66756E6374696F6E28297B72657475726E20';
wwv_flow_imp.g_varchar2_table(1100) := '6E756C6C213D3D746869732E7472616E73666F726D7D2C62722E70726F746F747970652E6973506F736974696F6E65643D66756E6374696F6E28297B72657475726E20746869732E706F736974696F6E213D3D74722E5354415449437D2C62722E70726F';
wwv_flow_imp.g_varchar2_table(1101) := '746F747970652E6973506F736974696F6E6564576974685A496E6465783D66756E6374696F6E28297B72657475726E20746869732E6973506F736974696F6E65642829262621746869732E7A496E6465782E6175746F7D2C62722E70726F746F74797065';
wwv_flow_imp.g_varchar2_table(1102) := '2E6973466C6F6174696E673D66756E6374696F6E28297B72657475726E20746869732E666C6F6174213D3D64742E4E4F4E457D2C62722E70726F746F747970652E6973496E6C696E654C6576656C3D66756E6374696F6E28297B72657475726E204E7228';
wwv_flow_imp.g_varchar2_table(1103) := '746869732E646973706C61792C34297C7C4E7228746869732E646973706C61792C3333353534343332297C7C4E7228746869732E646973706C61792C323638343335343536297C7C4E7228746869732E646973706C61792C353336383730393132297C7C';
wwv_flow_imp.g_varchar2_table(1104) := '4E7228746869732E646973706C61792C3637313038383634297C7C4E7228746869732E646973706C61792C313334323137373238297D2C6272293B66756E6374696F6E2062722841297B746869732E6261636B67726F756E64436C69703D7972284B652C';
wwv_flow_imp.g_varchar2_table(1105) := '412E6261636B67726F756E64436C6970292C746869732E6261636B67726F756E64436F6C6F723D79722849652C412E6261636B67726F756E64436F6C6F72292C746869732E6261636B67726F756E64496D6167653D79722842742C412E6261636B67726F';
wwv_flow_imp.g_varchar2_table(1106) := '756E64496D616765292C746869732E6261636B67726F756E644F726967696E3D7972286E742C412E6261636B67726F756E644F726967696E292C746869732E6261636B67726F756E64506F736974696F6E3D79722873742C412E6261636B67726F756E64';
wwv_flow_imp.g_varchar2_table(1107) := '506F736974696F6E292C746869732E6261636B67726F756E645265706561743D79722869742C412E6261636B67726F756E64526570656174292C746869732E6261636B67726F756E6453697A653D79722851742C412E6261636B67726F756E6453697A65';
wwv_flow_imp.g_varchar2_table(1108) := '292C746869732E626F72646572546F70436F6C6F723D79722877742C412E626F72646572546F70436F6C6F72292C746869732E626F726465725269676874436F6C6F723D79722855742C412E626F726465725269676874436F6C6F72292C746869732E62';
wwv_flow_imp.g_varchar2_table(1109) := '6F72646572426F74746F6D436F6C6F723D7972286C742C412E626F72646572426F74746F6D436F6C6F72292C746869732E626F726465724C656674436F6C6F723D79722843742C412E626F726465724C656674436F6C6F72292C746869732E626F726465';
wwv_flow_imp.g_varchar2_table(1110) := '72546F704C6566745261646975733D79722867742C412E626F72646572546F704C656674526164697573292C746869732E626F72646572546F7052696768745261646975733D79722845742C412E626F72646572546F705269676874526164697573292C';
wwv_flow_imp.g_varchar2_table(1111) := '746869732E626F72646572426F74746F6D52696768745261646975733D79722868742C412E626F72646572426F74746F6D5269676874526164697573292C746869732E626F72646572426F74746F6D4C6566745261646975733D79722846742C412E626F';
wwv_flow_imp.g_varchar2_table(1112) := '72646572426F74746F6D4C656674526164697573292C746869732E626F72646572546F705374796C653D79722848742C412E626F72646572546F705374796C65292C746869732E626F7264657252696768745374796C653D79722866742C412E626F7264';
wwv_flow_imp.g_varchar2_table(1113) := '657252696768745374796C65292C746869732E626F72646572426F74746F6D5374796C653D79722870742C412E626F72646572426F74746F6D5374796C65292C746869732E626F726465724C6566745374796C653D7972284E742C412E626F726465724C';
wwv_flow_imp.g_varchar2_table(1114) := '6566745374796C65292C746869732E626F72646572546F7057696474683D7972284B742C412E626F72646572546F705769647468292C746869732E626F72646572526967687457696474683D79722849742C412E626F7264657252696768745769647468';
wwv_flow_imp.g_varchar2_table(1115) := '292C746869732E626F72646572426F74746F6D57696474683D79722854742C412E626F72646572426F74746F6D5769647468292C746869732E626F726465724C65667457696474683D7972286D742C412E626F726465724C6566745769647468292C7468';
wwv_flow_imp.g_varchar2_table(1116) := '69732E626F78536861646F773D7972284F722C412E626F78536861646F77292C746869732E636F6C6F723D79722852742C412E636F6C6F72292C746869732E646973706C61793D7972284C742C412E646973706C6179292C746869732E666C6F61743D79';
wwv_flow_imp.g_varchar2_table(1117) := '722853742C412E637373466C6F6174292C746869732E666F6E7446616D696C793D79722864722C412E666F6E7446616D696C79292C746869732E666F6E7453697A653D79722848722C412E666F6E7453697A65292C746869732E666F6E745374796C653D';
wwv_flow_imp.g_varchar2_table(1118) := '79722849722C412E666F6E745374796C65292C746869732E666F6E7456617269616E743D79722870722C412E666F6E7456617269616E74292C746869732E666F6E745765696768743D79722866722C412E666F6E74576569676874292C746869732E6C65';
wwv_flow_imp.g_varchar2_table(1119) := '7474657253706163696E673D7972284D742C412E6C657474657253706163696E67292C746869732E6C696E65427265616B3D79722876742C412E6C696E65427265616B292C746869732E6C696E654865696768743D79722879742C412E6C696E65486569';
wwv_flow_imp.g_varchar2_table(1120) := '676874292C746869732E6C6973745374796C65496D6167653D7972285F742C412E6C6973745374796C65496D616765292C746869732E6C6973745374796C65506F736974696F6E3D79722850742C412E6C6973745374796C65506F736974696F6E292C74';
wwv_flow_imp.g_varchar2_table(1121) := '6869732E6C6973745374796C65547970653D7972287A742C412E6C6973745374796C6554797065292C746869732E6D617267696E546F703D79722858742C412E6D617267696E546F70292C746869732E6D617267696E52696768743D79722847742C412E';
wwv_flow_imp.g_varchar2_table(1122) := '6D617267696E5269676874292C746869732E6D617267696E426F74746F6D3D7972284A742C412E6D617267696E426F74746F6D292C746869732E6D617267696E4C6566743D7972286B742C412E6D617267696E4C656674292C746869732E6F7061636974';
wwv_flow_imp.g_varchar2_table(1123) := '793D79722845722C412E6F706163697479293B76617220653D79722871742C412E6F766572666C6F77293B746869732E6F766572666C6F77583D655B305D2C746869732E6F766572666C6F77593D655B313C652E6C656E6774683F313A305D2C74686973';
wwv_flow_imp.g_varchar2_table(1124) := '2E6F766572666C6F77577261703D7972285A742C412E6F766572666C6F7757726170292C746869732E70616464696E67546F703D7972286A742C412E70616464696E67546F70292C746869732E70616464696E6752696768743D79722824742C412E7061';
wwv_flow_imp.g_varchar2_table(1125) := '6464696E675269676874292C746869732E70616464696E67426F74746F6D3D79722841722C412E70616464696E67426F74746F6D292C746869732E70616464696E674C6566743D79722865722C412E70616464696E674C656674292C746869732E706F73';
wwv_flow_imp.g_varchar2_table(1126) := '6974696F6E3D7972286E722C412E706F736974696F6E292C746869732E74657874416C69676E3D79722872722C412E74657874416C69676E292C746869732E746578744465636F726174696F6E436F6C6F723D79722868722C6E756C6C213D3D28653D41';
wwv_flow_imp.g_varchar2_table(1127) := '2E746578744465636F726174696F6E436F6C6F72292626766F69642030213D3D653F653A412E636F6C6F72292C746869732E746578744465636F726174696F6E4C696E653D79722846722C6E756C6C213D3D28653D412E746578744465636F726174696F';
wwv_flow_imp.g_varchar2_table(1128) := '6E4C696E65292626766F69642030213D3D653F653A412E746578744465636F726174696F6E292C746869732E74657874536861646F773D79722873722C412E74657874536861646F77292C746869732E746578745472616E73666F726D3D79722869722C';
wwv_flow_imp.g_varchar2_table(1129) := '412E746578745472616E73666F726D292C746869732E7472616E73666F726D3D79722861722C412E7472616E73666F726D292C746869732E7472616E73666F726D4F726967696E3D79722875722C412E7472616E73666F726D4F726967696E292C746869';
wwv_flow_imp.g_varchar2_table(1130) := '732E7669736962696C6974793D79722855722C412E7669736962696C697479292C746869732E776F7264427265616B3D79722843722C412E776F7264427265616B292C746869732E7A496E6465783D79722867722C412E7A496E646578297D7661722053';
wwv_flow_imp.g_varchar2_table(1131) := '722C4D723D66756E6374696F6E2841297B746869732E636F6E74656E743D79722854722C412E636F6E74656E74292C746869732E71756F7465733D7972284C722C412E71756F746573297D2C76723D66756E6374696F6E2841297B746869732E636F756E';
wwv_flow_imp.g_varchar2_table(1132) := '746572496E6372656D656E743D7972286D722C412E636F756E746572496E6372656D656E74292C746869732E636F756E74657252657365743D79722852722C412E636F756E7465725265736574297D2C79723D66756E6374696F6E28412C65297B766172';
wwv_flow_imp.g_varchar2_table(1133) := '20743D6E65772076412C653D6E756C6C213D653F652E746F537472696E6728293A412E696E697469616C56616C75653B742E77726974652865293B76617220723D6E6577205F4128742E726561642829293B73776974636828412E74797065297B636173';
wwv_flow_imp.g_varchar2_table(1134) := '65206C652E4944454E545F56414C55453A76617220423D722E7061727365436F6D706F6E656E7456616C756528293B72657475726E20412E7061727365287A412842293F422E76616C75653A412E696E697469616C56616C7565293B63617365206C652E';
wwv_flow_imp.g_varchar2_table(1135) := '56414C55453A72657475726E20412E706172736528722E7061727365436F6D706F6E656E7456616C75652829293B63617365206C652E4C4953543A72657475726E20412E706172736528722E7061727365436F6D706F6E656E7456616C7565732829293B';
wwv_flow_imp.g_varchar2_table(1136) := '63617365206C652E544F4B454E5F56414C55453A72657475726E20722E7061727365436F6D706F6E656E7456616C756528293B63617365206C652E545950455F56414C55453A73776974636828412E666F726D6174297B6361736522616E676C65223A72';
wwv_flow_imp.g_varchar2_table(1137) := '657475726E20616528722E7061727365436F6D706F6E656E7456616C75652829293B6361736522636F6C6F72223A72657475726E20516528722E7061727365436F6D706F6E656E7456616C75652829293B6361736522696D616765223A72657475726E20';
wwv_flow_imp.g_varchar2_table(1138) := '657428722E7061727365436F6D706F6E656E7456616C75652829293B63617365226C656E677468223A766172206E3D722E7061727365436F6D706F6E656E7456616C756528293B72657475726E205941286E293F6E3A6E653B63617365226C656E677468';
wwv_flow_imp.g_varchar2_table(1139) := '2D70657263656E74616765223A6E3D722E7061727365436F6D706F6E656E7456616C756528293B72657475726E207141286E293F6E3A6E657D7D7D2C5F723D66756E6374696F6E2841297B746869732E7374796C65733D6E65772044722877696E646F77';
wwv_flow_imp.g_varchar2_table(1140) := '2E676574436F6D70757465645374796C6528412C6E756C6C29292C746869732E746578744E6F6465733D5B5D2C746869732E656C656D656E74733D5B5D2C6E756C6C213D3D746869732E7374796C65732E7472616E73666F726D26267642284129262628';
wwv_flow_imp.g_varchar2_table(1141) := '412E7374796C652E7472616E73666F726D3D226E6F6E6522292C746869732E626F756E64733D672841292C746869732E666C6167733D307D2C78723D66756E6374696F6E28412C65297B746869732E746578743D412C746869732E626F756E64733D657D';
wwv_flow_imp.g_varchar2_table(1142) := '2C50723D66756E6374696F6E2841297B76617220653D412E6F776E6572446F63756D656E743B69662865297B76617220743D652E637265617465456C656D656E74282268746D6C3263616E7661737772617070657222293B742E617070656E644368696C';
wwv_flow_imp.g_varchar2_table(1143) := '6428412E636C6F6E654E6F646528213029293B653D412E706172656E744E6F64653B69662865297B652E7265706C6163654368696C6428742C41293B413D672874293B72657475726E20742E66697273744368696C642626652E7265706C616365436869';
wwv_flow_imp.g_varchar2_table(1144) := '6C6428742E66697273744368696C642C74292C417D7D72657475726E206E6577206828302C302C302C30297D2C56723D66756E6374696F6E28412C652C74297B76617220723D412E6F776E6572446F63756D656E743B6966282172297468726F77206E65';
wwv_flow_imp.g_varchar2_table(1145) := '77204572726F7228224E6F646520686173206E6F206F776E657220646F63756D656E7422293B723D722E63726561746552616E676528293B72657475726E20722E736574537461727428412C65292C722E736574456E6428412C652B74292C682E66726F';
wwv_flow_imp.g_varchar2_table(1146) := '6D436C69656E745265637428722E676574426F756E64696E67436C69656E74526563742829297D2C7A723D66756E6374696F6E28412C65297B72657475726E2030213D3D652E6C657474657253706163696E673F632841292E6D61702866756E6374696F';
wwv_flow_imp.g_varchar2_table(1147) := '6E2841297B72657475726E20512841297D293A587228412C65297D2C58723D66756E6374696F6E28412C65297B666F722876617220742C723D734128412C7B6C696E65427265616B3A652E6C696E65427265616B2C776F7264427265616B3A652E6F7665';
wwv_flow_imp.g_varchar2_table(1148) := '72666C6F77577261703D3D3D57742E425245414B5F574F52443F22627265616B2D776F7264223A652E776F7264427265616B7D292C423D5B5D3B2128743D722E6E6578742829292E646F6E653B29742E76616C75652626422E7075736828742E76616C75';
wwv_flow_imp.g_varchar2_table(1149) := '652E736C6963652829293B72657475726E20427D2C47723D66756E6374696F6E28412C65297B76617220742C722C422C6E2C733B746869732E746578743D4A7228412E646174612C652E746578745472616E73666F726D292C746869732E74657874426F';
wwv_flow_imp.g_varchar2_table(1150) := '756E64733D28743D746869732E746578742C423D412C743D7A7228742C723D65292C6E3D5B5D2C733D302C742E666F72456163682866756E6374696F6E2841297B76617220653B722E746578744465636F726174696F6E4C696E652E6C656E6774687C7C';
wwv_flow_imp.g_varchar2_table(1151) := '303C412E7472696D28292E6C656E6774683F52652E535550504F52545F52414E47455F424F554E44533F6E2E70757368286E657720787228412C567228422C732C412E6C656E6774682929293A28653D422E73706C69745465787428412E6C656E677468';
wwv_flow_imp.g_varchar2_table(1152) := '292C6E2E70757368286E657720787228412C507228422929292C423D65293A52652E535550504F52545F52414E47455F424F554E44537C7C28423D422E73706C69745465787428412E6C656E67746829292C732B3D412E6C656E6774687D292C6E297D2C';
wwv_flow_imp.g_varchar2_table(1153) := '4A723D66756E6374696F6E28412C65297B7377697463682865297B636173652042722E4C4F574552434153453A72657475726E20412E746F4C6F7765724361736528293B636173652042722E4341504954414C495A453A72657475726E20412E7265706C';
wwv_flow_imp.g_varchar2_table(1154) := '616365286B722C5772293B636173652042722E5550504552434153453A72657475726E20412E746F55707065724361736528293B64656661756C743A72657475726E20417D7D2C6B723D2F285E7C5C737C3A7C2D7C5C287C5C2929285B612D7A5D292F67';
wwv_flow_imp.g_varchar2_table(1155) := '2C57723D66756E6374696F6E28412C652C74297B72657475726E20303C412E6C656E6774683F652B742E746F55707065724361736528293A417D2C59723D28412871722C53723D5F72292C7172293B66756E6374696F6E2071722841297B76617220653D';
wwv_flow_imp.g_varchar2_table(1156) := '53722E63616C6C28746869732C41297C7C746869733B72657475726E20652E7372633D412E63757272656E745372637C7C412E7372632C652E696E7472696E73696357696474683D412E6E61747572616C57696474682C652E696E7472696E7369634865';
wwv_flow_imp.g_varchar2_table(1157) := '696768743D412E6E61747572616C4865696768742C44652E676574496E7374616E636528292E616464496D61676528652E737263292C657D766172205A722C6A723D28412824722C5A723D5F72292C2472293B66756E6374696F6E2024722841297B7661';
wwv_flow_imp.g_varchar2_table(1158) := '7220653D5A722E63616C6C28746869732C41297C7C746869733B72657475726E20652E63616E7661733D412C652E696E7472696E73696357696474683D412E77696474682C652E696E7472696E7369634865696768743D412E6865696768742C657D7661';
wwv_flow_imp.g_varchar2_table(1159) := '722041422C65423D28412874422C41423D5F72292C7442293B66756E6374696F6E2074422841297B76617220653D41422E63616C6C28746869732C41297C7C746869732C743D6E657720584D4C53657269616C697A65722C723D672841293B7265747572';
wwv_flow_imp.g_varchar2_table(1160) := '6E20412E73657441747472696275746528227769647468222C722E77696474682B22707822292C412E7365744174747269627574652822686569676874222C722E6865696768742B22707822292C652E7376673D22646174613A696D6167652F7376672B';
wwv_flow_imp.g_varchar2_table(1161) := '786D6C2C222B656E636F6465555249436F6D706F6E656E7428742E73657269616C697A65546F537472696E67284129292C652E696E7472696E73696357696474683D412E77696474682E6261736556616C2E76616C75652C652E696E7472696E73696348';
wwv_flow_imp.g_varchar2_table(1162) := '65696768743D412E6865696768742E6261736556616C2E76616C75652C44652E676574496E7374616E636528292E616464496D61676528652E737667292C657D7661722072422C42423D2841286E422C72423D5F72292C6E42293B66756E6374696F6E20';
wwv_flow_imp.g_varchar2_table(1163) := '6E422841297B76617220653D72422E63616C6C28746869732C41297C7C746869733B72657475726E20652E76616C75653D412E76616C75652C657D7661722073422C6F423D28412869422C73423D5F72292C6942293B66756E6374696F6E206942284129';
wwv_flow_imp.g_varchar2_table(1164) := '7B76617220653D73422E63616C6C28746869732C41297C7C746869733B72657475726E20652E73746172743D412E73746172742C652E72657665727365643D22626F6F6C65616E223D3D747970656F6620412E7265766572736564262621303D3D3D412E';
wwv_flow_imp.g_varchar2_table(1165) := '72657665727365642C657D7661722061422C63423D5B7B747970653A6F412E44494D454E53494F4E5F544F4B454E2C666C6167733A302C756E69743A227078222C6E756D6265723A337D5D2C51423D5B7B747970653A6F412E50455243454E544147455F';
wwv_flow_imp.g_varchar2_table(1166) := '544F4B454E2C666C6167733A302C6E756D6265723A35307D5D2C75423D22636865636B626F78222C77423D22726164696F222C55423D2270617373776F7264222C6C423D3730373430363539312C43423D28412867422C61423D5F72292C6742293B6675';
wwv_flow_imp.g_varchar2_table(1167) := '6E6374696F6E2067422841297B76617220652C743D61422E63616C6C28746869732C41297C7C746869733B73776974636828742E747970653D412E747970652E746F4C6F7765724361736528292C742E636865636B65643D412E636865636B65642C742E';
wwv_flow_imp.g_varchar2_table(1168) := '76616C75653D303D3D3D28413D28653D41292E747970653D3D3D55423F6E657720417272617928652E76616C75652E6C656E6774682B31292E6A6F696E2822E280A222293A652E76616C7565292E6C656E6774683F652E706C616365686F6C6465727C7C';
wwv_flow_imp.g_varchar2_table(1169) := '22223A412C742E74797065213D3D75422626742E74797065213D3D77427C7C28742E7374796C65732E6261636B67726F756E64436F6C6F723D333733393134383033312C742E7374796C65732E626F72646572546F70436F6C6F723D742E7374796C6573';
wwv_flow_imp.g_varchar2_table(1170) := '2E626F726465725269676874436F6C6F723D742E7374796C65732E626F72646572426F74746F6D436F6C6F723D742E7374796C65732E626F726465724C656674436F6C6F723D323737393039363537352C742E7374796C65732E626F72646572546F7057';
wwv_flow_imp.g_varchar2_table(1171) := '696474683D742E7374796C65732E626F72646572526967687457696474683D742E7374796C65732E626F72646572426F74746F6D57696474683D742E7374796C65732E626F726465724C65667457696474683D312C742E7374796C65732E626F72646572';
wwv_flow_imp.g_varchar2_table(1172) := '546F705374796C653D742E7374796C65732E626F7264657252696768745374796C653D742E7374796C65732E626F72646572426F74746F6D5374796C653D742E7374796C65732E626F726465724C6566745374796C653D63742E534F4C49442C742E7374';
wwv_flow_imp.g_varchar2_table(1173) := '796C65732E6261636B67726F756E64436C69703D5B43652E424F524445525F424F585D2C742E7374796C65732E6261636B67726F756E644F726967696E3D5B305D2C742E626F756E64733D28413D742E626F756E6473292E77696474683E412E68656967';
wwv_flow_imp.g_varchar2_table(1174) := '68743F6E6577206828412E6C6566742B28412E77696474682D412E686569676874292F322C412E746F702C412E6865696768742C412E686569676874293A412E77696474683C412E6865696768743F6E6577206828412E6C6566742C412E746F702B2841';
wwv_flow_imp.g_varchar2_table(1175) := '2E6865696768742D412E7769647468292F322C412E77696474682C412E7769647468293A41292C742E74797065297B636173652075423A742E7374796C65732E626F72646572546F7052696768745261646975733D742E7374796C65732E626F72646572';
wwv_flow_imp.g_varchar2_table(1176) := '546F704C6566745261646975733D742E7374796C65732E626F72646572426F74746F6D52696768745261646975733D742E7374796C65732E626F72646572426F74746F6D4C6566745261646975733D63423B627265616B3B636173652077423A742E7374';
wwv_flow_imp.g_varchar2_table(1177) := '796C65732E626F72646572546F7052696768745261646975733D742E7374796C65732E626F72646572546F704C6566745261646975733D742E7374796C65732E626F72646572426F74746F6D52696768745261646975733D742E7374796C65732E626F72';
wwv_flow_imp.g_varchar2_table(1178) := '646572426F74746F6D4C6566745261646975733D51427D72657475726E20747D7661722045422C68423D28412846422C45423D5F72292C4642293B66756E6374696F6E2046422841297B76617220653D45422E63616C6C28746869732C41297C7C746869';
wwv_flow_imp.g_varchar2_table(1179) := '732C413D412E6F7074696F6E735B412E73656C6563746564496E6465787C7C305D3B72657475726E20652E76616C75653D412626412E746578747C7C22222C657D7661722064422C48423D28412866422C64423D5F72292C6642293B66756E6374696F6E';
wwv_flow_imp.g_varchar2_table(1180) := '2066422841297B76617220653D64422E63616C6C28746869732C41297C7C746869733B72657475726E20652E76616C75653D412E76616C75652C657D66756E6374696F6E2070422841297B72657475726E205165285F412E6372656174652841292E7061';
wwv_flow_imp.g_varchar2_table(1181) := '727365436F6D706F6E656E7456616C75652829297D766172204E422C4B423D28412849422C4E423D5F72292C4942293B66756E6374696F6E2049422841297B76617220652C742C723D4E422E63616C6C28746869732C41297C7C746869733B722E737263';
wwv_flow_imp.g_varchar2_table(1182) := '3D412E7372632C722E77696474683D7061727365496E7428412E77696474682C3130297C7C302C722E6865696768743D7061727365496E7428412E6865696768742C3130297C7C302C722E6261636B67726F756E64436F6C6F723D722E7374796C65732E';
wwv_flow_imp.g_varchar2_table(1183) := '6261636B67726F756E64436F6C6F723B7472797B412E636F6E74656E7457696E646F772626412E636F6E74656E7457696E646F772E646F63756D656E742626412E636F6E74656E7457696E646F772E646F63756D656E742E646F63756D656E74456C656D';
wwv_flow_imp.g_varchar2_table(1184) := '656E74262628722E747265653D4F4228412E636F6E74656E7457696E646F772E646F63756D656E742E646F63756D656E74456C656D656E74292C653D412E636F6E74656E7457696E646F772E646F63756D656E742E646F63756D656E74456C656D656E74';
wwv_flow_imp.g_varchar2_table(1185) := '3F704228676574436F6D70757465645374796C6528412E636F6E74656E7457696E646F772E646F63756D656E742E646F63756D656E74456C656D656E74292E6261636B67726F756E64436F6C6F72293A68652E5452414E53504152454E542C743D412E63';
wwv_flow_imp.g_varchar2_table(1186) := '6F6E74656E7457696E646F772E646F63756D656E742E626F64793F704228676574436F6D70757465645374796C6528412E636F6E74656E7457696E646F772E646F63756D656E742E626F6479292E6261636B67726F756E64436F6C6F72293A68652E5452';
wwv_flow_imp.g_varchar2_table(1187) := '414E53504152454E542C722E6261636B67726F756E64436F6C6F723D65652865293F65652874293F722E7374796C65732E6261636B67726F756E64436F6C6F723A743A65297D63617463682841297B7D72657475726E20727D66756E6374696F6E205442';
wwv_flow_imp.g_varchar2_table(1188) := '2841297B72657475726E225354594C45223D3D3D412E7461674E616D657D766172206D423D5B224F4C222C22554C222C224D454E55225D2C52423D66756E6374696F6E28412C652C74297B666F722876617220723D412E66697273744368696C643B723B';
wwv_flow_imp.g_varchar2_table(1189) := '723D6E297B76617220422C6E3D722E6E6578745369626C696E673B53422872292626303C722E646174612E7472696D28292E6C656E6774683F652E746578744E6F6465732E70757368286E657720477228722C652E7374796C657329293A4D4228722926';
wwv_flow_imp.g_varchar2_table(1190) := '262859422872292626722E61737369676E65644E6F6465733F722E61737369676E65644E6F64657328292E666F72456163682866756E6374696F6E2841297B72657475726E20524228412C652C74297D293A28423D4C42287229292E7374796C65732E69';
wwv_flow_imp.g_varchar2_table(1191) := '7356697369626C652829262628444228722C422C74293F422E666C6167737C3D343A624228422E7374796C657329262628422E666C6167737C3D32292C2D31213D3D6D422E696E6465784F6628722E7461674E616D6529262628422E666C6167737C3D38';
wwv_flow_imp.g_varchar2_table(1192) := '292C652E656C656D656E74732E707573682842292C722E736C6F742C722E736861646F77526F6F743F524228722E736861646F77526F6F742C422C74293A6B422872297C7C56422872297C7C57422872297C7C524228722C422C742929297D7D2C4C423D';
wwv_flow_imp.g_varchar2_table(1193) := '66756E6374696F6E2841297B72657475726E206E65772847422841293F59723A58422841293F6A723A56422841293F65423A5F422841293F42423A78422841293F6F423A50422841293F43423A57422841293F68423A6B422841293F48423A4A42284129';
wwv_flow_imp.g_varchar2_table(1194) := '3F4B423A5F72292841297D2C4F423D66756E6374696F6E2841297B76617220653D4C422841293B72657475726E20652E666C6167737C3D342C524228412C652C65292C657D2C44423D66756E6374696F6E28412C652C74297B72657475726E20652E7374';
wwv_flow_imp.g_varchar2_table(1195) := '796C65732E6973506F736974696F6E6564576974685A496E64657828297C7C652E7374796C65732E6F7061636974793C317C7C652E7374796C65732E69735472616E73666F726D656428297C7C7A422841292626742E7374796C65732E69735472616E73';
wwv_flow_imp.g_varchar2_table(1196) := '706172656E7428297D2C62423D66756E6374696F6E2841297B72657475726E20412E6973506F736974696F6E656428297C7C412E6973466C6F6174696E6728297D2C53423D66756E6374696F6E2841297B72657475726E20412E6E6F6465547970653D3D';
wwv_flow_imp.g_varchar2_table(1197) := '3D4E6F64652E544558545F4E4F44457D2C4D423D66756E6374696F6E2841297B72657475726E20412E6E6F6465547970653D3D3D4E6F64652E454C454D454E545F4E4F44457D2C76423D66756E6374696F6E2841297B72657475726E204D422841292626';
wwv_flow_imp.g_varchar2_table(1198) := '766F69642030213D3D412E7374796C6526262179422841297D2C79423D66756E6374696F6E2841297B72657475726E226F626A656374223D3D747970656F6620412E636C6173734E616D657D2C5F423D66756E6374696F6E2841297B72657475726E224C';
wwv_flow_imp.g_varchar2_table(1199) := '49223D3D3D412E7461674E616D657D2C78423D66756E6374696F6E2841297B72657475726E224F4C223D3D3D412E7461674E616D657D2C50423D66756E6374696F6E2841297B72657475726E22494E505554223D3D3D412E7461674E616D657D2C56423D';
wwv_flow_imp.g_varchar2_table(1200) := '66756E6374696F6E2841297B72657475726E22737667223D3D3D412E7461674E616D657D2C7A423D66756E6374696F6E2841297B72657475726E22424F4459223D3D3D412E7461674E616D657D2C58423D66756E6374696F6E2841297B72657475726E22';
wwv_flow_imp.g_varchar2_table(1201) := '43414E564153223D3D3D412E7461674E616D657D2C47423D66756E6374696F6E2841297B72657475726E22494D47223D3D3D412E7461674E616D657D2C4A423D66756E6374696F6E2841297B72657475726E22494652414D45223D3D3D412E7461674E61';
wwv_flow_imp.g_varchar2_table(1202) := '6D657D2C6B423D66756E6374696F6E2841297B72657475726E225445585441524541223D3D3D412E7461674E616D657D2C57423D66756E6374696F6E2841297B72657475726E2253454C454354223D3D3D412E7461674E616D657D2C59423D66756E6374';
wwv_flow_imp.g_varchar2_table(1203) := '696F6E2841297B72657475726E22534C4F54223D3D3D412E7461674E616D657D2C71423D285A422E70726F746F747970652E676574436F756E74657256616C75653D66756E6374696F6E2841297B413D746869732E636F756E746572735B415D3B726574';
wwv_flow_imp.g_varchar2_table(1204) := '75726E20412626412E6C656E6774683F415B412E6C656E6774682D315D3A317D2C5A422E70726F746F747970652E676574436F756E74657256616C7565733D66756E6374696F6E2841297B413D746869732E636F756E746572735B415D3B72657475726E';
wwv_flow_imp.g_varchar2_table(1205) := '20417C7C5B5D7D2C5A422E70726F746F747970652E706F703D66756E6374696F6E2841297B76617220653D746869733B412E666F72456163682866756E6374696F6E2841297B72657475726E20652E636F756E746572735B415D2E706F7028297D297D2C';
wwv_flow_imp.g_varchar2_table(1206) := '5A422E70726F746F747970652E70617273653D66756E6374696F6E2841297B76617220743D746869732C653D412E636F756E746572496E6372656D656E742C413D412E636F756E74657252657365742C723D21303B6E756C6C213D3D652626652E666F72';
wwv_flow_imp.g_varchar2_table(1207) := '456163682866756E6374696F6E2841297B76617220653D742E636F756E746572735B412E636F756E7465725D3B65262630213D3D412E696E6372656D656E74262628723D21312C655B4D6174682E6D617828302C652E6C656E6774682D31295D2B3D412E';
wwv_flow_imp.g_varchar2_table(1208) := '696E6372656D656E74297D293B76617220423D5B5D3B72657475726E20722626412E666F72456163682866756E6374696F6E2841297B76617220653D742E636F756E746572735B412E636F756E7465725D3B422E7075736828412E636F756E746572292C';
wwv_flow_imp.g_varchar2_table(1209) := '28653D657C7C28742E636F756E746572735B412E636F756E7465725D3D5B5D29292E7075736828412E7265736574297D292C427D2C5A42293B66756E6374696F6E205A4228297B746869732E636F756E746572733D7B7D7D66756E6374696F6E206A4228';
wwv_flow_imp.g_varchar2_table(1210) := '722C412C652C422C742C6E297B72657475726E20723C417C7C653C723F636E28722C742C303C6E2E6C656E677468293A422E696E7465676572732E7265647563652866756E6374696F6E28412C652C74297B666F72283B653C3D723B29722D3D652C412B';
wwv_flow_imp.g_varchar2_table(1211) := '3D422E76616C7565735B745D3B72657475726E20417D2C2222292B6E7D66756E6374696F6E20244228412C652C742C72297B666F722876617220423D22223B747C7C412D2D2C423D722841292B422C653C3D28412F3D65292A653B293B72657475726E20';
wwv_flow_imp.g_varchar2_table(1212) := '427D66756E6374696F6E20416E28412C652C742C722C42297B766172206E3D742D652B313B72657475726E28413C303F222D223A2222292B282442284D6174682E6162732841292C6E2C722C66756E6374696F6E2841297B72657475726E2051284D6174';
wwv_flow_imp.g_varchar2_table(1213) := '682E666C6F6F722841256E292B65297D292B42297D66756E6374696F6E20656E28412C652C74297B766F696420303D3D3D74262628743D222E2022293B76617220723D652E6C656E6774683B72657475726E202442284D6174682E6162732841292C722C';
wwv_flow_imp.g_varchar2_table(1214) := '21312C66756E6374696F6E2841297B72657475726E20655B4D6174682E666C6F6F7228412572295D7D292B747D66756E6374696F6E20746E28412C652C742C722C422C6E297B696628413C2D393939397C7C393939393C412972657475726E20636E2841';
wwv_flow_imp.g_varchar2_table(1215) := '2C78742E434A4B5F444543494D414C2C303C422E6C656E677468293B76617220733D4D6174682E6162732841292C6F3D423B696628303D3D3D732972657475726E20655B305D2B6F3B666F722876617220693D303B303C732626693C3D343B692B2B297B';
wwv_flow_imp.g_varchar2_table(1216) := '76617220613D732531303B303D3D6126264E72286E2C312926262222213D3D6F3F6F3D655B615D2B6F3A313C617C7C313D3D612626303D3D3D697C7C313D3D612626313D3D3D6926264E72286E2C32297C7C313D3D612626313D3D3D6926264E72286E2C';
wwv_flow_imp.g_varchar2_table(1217) := '342926263130303C417C7C313D3D612626313C6926264E72286E2C38293F6F3D655B615D2B28303C693F745B692D315D3A2222292B6F3A313D3D612626303C692626286F3D745B692D315D2B6F292C733D4D6174682E666C6F6F7228732F3130297D7265';
wwv_flow_imp.g_varchar2_table(1218) := '7475726E28413C303F723A2222292B6F7D76617220726E2C426E3D7B696E7465676572733A5B3165332C3930302C3530302C3430302C3130302C39302C35302C34302C31302C392C352C342C315D2C76616C7565733A5B224D222C22434D222C2244222C';
wwv_flow_imp.g_varchar2_table(1219) := '224344222C2243222C225843222C224C222C22584C222C2258222C224958222C2256222C224956222C2249225D7D2C6E6E3D7B696E7465676572733A5B3965332C3865332C3765332C3665332C3565332C3465332C3365332C3265332C3165332C393030';
wwv_flow_imp.g_varchar2_table(1220) := '2C3830302C3730302C3630302C3530302C3430302C3330302C3230302C3130302C39302C38302C37302C36302C35302C34302C33302C32302C31302C392C382C372C362C352C342C332C322C315D2C76616C7565733A5B22D594222C22D593222C22D592';
wwv_flow_imp.g_varchar2_table(1221) := '222C22D591222C22D590222C22D58F222C22D58E222C22D58D222C22D58C222C22D58B222C22D58A222C22D589222C22D588222C22D587222C22D586222C22D585222C22D584222C22D583222C22D582222C22D581222C22D580222C22D4BF222C22D4BE';
wwv_flow_imp.g_varchar2_table(1222) := '222C22D4BD222C22D4BC222C22D4BB222C22D4BA222C22D4B9222C22D4B8222C22D4B7222C22D4B6222C22D4B5222C22D4B4222C22D4B3222C22D4B2222C22D4B1225D7D2C736E3D7B696E7465676572733A5B3165342C3965332C3865332C3765332C36';
wwv_flow_imp.g_varchar2_table(1223) := '65332C3565332C3465332C3365332C3265332C3165332C3430302C3330302C3230302C3130302C39302C38302C37302C36302C35302C34302C33302C32302C31392C31382C31372C31362C31352C31302C392C382C372C362C352C342C332C322C315D2C';
wwv_flow_imp.g_varchar2_table(1224) := '76616C7565733A5B22D799D7B3222C22D798D7B3222C22D797D7B3222C22D796D7B3222C22D795D7B3222C22D794D7B3222C22D793D7B3222C22D792D7B3222C22D791D7B3222C22D790D7B3222C22D7AA222C22D7A9222C22D7A8222C22D7A7222C22D7';
wwv_flow_imp.g_varchar2_table(1225) := 'A6222C22D7A4222C22D7A2222C22D7A1222C22D7A0222C22D79E222C22D79C222C22D79B222C22D799D798222C22D799D797222C22D799D796222C22D798D796222C22D798D795222C22D799222C22D798222C22D797222C22D796222C22D795222C22D7';
wwv_flow_imp.g_varchar2_table(1226) := '94222C22D793222C22D792222C22D791222C22D790225D7D2C6F6E3D7B696E7465676572733A5B3165342C3965332C3865332C3765332C3665332C3565332C3465332C3365332C3265332C3165332C3930302C3830302C3730302C3630302C3530302C34';
wwv_flow_imp.g_varchar2_table(1227) := '30302C3330302C3230302C3130302C39302C38302C37302C36302C35302C34302C33302C32302C31302C392C382C372C362C352C342C332C322C315D2C76616C7565733A5B22E183B5222C22E183B0222C22E183AF222C22E183B4222C22E183AE222C22';
wwv_flow_imp.g_varchar2_table(1228) := 'E183AD222C22E183AC222C22E183AB222C22E183AA222C22E183A9222C22E183A8222C22E183A7222C22E183A6222C22E183A5222C22E183A4222C22E183B3222C22E183A2222C22E183A1222C22E183A0222C22E1839F222C22E1839E222C22E1839D22';
wwv_flow_imp.g_varchar2_table(1229) := '2C22E183B2222C22E1839C222C22E1839B222C22E1839A222C22E18399222C22E18398222C22E18397222C22E183B1222C22E18396222C22E18395222C22E18394222C22E18393222C22E18392222C22E18391222C22E18390225D7D2C616E3D22EBA788';
wwv_flow_imp.g_varchar2_table(1230) := 'EC9DB4EB8488EC8AA4222C636E3D66756E6374696F6E28412C652C74297B76617220723D743F222E20223A22222C423D743F22E38081223A22222C6E3D743F222C20223A22222C733D743F2220223A22223B7377697463682865297B636173652078742E';
wwv_flow_imp.g_varchar2_table(1231) := '444953433A72657475726E22E280A2222B733B636173652078742E434952434C453A72657475726E22E297A6222B733B636173652078742E5351554152453A72657475726E22E297BE222B733B636173652078742E444543494D414C5F4C454144494E47';
wwv_flow_imp.g_varchar2_table(1232) := '5F5A45524F3A766172206F3D416E28412C34382C35372C21302C72293B72657475726E206F2E6C656E6774683C343F2230222B6F3A6F3B636173652078742E434A4B5F444543494D414C3A72657475726E20656E28412C22E38087E4B880E4BA8CE4B889';
wwv_flow_imp.g_varchar2_table(1233) := 'E59B9BE4BA94E585ADE4B883E585ABE4B99D222C42293B636173652078742E4C4F5745525F524F4D414E3A72657475726E206A4228412C312C333939392C426E2C78742E444543494D414C2C72292E746F4C6F7765724361736528293B63617365207874';
wwv_flow_imp.g_varchar2_table(1234) := '2E55505045525F524F4D414E3A72657475726E206A4228412C312C333939392C426E2C78742E444543494D414C2C72293B636173652078742E4C4F5745525F475245454B3A72657475726E20416E28412C3934352C3936392C21312C72293B6361736520';
wwv_flow_imp.g_varchar2_table(1235) := '78742E4C4F5745525F414C5048413A72657475726E20416E28412C39372C3132322C21312C72293B636173652078742E55505045525F414C5048413A72657475726E20416E28412C36352C39302C21312C72293B636173652078742E4152414249435F49';
wwv_flow_imp.g_varchar2_table(1236) := '4E4449433A72657475726E20416E28412C313633322C313634312C21302C72293B636173652078742E41524D454E49414E3A636173652078742E55505045525F41524D454E49414E3A72657475726E206A4228412C312C393939392C6E6E2C78742E4445';
wwv_flow_imp.g_varchar2_table(1237) := '43494D414C2C72293B636173652078742E4C4F5745525F41524D454E49414E3A72657475726E206A4228412C312C393939392C6E6E2C78742E444543494D414C2C72292E746F4C6F7765724361736528293B636173652078742E42454E47414C493A7265';
wwv_flow_imp.g_varchar2_table(1238) := '7475726E20416E28412C323533342C323534332C21302C72293B636173652078742E43414D424F4449414E3A636173652078742E4B484D45523A72657475726E20416E28412C363131322C363132312C21302C72293B636173652078742E434A4B5F4541';
wwv_flow_imp.g_varchar2_table(1239) := '5254484C595F4252414E43483A72657475726E20656E28412C22E5AD90E4B891E5AF85E58DAFE8BEB0E5B7B3E58D88E69CAAE794B3E98589E6888CE4BAA5222C42293B636173652078742E434A4B5F48454156454E4C595F5354454D3A72657475726E20';
wwv_flow_imp.g_varchar2_table(1240) := '656E28412C22E794B2E4B999E4B899E4B881E6888AE5B7B1E5BA9AE8BE9BE5A3ACE799B8222C42293B636173652078742E434A4B5F4944454F475241504849433A636173652078742E545241445F4348494E4553455F494E464F524D414C3A7265747572';
wwv_flow_imp.g_varchar2_table(1241) := '6E20746E28412C22E99BB6E4B880E4BA8CE4B889E59B9BE4BA94E585ADE4B883E585ABE4B99D222C22E58D81E799BEE58D83E890AC222C22E8B2A0222C422C3134293B636173652078742E545241445F4348494E4553455F464F524D414C3A7265747572';
wwv_flow_imp.g_varchar2_table(1242) := '6E20746E28412C22E99BB6E5A3B9E8B2B3E58F83E88286E4BC8DE999B8E69F92E68D8CE78E96222C22E68BBEE4BDB0E4BB9FE890AC222C22E8B2A0222C422C3135293B636173652078742E53494D505F4348494E4553455F494E464F524D414C3A726574';
wwv_flow_imp.g_varchar2_table(1243) := '75726E20746E28412C22E99BB6E4B880E4BA8CE4B889E59B9BE4BA94E585ADE4B883E585ABE4B99D222C22E58D81E799BEE58D83E890AC222C22E8B49F222C422C3134293B636173652078742E53494D505F4348494E4553455F464F524D414C3A726574';
wwv_flow_imp.g_varchar2_table(1244) := '75726E20746E28412C22E99BB6E5A3B9E8B4B0E58F81E88286E4BC8DE99986E69F92E68D8CE78E96222C22E68BBEE4BDB0E4BB9FE890AC222C22E8B49F222C422C3135293B636173652078742E4A4150414E4553455F494E464F524D414C3A7265747572';
wwv_flow_imp.g_varchar2_table(1245) := '6E20746E28412C22E38087E4B880E4BA8CE4B889E59B9BE4BA94E585ADE4B883E585ABE4B99D222C22E58D81E799BEE58D83E4B887222C22E3839EE382A4E3838AE382B9222C422C30293B636173652078742E4A4150414E4553455F464F524D414C3A72';
wwv_flow_imp.g_varchar2_table(1246) := '657475726E20746E28412C22E99BB6E5A3B1E5BC90E58F82E59B9BE4BC8DE585ADE4B883E585ABE4B99D222C22E68BBEE799BEE58D83E4B887222C22E3839EE382A4E3838AE382B9222C422C37293B636173652078742E4B4F5245414E5F48414E47554C';
wwv_flow_imp.g_varchar2_table(1247) := '5F464F524D414C3A72657475726E20746E28412C22EC9881EC9DBCEC9DB4EC82BCEC82ACEC98A4EC9CA1ECB9A0ED8C94EAB5AC222C22EC8BADEBB0B1ECB29CEBA78C222C616E2C6E2C37293B636173652078742E4B4F5245414E5F48414E4A415F494E46';
wwv_flow_imp.g_varchar2_table(1248) := '4F524D414C3A72657475726E20746E28412C22E99BB6E4B880E4BA8CE4B889E59B9BE4BA94E585ADE4B883E585ABE4B99D222C22E58D81E799BEE58D83E890AC222C616E2C6E2C30293B636173652078742E4B4F5245414E5F48414E4A415F464F524D41';
wwv_flow_imp.g_varchar2_table(1249) := '4C3A72657475726E20746E28412C22E99BB6E5A3B9E8B2B3E58F83E59B9BE4BA94E585ADE4B883E585ABE4B99D222C22E68BBEE799BEE58D83222C616E2C6E2C37293B636173652078742E444556414E41474152493A72657475726E20416E28412C3234';
wwv_flow_imp.g_varchar2_table(1250) := '30362C323431352C21302C72293B636173652078742E47454F524749414E3A72657475726E206A4228412C312C31393939392C6F6E2C78742E444543494D414C2C72293B636173652078742E47554A41524154493A72657475726E20416E28412C323739';
wwv_flow_imp.g_varchar2_table(1251) := '302C323739392C21302C72293B636173652078742E4755524D554B48493A72657475726E20416E28412C323636322C323637312C21302C72293B636173652078742E4845425245573A72657475726E206A4228412C312C31303939392C736E2C78742E44';
wwv_flow_imp.g_varchar2_table(1252) := '4543494D414C2C72293B636173652078742E4849524147414E413A72657475726E20656E28412C22E38182E38184E38186E38188E3818AE3818BE3818DE3818FE38191E38193E38195E38197E38199E3819BE3819DE3819FE381A1E381A4E381A6E381A8';
wwv_flow_imp.g_varchar2_table(1253) := 'E381AAE381ABE381ACE381ADE381AEE381AFE381B2E381B5E381B8E381BBE381BEE381BFE38280E38281E38282E38284E38286E38288E38289E3828AE3828BE3828CE3828DE3828FE38290E38291E38292E3829322293B636173652078742E4849524147';
wwv_flow_imp.g_varchar2_table(1254) := '414E415F49524F48413A72657475726E20656E28412C22E38184E3828DE381AFE381ABE381BBE381B8E381A8E381A1E3828AE381ACE3828BE38292E3828FE3818BE38288E3819FE3828CE3819DE381A4E381ADE381AAE38289E38280E38186E38290E381';
wwv_flow_imp.g_varchar2_table(1255) := 'AEE3818AE3818FE38284E381BEE38191E381B5E38193E38188E381A6E38182E38195E3818DE38286E38281E381BFE38197E38291E381B2E38282E3819BE3819922293B636173652078742E4B414E4E4144413A72657475726E20416E28412C333330322C';
wwv_flow_imp.g_varchar2_table(1256) := '333331312C21302C72293B636173652078742E4B4154414B414E413A72657475726E20656E28412C22E382A2E382A4E382A6E382A8E382AAE382ABE382ADE382AFE382B1E382B3E382B5E382B7E382B9E382BBE382BDE382BFE38381E38384E38386E383';
wwv_flow_imp.g_varchar2_table(1257) := '88E3838AE3838BE3838CE3838DE3838EE3838FE38392E38395E38398E3839BE3839EE3839FE383A0E383A1E383A2E383A4E383A6E383A8E383A9E383AAE383ABE383ACE383ADE383AFE383B0E383B1E383B2E383B3222C42293B636173652078742E4B41';
wwv_flow_imp.g_varchar2_table(1258) := '54414B414E415F49524F48413A72657475726E20656E28412C22E382A4E383ADE3838FE3838BE3839BE38398E38388E38381E383AAE3838CE383ABE383B2E383AFE382ABE383A8E382BFE383ACE382BDE38384E3838DE3838AE383A9E383A0E382A6E383';
wwv_flow_imp.g_varchar2_table(1259) := 'B0E3838EE382AAE382AFE383A4E3839EE382B1E38395E382B3E382A8E38386E382A2E382B5E382ADE383A6E383A1E3839FE382B7E383B1E38392E383A2E382BBE382B9222C42293B636173652078742E4C414F3A72657475726E20416E28412C33373932';
wwv_flow_imp.g_varchar2_table(1260) := '2C333830312C21302C72293B636173652078742E4D4F4E474F4C49414E3A72657475726E20416E28412C363136302C363136392C21302C72293B636173652078742E4D59414E4D41523A72657475726E20416E28412C343136302C343136392C21302C72';
wwv_flow_imp.g_varchar2_table(1261) := '293B636173652078742E4F524959413A72657475726E20416E28412C323931382C323932372C21302C72293B636173652078742E5045525349414E3A72657475726E20416E28412C313737362C313738352C21302C72293B636173652078742E54414D49';
wwv_flow_imp.g_varchar2_table(1262) := '4C3A72657475726E20416E28412C333034362C333035352C21302C72293B636173652078742E54454C5547553A72657475726E20416E28412C333137342C333138332C21302C72293B636173652078742E544841493A72657475726E20416E28412C3336';
wwv_flow_imp.g_varchar2_table(1263) := '36342C333637332C21302C72293B636173652078742E5449424554414E3A72657475726E20416E28412C333837322C333838312C21302C72293B64656661756C743A78742E444543494D414C3B72657475726E20416E28412C34382C35372C21302C7229';
wwv_flow_imp.g_varchar2_table(1264) := '7D7D2C516E3D22646174612D68746D6C3263616E7661732D69676E6F7265222C756E3D28776E2E70726F746F747970652E746F494672616D653D66756E6374696F6E28412C72297B76617220653D746869732C423D436E28412C72293B69662821422E63';
wwv_flow_imp.g_varchar2_table(1265) := '6F6E74656E7457696E646F772972657475726E2050726F6D6973652E72656A6563742822556E61626C6520746F2066696E6420696672616D652077696E646F7722293B76617220743D412E64656661756C74566965772E70616765584F66667365742C6E';
wwv_flow_imp.g_varchar2_table(1266) := '3D412E64656661756C74566965772E70616765594F66667365742C733D422E636F6E74656E7457696E646F772C6F3D732E646F63756D656E742C413D456E2842292E7468656E2866756E6374696F6E28297B72657475726E206128652C766F696420302C';
wwv_flow_imp.g_varchar2_table(1267) := '766F696420302C66756E6374696F6E28297B76617220652C743B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E20746869732E7363726F6C6C6564456C656D65';
wwv_flow_imp.g_varchar2_table(1268) := '6E74732E666F724561636828486E292C73262628732E7363726F6C6C546F28722E6C6566742C722E746F70292C212F28695061647C6950686F6E657C69506F64292F672E74657374286E6176696761746F722E757365724167656E74297C7C732E736372';
wwv_flow_imp.g_varchar2_table(1269) := '6F6C6C593D3D3D722E746F702626732E7363726F6C6C583D3D3D722E6C6566747C7C286F2E646F63756D656E74456C656D656E742E7374796C652E746F703D2D722E746F702B227078222C6F2E646F63756D656E74456C656D656E742E7374796C652E6C';
wwv_flow_imp.g_varchar2_table(1270) := '6566743D2D722E6C6566742B227078222C6F2E646F63756D656E74456C656D656E742E7374796C652E706F736974696F6E3D226162736F6C7574652229292C653D746869732E6F7074696F6E732E6F6E636C6F6E652C766F696420303D3D3D28743D7468';
wwv_flow_imp.g_varchar2_table(1271) := '69732E636C6F6E65645265666572656E6365456C656D656E74293F5B322C50726F6D6973652E72656A65637428224572726F722066696E64696E672074686520222B746869732E7265666572656E6365456C656D656E742E6E6F64654E616D652B222069';
wwv_flow_imp.g_varchar2_table(1272) := '6E2074686520636C6F6E656420646F63756D656E7422295D3A6F2E666F6E747326266F2E666F6E74732E72656164793F5B342C6F2E666F6E74732E72656164795D3A5B332C325D3B6361736520313A412E73656E7428292C412E6C6162656C3D323B6361';
wwv_flow_imp.g_varchar2_table(1273) := '736520323A72657475726E2F284170706C655765624B6974292F672E74657374286E6176696761746F722E757365724167656E74293F5B342C676E286F295D3A5B332C345D3B6361736520333A412E73656E7428292C412E6C6162656C3D343B63617365';
wwv_flow_imp.g_varchar2_table(1274) := '20343A72657475726E2266756E6374696F6E223D3D747970656F6620653F5B322C50726F6D6973652E7265736F6C766528292E7468656E2866756E6374696F6E28297B72657475726E2065286F2C74297D292E7468656E2866756E6374696F6E28297B72';
wwv_flow_imp.g_varchar2_table(1275) := '657475726E20427D295D3A5B322C425D7D7D297D297D293B72657475726E206F2E6F70656E28292C6F2E777269746528466E28646F63756D656E742E646F6374797065292B223C68746D6C3E3C2F68746D6C3E22292C646E28746869732E726566657265';
wwv_flow_imp.g_varchar2_table(1276) := '6E6365456C656D656E742E6F776E6572446F63756D656E742C742C6E292C6F2E7265706C6163654368696C64286F2E61646F70744E6F646528746869732E646F63756D656E74456C656D656E74292C6F2E646F63756D656E74456C656D656E74292C6F2E';
wwv_flow_imp.g_varchar2_table(1277) := '636C6F736528292C417D2C776E2E70726F746F747970652E637265617465456C656D656E74436C6F6E653D66756E6374696F6E2841297B69662858422841292972657475726E20746869732E63726561746543616E766173436C6F6E652841293B696628';
wwv_flow_imp.g_varchar2_table(1278) := '54422841292972657475726E20746869732E6372656174655374796C65436C6F6E652841293B413D412E636C6F6E654E6F6465282131293B72657475726E2047422841292626226C617A79223D3D3D412E6C6F6164696E67262628412E6C6F6164696E67';
wwv_flow_imp.g_varchar2_table(1279) := '3D22656167657222292C417D2C776E2E70726F746F747970652E6372656174655374796C65436C6F6E653D66756E6374696F6E2841297B7472797B76617220653D412E73686565743B696628652626652E63737352756C6573297B76617220743D5B5D2E';
wwv_flow_imp.g_varchar2_table(1280) := '736C6963652E63616C6C28652E63737352756C65732C30292E7265647563652866756E6374696F6E28412C65297B72657475726E2065262622737472696E67223D3D747970656F6620652E637373546578743F412B652E637373546578743A417D2C2222';
wwv_flow_imp.g_varchar2_table(1281) := '292C723D412E636C6F6E654E6F6465282131293B72657475726E20722E74657874436F6E74656E743D742C727D7D63617463682841297B6966284C652E676574496E7374616E636528746869732E6F7074696F6E732E6964292E6572726F722822556E61';
wwv_flow_imp.g_varchar2_table(1282) := '626C6520746F206163636573732063737352756C65732070726F7065727479222C41292C2253656375726974794572726F7222213D3D412E6E616D65297468726F7720417D72657475726E20412E636C6F6E654E6F6465282131297D2C776E2E70726F74';
wwv_flow_imp.g_varchar2_table(1283) := '6F747970652E63726561746543616E766173436C6F6E653D66756E6374696F6E2841297B696628746869732E6F7074696F6E732E696E6C696E65496D616765732626412E6F776E6572446F63756D656E74297B76617220653D412E6F776E6572446F6375';
wwv_flow_imp.g_varchar2_table(1284) := '6D656E742E637265617465456C656D656E742822696D6722293B7472797B72657475726E20652E7372633D412E746F4461746155524C28292C657D63617463682841297B4C652E676574496E7374616E636528746869732E6F7074696F6E732E6964292E';
wwv_flow_imp.g_varchar2_table(1285) := '696E666F2822556E61626C6520746F20636C6F6E652063616E76617320636F6E74656E74732C2063616E766173206973207461696E74656422297D7D653D412E636C6F6E654E6F6465282131293B7472797B652E77696474683D412E77696474682C652E';
wwv_flow_imp.g_varchar2_table(1286) := '6865696768743D412E6865696768743B76617220743D412E676574436F6E746578742822326422292C723D652E676574436F6E746578742822326422293B72657475726E2072262628743F722E707574496D6167654461746128742E676574496D616765';
wwv_flow_imp.g_varchar2_table(1287) := '4461746128302C302C412E77696474682C412E686569676874292C302C30293A722E64726177496D61676528412C302C3029292C657D63617463682841297B7D72657475726E20657D2C776E2E70726F746F747970652E636C6F6E654E6F64653D66756E';
wwv_flow_imp.g_varchar2_table(1288) := '6374696F6E2841297B69662853422841292972657475726E20646F63756D656E742E637265617465546578744E6F646528412E64617461293B69662821412E6F776E6572446F63756D656E742972657475726E20412E636C6F6E654E6F6465282131293B';
wwv_flow_imp.g_varchar2_table(1289) := '76617220653D412E6F776E6572446F63756D656E742E64656661756C74566965773B6966286526264D4228412926262876422841297C7C794228412929297B76617220743D746869732E637265617465456C656D656E74436C6F6E652841292C723D652E';
wwv_flow_imp.g_varchar2_table(1290) := '676574436F6D70757465645374796C652841292C423D652E676574436F6D70757465645374796C6528412C223A6265666F726522292C6E3D652E676574436F6D70757465645374796C6528412C223A616674657222293B746869732E7265666572656E63';
wwv_flow_imp.g_varchar2_table(1291) := '65456C656D656E743D3D3D4126267642287429262628746869732E636C6F6E65645265666572656E6365456C656D656E743D74292C7A4228742926264B6E2874293B666F722876617220653D746869732E636F756E746572732E7061727365286E657720';
wwv_flow_imp.g_varchar2_table(1292) := '7672287229292C423D746869732E7265736F6C766550736575646F436F6E74656E7428412C742C422C726E2E4245464F5245292C733D412E66697273744368696C643B733B733D732E6E6578745369626C696E67294D4228732926262822534352495054';
wwv_flow_imp.g_varchar2_table(1293) := '223D3D3D732E7461674E616D657C7C732E68617341747472696275746528516E297C7C2266756E6374696F6E223D3D747970656F6620746869732E6F7074696F6E732E69676E6F7265456C656D656E74732626746869732E6F7074696F6E732E69676E6F';
wwv_flow_imp.g_varchar2_table(1294) := '7265456C656D656E7473287329297C7C746869732E6F7074696F6E732E636F70795374796C657326264D42287329262654422873297C7C742E617070656E644368696C6428746869732E636C6F6E654E6F6465287329293B422626742E696E7365727442';
wwv_flow_imp.g_varchar2_table(1295) := '65666F726528422C742E66697273744368696C64293B6E3D746869732E7265736F6C766550736575646F436F6E74656E7428412C742C6E2C726E2E4146544552293B72657475726E206E2626742E617070656E644368696C64286E292C746869732E636F';
wwv_flow_imp.g_varchar2_table(1296) := '756E746572732E706F702865292C72262628746869732E6F7074696F6E732E636F70795374796C65737C7C7942284129292626214A422841292626686E28722C74292C303D3D3D412E7363726F6C6C546F702626303D3D3D412E7363726F6C6C4C656674';
wwv_flow_imp.g_varchar2_table(1297) := '7C7C746869732E7363726F6C6C6564456C656D656E74732E70757368285B742C412E7363726F6C6C4C6566742C412E7363726F6C6C546F705D292C286B422841297C7C5742284129292626286B422874297C7C574228742929262628742E76616C75653D';
wwv_flow_imp.g_varchar2_table(1298) := '412E76616C7565292C747D72657475726E20412E636C6F6E654E6F6465282131297D2C776E2E70726F746F747970652E7265736F6C766550736575646F436F6E74656E743D66756E6374696F6E286F2C412C652C74297B76617220693D746869733B6966';
wwv_flow_imp.g_varchar2_table(1299) := '2865297B76617220723D652E636F6E74656E742C613D412E6F776E6572446F63756D656E743B696628612626722626226E6F6E6522213D3D722626222D6D6F7A2D616C742D636F6E74656E7422213D3D722626226E6F6E6522213D3D652E646973706C61';
wwv_flow_imp.g_varchar2_table(1300) := '79297B746869732E636F756E746572732E7061727365286E6577207672286529293B76617220633D6E6577204D722865292C513D612E637265617465456C656D656E74282268746D6C3263616E76617370736575646F656C656D656E7422293B686E2865';
wwv_flow_imp.g_varchar2_table(1301) := '2C51292C632E636F6E74656E742E666F72456163682866756E6374696F6E2841297B696628412E747970653D3D3D6F412E535452494E475F544F4B454E29512E617070656E644368696C6428612E637265617465546578744E6F646528412E76616C7565';
wwv_flow_imp.g_varchar2_table(1302) := '29293B656C736520696628412E747970653D3D3D6F412E55524C5F544F4B454E297B76617220653D612E637265617465456C656D656E742822696D6722293B652E7372633D412E76616C75652C652E7374796C652E6F7061636974793D2231222C512E61';
wwv_flow_imp.g_varchar2_table(1303) := '7070656E644368696C642865297D656C736520696628412E747970653D3D3D6F412E46554E4354494F4E297B76617220742C722C422C6E2C733B2261747472223D3D3D412E6E616D653F28653D412E76616C7565732E66696C746572287A4129292E6C65';
wwv_flow_imp.g_varchar2_table(1304) := '6E6774682626512E617070656E644368696C6428612E637265617465546578744E6F6465286F2E67657441747472696275746528655B305D2E76616C7565297C7C222229293A22636F756E746572223D3D3D412E6E616D653F28423D28723D412E76616C';
wwv_flow_imp.g_varchar2_table(1305) := '7565732E66696C746572286B4129295B305D2C723D725B315D2C4226267A41284229262628743D692E636F756E746572732E676574436F756E74657256616C756528422E76616C7565292C733D7226267A412872293F7A742E706172736528722E76616C';
wwv_flow_imp.g_varchar2_table(1306) := '7565293A78742E444543494D414C2C512E617070656E644368696C6428612E637265617465546578744E6F646528636E28742C732C213129292929293A22636F756E74657273223D3D3D412E6E616D65262628423D28743D412E76616C7565732E66696C';
wwv_flow_imp.g_varchar2_table(1307) := '746572286B4129295B305D2C733D745B315D2C723D745B325D2C4226267A41284229262628423D692E636F756E746572732E676574436F756E74657256616C75657328422E76616C7565292C6E3D7226267A412872293F7A742E706172736528722E7661';
wwv_flow_imp.g_varchar2_table(1308) := '6C7565293A78742E444543494D414C2C733D732626732E747970653D3D3D6F412E535452494E475F544F4B454E3F732E76616C75653A22222C733D422E6D61702866756E6374696F6E2841297B72657475726E20636E28412C6E2C2131297D292E6A6F69';
wwv_flow_imp.g_varchar2_table(1309) := '6E2873292C512E617070656E644368696C6428612E637265617465546578744E6F64652873292929297D656C736520696628412E747970653D3D3D6F412E4944454E545F544F4B454E2973776974636828412E76616C7565297B63617365226F70656E2D';
wwv_flow_imp.g_varchar2_table(1310) := '71756F7465223A512E617070656E644368696C6428612E637265617465546578744E6F6465284B7228632E71756F7465732C692E71756F746544657074682B2B2C21302929293B627265616B3B6361736522636C6F73652D71756F7465223A512E617070';
wwv_flow_imp.g_varchar2_table(1311) := '656E644368696C6428612E637265617465546578744E6F6465284B7228632E71756F7465732C2D2D692E71756F746544657074682C21312929293B627265616B3B64656661756C743A512E617070656E644368696C6428612E637265617465546578744E';
wwv_flow_imp.g_varchar2_table(1312) := '6F646528412E76616C756529297D7D292C512E636C6173734E616D653D666E2B2220222B706E3B743D743D3D3D726E2E4245464F52453F2220222B666E3A2220222B706E3B72657475726E2079422841293F412E636C6173734E616D652E626173655661';
wwv_flow_imp.g_varchar2_table(1313) := '6C75652B3D743A412E636C6173734E616D652B3D742C517D7D7D2C776E2E64657374726F793D66756E6374696F6E2841297B72657475726E2121412E706172656E744E6F6465262628412E706172656E744E6F64652E72656D6F76654368696C64284129';
wwv_flow_imp.g_varchar2_table(1314) := '2C2130297D2C776E293B66756E6374696F6E20776E28412C65297B696628746869732E6F7074696F6E733D652C746869732E7363726F6C6C6564456C656D656E74733D5B5D2C746869732E7265666572656E6365456C656D656E743D412C746869732E63';
wwv_flow_imp.g_varchar2_table(1315) := '6F756E746572733D6E65772071422C746869732E71756F746544657074683D302C21412E6F776E6572446F63756D656E74297468726F77206E6577204572726F722822436C6F6E656420656C656D656E7420646F6573206E6F74206861766520616E206F';
wwv_flow_imp.g_varchar2_table(1316) := '776E657220646F63756D656E7422293B746869732E646F63756D656E74456C656D656E743D746869732E636C6F6E654E6F646528412E6F776E6572446F63756D656E742E646F63756D656E74456C656D656E74297D286A653D726E3D726E7C7C7B7D295B';
wwv_flow_imp.g_varchar2_table(1317) := '6A652E4245464F52453D305D3D224245464F5245222C6A655B6A652E41465445523D315D3D224146544552223B66756E6374696F6E20556E2865297B72657475726E206E65772050726F6D6973652866756E6374696F6E2841297B21652E636F6D706C65';
wwv_flow_imp.g_varchar2_table(1318) := '74652626652E7372633F28652E6F6E6C6F61643D412C652E6F6E6572726F723D41293A4128297D297D766172206C6E2C436E3D66756E6374696F6E28412C65297B76617220743D412E637265617465456C656D656E742822696672616D6522293B726574';
wwv_flow_imp.g_varchar2_table(1319) := '75726E20742E636C6173734E616D653D2268746D6C3263616E7661732D636F6E7461696E6572222C742E7374796C652E7669736962696C6974793D2268696464656E222C742E7374796C652E706F736974696F6E3D226669786564222C742E7374796C65';
wwv_flow_imp.g_varchar2_table(1320) := '2E6C6566743D222D31303030307078222C742E7374796C652E746F703D22307078222C742E7374796C652E626F726465723D2230222C742E77696474683D652E77696474682E746F537472696E6728292C742E6865696768743D652E6865696768742E74';
wwv_flow_imp.g_varchar2_table(1321) := '6F537472696E6728292C742E7363726F6C6C696E673D226E6F222C742E73657441747472696275746528516E2C227472756522292C412E626F64792E617070656E644368696C642874292C747D2C676E3D66756E6374696F6E2841297B72657475726E20';
wwv_flow_imp.g_varchar2_table(1322) := '50726F6D6973652E616C6C285B5D2E736C6963652E63616C6C28412E696D616765732C30292E6D617028556E29297D2C456E3D66756E6374696F6E2842297B72657475726E206E65772050726F6D6973652866756E6374696F6E28652C41297B76617220';
wwv_flow_imp.g_varchar2_table(1323) := '743D422E636F6E74656E7457696E646F773B69662821742972657475726E204128224E6F2077696E646F772061737369676E656420666F7220696672616D6522293B76617220723D742E646F63756D656E743B742E6F6E6C6F61643D422E6F6E6C6F6164';
wwv_flow_imp.g_varchar2_table(1324) := '3D66756E6374696F6E28297B742E6F6E6C6F61643D422E6F6E6C6F61643D6E756C6C3B76617220413D736574496E74657276616C2866756E6374696F6E28297B303C722E626F64792E6368696C644E6F6465732E6C656E677468262622636F6D706C6574';
wwv_flow_imp.g_varchar2_table(1325) := '65223D3D3D722E72656164795374617465262628636C656172496E74657276616C2841292C65284229297D2C3530297D7D297D2C686E3D66756E6374696F6E28412C65297B666F722876617220743D412E6C656E6774682D313B303C3D743B742D2D297B';
wwv_flow_imp.g_varchar2_table(1326) := '76617220723D412E6974656D2874293B22636F6E74656E7422213D3D722626652E7374796C652E73657450726F706572747928722C412E67657450726F706572747956616C7565287229297D72657475726E20657D2C466E3D66756E6374696F6E284129';
wwv_flow_imp.g_varchar2_table(1327) := '7B76617220653D22223B72657475726E2041262628652B3D223C21444F435459504520222C412E6E616D65262628652B3D412E6E616D65292C412E696E7465726E616C537562736574262628652B3D412E696E7465726E616C537562736574292C412E70';
wwv_flow_imp.g_varchar2_table(1328) := '75626C69634964262628652B3D2722272B412E7075626C696349642B272227292C412E73797374656D4964262628652B3D2722272B412E73797374656D49642B272227292C652B3D223E22292C657D2C646E3D66756E6374696F6E28412C652C74297B41';
wwv_flow_imp.g_varchar2_table(1329) := '2626412E64656661756C745669657726262865213D3D412E64656661756C74566965772E70616765584F66667365747C7C74213D3D412E64656661756C74566965772E70616765594F6666736574292626412E64656661756C74566965772E7363726F6C';
wwv_flow_imp.g_varchar2_table(1330) := '6C546F28652C74297D2C486E3D66756E6374696F6E2841297B76617220653D415B305D2C743D415B315D2C413D415B325D3B652E7363726F6C6C4C6566743D742C652E7363726F6C6C546F703D417D2C666E3D225F5F5F68746D6C3263616E7661735F5F';
wwv_flow_imp.g_varchar2_table(1331) := '5F70736575646F656C656D656E745F6265666F7265222C706E3D225F5F5F68746D6C3263616E7661735F5F5F70736575646F656C656D656E745F6166746572222C4E6E3D277B5C6E20202020636F6E74656E743A2022222021696D706F7274616E743B5C';
wwv_flow_imp.g_varchar2_table(1332) := '6E20202020646973706C61793A206E6F6E652021696D706F7274616E743B5C6E7D272C4B6E3D66756E6374696F6E2841297B496E28412C222E222B666E2B223A6265666F7265222B4E6E2B225C6E2020202020202020202E222B706E2B223A6166746572';
wwv_flow_imp.g_varchar2_table(1333) := '222B4E6E297D2C496E3D66756E6374696F6E28412C65297B76617220743D412E6F776E6572446F63756D656E743B7426262828743D742E637265617465456C656D656E7428227374796C652229292E74657874436F6E74656E743D652C412E617070656E';
wwv_flow_imp.g_varchar2_table(1334) := '644368696C64287429297D3B286A653D6C6E3D6C6E7C7C7B7D295B6A652E564543544F523D305D3D22564543544F52222C6A655B6A652E42455A4945525F43555256453D315D3D2242455A4945525F4355525645223B66756E6374696F6E20546E28412C';
wwv_flow_imp.g_varchar2_table(1335) := '74297B72657475726E20412E6C656E6774683D3D3D742E6C656E6774682626412E736F6D652866756E6374696F6E28412C65297B72657475726E20413D3D3D745B655D7D297D766172206D6E3D28526E2E70726F746F747970652E6164643D66756E6374';
wwv_flow_imp.g_varchar2_table(1336) := '696F6E28412C65297B72657475726E206E657720526E28746869732E782B412C746869732E792B65297D2C526E293B66756E6374696F6E20526E28412C65297B746869732E747970653D6C6E2E564543544F522C746869732E783D412C746869732E793D';
wwv_flow_imp.g_varchar2_table(1337) := '657D66756E6374696F6E204C6E28412C652C74297B72657475726E206E6577206D6E28412E782B28652E782D412E78292A742C412E792B28652E792D412E79292A74297D766172204F6E3D28446E2E70726F746F747970652E7375626469766964653D66';
wwv_flow_imp.g_varchar2_table(1338) := '756E6374696F6E28412C65297B76617220743D4C6E28746869732E73746172742C746869732E7374617274436F6E74726F6C2C41292C723D4C6E28746869732E7374617274436F6E74726F6C2C746869732E656E64436F6E74726F6C2C41292C423D4C6E';
wwv_flow_imp.g_varchar2_table(1339) := '28746869732E656E64436F6E74726F6C2C746869732E656E642C41292C6E3D4C6E28742C722C41292C723D4C6E28722C422C41292C413D4C6E286E2C722C41293B72657475726E20653F6E657720446E28746869732E73746172742C742C6E2C41293A6E';
wwv_flow_imp.g_varchar2_table(1340) := '657720446E28412C722C422C746869732E656E64297D2C446E2E70726F746F747970652E6164643D66756E6374696F6E28412C65297B72657475726E206E657720446E28746869732E73746172742E61646428412C65292C746869732E7374617274436F';
wwv_flow_imp.g_varchar2_table(1341) := '6E74726F6C2E61646428412C65292C746869732E656E64436F6E74726F6C2E61646428412C65292C746869732E656E642E61646428412C6529297D2C446E2E70726F746F747970652E726576657273653D66756E6374696F6E28297B72657475726E206E';
wwv_flow_imp.g_varchar2_table(1342) := '657720446E28746869732E656E642C746869732E656E64436F6E74726F6C2C746869732E7374617274436F6E74726F6C2C746869732E7374617274297D2C446E293B66756E6374696F6E20446E28412C652C742C72297B746869732E747970653D6C6E2E';
wwv_flow_imp.g_varchar2_table(1343) := '42455A4945525F43555256452C746869732E73746172743D412C746869732E7374617274436F6E74726F6C3D652C746869732E656E64436F6E74726F6C3D742C746869732E656E643D727D66756E6374696F6E20626E2841297B72657475726E20412E74';
wwv_flow_imp.g_varchar2_table(1344) := '7970653D3D3D6C6E2E42455A4945525F43555256457D76617220536E2C4D6E3D66756E6374696F6E2841297B76617220653D412E7374796C65732C743D412E626F756E64732C723D28433D6A4128652E626F72646572546F704C6566745261646975732C';
wwv_flow_imp.g_varchar2_table(1345) := '742E77696474682C742E68656967687429295B305D2C423D435B315D2C6E3D28673D6A4128652E626F72646572546F7052696768745261646975732C742E77696474682C742E68656967687429295B305D2C733D675B315D2C6F3D28453D6A4128652E62';
wwv_flow_imp.g_varchar2_table(1346) := '6F72646572426F74746F6D52696768745261646975732C742E77696474682C742E68656967687429295B305D2C693D455B315D2C613D28683D6A4128652E626F72646572426F74746F6D4C6566745261646975732C742E77696474682C742E6865696768';
wwv_flow_imp.g_varchar2_table(1347) := '7429295B305D2C633D685B315D3B28463D5B5D292E707573682828722B6E292F742E7769647468292C462E707573682828612B6F292F742E7769647468292C462E707573682828422B63292F742E686569676874292C462E707573682828732B69292F74';
wwv_flow_imp.g_varchar2_table(1348) := '2E686569676874292C313C28643D4D6174682E6D61782E6170706C79284D6174682C462929262628722F3D642C422F3D642C6E2F3D642C732F3D642C6F2F3D642C692F3D642C612F3D642C632F3D64293B76617220513D742E77696474682D6E2C753D74';
wwv_flow_imp.g_varchar2_table(1349) := '2E6865696768742D692C773D742E77696474682D6F2C553D742E6865696768742D632C6C3D652E626F72646572546F7057696474682C433D652E626F72646572526967687457696474682C673D652E626F72646572426F74746F6D57696474682C453D65';
wwv_flow_imp.g_varchar2_table(1350) := '2E626F726465724C65667457696474682C683D696528652E70616464696E67546F702C412E626F756E64732E7769647468292C463D696528652E70616464696E6752696768742C412E626F756E64732E7769647468292C643D696528652E70616464696E';
wwv_flow_imp.g_varchar2_table(1351) := '67426F74746F6D2C412E626F756E64732E7769647468292C413D696528652E70616464696E674C6566742C412E626F756E64732E7769647468293B746869732E746F704C656674426F72646572446F75626C654F75746572426F783D303C727C7C303C42';
wwv_flow_imp.g_varchar2_table(1352) := '3F5F6E28742E6C6566742B452F332C742E746F702B6C2F332C722D452F332C422D6C2F332C536E2E544F505F4C454654293A6E6577206D6E28742E6C6566742B452F332C742E746F702B6C2F33292C746869732E746F705269676874426F72646572446F';
wwv_flow_imp.g_varchar2_table(1353) := '75626C654F75746572426F783D303C727C7C303C423F5F6E28742E6C6566742B512C742E746F702B6C2F332C6E2D432F332C732D6C2F332C536E2E544F505F5249474854293A6E6577206D6E28742E6C6566742B742E77696474682D432F332C742E746F';
wwv_flow_imp.g_varchar2_table(1354) := '702B6C2F33292C746869732E626F74746F6D5269676874426F72646572446F75626C654F75746572426F783D303C6F7C7C303C693F5F6E28742E6C6566742B772C742E746F702B752C6F2D432F332C692D672F332C536E2E424F54544F4D5F5249474854';
wwv_flow_imp.g_varchar2_table(1355) := '293A6E6577206D6E28742E6C6566742B742E77696474682D432F332C742E746F702B742E6865696768742D672F33292C746869732E626F74746F6D4C656674426F72646572446F75626C654F75746572426F783D303C617C7C303C633F5F6E28742E6C65';
wwv_flow_imp.g_varchar2_table(1356) := '66742B452F332C742E746F702B552C612D452F332C632D672F332C536E2E424F54544F4D5F4C454654293A6E6577206D6E28742E6C6566742B452F332C742E746F702B742E6865696768742D672F33292C746869732E746F704C656674426F7264657244';
wwv_flow_imp.g_varchar2_table(1357) := '6F75626C65496E6E6572426F783D303C727C7C303C423F5F6E28742E6C6566742B322A452F332C742E746F702B322A6C2F332C722D322A452F332C422D322A6C2F332C536E2E544F505F4C454654293A6E6577206D6E28742E6C6566742B322A452F332C';
wwv_flow_imp.g_varchar2_table(1358) := '742E746F702B322A6C2F33292C746869732E746F705269676874426F72646572446F75626C65496E6E6572426F783D303C727C7C303C423F5F6E28742E6C6566742B512C742E746F702B322A6C2F332C6E2D322A432F332C732D322A6C2F332C536E2E54';
wwv_flow_imp.g_varchar2_table(1359) := '4F505F5249474854293A6E6577206D6E28742E6C6566742B742E77696474682D322A432F332C742E746F702B322A6C2F33292C746869732E626F74746F6D5269676874426F72646572446F75626C65496E6E6572426F783D303C6F7C7C303C693F5F6E28';
wwv_flow_imp.g_varchar2_table(1360) := '742E6C6566742B772C742E746F702B752C6F2D322A432F332C692D322A672F332C536E2E424F54544F4D5F5249474854293A6E6577206D6E28742E6C6566742B742E77696474682D322A432F332C742E746F702B742E6865696768742D322A672F33292C';
wwv_flow_imp.g_varchar2_table(1361) := '746869732E626F74746F6D4C656674426F72646572446F75626C65496E6E6572426F783D303C617C7C303C633F5F6E28742E6C6566742B322A452F332C742E746F702B552C612D322A452F332C632D322A672F332C536E2E424F54544F4D5F4C45465429';
wwv_flow_imp.g_varchar2_table(1362) := '3A6E6577206D6E28742E6C6566742B322A452F332C742E746F702B742E6865696768742D322A672F33292C746869732E746F704C656674426F726465725374726F6B653D303C727C7C303C423F5F6E28742E6C6566742B452F322C742E746F702B6C2F32';
wwv_flow_imp.g_varchar2_table(1363) := '2C722D452F322C422D6C2F322C536E2E544F505F4C454654293A6E6577206D6E28742E6C6566742B452F322C742E746F702B6C2F32292C746869732E746F705269676874426F726465725374726F6B653D303C727C7C303C423F5F6E28742E6C6566742B';
wwv_flow_imp.g_varchar2_table(1364) := '512C742E746F702B6C2F322C6E2D432F322C732D6C2F322C536E2E544F505F5249474854293A6E6577206D6E28742E6C6566742B742E77696474682D432F322C742E746F702B6C2F32292C746869732E626F74746F6D5269676874426F72646572537472';
wwv_flow_imp.g_varchar2_table(1365) := '6F6B653D303C6F7C7C303C693F5F6E28742E6C6566742B772C742E746F702B752C6F2D432F322C692D672F322C536E2E424F54544F4D5F5249474854293A6E6577206D6E28742E6C6566742B742E77696474682D432F322C742E746F702B742E68656967';
wwv_flow_imp.g_varchar2_table(1366) := '68742D672F32292C746869732E626F74746F6D4C656674426F726465725374726F6B653D303C617C7C303C633F5F6E28742E6C6566742B452F322C742E746F702B552C612D452F322C632D672F322C536E2E424F54544F4D5F4C454654293A6E6577206D';
wwv_flow_imp.g_varchar2_table(1367) := '6E28742E6C6566742B452F322C742E746F702B742E6865696768742D672F32292C746869732E746F704C656674426F72646572426F783D303C727C7C303C423F5F6E28742E6C6566742C742E746F702C722C422C536E2E544F505F4C454654293A6E6577';
wwv_flow_imp.g_varchar2_table(1368) := '206D6E28742E6C6566742C742E746F70292C746869732E746F705269676874426F72646572426F783D303C6E7C7C303C733F5F6E28742E6C6566742B512C742E746F702C6E2C732C536E2E544F505F5249474854293A6E6577206D6E28742E6C6566742B';
wwv_flow_imp.g_varchar2_table(1369) := '742E77696474682C742E746F70292C746869732E626F74746F6D5269676874426F72646572426F783D303C6F7C7C303C693F5F6E28742E6C6566742B772C742E746F702B752C6F2C692C536E2E424F54544F4D5F5249474854293A6E6577206D6E28742E';
wwv_flow_imp.g_varchar2_table(1370) := '6C6566742B742E77696474682C742E746F702B742E686569676874292C746869732E626F74746F6D4C656674426F72646572426F783D303C617C7C303C633F5F6E28742E6C6566742C742E746F702B552C612C632C536E2E424F54544F4D5F4C45465429';
wwv_flow_imp.g_varchar2_table(1371) := '3A6E6577206D6E28742E6C6566742C742E746F702B742E686569676874292C746869732E746F704C65667450616464696E67426F783D303C727C7C303C423F5F6E28742E6C6566742B452C742E746F702B6C2C4D6174682E6D617828302C722D45292C4D';
wwv_flow_imp.g_varchar2_table(1372) := '6174682E6D617828302C422D6C292C536E2E544F505F4C454654293A6E6577206D6E28742E6C6566742B452C742E746F702B6C292C746869732E746F70526967687450616464696E67426F783D303C6E7C7C303C733F5F6E28742E6C6566742B4D617468';
wwv_flow_imp.g_varchar2_table(1373) := '2E6D696E28512C742E77696474682D43292C742E746F702B6C2C513E742E77696474682B433F303A4D6174682E6D617828302C6E2D43292C4D6174682E6D617828302C732D6C292C536E2E544F505F5249474854293A6E6577206D6E28742E6C6566742B';
wwv_flow_imp.g_varchar2_table(1374) := '742E77696474682D432C742E746F702B6C292C746869732E626F74746F6D526967687450616464696E67426F783D303C6F7C7C303C693F5F6E28742E6C6566742B4D6174682E6D696E28772C742E77696474682D45292C742E746F702B4D6174682E6D69';
wwv_flow_imp.g_varchar2_table(1375) := '6E28752C742E6865696768742D67292C4D6174682E6D617828302C6F2D43292C4D6174682E6D617828302C692D67292C536E2E424F54544F4D5F5249474854293A6E6577206D6E28742E6C6566742B742E77696474682D432C742E746F702B742E686569';
wwv_flow_imp.g_varchar2_table(1376) := '6768742D67292C746869732E626F74746F6D4C65667450616464696E67426F783D303C617C7C303C633F5F6E28742E6C6566742B452C742E746F702B4D6174682E6D696E28552C742E6865696768742D67292C4D6174682E6D617828302C612D45292C4D';
wwv_flow_imp.g_varchar2_table(1377) := '6174682E6D617828302C632D67292C536E2E424F54544F4D5F4C454654293A6E6577206D6E28742E6C6566742B452C742E746F702B742E6865696768742D67292C746869732E746F704C656674436F6E74656E74426F783D303C727C7C303C423F5F6E28';
wwv_flow_imp.g_varchar2_table(1378) := '742E6C6566742B452B412C742E746F702B6C2B682C4D6174682E6D617828302C722D28452B4129292C4D6174682E6D617828302C422D286C2B6829292C536E2E544F505F4C454654293A6E6577206D6E28742E6C6566742B452B412C742E746F702B6C2B';
wwv_flow_imp.g_varchar2_table(1379) := '68292C746869732E746F705269676874436F6E74656E74426F783D303C6E7C7C303C733F5F6E28742E6C6566742B4D6174682E6D696E28512C742E77696474682B452B41292C742E746F702B6C2B682C513E742E77696474682B452B413F303A6E2D452B';
wwv_flow_imp.g_varchar2_table(1380) := '412C732D286C2B68292C536E2E544F505F5249474854293A6E6577206D6E28742E6C6566742B742E77696474682D28432B46292C742E746F702B6C2B68292C746869732E626F74746F6D5269676874436F6E74656E74426F783D303C6F7C7C303C693F5F';
wwv_flow_imp.g_varchar2_table(1381) := '6E28742E6C6566742B4D6174682E6D696E28772C742E77696474682D28452B4129292C742E746F702B4D6174682E6D696E28752C742E6865696768742B6C2B68292C4D6174682E6D617828302C6F2D28432B4629292C692D28672B64292C536E2E424F54';
wwv_flow_imp.g_varchar2_table(1382) := '544F4D5F5249474854293A6E6577206D6E28742E6C6566742B742E77696474682D28432B46292C742E746F702B742E6865696768742D28672B6429292C746869732E626F74746F6D4C656674436F6E74656E74426F783D303C617C7C303C633F5F6E2874';
wwv_flow_imp.g_varchar2_table(1383) := '2E6C6566742B452B412C742E746F702B552C4D6174682E6D617828302C612D28452B4129292C632D28672B64292C536E2E424F54544F4D5F4C454654293A6E6577206D6E28742E6C6566742B452B412C742E746F702B742E6865696768742D28672B6429';
wwv_flow_imp.g_varchar2_table(1384) := '297D3B286A653D536E3D536E7C7C7B7D295B6A652E544F505F4C4546543D305D3D22544F505F4C454654222C6A655B6A652E544F505F52494748543D315D3D22544F505F5249474854222C6A655B6A652E424F54544F4D5F52494748543D325D3D22424F';
wwv_flow_imp.g_varchar2_table(1385) := '54544F4D5F5249474854222C6A655B6A652E424F54544F4D5F4C4546543D335D3D22424F54544F4D5F4C454654223B66756E6374696F6E20766E2841297B72657475726E5B412E746F704C656674426F72646572426F782C412E746F705269676874426F';
wwv_flow_imp.g_varchar2_table(1386) := '72646572426F782C412E626F74746F6D5269676874426F72646572426F782C412E626F74746F6D4C656674426F72646572426F785D7D66756E6374696F6E20796E2841297B72657475726E5B412E746F704C65667450616464696E67426F782C412E746F';
wwv_flow_imp.g_varchar2_table(1387) := '70526967687450616464696E67426F782C412E626F74746F6D526967687450616464696E67426F782C412E626F74746F6D4C65667450616464696E67426F785D7D766172205F6E3D66756E6374696F6E28412C652C742C722C42297B766172206E3D284D';
wwv_flow_imp.g_varchar2_table(1388) := '6174682E737172742832292D31292F332A342C733D742A6E2C6F3D722A6E2C693D412B742C613D652B723B7377697463682842297B6361736520536E2E544F505F4C4546543A72657475726E206E6577204F6E286E6577206D6E28412C61292C6E657720';
wwv_flow_imp.g_varchar2_table(1389) := '6D6E28412C612D6F292C6E6577206D6E28692D732C65292C6E6577206D6E28692C6529293B6361736520536E2E544F505F52494748543A72657475726E206E6577204F6E286E6577206D6E28412C65292C6E6577206D6E28412B732C65292C6E6577206D';
wwv_flow_imp.g_varchar2_table(1390) := '6E28692C612D6F292C6E6577206D6E28692C6129293B6361736520536E2E424F54544F4D5F52494748543A72657475726E206E6577204F6E286E6577206D6E28692C65292C6E6577206D6E28692C652B6F292C6E6577206D6E28412B732C61292C6E6577';
wwv_flow_imp.g_varchar2_table(1391) := '206D6E28412C6129293B64656661756C743A536E2E424F54544F4D5F4C4546543B72657475726E206E6577204F6E286E6577206D6E28692C61292C6E6577206D6E28692D732C61292C6E6577206D6E28412C652B6F292C6E6577206D6E28412C6529297D';
wwv_flow_imp.g_varchar2_table(1392) := '7D2C786E3D66756E6374696F6E28412C652C74297B746869732E747970653D302C746869732E7461726765743D362C746869732E6F6666736574583D412C746869732E6F6666736574593D652C746869732E6D61747269783D747D2C506E3D66756E6374';
wwv_flow_imp.g_varchar2_table(1393) := '696F6E28412C65297B746869732E747970653D312C746869732E7461726765743D652C746869732E706174683D417D2C566E3D66756E6374696F6E2841297B746869732E747970653D322C746869732E7461726765743D362C746869732E6F7061636974';
wwv_flow_imp.g_varchar2_table(1394) := '793D417D2C7A6E3D66756E6374696F6E2841297B746869732E656C656D656E743D412C746869732E696E6C696E654C6576656C3D5B5D2C746869732E6E6F6E496E6C696E654C6576656C3D5B5D2C746869732E6E656761746976655A496E6465783D5B5D';
wwv_flow_imp.g_varchar2_table(1395) := '2C746869732E7A65726F4F724175746F5A496E6465784F725472616E73666F726D65644F724F7061636974793D5B5D2C746869732E706F7369746976655A496E6465783D5B5D2C746869732E6E6F6E506F736974696F6E6564466C6F6174733D5B5D2C74';
wwv_flow_imp.g_varchar2_table(1396) := '6869732E6E6F6E506F736974696F6E6564496E6C696E654C6576656C3D5B5D7D2C586E3D28476E2E70726F746F747970652E676574506172656E74456666656374733D66756E6374696F6E28297B76617220412C652C743D746869732E65666665637473';
wwv_flow_imp.g_varchar2_table(1397) := '2E736C6963652830293B72657475726E20746869732E636F6E7461696E65722E7374796C65732E6F766572666C6F7758213D3D56742E56495349424C45262628413D766E28746869732E637572766573292C653D796E28746869732E637572766573292C';
wwv_flow_imp.g_varchar2_table(1398) := '546E28412C65297C7C742E70757368286E657720506E28652C362929292C747D2C476E293B66756E6374696F6E20476E28412C65297B76617220742C723B746869732E636F6E7461696E65723D412C746869732E656666656374733D652E736C69636528';
wwv_flow_imp.g_varchar2_table(1399) := '30292C746869732E6375727665733D6E6577204D6E2841292C412E7374796C65732E6F7061636974793C312626746869732E656666656374732E70757368286E657720566E28412E7374796C65732E6F70616369747929292C6E756C6C213D3D412E7374';
wwv_flow_imp.g_varchar2_table(1400) := '796C65732E7472616E73666F726D262628743D412E626F756E64732E6C6566742B412E7374796C65732E7472616E73666F726D4F726967696E5B305D2E6E756D6265722C653D412E626F756E64732E746F702B412E7374796C65732E7472616E73666F72';
wwv_flow_imp.g_varchar2_table(1401) := '6D4F726967696E5B315D2E6E756D6265722C723D412E7374796C65732E7472616E73666F726D2C746869732E656666656374732E70757368286E657720786E28742C652C722929292C412E7374796C65732E6F766572666C6F7758213D3D56742E564953';
wwv_flow_imp.g_varchar2_table(1402) := '49424C45262628723D766E28746869732E637572766573292C413D796E28746869732E637572766573292C546E28722C41293F746869732E656666656374732E70757368286E657720506E28722C3629293A28746869732E656666656374732E70757368';
wwv_flow_imp.g_varchar2_table(1403) := '286E657720506E28722C3229292C746869732E656666656374732E70757368286E657720506E28412C34292929297D66756E6374696F6E204A6E28412C65297B7377697463682865297B6361736520303A72657475726E20657328412E746F704C656674';
wwv_flow_imp.g_varchar2_table(1404) := '426F72646572426F782C412E746F704C65667450616464696E67426F782C412E746F705269676874426F72646572426F782C412E746F70526967687450616464696E67426F78293B6361736520313A72657475726E20657328412E746F70526967687442';
wwv_flow_imp.g_varchar2_table(1405) := '6F72646572426F782C412E746F70526967687450616464696E67426F782C412E626F74746F6D5269676874426F72646572426F782C412E626F74746F6D526967687450616464696E67426F78293B6361736520323A72657475726E20657328412E626F74';
wwv_flow_imp.g_varchar2_table(1406) := '746F6D5269676874426F72646572426F782C412E626F74746F6D526967687450616464696E67426F782C412E626F74746F6D4C656674426F72646572426F782C412E626F74746F6D4C65667450616464696E67426F78293B64656661756C743A72657475';
wwv_flow_imp.g_varchar2_table(1407) := '726E20657328412E626F74746F6D4C656674426F72646572426F782C412E626F74746F6D4C65667450616464696E67426F782C412E746F704C656674426F72646572426F782C412E746F704C65667450616464696E67426F78297D7D66756E6374696F6E';
wwv_flow_imp.g_varchar2_table(1408) := '206B6E2841297B76617220653D412E626F756E64732C413D412E7374796C65733B72657475726E20652E61646428412E626F726465724C65667457696474682C412E626F72646572546F7057696474682C2D28412E626F72646572526967687457696474';
wwv_flow_imp.g_varchar2_table(1409) := '682B412E626F726465724C6566745769647468292C2D28412E626F72646572546F7057696474682B412E626F72646572426F74746F6D576964746829297D66756E6374696F6E20576E2841297B76617220653D412E7374796C65732C743D412E626F756E';
wwv_flow_imp.g_varchar2_table(1410) := '64732C723D696528652E70616464696E674C6566742C742E7769647468292C423D696528652E70616464696E6752696768742C742E7769647468292C6E3D696528652E70616464696E67546F702C742E7769647468292C413D696528652E70616464696E';
wwv_flow_imp.g_varchar2_table(1411) := '67426F74746F6D2C742E7769647468293B72657475726E20742E61646428722B652E626F726465724C65667457696474682C6E2B652E626F72646572546F7057696474682C2D28652E626F72646572526967687457696474682B652E626F726465724C65';
wwv_flow_imp.g_varchar2_table(1412) := '667457696474682B722B42292C2D28652E626F72646572546F7057696474682B652E626F72646572426F74746F6D57696474682B6E2B4129297D66756E6374696F6E20596E28412C652C74297B76617220723D28423D727328412E7374796C65732E6261';
wwv_flow_imp.g_varchar2_table(1413) := '636B67726F756E644F726967696E2C65292C6E3D412C303D3D3D423F6E2E626F756E64733A28323D3D3D423F576E3A6B6E29286E29292C423D28733D727328412E7374796C65732E6261636B67726F756E64436C69702C65292C6F3D412C733D3D3D4365';
wwv_flow_imp.g_varchar2_table(1414) := '2E424F524445525F424F583F6F2E626F756E64733A28733D3D3D43652E434F4E54454E545F424F583F576E3A6B6E29286F29292C6E3D747328727328412E7374796C65732E6261636B67726F756E6453697A652C65292C742C72292C733D6E5B305D2C6F';
wwv_flow_imp.g_varchar2_table(1415) := '3D6E5B315D2C743D6A4128727328412E7374796C65732E6261636B67726F756E64506F736974696F6E2C65292C722E77696474682D732C722E6865696768742D6F293B72657475726E5B427328727328412E7374796C65732E6261636B67726F756E6452';
wwv_flow_imp.g_varchar2_table(1416) := '65706561742C65292C742C6E2C722C42292C4D6174682E726F756E6428722E6C6566742B745B305D292C4D6174682E726F756E6428722E746F702B745B315D292C732C6F5D7D66756E6374696F6E20716E2841297B72657475726E207A41284129262641';
wwv_flow_imp.g_varchar2_table(1417) := '2E76616C75653D3D3D6F742E4155544F7D66756E6374696F6E205A6E2841297B72657475726E226E756D626572223D3D747970656F6620417D766172206A6E3D66756E6374696F6E28612C632C512C75297B612E636F6E7461696E65722E656C656D656E';
wwv_flow_imp.g_varchar2_table(1418) := '74732E666F72456163682866756E6374696F6E2841297B76617220653D4E7228412E666C6167732C34292C743D4E7228412E666C6167732C32292C723D6E657720586E28412C612E676574506172656E74456666656374732829293B4E7228412E737479';
wwv_flow_imp.g_varchar2_table(1419) := '6C65732E646973706C61792C32303438292626752E707573682872293B76617220422C6E2C732C6F2C693D4E7228412E666C6167732C38293F5B5D3A753B657C7C743F28423D657C7C412E7374796C65732E6973506F736974696F6E656428293F513A63';
wwv_flow_imp.g_varchar2_table(1420) := '2C743D6E6577207A6E2872292C412E7374796C65732E6973506F736974696F6E656428297C7C412E7374796C65732E6F7061636974793C317C7C412E7374796C65732E69735472616E73666F726D656428293F286E3D412E7374796C65732E7A496E6465';
wwv_flow_imp.g_varchar2_table(1421) := '782E6F72646572293C303F28733D302C422E6E656761746976655A496E6465782E736F6D652866756E6374696F6E28412C65297B72657475726E206E3E412E656C656D656E742E636F6E7461696E65722E7374796C65732E7A496E6465782E6F72646572';
wwv_flow_imp.g_varchar2_table(1422) := '3F28733D652C2131293A303C737D292C422E6E656761746976655A496E6465782E73706C69636528732C302C7429293A303C6E3F286F3D302C422E706F7369746976655A496E6465782E736F6D652866756E6374696F6E28412C65297B72657475726E20';
wwv_flow_imp.g_varchar2_table(1423) := '6E3E3D412E656C656D656E742E636F6E7461696E65722E7374796C65732E7A496E6465782E6F726465723F286F3D652B312C2131293A303C6F7D292C422E706F7369746976655A496E6465782E73706C696365286F2C302C7429293A422E7A65726F4F72';
wwv_flow_imp.g_varchar2_table(1424) := '4175746F5A496E6465784F725472616E73666F726D65644F724F7061636974792E707573682874293A28412E7374796C65732E6973466C6F6174696E6728293F422E6E6F6E506F736974696F6E6564466C6F6174733A422E6E6F6E506F736974696F6E65';
wwv_flow_imp.g_varchar2_table(1425) := '64496E6C696E654C6576656C292E707573682874292C6A6E28722C742C653F743A512C6929293A2828412E7374796C65732E6973496E6C696E654C6576656C28293F632E696E6C696E654C6576656C3A632E6E6F6E496E6C696E654C6576656C292E7075';
wwv_flow_imp.g_varchar2_table(1426) := '73682872292C6A6E28722C632C512C6929292C4E7228412E666C6167732C38292626246E28412C69297D297D2C246E3D66756E6374696F6E28412C65297B666F722876617220743D4120696E7374616E63656F66206F423F412E73746172743A312C723D';
wwv_flow_imp.g_varchar2_table(1427) := '4120696E7374616E63656F66206F422626412E72657665727365642C423D303B423C652E6C656E6774683B422B2B297B766172206E3D655B425D3B6E2E636F6E7461696E657220696E7374616E63656F662042422626226E756D626572223D3D74797065';
wwv_flow_imp.g_varchar2_table(1428) := '6F66206E2E636F6E7461696E65722E76616C7565262630213D3D6E2E636F6E7461696E65722E76616C7565262628743D6E2E636F6E7461696E65722E76616C7565292C6E2E6C69737456616C75653D636E28742C6E2E636F6E7461696E65722E7374796C';
wwv_flow_imp.g_varchar2_table(1429) := '65732E6C6973745374796C65547970652C2130292C742B3D723F2D313A317D7D2C41733D66756E6374696F6E28412C65297B76617220743D5B5D3B72657475726E20626E2841293F742E7075736828412E737562646976696465282E352C213129293A74';
wwv_flow_imp.g_varchar2_table(1430) := '2E707573682841292C626E2865293F742E7075736828652E737562646976696465282E352C213029293A742E707573682865292C747D2C65733D66756E6374696F6E28412C652C742C72297B76617220423D5B5D3B72657475726E20626E2841293F422E';
wwv_flow_imp.g_varchar2_table(1431) := '7075736828412E737562646976696465282E352C213129293A422E707573682841292C626E2874293F422E7075736828742E737562646976696465282E352C213029293A422E707573682874292C626E2872293F422E7075736828722E73756264697669';
wwv_flow_imp.g_varchar2_table(1432) := '6465282E352C2130292E726576657273652829293A422E707573682872292C626E2865293F422E7075736828652E737562646976696465282E352C2131292E726576657273652829293A422E707573682865292C427D2C74733D66756E6374696F6E2841';
wwv_flow_imp.g_varchar2_table(1433) := '2C652C74297B76617220723D655B305D2C423D655B315D2C6E3D655B325D2C733D415B305D2C6F3D415B315D3B69662821732972657475726E5B302C305D3B696628714128732926266F26267141286F292972657475726E5B696528732C742E77696474';
wwv_flow_imp.g_varchar2_table(1434) := '68292C6965286F2C742E686569676874295D3B76617220693D5A6E286E293B6966287A41287329262628732E76616C75653D3D3D6F742E434F4E5441494E7C7C732E76616C75653D3D3D6F742E434F564552292972657475726E205A6E286E293F742E77';
wwv_flow_imp.g_varchar2_table(1435) := '696474682F742E6865696768743C6E213D28732E76616C75653D3D3D6F742E434F564552293F5B742E77696474682C742E77696474682F6E5D3A5B742E6865696768742A6E2C742E6865696768745D3A5B742E77696474682C742E6865696768745D3B76';
wwv_flow_imp.g_varchar2_table(1436) := '617220613D5A6E2872292C653D5A6E2842292C413D617C7C653B696628716E287329262628216F7C7C716E286F29292972657475726E20612626653F5B722C425D3A697C7C413F412626693F5B613F723A422A6E2C653F423A722F6E5D3A5B613F723A74';
wwv_flow_imp.g_varchar2_table(1437) := '2E77696474682C653F423A742E6865696768745D3A5B742E77696474682C742E6865696768745D3B69662869297B76617220633D302C513D303B72657475726E2071412873293F633D696528732C742E7769647468293A7141286F29262628513D696528';
wwv_flow_imp.g_varchar2_table(1438) := '6F2C742E68656967687429292C716E2873293F633D512A6E3A6F262621716E286F297C7C28513D632F6E292C5B632C515D7D633D6E756C6C2C513D6E756C6C3B69662871412873293F633D696528732C742E7769647468293A6F26267141286F29262628';
wwv_flow_imp.g_varchar2_table(1439) := '513D6965286F2C742E68656967687429292C6E756C6C213D3D28633D6E756C6C213D3D28513D6E756C6C213D3D63262628216F7C7C716E286F29293F612626653F632F722A423A742E6865696768743A51292626716E2873293F612626653F512F422A72';
wwv_flow_imp.g_varchar2_table(1440) := '3A742E77696474683A632926266E756C6C213D3D512972657475726E5B632C515D3B7468726F77206E6577204572726F722822556E61626C6520746F2063616C63756C617465206261636B67726F756E642D73697A6520666F7220656C656D656E742229';
wwv_flow_imp.g_varchar2_table(1441) := '7D2C72733D66756E6374696F6E28412C65297B653D415B655D3B72657475726E20766F696420303D3D3D653F415B305D3A657D2C42733D66756E6374696F6E28412C652C742C722C42297B766172206E3D655B305D2C733D655B315D2C6F3D745B305D2C';
wwv_flow_imp.g_varchar2_table(1442) := '693D745B315D3B7377697463682841297B636173652074742E5245504541545F583A72657475726E5B6E6577206D6E284D6174682E726F756E6428722E6C656674292C4D6174682E726F756E6428722E746F702B7329292C6E6577206D6E284D6174682E';
wwv_flow_imp.g_varchar2_table(1443) := '726F756E6428722E6C6566742B722E7769647468292C4D6174682E726F756E6428722E746F702B7329292C6E6577206D6E284D6174682E726F756E6428722E6C6566742B722E7769647468292C4D6174682E726F756E6428692B722E746F702B7329292C';
wwv_flow_imp.g_varchar2_table(1444) := '6E6577206D6E284D6174682E726F756E6428722E6C656674292C4D6174682E726F756E6428692B722E746F702B7329295D3B636173652074742E5245504541545F593A72657475726E5B6E6577206D6E284D6174682E726F756E6428722E6C6566742B6E';
wwv_flow_imp.g_varchar2_table(1445) := '292C4D6174682E726F756E6428722E746F7029292C6E6577206D6E284D6174682E726F756E6428722E6C6566742B6E2B6F292C4D6174682E726F756E6428722E746F7029292C6E6577206D6E284D6174682E726F756E6428722E6C6566742B6E2B6F292C';
wwv_flow_imp.g_varchar2_table(1446) := '4D6174682E726F756E6428722E6865696768742B722E746F7029292C6E6577206D6E284D6174682E726F756E6428722E6C6566742B6E292C4D6174682E726F756E6428722E6865696768742B722E746F7029295D3B636173652074742E4E4F5F52455045';
wwv_flow_imp.g_varchar2_table(1447) := '41543A72657475726E5B6E6577206D6E284D6174682E726F756E6428722E6C6566742B6E292C4D6174682E726F756E6428722E746F702B7329292C6E6577206D6E284D6174682E726F756E6428722E6C6566742B6E2B6F292C4D6174682E726F756E6428';
wwv_flow_imp.g_varchar2_table(1448) := '722E746F702B7329292C6E6577206D6E284D6174682E726F756E6428722E6C6566742B6E2B6F292C4D6174682E726F756E6428722E746F702B732B6929292C6E6577206D6E284D6174682E726F756E6428722E6C6566742B6E292C4D6174682E726F756E';
wwv_flow_imp.g_varchar2_table(1449) := '6428722E746F702B732B6929295D3B64656661756C743A72657475726E5B6E6577206D6E284D6174682E726F756E6428422E6C656674292C4D6174682E726F756E6428422E746F7029292C6E6577206D6E284D6174682E726F756E6428422E6C6566742B';
wwv_flow_imp.g_varchar2_table(1450) := '422E7769647468292C4D6174682E726F756E6428422E746F7029292C6E6577206D6E284D6174682E726F756E6428422E6C6566742B422E7769647468292C4D6174682E726F756E6428422E6865696768742B422E746F7029292C6E6577206D6E284D6174';
wwv_flow_imp.g_varchar2_table(1451) := '682E726F756E6428422E6C656674292C4D6174682E726F756E6428422E6865696768742B422E746F7029295D7D7D2C6E733D2248696464656E2054657874222C73733D286F732E70726F746F747970652E70617273654D6574726963733D66756E637469';
wwv_flow_imp.g_varchar2_table(1452) := '6F6E28412C65297B76617220743D746869732E5F646F63756D656E742E637265617465456C656D656E74282264697622292C723D746869732E5F646F63756D656E742E637265617465456C656D656E742822696D6722292C423D746869732E5F646F6375';
wwv_flow_imp.g_varchar2_table(1453) := '6D656E742E637265617465456C656D656E7428227370616E22292C6E3D746869732E5F646F63756D656E742E626F64793B742E7374796C652E7669736962696C6974793D2268696464656E222C742E7374796C652E666F6E7446616D696C793D412C742E';
wwv_flow_imp.g_varchar2_table(1454) := '7374796C652E666F6E7453697A653D652C742E7374796C652E6D617267696E3D2230222C742E7374796C652E70616464696E673D2230222C6E2E617070656E644368696C642874292C722E7372633D22646174613A696D6167652F6769663B6261736536';
wwv_flow_imp.g_varchar2_table(1455) := '342C52306C474F446C6841514142414941414141414141502F2F2F79483542414541414141414C41414141414142414145414141494252414137222C722E77696474683D312C722E6865696768743D312C722E7374796C652E6D617267696E3D2230222C';
wwv_flow_imp.g_varchar2_table(1456) := '722E7374796C652E70616464696E673D2230222C722E7374796C652E766572746963616C416C69676E3D22626173656C696E65222C422E7374796C652E666F6E7446616D696C793D412C422E7374796C652E666F6E7453697A653D652C422E7374796C65';
wwv_flow_imp.g_varchar2_table(1457) := '2E6D617267696E3D2230222C422E7374796C652E70616464696E673D2230222C422E617070656E644368696C6428746869732E5F646F63756D656E742E637265617465546578744E6F6465286E7329292C742E617070656E644368696C642842292C742E';
wwv_flow_imp.g_varchar2_table(1458) := '617070656E644368696C642872293B653D722E6F6666736574546F702D422E6F6666736574546F702B323B742E72656D6F76654368696C642842292C742E617070656E644368696C6428746869732E5F646F63756D656E742E637265617465546578744E';
wwv_flow_imp.g_varchar2_table(1459) := '6F6465286E7329292C742E7374796C652E6C696E654865696768743D226E6F726D616C222C722E7374796C652E766572746963616C416C69676E3D227375706572223B723D722E6F6666736574546F702D742E6F6666736574546F702B323B7265747572';
wwv_flow_imp.g_varchar2_table(1460) := '6E206E2E72656D6F76654368696C642874292C7B626173656C696E653A652C6D6964646C653A727D7D2C6F732E70726F746F747970652E6765744D6574726963733D66756E6374696F6E28412C65297B76617220743D412B2220222B653B72657475726E';
wwv_flow_imp.g_varchar2_table(1461) := '20766F696420303D3D3D746869732E5F646174615B745D262628746869732E5F646174615B745D3D746869732E70617273654D65747269637328412C6529292C746869732E5F646174615B745D7D2C6F73293B66756E6374696F6E206F732841297B7468';
wwv_flow_imp.g_varchar2_table(1462) := '69732E5F646174613D7B7D2C746869732E5F646F63756D656E743D417D7661722069733D2861732E70726F746F747970652E6170706C79456666656374733D66756E6374696F6E28412C65297B666F722876617220743D746869733B746869732E5F6163';
wwv_flow_imp.g_varchar2_table(1463) := '74697665456666656374732E6C656E6774683B29746869732E706F7045666665637428293B412E66696C7465722866756E6374696F6E2841297B72657475726E204E7228412E7461726765742C65297D292E666F72456163682866756E6374696F6E2841';
wwv_flow_imp.g_varchar2_table(1464) := '297B72657475726E20742E6170706C794566666563742841297D297D2C61732E70726F746F747970652E6170706C794566666563743D66756E6374696F6E2841297B746869732E6374782E7361766528292C323D3D3D412E74797065262628746869732E';
wwv_flow_imp.g_varchar2_table(1465) := '6374782E676C6F62616C416C7068613D412E6F706163697479292C303D3D3D412E74797065262628746869732E6374782E7472616E736C61746528412E6F6666736574582C412E6F666673657459292C746869732E6374782E7472616E73666F726D2841';
wwv_flow_imp.g_varchar2_table(1466) := '2E6D61747269785B305D2C412E6D61747269785B315D2C412E6D61747269785B325D2C412E6D61747269785B335D2C412E6D61747269785B345D2C412E6D61747269785B355D292C746869732E6374782E7472616E736C617465282D412E6F6666736574';
wwv_flow_imp.g_varchar2_table(1467) := '582C2D412E6F66667365745929292C313D3D3D412E74797065262628746869732E7061746828412E70617468292C746869732E6374782E636C69702829292C746869732E5F616374697665456666656374732E707573682841297D2C61732E70726F746F';
wwv_flow_imp.g_varchar2_table(1468) := '747970652E706F704566666563743D66756E6374696F6E28297B746869732E5F616374697665456666656374732E706F7028292C746869732E6374782E726573746F726528297D2C61732E70726F746F747970652E72656E646572537461636B3D66756E';
wwv_flow_imp.g_varchar2_table(1469) := '6374696F6E2865297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A726574';
wwv_flow_imp.g_varchar2_table(1470) := '75726E20652E656C656D656E742E636F6E7461696E65722E7374796C65732E697356697369626C6528293F5B342C746869732E72656E646572537461636B436F6E74656E742865295D3A5B332C325D3B6361736520313A412E73656E7428292C412E6C61';
wwv_flow_imp.g_varchar2_table(1471) := '62656C3D323B6361736520323A72657475726E5B325D7D7D297D297D2C61732E70726F746F747970652E72656E6465724E6F64653D66756E6374696F6E2865297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F';
wwv_flow_imp.g_varchar2_table(1472) := '6E28297B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E20652E636F6E7461696E65722E7374796C65732E697356697369626C6528293F5B342C746869732E72';
wwv_flow_imp.g_varchar2_table(1473) := '656E6465724E6F64654261636B67726F756E64416E64426F72646572732865295D3A5B332C335D3B6361736520313A72657475726E20412E73656E7428292C5B342C746869732E72656E6465724E6F6465436F6E74656E742865295D3B6361736520323A';
wwv_flow_imp.g_varchar2_table(1474) := '412E73656E7428292C412E6C6162656C3D333B6361736520333A72657475726E5B325D7D7D297D297D2C61732E70726F746F747970652E72656E64657254657874576974684C657474657253706163696E673D66756E6374696F6E28742C412C72297B76';
wwv_flow_imp.g_varchar2_table(1475) := '617220423D746869733B303D3D3D413F746869732E6374782E66696C6C5465787428742E746578742C742E626F756E64732E6C6566742C742E626F756E64732E746F702B72293A6328742E74657874292E6D61702866756E6374696F6E2841297B726574';
wwv_flow_imp.g_varchar2_table(1476) := '75726E20512841297D292E7265647563652866756E6374696F6E28412C65297B72657475726E20422E6374782E66696C6C5465787428652C412C742E626F756E64732E746F702B72292C412B422E6374782E6D656173757265546578742865292E776964';
wwv_flow_imp.g_varchar2_table(1477) := '74687D2C742E626F756E64732E6C656674297D2C61732E70726F746F747970652E637265617465466F6E745374796C653D66756E6374696F6E2841297B76617220653D412E666F6E7456617269616E742E66696C7465722866756E6374696F6E2841297B';
wwv_flow_imp.g_varchar2_table(1478) := '72657475726E226E6F726D616C223D3D3D417C7C22736D616C6C2D63617073223D3D3D417D292E6A6F696E282222292C743D412E666F6E7446616D696C792E6A6F696E28222C2022292C723D504128412E666F6E7453697A65293F22222B412E666F6E74';
wwv_flow_imp.g_varchar2_table(1479) := '53697A652E6E756D6265722B412E666F6E7453697A652E756E69743A412E666F6E7453697A652E6E756D6265722B227078223B72657475726E5B5B412E666F6E745374796C652C652C412E666F6E745765696768742C722C745D2E6A6F696E2822202229';
wwv_flow_imp.g_varchar2_table(1480) := '2C742C725D7D2C61732E70726F746F747970652E72656E646572546578744E6F64653D66756E6374696F6E286F2C69297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B76617220652C742C722C422C';
wwv_flow_imp.g_varchar2_table(1481) := '6E2C733D746869733B72657475726E204828746869732C66756E6374696F6E2841297B72657475726E20723D746869732E637265617465466F6E745374796C652869292C653D725B305D2C743D725B315D2C723D725B325D2C746869732E6374782E666F';
wwv_flow_imp.g_varchar2_table(1482) := '6E743D652C746869732E6374782E74657874426173656C696E653D22616C7068616265746963222C723D746869732E666F6E744D6574726963732E6765744D65747269637328742C72292C423D722E626173656C696E652C6E3D722E6D6964646C652C6F';
wwv_flow_imp.g_varchar2_table(1483) := '2E74657874426F756E64732E666F72456163682866756E6374696F6E2865297B732E6374782E66696C6C5374796C653D746528692E636F6C6F72292C732E72656E64657254657874576974684C657474657253706163696E6728652C692E6C6574746572';
wwv_flow_imp.g_varchar2_table(1484) := '53706163696E672C42293B76617220413D692E74657874536861646F773B412E6C656E6774682626652E746578742E7472696D28292E6C656E677468262628412E736C6963652830292E7265766572736528292E666F72456163682866756E6374696F6E';
wwv_flow_imp.g_varchar2_table(1485) := '2841297B732E6374782E736861646F77436F6C6F723D746528412E636F6C6F72292C732E6374782E736861646F774F6666736574583D412E6F6666736574582E6E756D6265722A732E6F7074696F6E732E7363616C652C732E6374782E736861646F774F';
wwv_flow_imp.g_varchar2_table(1486) := '6666736574593D412E6F6666736574592E6E756D6265722A732E6F7074696F6E732E7363616C652C732E6374782E736861646F77426C75723D412E626C75722E6E756D6265722C732E72656E64657254657874576974684C657474657253706163696E67';
wwv_flow_imp.g_varchar2_table(1487) := '28652C692E6C657474657253706163696E672C42297D292C732E6374782E736861646F77436F6C6F723D22222C732E6374782E736861646F774F6666736574583D302C732E6374782E736861646F774F6666736574593D302C732E6374782E736861646F';
wwv_flow_imp.g_varchar2_table(1488) := '77426C75723D30292C692E746578744465636F726174696F6E4C696E652E6C656E677468262628732E6374782E66696C6C5374796C653D746528692E746578744465636F726174696F6E436F6C6F727C7C692E636F6C6F72292C692E746578744465636F';
wwv_flow_imp.g_varchar2_table(1489) := '726174696F6E4C696E652E666F72456163682866756E6374696F6E2841297B7377697463682841297B6361736520313A732E6374782E66696C6C5265637428652E626F756E64732E6C6566742C4D6174682E726F756E6428652E626F756E64732E746F70';
wwv_flow_imp.g_varchar2_table(1490) := '2B42292C652E626F756E64732E77696474682C31293B627265616B3B6361736520323A732E6374782E66696C6C5265637428652E626F756E64732E6C6566742C4D6174682E726F756E6428652E626F756E64732E746F70292C652E626F756E64732E7769';
wwv_flow_imp.g_varchar2_table(1491) := '6474682C31293B627265616B3B6361736520333A732E6374782E66696C6C5265637428652E626F756E64732E6C6566742C4D6174682E6365696C28652E626F756E64732E746F702B6E292C652E626F756E64732E77696474682C31297D7D29297D292C5B';
wwv_flow_imp.g_varchar2_table(1492) := '325D7D297D297D2C61732E70726F746F747970652E72656E6465725265706C61636564456C656D656E743D66756E6374696F6E28412C652C74297B76617220723B742626303C412E696E7472696E73696357696474682626303C412E696E7472696E7369';
wwv_flow_imp.g_varchar2_table(1493) := '63486569676874262628723D576E2841292C653D796E2865292C746869732E706174682865292C746869732E6374782E7361766528292C746869732E6374782E636C697028292C746869732E6374782E64726177496D61676528742C302C302C412E696E';
wwv_flow_imp.g_varchar2_table(1494) := '7472696E73696357696474682C412E696E7472696E7369634865696768742C722E6C6566742C722E746F702C722E77696474682C722E686569676874292C746869732E6374782E726573746F72652829297D2C61732E70726F746F747970652E72656E64';
wwv_flow_imp.g_varchar2_table(1495) := '65724E6F6465436F6E74656E743D66756E6374696F6E2845297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B76617220722C422C6E2C732C6F2C692C612C632C512C752C772C552C6C2C432C673B72';
wwv_flow_imp.g_varchar2_table(1496) := '657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A746869732E6170706C794566666563747328452E656666656374732C34292C723D452E636F6E7461696E65722C423D452E637572';
wwv_flow_imp.g_varchar2_table(1497) := '7665732C6E3D722E7374796C65732C733D302C6F3D722E746578744E6F6465732C412E6C6162656C3D313B6361736520313A72657475726E20733C6F2E6C656E6774683F28693D6F5B735D2C5B342C746869732E72656E646572546578744E6F64652869';
wwv_flow_imp.g_varchar2_table(1498) := '2C6E295D293A5B332C345D3B6361736520323A412E73656E7428292C412E6C6162656C3D333B6361736520333A72657475726E20732B2B2C5B332C315D3B6361736520343A69662821287220696E7374616E63656F66205972292972657475726E5B332C';
wwv_flow_imp.g_varchar2_table(1499) := '385D3B412E6C6162656C3D353B6361736520353A72657475726E20412E747279732E70757368285B352C372C2C385D292C5B342C746869732E6F7074696F6E732E63616368652E6D6174636828722E737263295D3B6361736520363A72657475726E2051';
wwv_flow_imp.g_varchar2_table(1500) := '3D412E73656E7428292C746869732E72656E6465725265706C61636564456C656D656E7428722C422C51292C5B332C385D3B6361736520373A72657475726E20412E73656E7428292C4C652E676574496E7374616E636528746869732E6F7074696F6E73';
end;
/
begin
wwv_flow_imp.g_varchar2_table(1501) := '2E6964292E6572726F7228224572726F72206C6F6164696E6720696D61676520222B722E737263292C5B332C385D3B6361736520383A6966287220696E7374616E63656F66206A722626746869732E72656E6465725265706C61636564456C656D656E74';
wwv_flow_imp.g_varchar2_table(1502) := '28722C422C722E63616E766173292C21287220696E7374616E63656F66206542292972657475726E5B332C31325D3B412E6C6162656C3D393B6361736520393A72657475726E20412E747279732E70757368285B392C31312C2C31325D292C5B342C7468';
wwv_flow_imp.g_varchar2_table(1503) := '69732E6F7074696F6E732E63616368652E6D6174636828722E737667295D3B636173652031303A72657475726E20513D412E73656E7428292C746869732E72656E6465725265706C61636564456C656D656E7428722C422C51292C5B332C31325D3B6361';
wwv_flow_imp.g_varchar2_table(1504) := '73652031313A72657475726E20412E73656E7428292C4C652E676574496E7374616E636528746869732E6F7074696F6E732E6964292E6572726F7228224572726F72206C6F6164696E672073766720222B722E7376672E737562737472696E6728302C32';
wwv_flow_imp.g_varchar2_table(1505) := '353529292C5B332C31325D3B636173652031323A72657475726E207220696E7374616E63656F66204B422626722E747265653F5B342C6E6577206173287B69643A746869732E6F7074696F6E732E69642C7363616C653A746869732E6F7074696F6E732E';
wwv_flow_imp.g_varchar2_table(1506) := '7363616C652C6261636B67726F756E64436F6C6F723A722E6261636B67726F756E64436F6C6F722C783A302C793A302C7363726F6C6C583A302C7363726F6C6C593A302C77696474683A722E77696474682C6865696768743A722E6865696768742C6361';
wwv_flow_imp.g_varchar2_table(1507) := '6368653A746869732E6F7074696F6E732E63616368652C77696E646F7757696474683A722E77696474682C77696E646F774865696768743A722E6865696768747D292E72656E64657228722E74726565295D3A5B332C31345D3B636173652031333A613D';
wwv_flow_imp.g_varchar2_table(1508) := '412E73656E7428292C722E77696474682626722E6865696768742626746869732E6374782E64726177496D61676528612C302C302C722E77696474682C722E6865696768742C722E626F756E64732E6C6566742C722E626F756E64732E746F702C722E62';
wwv_flow_imp.g_varchar2_table(1509) := '6F756E64732E77696474682C722E626F756E64732E686569676874292C412E6C6162656C3D31343B636173652031343A6966287220696E7374616E63656F66204342262628613D4D6174682E6D696E28722E626F756E64732E77696474682C722E626F75';
wwv_flow_imp.g_varchar2_table(1510) := '6E64732E686569676874292C722E747970653D3D3D75423F722E636865636B6564262628746869732E6374782E7361766528292C746869732E70617468285B6E6577206D6E28722E626F756E64732E6C6566742B2E33393336332A612C722E626F756E64';
wwv_flow_imp.g_varchar2_table(1511) := '732E746F702B2E37392A61292C6E6577206D6E28722E626F756E64732E6C6566742B2E31362A612C722E626F756E64732E746F702B2E353534392A61292C6E6577206D6E28722E626F756E64732E6C6566742B2E32373334372A612C722E626F756E6473';
wwv_flow_imp.g_varchar2_table(1512) := '2E746F702B2E34343037312A61292C6E6577206D6E28722E626F756E64732E6C6566742B2E33393639342A612C722E626F756E64732E746F702B2E353634392A61292C6E6577206D6E28722E626F756E64732E6C6566742B2E37323938332A612C722E62';
wwv_flow_imp.g_varchar2_table(1513) := '6F756E64732E746F702B2E32332A61292C6E6577206D6E28722E626F756E64732E6C6566742B2E38342A612C722E626F756E64732E746F702B2E33343038352A61292C6E6577206D6E28722E626F756E64732E6C6566742B2E33393336332A612C722E62';
wwv_flow_imp.g_varchar2_table(1514) := '6F756E64732E746F702B2E37392A61295D292C746869732E6374782E66696C6C5374796C653D7465286C42292C746869732E6374782E66696C6C28292C746869732E6374782E726573746F72652829293A722E747970653D3D3D77422626722E63686563';
wwv_flow_imp.g_varchar2_table(1515) := '6B6564262628746869732E6374782E7361766528292C746869732E6374782E626567696E5061746828292C746869732E6374782E61726328722E626F756E64732E6C6566742B612F322C722E626F756E64732E746F702B612F322C612F342C302C322A4D';
wwv_flow_imp.g_varchar2_table(1516) := '6174682E50492C2130292C746869732E6374782E66696C6C5374796C653D7465286C42292C746869732E6374782E66696C6C28292C746869732E6374782E726573746F7265282929292C63732872292626722E76616C75652E6C656E677468297B737769';
wwv_flow_imp.g_varchar2_table(1517) := '74636828773D746869732E637265617465466F6E745374796C65286E292C553D775B305D2C6C3D775B315D2C673D746869732E666F6E744D6574726963732E6765744D65747269637328552C6C292E626173656C696E652C746869732E6374782E666F6E';
wwv_flow_imp.g_varchar2_table(1518) := '743D552C746869732E6374782E66696C6C5374796C653D7465286E2E636F6C6F72292C746869732E6374782E74657874426173656C696E653D226D6964646C65222C746869732E6374782E74657874416C69676E3D757328722E7374796C65732E746578';
wwv_flow_imp.g_varchar2_table(1519) := '74416C69676E292C433D576E2872292C633D302C722E7374796C65732E74657874416C69676E297B636173652059742E43454E5445523A632B3D432E77696474682F323B627265616B3B636173652059742E52494748543A632B3D432E77696474687D75';
wwv_flow_imp.g_varchar2_table(1520) := '3D432E61646428632C302C302C2D432E6865696768742F322B31292C746869732E6374782E7361766528292C746869732E70617468285B6E6577206D6E28432E6C6566742C432E746F70292C6E6577206D6E28432E6C6566742B432E77696474682C432E';
wwv_flow_imp.g_varchar2_table(1521) := '746F70292C6E6577206D6E28432E6C6566742B432E77696474682C432E746F702B432E686569676874292C6E6577206D6E28432E6C6566742C432E746F702B432E686569676874295D292C746869732E6374782E636C697028292C746869732E72656E64';
wwv_flow_imp.g_varchar2_table(1522) := '657254657874576974684C657474657253706163696E67286E657720787228722E76616C75652C75292C6E2E6C657474657253706163696E672C67292C746869732E6374782E726573746F726528292C746869732E6374782E74657874426173656C696E';
wwv_flow_imp.g_varchar2_table(1523) := '653D22626F74746F6D222C746869732E6374782E74657874416C69676E3D226C656674227D696628214E7228722E7374796C65732E646973706C61792C32303438292972657475726E5B332C32305D3B6966286E756C6C3D3D3D722E7374796C65732E6C';
wwv_flow_imp.g_varchar2_table(1524) := '6973745374796C65496D6167652972657475726E5B332C31395D3B69662828773D722E7374796C65732E6C6973745374796C65496D616765292E74797065213D3D76652E55524C2972657475726E5B332C31385D3B513D766F696420302C753D772E7572';
wwv_flow_imp.g_varchar2_table(1525) := '6C2C412E6C6162656C3D31353B636173652031353A72657475726E20412E747279732E70757368285B31352C31372C2C31385D292C5B342C746869732E6F7074696F6E732E63616368652E6D617463682875295D3B636173652031363A72657475726E20';
wwv_flow_imp.g_varchar2_table(1526) := '513D412E73656E7428292C746869732E6374782E64726177496D61676528512C722E626F756E64732E6C6566742D28512E77696474682B3130292C722E626F756E64732E746F70292C5B332C31385D3B636173652031373A72657475726E20412E73656E';
wwv_flow_imp.g_varchar2_table(1527) := '7428292C4C652E676574496E7374616E636528746869732E6F7074696F6E732E6964292E6572726F7228224572726F72206C6F6164696E67206C6973742D7374796C652D696D61676520222B75292C5B332C31385D3B636173652031383A72657475726E';
wwv_flow_imp.g_varchar2_table(1528) := '5B332C32305D3B636173652031393A452E6C69737456616C75652626722E7374796C65732E6C6973745374796C6554797065213D3D78742E4E4F4E45262628773D746869732E637265617465466F6E745374796C65286E292C553D775B305D2C6C3D775B';
wwv_flow_imp.g_varchar2_table(1529) := '315D2C746869732E6374782E666F6E743D552C746869732E6374782E66696C6C5374796C653D7465286E2E636F6C6F72292C746869732E6374782E74657874426173656C696E653D226D6964646C65222C746869732E6374782E74657874416C69676E3D';
wwv_flow_imp.g_varchar2_table(1530) := '227269676874222C433D6E6577206828722E626F756E64732E6C6566742C722E626F756E64732E746F702B696528722E7374796C65732E70616464696E67546F702C722E626F756E64732E7769647468292C722E626F756E64732E77696474682C28653D';
wwv_flow_imp.g_varchar2_table(1531) := '6E2E6C696E654865696768742C743D6E2E666F6E7453697A652E6E756D6265722C287A412865292626226E6F726D616C223D3D3D652E76616C75653F312E322A743A652E747970653D3D3D6F412E4E554D4245525F544F4B454E3F742A652E6E756D6265';
wwv_flow_imp.g_varchar2_table(1532) := '723A71412865293F696528652C74293A74292F322B3129292C673D746869732E666F6E744D6574726963732E6765744D65747269637328552C6C292E626173656C696E652C746869732E72656E64657254657874576974684C657474657253706163696E';
wwv_flow_imp.g_varchar2_table(1533) := '67286E657720787228452E6C69737456616C75652C43292C6E2E6C657474657253706163696E672C67292C746869732E6374782E74657874426173656C696E653D22626F74746F6D222C746869732E6374782E74657874416C69676E3D226C6566742229';
wwv_flow_imp.g_varchar2_table(1534) := '2C412E6C6162656C3D32303B636173652032303A72657475726E5B325D7D76617220652C747D297D297D2C61732E70726F746F747970652E72656E646572537461636B436F6E74656E743D66756E6374696F6E2843297B72657475726E20612874686973';
wwv_flow_imp.g_varchar2_table(1535) := '2C766F696420302C766F696420302C66756E6374696F6E28297B76617220652C742C722C422C6E2C732C6F2C692C612C632C512C752C772C552C6C3B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C';
wwv_flow_imp.g_varchar2_table(1536) := '297B6361736520303A72657475726E5B342C746869732E72656E6465724E6F64654261636B67726F756E64416E64426F726465727328432E656C656D656E74295D3B6361736520313A412E73656E7428292C653D302C743D432E6E656761746976655A49';
wwv_flow_imp.g_varchar2_table(1537) := '6E6465782C412E6C6162656C3D323B6361736520323A72657475726E20653C742E6C656E6774683F286C3D745B655D2C5B342C746869732E72656E646572537461636B286C295D293A5B332C355D3B6361736520333A412E73656E7428292C412E6C6162';
wwv_flow_imp.g_varchar2_table(1538) := '656C3D343B6361736520343A72657475726E20652B2B2C5B332C325D3B6361736520353A72657475726E5B342C746869732E72656E6465724E6F6465436F6E74656E7428432E656C656D656E74295D3B6361736520363A412E73656E7428292C723D302C';
wwv_flow_imp.g_varchar2_table(1539) := '423D432E6E6F6E496E6C696E654C6576656C2C412E6C6162656C3D373B6361736520373A72657475726E20723C422E6C656E6774683F286C3D425B725D2C5B342C746869732E72656E6465724E6F6465286C295D293A5B332C31305D3B6361736520383A';
wwv_flow_imp.g_varchar2_table(1540) := '412E73656E7428292C412E6C6162656C3D393B6361736520393A72657475726E20722B2B2C5B332C375D3B636173652031303A6E3D302C733D432E6E6F6E506F736974696F6E6564466C6F6174732C412E6C6162656C3D31313B636173652031313A7265';
wwv_flow_imp.g_varchar2_table(1541) := '7475726E206E3C732E6C656E6774683F286C3D735B6E5D2C5B342C746869732E72656E646572537461636B286C295D293A5B332C31345D3B636173652031323A412E73656E7428292C412E6C6162656C3D31333B636173652031333A72657475726E206E';
wwv_flow_imp.g_varchar2_table(1542) := '2B2B2C5B332C31315D3B636173652031343A6F3D302C693D432E6E6F6E506F736974696F6E6564496E6C696E654C6576656C2C412E6C6162656C3D31353B636173652031353A72657475726E206F3C692E6C656E6774683F286C3D695B6F5D2C5B342C74';
wwv_flow_imp.g_varchar2_table(1543) := '6869732E72656E646572537461636B286C295D293A5B332C31385D3B636173652031363A412E73656E7428292C412E6C6162656C3D31373B636173652031373A72657475726E206F2B2B2C5B332C31355D3B636173652031383A613D302C633D432E696E';
wwv_flow_imp.g_varchar2_table(1544) := '6C696E654C6576656C2C412E6C6162656C3D31393B636173652031393A72657475726E20613C632E6C656E6774683F286C3D635B615D2C5B342C746869732E72656E6465724E6F6465286C295D293A5B332C32325D3B636173652032303A412E73656E74';
wwv_flow_imp.g_varchar2_table(1545) := '28292C412E6C6162656C3D32313B636173652032313A72657475726E20612B2B2C5B332C31395D3B636173652032323A513D302C753D432E7A65726F4F724175746F5A496E6465784F725472616E73666F726D65644F724F7061636974792C412E6C6162';
wwv_flow_imp.g_varchar2_table(1546) := '656C3D32333B636173652032333A72657475726E20513C752E6C656E6774683F286C3D755B515D2C5B342C746869732E72656E646572537461636B286C295D293A5B332C32365D3B636173652032343A412E73656E7428292C412E6C6162656C3D32353B';
wwv_flow_imp.g_varchar2_table(1547) := '636173652032353A72657475726E20512B2B2C5B332C32335D3B636173652032363A773D302C553D432E706F7369746976655A496E6465782C412E6C6162656C3D32373B636173652032373A72657475726E20773C552E6C656E6774683F286C3D555B77';
wwv_flow_imp.g_varchar2_table(1548) := '5D2C5B342C746869732E72656E646572537461636B286C295D293A5B332C33305D3B636173652032383A412E73656E7428292C412E6C6162656C3D32393B636173652032393A72657475726E20772B2B2C5B332C32375D3B636173652033303A72657475';
wwv_flow_imp.g_varchar2_table(1549) := '726E5B325D7D7D297D297D2C61732E70726F746F747970652E6D61736B3D66756E6374696F6E2841297B746869732E6374782E626567696E5061746828292C746869732E6374782E6D6F7665546F28302C30292C746869732E6374782E6C696E65546F28';
wwv_flow_imp.g_varchar2_table(1550) := '746869732E63616E7661732E77696474682C30292C746869732E6374782E6C696E65546F28746869732E63616E7661732E77696474682C746869732E63616E7661732E686569676874292C746869732E6374782E6C696E65546F28302C746869732E6361';
wwv_flow_imp.g_varchar2_table(1551) := '6E7661732E686569676874292C746869732E6374782E6C696E65546F28302C30292C746869732E666F726D61745061746828412E736C6963652830292E726576657273652829292C746869732E6374782E636C6F73655061746828297D2C61732E70726F';
wwv_flow_imp.g_varchar2_table(1552) := '746F747970652E706174683D66756E6374696F6E2841297B746869732E6374782E626567696E5061746828292C746869732E666F726D6174506174682841292C746869732E6374782E636C6F73655061746828297D2C61732E70726F746F747970652E66';
wwv_flow_imp.g_varchar2_table(1553) := '6F726D6174506174683D66756E6374696F6E2841297B76617220723D746869733B412E666F72456163682866756E6374696F6E28412C65297B76617220743D626E2841293F412E73746172743A413B303D3D3D653F722E6374782E6D6F7665546F28742E';
wwv_flow_imp.g_varchar2_table(1554) := '782C742E79293A722E6374782E6C696E65546F28742E782C742E79292C626E2841292626722E6374782E62657A6965724375727665546F28412E7374617274436F6E74726F6C2E782C412E7374617274436F6E74726F6C2E792C412E656E64436F6E7472';
wwv_flow_imp.g_varchar2_table(1555) := '6F6C2E782C412E656E64436F6E74726F6C2E792C412E656E642E782C412E656E642E79297D297D2C61732E70726F746F747970652E72656E6465725265706561743D66756E6374696F6E28412C652C742C72297B746869732E706174682841292C746869';
wwv_flow_imp.g_varchar2_table(1556) := '732E6374782E66696C6C5374796C653D652C746869732E6374782E7472616E736C61746528742C72292C746869732E6374782E66696C6C28292C746869732E6374782E7472616E736C617465282D742C2D72297D2C61732E70726F746F747970652E7265';
wwv_flow_imp.g_varchar2_table(1557) := '73697A65496D6167653D66756E6374696F6E28412C652C74297B696628412E77696474683D3D3D652626412E6865696768743D3D3D742972657475726E20413B76617220723D746869732E63616E7661732E6F776E6572446F63756D656E742E63726561';
wwv_flow_imp.g_varchar2_table(1558) := '7465456C656D656E74282263616E76617322293B72657475726E20722E77696474683D4D6174682E6D617828312C65292C722E6865696768743D4D6174682E6D617828312C74292C722E676574436F6E746578742822326422292E64726177496D616765';
wwv_flow_imp.g_varchar2_table(1559) := '28412C302C302C412E77696474682C412E6865696768742C302C302C652C74292C727D2C61732E70726F746F747970652E72656E6465724261636B67726F756E64496D6167653D66756E6374696F6E2864297B72657475726E206128746869732C766F69';
wwv_flow_imp.g_varchar2_table(1560) := '6420302C766F696420302C66756E6374696F6E28297B76617220682C652C462C742C722C423B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A683D642E7374796C65732E6261';
wwv_flow_imp.g_varchar2_table(1561) := '636B67726F756E64496D6167652E6C656E6774682D312C653D66756E6374696F6E2865297B76617220742C722C422C6E2C732C6F2C692C612C632C512C752C772C552C6C2C432C672C453B72657475726E204828746869732C66756E6374696F6E284129';
wwv_flow_imp.g_varchar2_table(1562) := '7B73776974636828412E6C6162656C297B6361736520303A696628652E74797065213D3D76652E55524C2972657475726E5B332C355D3B743D766F696420302C723D652E75726C2C412E6C6162656C3D313B6361736520313A72657475726E20412E7472';
wwv_flow_imp.g_varchar2_table(1563) := '79732E70757368285B312C332C2C345D292C5B342C462E6F7074696F6E732E63616368652E6D617463682872295D3B6361736520323A72657475726E20743D412E73656E7428292C5B332C345D3B6361736520333A72657475726E20412E73656E742829';
wwv_flow_imp.g_varchar2_table(1564) := '2C4C652E676574496E7374616E636528462E6F7074696F6E732E6964292E6572726F7228224572726F72206C6F6164696E67206261636B67726F756E642D696D61676520222B72292C5B332C345D3B6361736520343A72657475726E2074262628423D59';
wwv_flow_imp.g_varchar2_table(1565) := '6E28642C682C5B742E77696474682C742E6865696768742C742E77696474682F742E6865696768745D292C6F3D425B305D2C753D425B315D2C773D425B325D2C633D425B335D2C513D425B345D2C733D462E6374782E6372656174655061747465726E28';
wwv_flow_imp.g_varchar2_table(1566) := '462E726573697A65496D61676528742C632C51292C2272657065617422292C462E72656E646572526570656174286F2C732C752C7729292C5B332C365D3B6361736520353A652E747970653D3D3D76652E4C494E4541525F4752414449454E543F28453D';
wwv_flow_imp.g_varchar2_table(1567) := '596E28642C682C5B6E756C6C2C6E756C6C2C6E756C6C5D292C6F3D455B305D2C753D455B315D2C773D455B325D2C633D455B335D2C513D455B345D2C433D486528652E616E676C652C632C51292C6C3D435B305D2C423D435B315D2C693D435B325D2C67';
wwv_flow_imp.g_varchar2_table(1568) := '3D435B335D2C613D435B345D2C28453D646F63756D656E742E637265617465456C656D656E74282263616E7661732229292E77696474683D632C452E6865696768743D512C433D452E676574436F6E746578742822326422292C6E3D432E637265617465';
wwv_flow_imp.g_varchar2_table(1569) := '4C696E6561724772616469656E7428422C672C692C61292C646528652E73746F70732C6C292E666F72456163682866756E6374696F6E2841297B72657475726E206E2E616464436F6C6F7253746F7028412E73746F702C746528412E636F6C6F7229297D';
wwv_flow_imp.g_varchar2_table(1570) := '292C432E66696C6C5374796C653D6E2C432E66696C6C5265637428302C302C632C51292C303C632626303C51262628733D462E6374782E6372656174655061747465726E28452C2272657065617422292C462E72656E646572526570656174286F2C732C';
wwv_flow_imp.g_varchar2_table(1571) := '752C772929293A652E747970653D3D3D76652E52414449414C5F4752414449454E54262628673D596E28642C682C5B6E756C6C2C6E756C6C2C6E756C6C5D292C6F3D675B305D2C693D675B315D2C613D675B325D2C633D675B335D2C513D675B345D2C6C';
wwv_flow_imp.g_varchar2_table(1572) := '3D303D3D3D652E706F736974696F6E2E6C656E6774683F5B73655D3A652E706F736974696F6E2C753D6965286C5B305D2C63292C773D6965286C5B6C2E6C656E6774682D315D2C51292C433D66756E6374696F6E28412C652C742C722C42297B76617220';
wwv_flow_imp.g_varchar2_table(1573) := '6E2C732C6F2C692C613D302C633D303B73776974636828412E73697A65297B636173652041742E434C4F534553545F534944453A412E73686170653D3D3D24652E434952434C453F613D633D4D6174682E6D696E284D6174682E6162732865292C4D6174';
wwv_flow_imp.g_varchar2_table(1574) := '682E61627328652D72292C4D6174682E6162732874292C4D6174682E61627328742D4229293A412E73686170653D3D3D24652E454C4C49505345262628613D4D6174682E6D696E284D6174682E6162732865292C4D6174682E61627328652D7229292C63';
wwv_flow_imp.g_varchar2_table(1575) := '3D4D6174682E6D696E284D6174682E6162732874292C4D6174682E61627328742D422929293B627265616B3B636173652041742E434C4F534553545F434F524E45523A412E73686170653D3D3D24652E434952434C453F613D633D4D6174682E6D696E28';
wwv_flow_imp.g_varchar2_table(1576) := '666528652C74292C666528652C742D42292C666528652D722C74292C666528652D722C742D4229293A412E73686170653D3D3D24652E454C4C495053452626286E3D4D6174682E6D696E284D6174682E6162732874292C4D6174682E61627328742D4229';
wwv_flow_imp.g_varchar2_table(1577) := '292F4D6174682E6D696E284D6174682E6162732865292C4D6174682E61627328652D7229292C6F3D28733D706528722C422C652C742C213029295B305D2C693D735B315D2C633D6E2A28613D6665286F2D652C28692D74292F6E2929293B627265616B3B';
wwv_flow_imp.g_varchar2_table(1578) := '636173652041742E46415254484553545F534944453A412E73686170653D3D3D24652E434952434C453F613D633D4D6174682E6D6178284D6174682E6162732865292C4D6174682E61627328652D72292C4D6174682E6162732874292C4D6174682E6162';
wwv_flow_imp.g_varchar2_table(1579) := '7328742D4229293A412E73686170653D3D3D24652E454C4C49505345262628613D4D6174682E6D6178284D6174682E6162732865292C4D6174682E61627328652D7229292C633D4D6174682E6D6178284D6174682E6162732874292C4D6174682E616273';
wwv_flow_imp.g_varchar2_table(1580) := '28742D422929293B627265616B3B636173652041742E46415254484553545F434F524E45523A412E73686170653D3D3D24652E434952434C453F613D633D4D6174682E6D617828666528652C74292C666528652C742D42292C666528652D722C74292C66';
wwv_flow_imp.g_varchar2_table(1581) := '6528652D722C742D4229293A412E73686170653D3D3D24652E454C4C495053452626286E3D4D6174682E6D6178284D6174682E6162732874292C4D6174682E61627328742D4229292F4D6174682E6D6178284D6174682E6162732865292C4D6174682E61';
wwv_flow_imp.g_varchar2_table(1582) := '627328652D7229292C6F3D28733D706528722C422C652C742C213129295B305D2C693D735B315D2C633D6E2A28613D6665286F2D652C28692D74292F6E2929297D72657475726E2041727261792E6973417272617928412E73697A6529262628613D6965';
wwv_flow_imp.g_varchar2_table(1583) := '28412E73697A655B305D2C72292C633D323D3D3D412E73697A652E6C656E6774683F696528412E73697A655B315D2C42293A61292C5B612C635D7D28652C752C772C632C51292C453D435B305D2C673D435B315D2C303C45262628553D462E6374782E63';
wwv_flow_imp.g_varchar2_table(1584) := '726561746552616469616C4772616469656E7428692B752C612B772C302C692B752C612B772C45292C646528652E73746F70732C322A45292E666F72456163682866756E6374696F6E2841297B72657475726E20552E616464436F6C6F7253746F702841';
wwv_flow_imp.g_varchar2_table(1585) := '2E73746F702C746528412E636F6C6F7229297D292C462E70617468286F292C462E6374782E66696C6C5374796C653D552C45213D3D673F286C3D642E626F756E64732E6C6566742B2E352A642E626F756E64732E77696474682C433D642E626F756E6473';
wwv_flow_imp.g_varchar2_table(1586) := '2E746F702B2E352A642E626F756E64732E6865696768742C453D312F28673D672F45292C462E6374782E7361766528292C462E6374782E7472616E736C617465286C2C43292C462E6374782E7472616E73666F726D28312C302C302C672C302C30292C46';
wwv_flow_imp.g_varchar2_table(1587) := '2E6374782E7472616E736C617465282D6C2C2D43292C462E6374782E66696C6C5265637428692C452A28612D43292B432C632C512A45292C462E6374782E726573746F72652829293A462E6374782E66696C6C282929292C412E6C6162656C3D363B6361';
wwv_flow_imp.g_varchar2_table(1588) := '736520363A72657475726E20682D2D2C5B325D7D7D297D2C463D746869732C743D302C723D642E7374796C65732E6261636B67726F756E64496D6167652E736C6963652830292E7265766572736528292C412E6C6162656C3D313B6361736520313A7265';
wwv_flow_imp.g_varchar2_table(1589) := '7475726E20743C722E6C656E6774683F28423D725B745D2C5B352C652842295D293A5B332C345D3B6361736520323A412E73656E7428292C412E6C6162656C3D333B6361736520333A72657475726E20742B2B2C5B332C315D3B6361736520343A726574';
wwv_flow_imp.g_varchar2_table(1590) := '75726E5B325D7D7D297D297D2C61732E70726F746F747970652E72656E646572536F6C6964426F726465723D66756E6374696F6E28652C742C72297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B72';
wwv_flow_imp.g_varchar2_table(1591) := '657475726E204828746869732C66756E6374696F6E2841297B72657475726E20746869732E70617468284A6E28722C7429292C746869732E6374782E66696C6C5374796C653D74652865292C746869732E6374782E66696C6C28292C5B325D7D297D297D';
wwv_flow_imp.g_varchar2_table(1592) := '2C61732E70726F746F747970652E72656E646572446F75626C65426F726465723D66756E6374696F6E28742C722C422C6E297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B76617220653B72657475';
wwv_flow_imp.g_varchar2_table(1593) := '726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E20723C333F5B342C746869732E72656E646572536F6C6964426F7264657228742C422C6E295D3A5B332C325D3B63617365';
wwv_flow_imp.g_varchar2_table(1594) := '20313A72657475726E20412E73656E7428292C5B325D3B6361736520323A72657475726E20653D66756E6374696F6E28412C65297B7377697463682865297B6361736520303A72657475726E20657328412E746F704C656674426F72646572426F782C41';
wwv_flow_imp.g_varchar2_table(1595) := '2E746F704C656674426F72646572446F75626C654F75746572426F782C412E746F705269676874426F72646572426F782C412E746F705269676874426F72646572446F75626C654F75746572426F78293B6361736520313A72657475726E20657328412E';
wwv_flow_imp.g_varchar2_table(1596) := '746F705269676874426F72646572426F782C412E746F705269676874426F72646572446F75626C654F75746572426F782C412E626F74746F6D5269676874426F72646572426F782C412E626F74746F6D5269676874426F72646572446F75626C654F7574';
wwv_flow_imp.g_varchar2_table(1597) := '6572426F78293B6361736520323A72657475726E20657328412E626F74746F6D5269676874426F72646572426F782C412E626F74746F6D5269676874426F72646572446F75626C654F75746572426F782C412E626F74746F6D4C656674426F7264657242';
wwv_flow_imp.g_varchar2_table(1598) := '6F782C412E626F74746F6D4C656674426F72646572446F75626C654F75746572426F78293B64656661756C743A72657475726E20657328412E626F74746F6D4C656674426F72646572426F782C412E626F74746F6D4C656674426F72646572446F75626C';
wwv_flow_imp.g_varchar2_table(1599) := '654F75746572426F782C412E746F704C656674426F72646572426F782C412E746F704C656674426F72646572446F75626C654F75746572426F78297D7D286E2C42292C746869732E706174682865292C746869732E6374782E66696C6C5374796C653D74';
wwv_flow_imp.g_varchar2_table(1600) := '652874292C746869732E6374782E66696C6C28292C653D66756E6374696F6E28412C65297B7377697463682865297B6361736520303A72657475726E20657328412E746F704C656674426F72646572446F75626C65496E6E6572426F782C412E746F704C';
wwv_flow_imp.g_varchar2_table(1601) := '65667450616464696E67426F782C412E746F705269676874426F72646572446F75626C65496E6E6572426F782C412E746F70526967687450616464696E67426F78293B6361736520313A72657475726E20657328412E746F705269676874426F72646572';
wwv_flow_imp.g_varchar2_table(1602) := '446F75626C65496E6E6572426F782C412E746F70526967687450616464696E67426F782C412E626F74746F6D5269676874426F72646572446F75626C65496E6E6572426F782C412E626F74746F6D526967687450616464696E67426F78293B6361736520';
wwv_flow_imp.g_varchar2_table(1603) := '323A72657475726E20657328412E626F74746F6D5269676874426F72646572446F75626C65496E6E6572426F782C412E626F74746F6D526967687450616464696E67426F782C412E626F74746F6D4C656674426F72646572446F75626C65496E6E657242';
wwv_flow_imp.g_varchar2_table(1604) := '6F782C412E626F74746F6D4C65667450616464696E67426F78293B64656661756C743A72657475726E20657328412E626F74746F6D4C656674426F72646572446F75626C65496E6E6572426F782C412E626F74746F6D4C65667450616464696E67426F78';
wwv_flow_imp.g_varchar2_table(1605) := '2C412E746F704C656674426F72646572446F75626C65496E6E6572426F782C412E746F704C65667450616464696E67426F78297D7D286E2C42292C746869732E706174682865292C746869732E6374782E66696C6C28292C5B325D7D7D297D297D2C6173';
wwv_flow_imp.g_varchar2_table(1606) := '2E70726F746F747970652E72656E6465724E6F64654261636B67726F756E64416E64426F72646572733D66756E6374696F6E2863297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B76617220652C74';
wwv_flow_imp.g_varchar2_table(1607) := '2C722C422C6E2C732C6F2C692C613D746869733B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E28746869732E6170706C794566666563747328632E65666665';
wwv_flow_imp.g_varchar2_table(1608) := '6374732C32292C653D632E636F6E7461696E65722E7374796C65732C743D21656528652E6261636B67726F756E64436F6C6F72297C7C652E6261636B67726F756E64496D6167652E6C656E6774682C723D5B7B7374796C653A652E626F72646572546F70';
wwv_flow_imp.g_varchar2_table(1609) := '5374796C652C636F6C6F723A652E626F72646572546F70436F6C6F722C77696474683A652E626F72646572546F7057696474687D2C7B7374796C653A652E626F7264657252696768745374796C652C636F6C6F723A652E626F726465725269676874436F';
wwv_flow_imp.g_varchar2_table(1610) := '6C6F722C77696474683A652E626F72646572526967687457696474687D2C7B7374796C653A652E626F72646572426F74746F6D5374796C652C636F6C6F723A652E626F72646572426F74746F6D436F6C6F722C77696474683A652E626F72646572426F74';
wwv_flow_imp.g_varchar2_table(1611) := '746F6D57696474687D2C7B7374796C653A652E626F726465724C6566745374796C652C636F6C6F723A652E626F726465724C656674436F6C6F722C77696474683A652E626F726465724C65667457696474687D5D2C423D517328727328652E6261636B67';
wwv_flow_imp.g_varchar2_table(1612) := '726F756E64436C69702C30292C632E637572766573292C747C7C652E626F78536861646F772E6C656E677468293F28746869732E6374782E7361766528292C746869732E706174682842292C746869732E6374782E636C697028292C656528652E626163';
wwv_flow_imp.g_varchar2_table(1613) := '6B67726F756E64436F6C6F72297C7C28746869732E6374782E66696C6C5374796C653D746528652E6261636B67726F756E64436F6C6F72292C746869732E6374782E66696C6C2829292C5B342C746869732E72656E6465724261636B67726F756E64496D';
wwv_flow_imp.g_varchar2_table(1614) := '61676528632E636F6E7461696E6572295D293A5B332C325D3B6361736520313A412E73656E7428292C746869732E6374782E726573746F726528292C652E626F78536861646F772E736C6963652830292E7265766572736528292E666F72456163682866';
wwv_flow_imp.g_varchar2_table(1615) := '756E6374696F6E2841297B612E6374782E7361766528293B76617220742C722C422C6E2C653D766E28632E637572766573292C733D412E696E7365743F303A3165342C6F3D28743D2D732B28412E696E7365743F313A2D31292A412E7370726561642E6E';
wwv_flow_imp.g_varchar2_table(1616) := '756D6265722C723D28412E696E7365743F313A2D31292A412E7370726561642E6E756D6265722C423D412E7370726561642E6E756D6265722A28412E696E7365743F2D323A32292C6E3D412E7370726561642E6E756D6265722A28412E696E7365743F2D';
wwv_flow_imp.g_varchar2_table(1617) := '323A32292C652E6D61702866756E6374696F6E28412C65297B7377697463682865297B6361736520303A72657475726E20412E61646428742C72293B6361736520313A72657475726E20412E61646428742B422C72293B6361736520323A72657475726E';
wwv_flow_imp.g_varchar2_table(1618) := '20412E61646428742B422C722B6E293B6361736520333A72657475726E20412E61646428742C722B6E297D72657475726E20417D29293B412E696E7365743F28612E706174682865292C612E6374782E636C697028292C612E6D61736B286F29293A2861';
wwv_flow_imp.g_varchar2_table(1619) := '2E6D61736B2865292C612E6374782E636C697028292C612E70617468286F29292C612E6374782E736861646F774F6666736574583D412E6F6666736574582E6E756D6265722B732C612E6374782E736861646F774F6666736574593D412E6F6666736574';
wwv_flow_imp.g_varchar2_table(1620) := '592E6E756D6265722C612E6374782E736861646F77436F6C6F723D746528412E636F6C6F72292C612E6374782E736861646F77426C75723D412E626C75722E6E756D6265722C612E6374782E66696C6C5374796C653D412E696E7365743F746528412E63';
wwv_flow_imp.g_varchar2_table(1621) := '6F6C6F72293A227267626128302C302C302C3129222C612E6374782E66696C6C28292C612E6374782E726573746F726528297D292C412E6C6162656C3D323B6361736520323A733D6E3D302C6F3D722C412E6C6162656C3D333B6361736520333A726574';
wwv_flow_imp.g_varchar2_table(1622) := '75726E20733C6F2E6C656E6774683F28693D6F5B735D292E7374796C65213D3D63742E4E4F4E45262621656528692E636F6C6F72292626303C692E77696474683F692E7374796C65213D3D63742E4441534845443F5B332C355D3A5B342C746869732E72';
wwv_flow_imp.g_varchar2_table(1623) := '656E646572446173686564446F74746564426F7264657228692E636F6C6F722C692E77696474682C6E2C632E6375727665732C63742E444153484544295D3A5B332C31315D3A5B332C31335D3B6361736520343A72657475726E20412E73656E7428292C';
wwv_flow_imp.g_varchar2_table(1624) := '5B332C31315D3B6361736520353A72657475726E20692E7374796C65213D3D63742E444F545445443F5B332C375D3A5B342C746869732E72656E646572446173686564446F74746564426F7264657228692E636F6C6F722C692E77696474682C6E2C632E';
wwv_flow_imp.g_varchar2_table(1625) := '6375727665732C63742E444F54544544295D3B6361736520363A72657475726E20412E73656E7428292C5B332C31315D3B6361736520373A72657475726E20692E7374796C65213D3D63742E444F55424C453F5B332C395D3A5B342C746869732E72656E';
wwv_flow_imp.g_varchar2_table(1626) := '646572446F75626C65426F7264657228692E636F6C6F722C692E77696474682C6E2C632E637572766573295D3B6361736520383A72657475726E20412E73656E7428292C5B332C31315D3B6361736520393A72657475726E5B342C746869732E72656E64';
wwv_flow_imp.g_varchar2_table(1627) := '6572536F6C6964426F7264657228692E636F6C6F722C6E2C632E637572766573295D3B636173652031303A412E73656E7428292C412E6C6162656C3D31313B636173652031313A6E2B2B2C412E6C6162656C3D31323B636173652031323A72657475726E';
wwv_flow_imp.g_varchar2_table(1628) := '20732B2B2C5B332C335D3B636173652031333A72657475726E5B325D7D7D297D297D2C61732E70726F746F747970652E72656E646572446173686564446F74746564426F726465723D66756E6374696F6E28752C772C552C6C2C43297B72657475726E20';
wwv_flow_imp.g_varchar2_table(1629) := '6128746869732C766F696420302C766F696420302C66756E6374696F6E28297B76617220652C742C722C422C6E2C732C6F2C692C612C632C513B72657475726E204828746869732C66756E6374696F6E2841297B72657475726E20746869732E6374782E';
wwv_flow_imp.g_varchar2_table(1630) := '7361766528292C613D66756E6374696F6E28412C65297B7377697463682865297B6361736520303A72657475726E20417328412E746F704C656674426F726465725374726F6B652C412E746F705269676874426F726465725374726F6B65293B63617365';
wwv_flow_imp.g_varchar2_table(1631) := '20313A72657475726E20417328412E746F705269676874426F726465725374726F6B652C412E626F74746F6D5269676874426F726465725374726F6B65293B6361736520323A72657475726E20417328412E626F74746F6D5269676874426F7264657253';
wwv_flow_imp.g_varchar2_table(1632) := '74726F6B652C412E626F74746F6D4C656674426F726465725374726F6B65293B64656661756C743A72657475726E20417328412E626F74746F6D4C656674426F726465725374726F6B652C412E746F704C656674426F726465725374726F6B65297D7D28';
wwv_flow_imp.g_varchar2_table(1633) := '6C2C55292C653D4A6E286C2C55292C433D3D3D63742E444153484544262628746869732E706174682865292C746869732E6374782E636C69702829292C733D626E28655B305D293F28743D655B305D2E73746172742E782C655B305D2E73746172742E79';
wwv_flow_imp.g_varchar2_table(1634) := '293A28743D655B305D2E782C655B305D2E79292C6F3D626E28655B315D293F28723D655B315D2E656E642E782C655B315D2E656E642E79293A28723D655B315D2E782C655B315D2E79292C423D303D3D3D557C7C323D3D3D553F4D6174682E6162732874';
wwv_flow_imp.g_varchar2_table(1635) := '2D72293A4D6174682E61627328732D6F292C746869732E6374782E626567696E5061746828292C433D3D3D63742E444F545445443F746869732E666F726D6174506174682861293A746869732E666F726D61745061746828652E736C69636528302C3229';
wwv_flow_imp.g_varchar2_table(1636) := '292C6E3D773C333F332A773A322A772C733D773C333F322A773A772C433D3D3D63742E444F54544544262628733D6E3D77292C6F3D21302C423C3D322A6E3F6F3D21313A423C3D322A6E2B733F286E2A3D693D422F28322A6E2B73292C732A3D69293A28';
wwv_flow_imp.g_varchar2_table(1637) := '613D4D6174682E666C6F6F722828422B73292F286E2B7329292C693D28422D612A6E292F28612D31292C733D28613D28422D28612B31292A6E292F61293C3D307C7C4D6174682E61627328732D69293C4D6174682E61627328732D61293F693A61292C6F';
wwv_flow_imp.g_varchar2_table(1638) := '262628433D3D3D63742E444F545445443F746869732E6374782E7365744C696E6544617368285B302C6E2B735D293A746869732E6374782E7365744C696E6544617368285B6E2C735D29292C433D3D3D63742E444F545445443F28746869732E6374782E';
wwv_flow_imp.g_varchar2_table(1639) := '6C696E654361703D22726F756E64222C746869732E6374782E6C696E6557696474683D77293A746869732E6374782E6C696E6557696474683D322A772B312E312C746869732E6374782E7374726F6B655374796C653D74652875292C746869732E637478';
wwv_flow_imp.g_varchar2_table(1640) := '2E7374726F6B6528292C746869732E6374782E7365744C696E6544617368285B5D292C433D3D3D63742E444153484544262628626E28655B305D29262628633D655B335D2C513D655B305D2C746869732E6374782E626567696E5061746828292C746869';
wwv_flow_imp.g_varchar2_table(1641) := '732E666F726D617450617468285B6E6577206D6E28632E656E642E782C632E656E642E79292C6E6577206D6E28512E73746172742E782C512E73746172742E79295D292C746869732E6374782E7374726F6B652829292C626E28655B315D29262628633D';
wwv_flow_imp.g_varchar2_table(1642) := '655B315D2C513D655B325D2C746869732E6374782E626567696E5061746828292C746869732E666F726D617450617468285B6E6577206D6E28632E656E642E782C632E656E642E79292C6E6577206D6E28512E73746172742E782C512E73746172742E79';
wwv_flow_imp.g_varchar2_table(1643) := '295D292C746869732E6374782E7374726F6B65282929292C746869732E6374782E726573746F726528292C5B325D7D297D297D2C61732E70726F746F747970652E72656E6465723D66756E6374696F6E2842297B72657475726E206128746869732C766F';
wwv_flow_imp.g_varchar2_table(1644) := '696420302C766F696420302C66756E6374696F6E28297B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E20746869732E6F7074696F6E732E6261636B67726F75';
wwv_flow_imp.g_varchar2_table(1645) := '6E64436F6C6F72262628746869732E6374782E66696C6C5374796C653D746528746869732E6F7074696F6E732E6261636B67726F756E64436F6C6F72292C746869732E6374782E66696C6C5265637428746869732E6F7074696F6E732E782D746869732E';
wwv_flow_imp.g_varchar2_table(1646) := '6F7074696F6E732E7363726F6C6C582C746869732E6F7074696F6E732E792D746869732E6F7074696F6E732E7363726F6C6C592C746869732E6F7074696F6E732E77696474682C746869732E6F7074696F6E732E68656967687429292C743D6E65772058';
wwv_flow_imp.g_varchar2_table(1647) := '6E28653D422C5B5D292C723D6E6577207A6E2874292C6A6E28742C722C722C653D5B5D292C246E28742E636F6E7461696E65722C65292C5B342C746869732E72656E646572537461636B2872295D3B6361736520313A72657475726E20412E73656E7428';
wwv_flow_imp.g_varchar2_table(1648) := '292C746869732E6170706C7945666665637473285B5D2C32292C5B322C746869732E63616E7661735D7D76617220652C742C727D297D297D2C6173293B66756E6374696F6E2061732841297B746869732E5F616374697665456666656374733D5B5D2C74';
wwv_flow_imp.g_varchar2_table(1649) := '6869732E63616E7661733D412E63616E7661737C7C646F63756D656E742E637265617465456C656D656E74282263616E76617322292C746869732E6374783D746869732E63616E7661732E676574436F6E746578742822326422292C28746869732E6F70';
wwv_flow_imp.g_varchar2_table(1650) := '74696F6E733D41292E63616E7661737C7C28746869732E63616E7661732E77696474683D4D6174682E666C6F6F7228412E77696474682A412E7363616C65292C746869732E63616E7661732E6865696768743D4D6174682E666C6F6F7228412E68656967';
wwv_flow_imp.g_varchar2_table(1651) := '68742A412E7363616C65292C746869732E63616E7661732E7374796C652E77696474683D412E77696474682B227078222C746869732E63616E7661732E7374796C652E6865696768743D412E6865696768742B22707822292C746869732E666F6E744D65';
wwv_flow_imp.g_varchar2_table(1652) := '74726963733D6E657720737328646F63756D656E74292C746869732E6374782E7363616C6528746869732E6F7074696F6E732E7363616C652C746869732E6F7074696F6E732E7363616C65292C746869732E6374782E7472616E736C617465282D412E78';
wwv_flow_imp.g_varchar2_table(1653) := '2B412E7363726F6C6C582C2D412E792B412E7363726F6C6C59292C746869732E6374782E74657874426173656C696E653D22626F74746F6D222C746869732E5F616374697665456666656374733D5B5D2C4C652E676574496E7374616E636528412E6964';
wwv_flow_imp.g_varchar2_table(1654) := '292E6465627567282243616E7661732072656E646572657220696E697469616C697A65642028222B412E77696474682B2278222B412E6865696768742B2220617420222B412E782B222C222B412E792B22292077697468207363616C6520222B412E7363';
wwv_flow_imp.g_varchar2_table(1655) := '616C65297D7661722063733D66756E6374696F6E2841297B72657475726E204120696E7374616E63656F662048427C7C284120696E7374616E63656F662068427C7C4120696E7374616E63656F662043422626412E74797065213D3D77422626412E7479';
wwv_flow_imp.g_varchar2_table(1656) := '7065213D3D7542297D2C51733D66756E6374696F6E28412C65297B7377697463682841297B636173652043652E424F524445525F424F583A72657475726E20766E2865293B636173652043652E434F4E54454E545F424F583A72657475726E5B652E746F';
wwv_flow_imp.g_varchar2_table(1657) := '704C656674436F6E74656E74426F782C652E746F705269676874436F6E74656E74426F782C652E626F74746F6D5269676874436F6E74656E74426F782C652E626F74746F6D4C656674436F6E74656E74426F785D3B64656661756C743A43652E50414444';
wwv_flow_imp.g_varchar2_table(1658) := '494E475F424F583B72657475726E20796E2865297D7D2C75733D66756E6374696F6E2841297B7377697463682841297B636173652059742E43454E5445523A72657475726E2263656E746572223B636173652059742E52494748543A72657475726E2272';
wwv_flow_imp.g_varchar2_table(1659) := '69676874223B64656661756C743A59742E4C4546543B72657475726E226C656674227D7D2C77733D2855732E70726F746F747970652E72656E6465723D66756E6374696F6E2874297B72657475726E206128746869732C766F696420302C766F69642030';
wwv_flow_imp.g_varchar2_table(1660) := '2C66756E6374696F6E28297B76617220653B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E20653D5465284D6174682E6D617828746869732E6F7074696F6E73';
wwv_flow_imp.g_varchar2_table(1661) := '2E77696E646F7757696474682C746869732E6F7074696F6E732E7769647468292A746869732E6F7074696F6E732E7363616C652C4D6174682E6D617828746869732E6F7074696F6E732E77696E646F774865696768742C746869732E6F7074696F6E732E';
wwv_flow_imp.g_varchar2_table(1662) := '686569676874292A746869732E6F7074696F6E732E7363616C652C746869732E6F7074696F6E732E7363726F6C6C582A746869732E6F7074696F6E732E7363616C652C746869732E6F7074696F6E732E7363726F6C6C592A746869732E6F7074696F6E73';
wwv_flow_imp.g_varchar2_table(1663) := '2E7363616C652C74292C5B342C43732865295D3B6361736520313A72657475726E20653D412E73656E7428292C746869732E6F7074696F6E732E6261636B67726F756E64436F6C6F72262628746869732E6374782E66696C6C5374796C653D7465287468';
wwv_flow_imp.g_varchar2_table(1664) := '69732E6F7074696F6E732E6261636B67726F756E64436F6C6F72292C746869732E6374782E66696C6C5265637428302C302C746869732E6F7074696F6E732E77696474682A746869732E6F7074696F6E732E7363616C652C746869732E6F7074696F6E73';
wwv_flow_imp.g_varchar2_table(1665) := '2E6865696768742A746869732E6F7074696F6E732E7363616C6529292C746869732E6374782E64726177496D61676528652C2D746869732E6F7074696F6E732E782A746869732E6F7074696F6E732E7363616C652C2D746869732E6F7074696F6E732E79';
wwv_flow_imp.g_varchar2_table(1666) := '2A746869732E6F7074696F6E732E7363616C65292C5B322C746869732E63616E7661735D7D7D297D297D2C5573293B66756E6374696F6E2055732841297B746869732E63616E7661733D412E63616E7661737C7C646F63756D656E742E63726561746545';
wwv_flow_imp.g_varchar2_table(1667) := '6C656D656E74282263616E76617322292C746869732E6374783D746869732E63616E7661732E676574436F6E746578742822326422292C746869732E6F7074696F6E733D412C746869732E63616E7661732E77696474683D4D6174682E666C6F6F722841';
wwv_flow_imp.g_varchar2_table(1668) := '2E77696474682A412E7363616C65292C746869732E63616E7661732E6865696768743D4D6174682E666C6F6F7228412E6865696768742A412E7363616C65292C746869732E63616E7661732E7374796C652E77696474683D412E77696474682B22707822';
wwv_flow_imp.g_varchar2_table(1669) := '2C746869732E63616E7661732E7374796C652E6865696768743D412E6865696768742B227078222C746869732E6374782E7363616C6528746869732E6F7074696F6E732E7363616C652C746869732E6F7074696F6E732E7363616C65292C746869732E63';
wwv_flow_imp.g_varchar2_table(1670) := '74782E7472616E736C617465282D412E782B412E7363726F6C6C582C2D412E792B412E7363726F6C6C59292C4C652E676574496E7374616E636528412E6964292E646562756728224558504552494D454E54414C20466F726569676E4F626A6563742072';
wwv_flow_imp.g_varchar2_table(1671) := '656E646572657220696E697469616C697A65642028222B412E77696474682B2278222B412E6865696768742B2220617420222B412E782B222C222B412E792B22292077697468207363616C6520222B412E7363616C65297D66756E6374696F6E206C7328';
wwv_flow_imp.g_varchar2_table(1672) := '41297B72657475726E205165285F412E6372656174652841292E7061727365436F6D706F6E656E7456616C75652829297D7661722043733D66756E6374696F6E2872297B72657475726E206E65772050726F6D6973652866756E6374696F6E28412C6529';
wwv_flow_imp.g_varchar2_table(1673) := '7B76617220743D6E657720496D6167653B742E6F6E6C6F61643D66756E6374696F6E28297B412874297D2C742E6F6E6572726F723D652C742E7372633D22646174613A696D6167652F7376672B786D6C3B636861727365743D7574662D382C222B656E63';
wwv_flow_imp.g_varchar2_table(1674) := '6F6465555249436F6D706F6E656E7428286E657720584D4C53657269616C697A6572292E73657269616C697A65546F537472696E67287229297D297D3B22756E646566696E656422213D747970656F662077696E646F77262644652E736574436F6E7465';
wwv_flow_imp.g_varchar2_table(1675) := '78742877696E646F77293B7661722067733D312C45733D66756E6374696F6E28552C6C297B72657475726E206128766F696420302C766F696420302C766F696420302C66756E6374696F6E28297B76617220652C742C722C422C6E2C732C6F2C692C612C';
wwv_flow_imp.g_varchar2_table(1676) := '632C512C752C773B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A69662821557C7C226F626A65637422213D747970656F6620552972657475726E5B322C50726F6D6973652E';
wwv_flow_imp.g_varchar2_table(1677) := '72656A6563742822496E76616C696420656C656D656E742070726F766964656420617320666972737420617267756D656E7422295D3B6966282128653D552E6F776E6572446F63756D656E7429297468726F77206E6577204572726F722822456C656D65';
wwv_flow_imp.g_varchar2_table(1678) := '6E74206973206E6F7420617474616368656420746F206120446F63756D656E7422293B6966282128743D652E64656661756C745669657729297468726F77206E6577204572726F722822446F63756D656E74206973206E6F742061747461636865642074';
wwv_flow_imp.g_varchar2_table(1679) := '6F20612057696E646F7722293B72657475726E20723D2223222B67732B2B2C693D7A422855297C7C2248544D4C223D3D3D552E7461674E616D653F66756E6374696F6E2841297B76617220653D412E626F64792C743D412E646F63756D656E74456C656D';
wwv_flow_imp.g_varchar2_table(1680) := '656E743B69662821657C7C2174297468726F77206E6577204572726F722822556E61626C6520746F2067657420646F63756D656E742073697A6522293B413D4D6174682E6D6178284D6174682E6D617828652E7363726F6C6C57696474682C742E736372';
wwv_flow_imp.g_varchar2_table(1681) := '6F6C6C5769647468292C4D6174682E6D617828652E6F666673657457696474682C742E6F66667365745769647468292C4D6174682E6D617828652E636C69656E7457696474682C742E636C69656E74576964746829292C743D4D6174682E6D6178284D61';
wwv_flow_imp.g_varchar2_table(1682) := '74682E6D617828652E7363726F6C6C4865696768742C742E7363726F6C6C486569676874292C4D6174682E6D617828652E6F66667365744865696768742C742E6F6666736574486569676874292C4D6174682E6D617828652E636C69656E744865696768';
wwv_flow_imp.g_varchar2_table(1683) := '742C742E636C69656E7448656967687429293B72657475726E206E6577206828302C302C412C74297D2865293A672855292C6E3D692E77696474682C733D692E6865696768742C423D692E6C6566742C6F3D692E746F702C693D432843287B7D2C7B616C';
wwv_flow_imp.g_varchar2_table(1684) := '6C6F775461696E743A21312C696D61676554696D656F75743A313565332C70726F78793A766F696420302C757365434F52533A21317D292C6C292C6F3D7B6261636B67726F756E64436F6C6F723A2223666666666666222C63616368653A6C2E63616368';
wwv_flow_imp.g_varchar2_table(1685) := '657C7C44652E63726561746528722C69292C6C6F6767696E673A21302C72656D6F7665436F6E7461696E65723A21302C666F726569676E4F626A65637452656E646572696E673A21312C7363616C653A742E646576696365506978656C526174696F7C7C';
wwv_flow_imp.g_varchar2_table(1686) := '312C77696E646F7757696474683A742E696E6E657257696474682C77696E646F774865696768743A742E696E6E65724865696768742C7363726F6C6C583A742E70616765584F66667365742C7363726F6C6C593A742E70616765594F66667365742C783A';
wwv_flow_imp.g_varchar2_table(1687) := '422C793A6F2C77696474683A4D6174682E6365696C286E292C6865696768743A4D6174682E6365696C2873292C69643A727D2C6E3D4328432843287B7D2C6F292C69292C6C292C733D6E65772068286E2E7363726F6C6C582C6E2E7363726F6C6C592C6E';
wwv_flow_imp.g_varchar2_table(1688) := '2E77696E646F7757696474682C6E2E77696E646F77486569676874292C4C652E637265617465287B69643A722C656E61626C65643A6E2E6C6F6767696E677D292C4C652E676574496E7374616E63652872292E646562756728225374617274696E672064';
wwv_flow_imp.g_varchar2_table(1689) := '6F63756D656E7420636C6F6E6522292C6F3D6E657720756E28552C7B69643A722C6F6E636C6F6E653A6E2E6F6E636C6F6E652C69676E6F7265456C656D656E74733A6E2E69676E6F7265456C656D656E74732C696E6C696E65496D616765733A6E2E666F';
wwv_flow_imp.g_varchar2_table(1690) := '726569676E4F626A65637452656E646572696E672C636F70795374796C65733A6E2E666F726569676E4F626A65637452656E646572696E677D292C28693D6F2E636C6F6E65645265666572656E6365456C656D656E74293F5B342C6F2E746F494672616D';
wwv_flow_imp.g_varchar2_table(1691) := '6528652C73295D3A5B322C50726F6D6973652E72656A6563742822556E61626C6520746F2066696E6420656C656D656E7420696E20636C6F6E656420696672616D6522295D3B6361736520313A72657475726E28613D412E73656E7428292C513D652E64';
wwv_flow_imp.g_varchar2_table(1692) := '6F63756D656E74456C656D656E743F6C7328676574436F6D70757465645374796C6528652E646F63756D656E74456C656D656E74292E6261636B67726F756E64436F6C6F72293A68652E5452414E53504152454E542C633D652E626F64793F6C73286765';
wwv_flow_imp.g_varchar2_table(1693) := '74436F6D70757465645374796C6528652E626F6479292E6261636B67726F756E64436F6C6F72293A68652E5452414E53504152454E542C773D6C2E6261636B67726F756E64436F6C6F722C773D22737472696E67223D3D747970656F6620773F6C732877';
wwv_flow_imp.g_varchar2_table(1694) := '293A6E756C6C3D3D3D773F68652E5452414E53504152454E543A343239343936373239352C633D553D3D3D652E646F63756D656E74456C656D656E743F65652851293F65652863293F773A633A513A772C513D7B69643A722C63616368653A6E2E636163';
wwv_flow_imp.g_varchar2_table(1695) := '68652C63616E7661733A6E2E63616E7661732C6261636B67726F756E64436F6C6F723A632C7363616C653A6E2E7363616C652C783A6E2E782C793A6E2E792C7363726F6C6C583A6E2E7363726F6C6C582C7363726F6C6C593A6E2E7363726F6C6C592C77';
wwv_flow_imp.g_varchar2_table(1696) := '696474683A6E2E77696474682C6865696768743A6E2E6865696768742C77696E646F7757696474683A6E2E77696E646F7757696474682C77696E646F774865696768743A6E2E77696E646F774865696768747D2C6E2E666F726569676E4F626A65637452';
wwv_flow_imp.g_varchar2_table(1697) := '656E646572696E67293F284C652E676574496E7374616E63652872292E64656275672822446F63756D656E7420636C6F6E65642C207573696E6720666F726569676E206F626A6563742072656E646572696E6722292C5B342C6E65772077732851292E72';
wwv_flow_imp.g_varchar2_table(1698) := '656E6465722869295D293A5B332C335D3B6361736520323A72657475726E20753D412E73656E7428292C5B332C355D3B6361736520333A72657475726E204C652E676574496E7374616E63652872292E64656275672822446F63756D656E7420636C6F6E';
wwv_flow_imp.g_varchar2_table(1699) := '65642C207573696E6720636F6D70757465642072656E646572696E6722292C44652E617474616368496E7374616E6365286E2E6361636865292C4C652E676574496E7374616E63652872292E646562756728225374617274696E6720444F4D2070617273';
wwv_flow_imp.g_varchar2_table(1700) := '696E6722292C773D4F422869292C44652E646574616368496E7374616E636528292C633D3D3D772E7374796C65732E6261636B67726F756E64436F6C6F72262628772E7374796C65732E6261636B67726F756E64436F6C6F723D68652E5452414E535041';
wwv_flow_imp.g_varchar2_table(1701) := '52454E54292C4C652E676574496E7374616E63652872292E646562756728225374617274696E672072656E646572657222292C5B342C6E65772069732851292E72656E6465722877295D3B6361736520343A753D412E73656E7428292C412E6C6162656C';
wwv_flow_imp.g_varchar2_table(1702) := '3D353B6361736520353A72657475726E21303D3D3D6E2E72656D6F7665436F6E7461696E6572262628756E2E64657374726F792861297C7C4C652E676574496E7374616E63652872292E6572726F72282243616E6E6F742064657461636820636C6F6E65';
wwv_flow_imp.g_varchar2_table(1703) := '6420696672616D65206173206974206973206E6F7420696E2074686520444F4D20616E796D6F72652229292C4C652E676574496E7374616E63652872292E6465627567282246696E69736865642072656E646572696E6722292C4C652E64657374726F79';
wwv_flow_imp.g_varchar2_table(1704) := '2872292C44652E64657374726F792872292C5B322C755D7D7D297D297D3B72657475726E2066756E6374696F6E28412C65297B72657475726E20457328412C653D766F696420303D3D3D653F7B7D3A65297D7D293B';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(117830353875418500)
,p_plugin_id=>wwv_flow_imp.id(117779138290418355)
,p_file_name=>'js/html2canvas.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.component_end;
end;
/
