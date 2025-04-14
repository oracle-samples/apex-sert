--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:seed_1721980451764 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;

-- delete tables
delete from sert_core.rule_severity;
delete from sert_core.rule_sets;
delete from sert_core.rule_set_types;
delete from sert_core.categories;
delete from sert_core.risks;
delete from sert_core.prefs;
delete from sert_core.reserved_strings;
delete from sert_core.rule_criteria;
delete from sert_core.rule_criteria_types;
delete from sert_core.shared_comp_views;

commit;
-- insert severities
insert into sert_core.rule_severity (rule_severity_name, rule_severity_key, seq) values ('Low', 'LOW', 1);
insert into sert_core.rule_severity (rule_severity_name, rule_severity_key, seq) values ('Medium', 'MEDIUM', 2);
insert into sert_core.rule_severity (rule_severity_name, rule_severity_key, seq) values ('High', 'HIGH', 3);

-- insert rule set types
insert into sert_core.rule_set_types (rule_set_type_name, rule_set_type_key) values ('Security', 'SECURITY');
insert into sert_core.rule_set_types (rule_set_type_name, rule_set_type_key) values ('Quality', 'QA');

-- insert risks
insert into sert_core.risks(risk_code, risk_name, url) values ('A01-2021', 'Broken Access Control', 'https://owasp.org/Top10/A01_2021-Broken_Access_Control/');
insert into sert_core.risks(risk_code, risk_name, url) values ('A02-2021', 'Cryptographic Failures', 'https://owasp.org/Top10/A02_2021-Cryptographic_Failures/');
insert into sert_core.risks(risk_code, risk_name, url) values ('A03-2021', 'Injection', 'https://owasp.org/Top10/A03_2021-Injection/');
insert into sert_core.risks(risk_code, risk_name, url) values ('A04-2021', 'Insecure Design', 'https://owasp.org/Top10/A04_2021-Insecure_Design/');
insert into sert_core.risks(risk_code, risk_name, url) values ('A05-2021', 'Security Misconfiguration', 'https://owasp.org/Top10/A05_2021-Security_Misconfiguration/');
insert into sert_core.risks(risk_code, risk_name, url) values ('A06-2021', 'Vulnerable and Outdated Components', 'https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/');
insert into sert_core.risks(risk_code, risk_name, url) values ('A07-2021', 'Identification and Authentication Failures', 'https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/');
insert into sert_core.risks(risk_code, risk_name, url) values ('A08-2021', 'Software and Data Integrity Failures', 'https://owasp.org/Top10/A08_2021-Software_and_Data_Integrity_Failures/');
insert into sert_core.risks(risk_code, risk_name, url) values ('A09-2021', 'Security Logging and Monitoring Failures', 'https://owasp.org/Top10/A09_2021-Security_Logging_and_Monitoring_Failures/');
insert into sert_core.risks(risk_code, risk_name, url) values ('A10-2021', 'Server-Side Request Forgery', 'https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29/');

-- insert categories
insert into sert_core.categories (category_name, category_key) values ('Access Control',	     'ACCESS_CONTROL');
insert into sert_core.categories (category_name, category_key) values ('Cross-Site Scripting', 'CROSS_SITE_SCRIPTING');
insert into sert_core.categories (category_name, category_key) values ('Misconfiguration',     'MISCONFIGURATION');
insert into sert_core.categories (category_name, category_key) values ('SQL Injection',        'SQL_INJECTION');

-- insert preferences
insert into sert_core.prefs(pref_name, pref_key, pref_value) values ('Log Evaluations',  'LOG_EVALUATIONS',  'Y');
insert into sert_core.prefs(pref_name, pref_key, pref_value) values ('Log Imports',      'LOG_IMPORTS',      'Y');
insert into sert_core.prefs(pref_name, pref_key, pref_value) values ('Low Score Value',  'LOW_SCORE_VALUE',  '70');
insert into sert_core.prefs(pref_name, pref_key, pref_value) values ('High Score Value', 'HIGH_SCORE_VALUE', '95');
insert into sert_core.prefs(pref_name, pref_key, pref_value, internal_yn) values ('SERT APEX Version', 'SERT_APEX_VERSION', (select apex_version from sert_core.apex_version_v), 'Y');

