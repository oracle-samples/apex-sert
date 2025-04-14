--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:rule_severity_merge_1722422296689 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
declare
  l_json clob;
begin

  -- Load data in JSON object
  l_json := q'!
[
{
"RULE_SEVERITY_NAME":"Low"
,"RULE_SEVERITY_KEY":"LOW"
,"SEQ":1
}
,{
"RULE_SEVERITY_NAME":"Medium"
,"RULE_SEVERITY_KEY":"MEDIUM"
,"SEQ":2
}
,{
"RULE_SEVERITY_NAME":"High"
,"RULE_SEVERITY_KEY":"HIGH"
,"SEQ":3
}
]

!';

for data in (
  select *
  from json_table(l_json, '$[*]' columns
        RULE_SEVERITY_NAME varchar2(250)  path '$.RULE_SEVERITY_NAME'
      , RULE_SEVERITY_KEY varchar2(250)  path '$.RULE_SEVERITY_KEY'
      , SEQ number  path '$.SEQ'

   )
) LOOP
   merge into sert_core.rule_severity dest
      using (
         select
           data.rule_severity_key rule_severity_key
         from dual
      ) src
      on (1 = 1
          and dest.rule_severity_key = src.rule_severity_key
       )
   when matched then
      update
         set
          dest.rule_severity_name = data.rule_severity_name
        , dest.seq = data.seq

   when not matched then
      insert (
          rule_severity_name
        , seq
        , rule_severity_key

   )
   values (
          data.rule_severity_name
        , data.seq
        , data.rule_severity_key
 );
end loop;

end;
/
--rollback not required
