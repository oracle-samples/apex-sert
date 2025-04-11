-- file_checksum: 88E5C58DBBDEB7D2B2136A91072CA35F0091660C2BB3DFFD2ABC202D0D0E7DEA
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_02011
begin
--   Manifest
--     PAGE: 02011
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2101
,p_default_id_offset=>43724842417270742
,p_default_owner=>'SERT_CORE'
);
wwv_flow_imp_page.create_page(
 p_id=>2011
,p_name=>'Custom Queries'
,p_alias=>'CUSTOM-QUERIES'
,p_page_mode=>'MODAL'
,p_step_title=>'Custom Queries'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(394386952125759954)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--lg'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(353804180451740379)
,p_plug_name=>'Custom Queries'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(394422849849760056)
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style type="text/css">',
'th { text-align : right; vertical-align: top; background: #eee; padding: 5px; }',
'td { font-size: 14px; padding: 5px; }',
'table { width: 100%; border: 1px solid #000; border-collapse: collapse; }',
'</style>',
'',
'<p>If you can''t easily extract what you need from the APEX views, you can write your own custom query.  Using this method, you can join serveral views together and/or incorporate more complex logic to determine if your rule has passed or failed.</p>',
'<h3>Query Format</h3>',
'<p>When writing a custom query, it is important that your query contain the following columns in the order specificed below:</p>',
'<pre>',
'select',
'   #EVAL_ID# as eval_id',
'  ,#RULE_ID# as rule_id ',
'  ,null as application_id',
'  ,null as page_id ',
'  ,null as component_id ',
'  ,null as component_name',
'  ,null as column_name ',
'  ,null as item_name',
'  ,null as shared_comp_name',
'  ,null as current_value',
'  ,null as valid_values',
'  ,null as result',
'from',
'   [table or view]',
'</pre>',
'',
'<p>The query should also always return a single row per item that you are evaluating.</p>',
'',
'<h3>Columns</h3>',
'',
'<p>The following table details what each column consists of.  You can also refer to some of APEX-SERT''s rules that use a Custom Query for other examples.</p>',
'',
'<table>',
'    <tr><th>eval_id<th><td>This should always be set to #EVAL_ID#, as it will be replaced at runtime by APEX-SERT</td></tr>',
'    <tr><th>rule_id<th><td>This should always be set to #RULE_ID#, as it will be replaced at runtime by APEX-SERT</td></tr>',
'    <tr><th>application_id<th><td>Include the Application ID of what is being validated so that APEX-SERT can return the correct results.</td></tr>',
'    <tr><th>page_id<th><td>(optional) Include the Page ID where the component being evaluated is located.  Leave NULL for Shared Components.</td></tr>',
'    <tr><th>component_id<th><td>(optional)component_id should refer to the primary key of the item being evaluated</td></tr>',
'    <tr><th>column_name<th><td>(optional)Include this if you want to evaluate a column-level attribute</td></tr>',
'    <tr><th>item_name<th><td>(optional)Include this if you want to evaluate an item-level attribute</td></tr>',
'    <tr><th>shared_comp_name<th><td>(optional)Include this if you want to evaluate a shared component-level attribute</td></tr>',
'    <tr><th>current_value<th><td>This is the current value of the attribute you are evaluating</td></tr>',
'    <tr><th>valid_values<th><td>This is a list of valid values that would cause the evaluation to pass</td></tr>',
'    <tr><th>result<th><td>This should be set to either <pre>{ "result":"PASS" } or { "reasons":[ ] ,"result":"FAIL" }</pre>',
'      "reasons" is an optional array that can contain any number of reasons for a rule failing.</td></tr>',
'    <tr><th>result_details<th><td>Use this to augment why an evasluation failed</td></tr>',
'</table>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp.component_end;
end;
/