-- insert reserved_strings
insert into sert_core.reserved_strings (reserved_string, reserved_string_key, reserved_string_type) values ('&APP_ID.', 'APP_ID', 'SUBSTITUTION_STRING');
insert into sert_core.reserved_strings (reserved_string, reserved_string_key, reserved_string_type) values ('&FLOW_ID.', 'FLOW_ID', 'SUBSTITUTION_STRING');
insert into sert_core.reserved_strings (reserved_string, reserved_string_key, reserved_string_type) values ('&FLOW_PAGE_ID.', 'FLOW_PAGE_ID', 'SUBSTITUTION_STRING');
insert into sert_core.reserved_strings (reserved_string, reserved_string_key, reserved_string_type) values ('&APP_ALIAS.', 'APP_ALIAS', 'SUBSTITUTION_STRING');
insert into sert_core.reserved_strings (reserved_string, reserved_string_key, reserved_string_type) values ('&APP_PAGE_ID.', 'APP_PAGE_ID', 'SUBSTITUTION_STRING');
insert into sert_core.reserved_strings (reserved_string, reserved_string_key, reserved_string_type) values ('&APP_USER.', 'APP_USER', 'SUBSTITUTION_STRING');
insert into sert_core.reserved_strings (reserved_string, reserved_string_key, reserved_string_type) values ('&SESSION.', 'SESSION', 'SUBSTITUTION_STRING');
insert into sert_core.reserved_strings (reserved_string, reserved_string_key, reserved_string_type) values ('&APP_SESSION.', 'APP_SESSION', 'SUBSTITUTION_STRING');
insert into sert_core.reserved_strings (reserved_string, reserved_string_key, reserved_string_type) values ('&DEBUG.', 'DEBUG', 'SUBSTITUTION_STRING');
insert into sert_core.reserved_strings (reserved_string, reserved_string_key, reserved_string_type) values ('&APP_SECURITY_GROUP_ID.', 'APP_SECURITY_GROUP_ID', 'SUBSTITUTION_STRING');

-- insert rule_criteria_types
insert into sert_core.rule_criteria_types (rule_criteria_type_name, rule_criteria_type_key) values ('SQL Injection', 'SQLI');
insert into sert_core.rule_criteria_types (rule_criteria_type_name, rule_criteria_type_key) values ('Cross-Site Scripting - Item Syntax', 'XSS_ITEM_SYNTAX');
insert into sert_core.rule_criteria_types (rule_criteria_type_name, rule_criteria_type_key) values ('Cross-Site Scripting - Unescaped htp.p', 'XSS_UNESCAPED_HTP');

-- insert rule_criteria
insert into sert_core.rule_criteria
  ( rule_criteria_name ,rule_criteria_key ,rule_criteria_type_id ,rule_criteria_sql ,reason )
values
  (
   'Incorrect Item Substitution Syntax'
  ,'INCORRECT_ITEM_SUBSTITUTION_SYNTAX_SQLI'
  ,(select rule_criteria_type_id from sert_core.rule_criteria_types where rule_criteria_type_key = 'SQLI')
  ,'select count(*) from dual where REGEXP_LIKE((:l_source), ''&[[:alnum:]]+.'', ''ix'')'
  ,'Incorrect item substitution syntax'
  );

insert into sert_core.rule_criteria
  (
   rule_criteria_name
  ,rule_criteria_key
  ,rule_criteria_type_id
  ,rule_criteria_sql
  ,reason
  )
