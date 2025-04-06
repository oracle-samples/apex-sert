--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:categories_merge_1722422210444 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
declare
  l_json clob;
begin

  -- Load data in JSON object
  l_json := q'!
[
{
"CATEGORY_NAME":"Access Control"
,"CATEGORY_KEY":"ACCESS_CONTROL"
}
,{
"CATEGORY_NAME":"Cross-Site Scripting"
,"CATEGORY_KEY":"CROSS_SITE_SCRIPTING"
}
,{
"CATEGORY_NAME":"Misconfiguration"
,"CATEGORY_KEY":"MISCONFIGURATION"
}
,{
"CATEGORY_NAME":"SQL Injection"
,"CATEGORY_KEY":"SQL_INJECTION"
}
]

!';

for data in (
  select *
  from json_table(l_json, '$[*]' columns
        CATEGORY_NAME varchar2(250)  path '$.CATEGORY_NAME'
      , CATEGORY_KEY varchar2(250)  path '$.CATEGORY_KEY'

   )
) LOOP
   merge into sert_core.categories dest
      using (
         select
           data.category_key category_key
         from dual
      ) src
      on (1 = 1
          and dest.category_key = src.category_key
       )
   when matched then
      update
         set
          dest.category_name = data.category_name

   when not matched then
      insert (
          category_name
        , category_key

   )
   values (
          data.category_name
        , data.category_key
 );
end loop;

end;
/
--rollback not required
