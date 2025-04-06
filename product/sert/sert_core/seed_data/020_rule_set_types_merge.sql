--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:rule_set_types_merge_1722422301445 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
declare
  l_json clob;
begin

  -- Load data in JSON object
  l_json := q'!
[
{
"RULE_SET_TYPE_NAME":"Security"
,"RULE_SET_TYPE_KEY":"SECURITY"
}
,{
"RULE_SET_TYPE_NAME":"Quality"
,"RULE_SET_TYPE_KEY":"QA"
}
]

!';

for data in (
  select *
  from json_table(l_json, '$[*]' columns
        RULE_SET_TYPE_NAME varchar2(250)  path '$.RULE_SET_TYPE_NAME'
      , RULE_SET_TYPE_KEY varchar2(250)  path '$.RULE_SET_TYPE_KEY'

   )
) LOOP
   merge into sert_core.rule_set_types dest
      using (
         select
           data.rule_set_type_key rule_set_type_key
         from dual
      ) src
      on (1 = 1
          and dest.rule_set_type_key = src.rule_set_type_key
       )
   when matched then
      update
         set
          dest.rule_set_type_name = data.rule_set_type_name

   when not matched then
      insert (
          rule_set_type_name
        , rule_set_type_key

   )
   values (
          data.rule_set_type_name
        , data.rule_set_type_key
 );
end loop;

end;
/
--rollback not required