values
  (
   'Usage of EXECUTE IMMEDIATE'
  ,'USAGE_OF_EXECUTE_IMMEDIATE'
  ,(select rule_criteria_type_id from sert_core.rule_criteria_types where rule_criteria_type_key = 'SQLI')
  ,'select count(*) from dual where REGEXP_LIKE((:l_source), ''EXECUTE+[ ]+IMMEDIATE'', ''i'')'
  ,'EXECUTE IMMEDIATE found; please investigate'
  );

insert into sert_core.rule_criteria
  (
   rule_criteria_name
  ,rule_criteria_key
  ,rule_criteria_type_id
  ,rule_criteria_sql
  ,reason
  )
values
  (
   'Usage of DBMS_SQL'
  ,'USAGE_OF_DBMS_SQL'
  ,(select rule_criteria_type_id from sert_core.rule_criteria_types where rule_criteria_type_key = 'SQLI')
  ,'select count(*) from dual where REGEXP_LIKE((:l_source), ''dbms_sql'', ''i'')'
  ,'DBMS_SQL found; please investigate'
  );

insert into sert_core.rule_criteria
  (
   rule_criteria_name
  ,rule_criteria_key
  ,rule_criteria_type_id
  ,rule_criteria_sql
  ,reason
  )
values
  (
   'Usage of HTP without SYS prefix'
  ,'USAGE_OF_HTP_WITHOUT_SYS_PREFIX'
  ,(select rule_criteria_type_id from sert_core.rule_criteria_types where rule_criteria_type_key = 'SQLI')
  ,'with string as (select :l_source as s from dual) select regexp_count(string.s,''htp\.'',1,''i'') - regexp_count(string.s,''(^[^(a-z_0-9)]?|[^(a-z_0-9)])sys\.htp\.'',1,''i'') DIFF from string'
  ,'Be sure to include the SYS prefix when making calls to HTP');

insert into sert_core.rule_criteria
  (
   rule_criteria_name
  ,rule_criteria_key
  ,rule_criteria_type_id
  ,rule_criteria_sql
  ,reason
  )
values
  (
   'Incorrect Item Substitution Syntax'
  ,'INCORRECT_ITEM_SUBSTITUTION_SYNTAX_XSS'
  ,(select rule_criteria_type_id from sert_core.rule_criteria_types where rule_criteria_type_key = 'XSS_ITEM_SYNTAX')
  ,'select count(*) from dual where REGEXP_LIKE((:l_source), ''&[[:alnum:]]+.'', ''ix'')'
  ,'Incorrect item substitution syntax'
  );


-- insert shared_comp_views
insert into sert_core.shared_comp_views (shared_comp_view, shared_comp_type) values ('APEX_APPLICATION_ITEMS',         'Application Items');
insert into sert_core.shared_comp_views (shared_comp_view, shared_comp_type) values ('APEX_APPLICATION_PROCESSES',     'Application Processes');
insert into sert_core.shared_comp_views (shared_comp_view, shared_comp_type) values ('APEX_APPLICATION_LISTS',         'Lists');
insert into sert_core.shared_comp_views (shared_comp_view, shared_comp_type) values ('APEX_APPLICATION_COMPUTATIONS',  'Application Computations');
insert into sert_core.shared_comp_views (shared_comp_view, shared_comp_type) values ('APEX_APPLICATION_LOVS',          'Lists of Values');
insert into sert_core.shared_comp_views (shared_comp_view, shared_comp_type) values ('APEX_APPLICATION_AUTHORIZATION', 'Authorization Schemes');
insert into sert_core.shared_comp_views (shared_comp_view, shared_comp_type) values ('APEX_APPLICATION_BREADCRUMBS',   'Breadcrumbs');
insert into sert_core.shared_comp_views (shared_comp_view, shared_comp_type) values ('APEX_APPLICATION_LIST_ENTRIES',  'List Entries');
insert into sert_core.shared_comp_views (shared_comp_view, shared_comp_type) values ('APEX_APPL_TASKDEFS',             'Task Definitions');

