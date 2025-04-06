--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:builder_urls_merge_1722422172201 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
declare
  l_json clob;
begin

  -- Load data in JSON object
  l_json := q'!
[
{
"COMPONENT_NAME":"Application"
,"BUILDER_URL_KEY":"APPLICATION"
,"DATA_TYPE_ID":1000
}
,{
"COMPONENT_NAME":"Application Definition"
,"BUILDER_URL_KEY":"APPLICATION_DEFINITION"
,"DATA_LINK":"edit-application-definition?clear=4001"
}
,{
"COMPONENT_NAME":"Application Security Attributes"
,"BUILDER_URL_KEY":"APPLICATION_SECURITY_ATTRIBUTES"
,"DATA_LINK":"edit-security-attributes?clear=509"
}
,{
"COMPONENT_NAME":"Application User Interface"
,"BUILDER_URL_KEY":"APPLICATION_USER_INTERFACE"
,"DATA_LINK":"edit-user-interface?clear=197"
}
,{
"COMPONENT_NAME":"Application Item"
,"BUILDER_URL_KEY":"APP_ITEM"
,"DATA_TYPE_ID":3010
,"DATA_LINK":"create-edit-application-item?f4000_p4303_id=#COMPONENT_ID#"
}
,{
"COMPONENT_NAME":"Application Computation"
,"BUILDER_URL_KEY":"APP_COMPUTATION"
,"DATA_TYPE_ID":3020
,"DATA_LINK":"create-edit-computations?f4000_p4304_id=#COMPONENT_ID#"
}
,{
"COMPONENT_NAME":"Application Process"
,"BUILDER_URL_KEY":"APP_PROCESS"
,"DATA_TYPE_ID":3030
,"DATA_LINK":"edit-application-process?f4000_p4309_id=#COMPONENT_ID#"
}
,{
"COMPONENT_NAME":"Authentication Scheme"
,"BUILDER_URL_KEY":"AUTHENTICATION"
,"DATA_TYPE_ID":3050
,"DATA_LINK":"edit-authentication-scheme?p4495_id=#COMPONENT_ID#\u0026clear=4495"
}
,{
"COMPONENT_NAME":"Authorization Scheme"
,"BUILDER_URL_KEY":"AUTHORIZATION"
,"DATA_TYPE_ID":3060
,"DATA_LINK":"edit-authorization-scheme?f4000_p4008_id=#COMPONENT_ID#\u0026clear=4008"
}
,{
"COMPONENT_NAME":"Page"
,"BUILDER_URL_KEY":"PAGE"
,"DATA_TYPE_ID":5000
}
,{
"COMPONENT_NAME":"Branch"
,"BUILDER_URL_KEY":"BRANCH"
,"DATA_TYPE_ID":5540
}
,{
"COMPONENT_NAME":"Breadcrumb"
,"BUILDER_URL_KEY":"BREADCRUMB"
,"DATA_TYPE_ID":3510
,"DATA_LINK":"edit-breadcrumb?p104_menu_id=#COMPONENT_ID#\u0026clear=104"
}
,{
"COMPONENT_NAME":"Breadcrumb Template"
,"BUILDER_URL_KEY":"BREADCRUMB_TEMPLATE"
,"DATA_TYPE_ID":2560
}
,{
"COMPONENT_NAME":"Build Option"
,"BUILDER_URL_KEY":"BUILD_OPTION"
,"DATA_TYPE_ID":3040
}
,{
"COMPONENT_NAME":"Button"
,"BUILDER_URL_KEY":"BUTTON"
,"DATA_TYPE_ID":5130
}
,{
"COMPONENT_NAME":"Button Template"
,"BUILDER_URL_KEY":"BUTTON_TEMPLATE"
,"DATA_TYPE_ID":2530
}
,{
"COMPONENT_NAME":"Calendar Template"
,"BUILDER_URL_KEY":"CALENDAR_TEMPLATE"
,"DATA_TYPE_ID":2570
}
,{
"COMPONENT_NAME":"Card Report"
,"BUILDER_URL_KEY":"CARD"
,"DATA_TYPE_ID":8110
}
,{
"COMPONENT_NAME":"Region"
,"BUILDER_URL_KEY":"REGION"
,"DATA_TYPE_ID":5110
}
,{
"COMPONENT_NAME":"Card Action"
,"BUILDER_URL_KEY":"CARD_ACTION"
,"DATA_TYPE_ID":8120
}
,{
"COMPONENT_NAME":"Theme"
,"BUILDER_URL_KEY":"THEME"
,"DATA_TYPE_ID":2000
}
,{
"COMPONENT_NAME":"Page Template"
,"BUILDER_URL_KEY":"PAGE_TEMPLATE"
,"DATA_TYPE_ID":2510
}
,{
"COMPONENT_NAME":"Classic Calendar"
,"BUILDER_URL_KEY":"CLASSIC_CALENDAR"
,"DATA_TYPE_ID":7610
}
,{
"COMPONENT_NAME":"Classic Report"
,"BUILDER_URL_KEY":"CLASSIC_REPORT"
,"DATA_TYPE_ID":7310
}
,{
"COMPONENT_NAME":"Classic Report Column"
,"BUILDER_URL_KEY":"CLASSIC_RPT_COLUMN"
,"DATA_TYPE_ID":7320
}
,{
"COMPONENT_NAME":"JET Chart"
,"BUILDER_URL_KEY":"JET_CHART"
,"DATA_TYPE_ID":7810
}
,{
"COMPONENT_NAME":"JET Chart Series"
,"BUILDER_URL_KEY":"JET_CHART_SERIES"
,"DATA_TYPE_ID":7820
}
,{
"COMPONENT_NAME":"JET Chart Axes"
,"BUILDER_URL_KEY":"JET_CHART_AXES"
,"DATA_TYPE_ID":7830
}
,{
"COMPONENT_NAME":"JET Chart WS Parameter"
,"BUILDER_URL_KEY":"JET_CHART_WS_PARAM"
,"DATA_TYPE_ID":7840
}
,{
"COMPONENT_NAME":"List"
,"BUILDER_URL_KEY":"LIST"
,"DATA_TYPE_ID":3520
,"DATA_LINK":"list-details?f4000_p4050_list_id=#COMPONENT_ID#\u0026clear=RP,4050"
}
,{
"COMPONENT_NAME":"List Template"
,"BUILDER_URL_KEY":"LIST_TEMPLATE"
,"DATA_TYPE_ID":2550
}
,{
"COMPONENT_NAME":"LOV"
,"BUILDER_URL_KEY":"LOV"
,"DATA_TYPE_ID":3530
,"DATA_LINK":"named-lists-of-values?f4000_p4111_id=#COMPONENT_ID#\u0026clear=4111"
}
,{
"COMPONENT_NAME":"Region Template"
,"BUILDER_URL_KEY":"REGION_TEMPLATE"
,"DATA_TYPE_ID":2540
}
,{
"COMPONENT_NAME":"Report Template"
,"BUILDER_URL_KEY":"REPORT_TEMPLATE"
,"DATA_TYPE_ID":2580
}
,{
"COMPONENT_NAME":"Page Item"
,"BUILDER_URL_KEY":"PAGE_ITEM"
,"DATA_TYPE_ID":5120
}
,{
"COMPONENT_NAME":"Validation"
,"BUILDER_URL_KEY":"VALIDATION"
,"DATA_TYPE_ID":5510
}
,{
"COMPONENT_NAME":"Page Computation"
,"BUILDER_URL_KEY":"PAGE_COMPUTATION"
,"DATA_TYPE_ID":5520
}
,{
"COMPONENT_NAME":"Page Process"
,"BUILDER_URL_KEY":"PAGE_PROCESS"
,"DATA_TYPE_ID":5530
}
,{
"COMPONENT_NAME":"Task Definition"
,"BUILDER_URL_KEY":"TASK_DEFINITION"
,"DATA_TYPE_ID":3700
,"DATA_LINK":"edit-task-definition?p9502_id=#COMPONENT_ID#\u0026clear=RP,9502"
}
,{
"COMPONENT_NAME":"Workflow Version"
,"BUILDER_URL_KEY":"WORKFLOW_VERSION"
,"DATA_TYPE_ID":8820
}
,{
"COMPONENT_NAME":"Workflow Activity"
,"BUILDER_URL_KEY":"WORKFLOW_ACTIVITY"
,"DATA_TYPE_ID":8830
}
,{
"COMPONENT_NAME":"Workflow Variable"
,"BUILDER_URL_KEY":"WORKFLOW_VARIABLE"
,"DATA_TYPE_ID":8840
}
,{
"COMPONENT_NAME":"Workflow Participant"
,"BUILDER_URL_KEY":"WORKFLOW_PARTICIPANT"
,"DATA_TYPE_ID":8860
}
,{
"COMPONENT_NAME":"Workflow Activity Variable"
,"BUILDER_URL_KEY":"WORKFLOW_ACTIVITY_VARIABLE"
,"DATA_TYPE_ID":8850
}
]

!';

for data in (
  select *
  from json_table(l_json, '$[*]' columns
        COMPONENT_NAME varchar2(250)  path '$.COMPONENT_NAME'
      , BUILDER_URL_KEY varchar2(250)  path '$.BUILDER_URL_KEY'
      , DATA_TYPE_ID number  path '$.DATA_TYPE_ID'
      , DATA_LINK varchar2(1000)  path '$.DATA_LINK'

   )
) LOOP
   merge into sert_core.builder_urls dest
      using (
         select
           data.builder_url_key builder_url_key
         from dual
      ) src
      on (1 = 1
          and dest.builder_url_key = src.builder_url_key
       )
   when matched then
      update
         set
          dest.component_name = data.component_name
        , dest.data_type_id = data.data_type_id
        , dest.data_link = data.data_link

   when not matched then
      insert (
          component_name
        , data_type_id
        , data_link
        , builder_url_key

   )
   values (
          data.component_name
        , data.data_type_id
        , data.data_link
        , data.builder_url_key
 );
end loop;

end;
/

--rollback not required
