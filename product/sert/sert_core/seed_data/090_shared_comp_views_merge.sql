--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:shared_comp_views_merge_1722422290630 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
declare
  l_json clob;
begin

  -- Load data in JSON object
  l_json := q'!
[
{
"SHARED_COMP_VIEW":"APEX_APPLICATION_ITEMS"
,"SHARED_COMP_TYPE":"Application Items"
}
,{
"SHARED_COMP_VIEW":"APEX_APPLICATION_PROCESSES"
,"SHARED_COMP_TYPE":"Application Processes"
}
,{
"SHARED_COMP_VIEW":"APEX_APPLICATION_LISTS"
,"SHARED_COMP_TYPE":"Lists"
}
,{
"SHARED_COMP_VIEW":"APEX_APPLICATION_COMPUTATIONS"
,"SHARED_COMP_TYPE":"Application Computations"
}
,{
"SHARED_COMP_VIEW":"APEX_APPLICATION_LOVS"
,"SHARED_COMP_TYPE":"Lists of Values"
}
,{
"SHARED_COMP_VIEW":"APEX_APPLICATION_AUTHORIZATION"
,"SHARED_COMP_TYPE":"Authorization Schemes"
}
,{
"SHARED_COMP_VIEW":"APEX_APPLICATION_BREADCRUMBS"
,"SHARED_COMP_TYPE":"Breadcrumbs"
}
,{
"SHARED_COMP_VIEW":"APEX_APPLICATION_LIST_ENTRIES"
,"SHARED_COMP_TYPE":"List Entries"
}
,{
"SHARED_COMP_VIEW":"APEX_APPL_TASKDEFS"
,"SHARED_COMP_TYPE":"Task Definitions"
}
]

!';

for data in (
  select *
  from json_table(l_json, '$[*]' columns
        SHARED_COMP_VIEW varchar2(250)  path '$.SHARED_COMP_VIEW'
      , SHARED_COMP_TYPE varchar2(250)  path '$.SHARED_COMP_TYPE'

   )
) LOOP
   merge into sert_core.shared_comp_views dest
      using (
         select
           data.shared_comp_view shared_comp_view
         from dual
      ) src
      on (1 = 1
          and dest.shared_comp_view = src.shared_comp_view
       )
   when matched then
      update
         set
          dest.shared_comp_type = data.shared_comp_type

   when not matched then
      insert (
          shared_comp_type
        , shared_comp_view

   )
   values (
          data.shared_comp_type
        , data.shared_comp_view
 );
end loop;

end;
/
--rollback not required