-- insert component keys
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Application',                     'APPLICATION',                     1000, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Application Definition',          'APPLICATION_DEFINITION',          null, 'edit-application-definition?clear=4001');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Application Security Attributes', 'APPLICATION_SECURITY_ATTRIBUTES', null, 'edit-security-attributes?clear=509');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Application User Interface',      'APPLICATION_USER_INTERFACE',      null, 'edit-user-interface?clear=197');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Application Item',                'APP_ITEM',                        3010, 'create-edit-application-item?f4000_p4303_id=#COMPONENT_ID#');  --&fb_flow_id=#APP_ID#&session=#APP_SESSION#');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Application Computation',         'APP_COMPUTATION',                 3020, 'create-edit-computations?f4000_p4304_id=#COMPONENT_ID#');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Application Process',             'APP_PROCESS',                     3030, 'edit-application-process?f4000_p4309_id=#COMPONENT_ID#');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Authentication Scheme',           'AUTHENTICATION',                  3050, 'edit-authentication-scheme?p4495_id=#COMPONENT_ID#&clear=4495');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Authorization Scheme',            'AUTHORIZATION',                   3060, 'edit-authorization-scheme?f4000_p4008_id=#COMPONENT_ID#&clear=4008');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Page',                            'PAGE',                            5000, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Branch',                          'BRANCH',                          5540, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Breadcrumb',                      'BREADCRUMB',                      3510, 'edit-breadcrumb?p104_menu_id=#COMPONENT_ID#&clear=104');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Breadcrumb Template',             'BREADCRUMB_TEMPLATE',             2560, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Build Option',                    'BUILD_OPTION',                    3040, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Button',                          'BUTTON',                          5130, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Button Template',                 'BUTTON_TEMPLATE',                 2530, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Calendar Template',               'CALENDAR_TEMPLATE',               2570, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Card Report',                     'CARD',                            8110, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Region',                          'REGION',                          5110, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Card Action',                     'CARD_ACTION',                     8120, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Theme',                           'THEME',                           2000, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Page Template',                   'PAGE_TEMPLATE',                   2510, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Classic Calendar',                'CLASSIC_CALENDAR',                7610, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Classic Report',                  'CLASSIC_REPORT',                  7310, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Classic Report Column',           'CLASSIC_RPT_COLUMN',              7320, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('JET Chart',                       'JET_CHART',                       7810, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('JET Chart Series',                'JET_CHART_SERIES',                7820, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('JET Chart Axes',                  'JET_CHART_AXES',                  7830, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('JET Chart WS Parameter',          'JET_CHART_WS_PARAM',              7840, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('List',                            'LIST',                            3520, 'list-details?f4000_p4050_list_id=#COMPONENT_ID#&clear=RP,4050');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('List Template',                   'LIST_TEMPLATE',                   2550, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('LOV',                             'LOV',                             3530, 'named-lists-of-values?f4000_p4111_id=#COMPONENT_ID#&clear=4111');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Region Template',                 'REGION_TEMPLATE',                 2540, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Report Template',                 'REPORT_TEMPLATE',                 2580, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Page Item',                       'PAGE_ITEM',                       5120, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Validation',                      'VALIDATION',                      5510, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Page Computation',                'PAGE_COMPUTATION',                5520, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Page Process',                    'PAGE_PROCESS',                    5530, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Task Definition',                 'TASK_DEFINITION',                 3700, 'edit-task-definition?p9502_id=#COMPONENT_ID#&clear=RP,9502');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Workflow Version',                'WORKFLOW_VERSION',                8820, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Workflow Activity',               'WORKFLOW_ACTIVITY',               8830, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Workflow Variable',               'WORKFLOW_VARIABLE',               8840, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Workflow Participant',            'WORKFLOW_PARTICIPANT',            8860, '');
insert into sert_core.builder_urls(component_name, builder_url_key, data_type_id, data_link) values ('Workflow Activity Variable',      'WORKFLOW_ACTIVITY_VARIABLE',      8850, '');

--rollback not required
