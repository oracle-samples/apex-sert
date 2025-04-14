--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:reserved_strings_merge_1722422322180 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
declare
  l_json clob;
begin

  -- Load data in JSON object
  l_json := q'!
[
{
"RESERVED_STRING":"\u0026APP_ID."
,"RESERVED_STRING_KEY":"APP_ID"
,"RESERVED_STRING_TYPE":"SUBSTITUTION_STRING"
}
,{
"RESERVED_STRING":"\u0026FLOW_ID."
,"RESERVED_STRING_KEY":"FLOW_ID"
,"RESERVED_STRING_TYPE":"SUBSTITUTION_STRING"
}
,{
"RESERVED_STRING":"\u0026FLOW_PAGE_ID."
,"RESERVED_STRING_KEY":"FLOW_PAGE_ID"
,"RESERVED_STRING_TYPE":"SUBSTITUTION_STRING"
}
,{
"RESERVED_STRING":"\u0026APP_ALIAS."
,"RESERVED_STRING_KEY":"APP_ALIAS"
,"RESERVED_STRING_TYPE":"SUBSTITUTION_STRING"
}
,{
"RESERVED_STRING":"\u0026APP_PAGE_ID."
,"RESERVED_STRING_KEY":"APP_PAGE_ID"
,"RESERVED_STRING_TYPE":"SUBSTITUTION_STRING"
}
,{
"RESERVED_STRING":"\u0026APP_USER."
,"RESERVED_STRING_KEY":"APP_USER"
,"RESERVED_STRING_TYPE":"SUBSTITUTION_STRING"
}
,{
"RESERVED_STRING":"\u0026SESSION."
,"RESERVED_STRING_KEY":"SESSION"
,"RESERVED_STRING_TYPE":"SUBSTITUTION_STRING"
}
,{
"RESERVED_STRING":"\u0026APP_SESSION."
,"RESERVED_STRING_KEY":"APP_SESSION"
,"RESERVED_STRING_TYPE":"SUBSTITUTION_STRING"
}
,{
"RESERVED_STRING":"\u0026DEBUG."
,"RESERVED_STRING_KEY":"DEBUG"
,"RESERVED_STRING_TYPE":"SUBSTITUTION_STRING"
}
,{
"RESERVED_STRING":"\u0026APP_SECURITY_GROUP_ID."
,"RESERVED_STRING_KEY":"APP_SECURITY_GROUP_ID"
,"RESERVED_STRING_TYPE":"SUBSTITUTION_STRING"
}
]

!';

for data in (
  select *
  from json_table(l_json, '$[*]' columns
        RESERVED_STRING varchar2(250)  path '$.RESERVED_STRING'
      , RESERVED_STRING_KEY varchar2(250)  path '$.RESERVED_STRING_KEY'
      , RESERVED_STRING_TYPE varchar2(250)  path '$.RESERVED_STRING_TYPE'

   )
) LOOP
   merge into sert_core.reserved_strings dest
      using (
         select
           data.reserved_string_key reserved_string_key
         from dual
      ) src
      on (1 = 1
          and dest.reserved_string_key = src.reserved_string_key
       )
   when matched then
      update
         set
          dest.reserved_string = data.reserved_string
        , dest.reserved_string_type = data.reserved_string_type

   when not matched then
      insert (
          reserved_string
        , reserved_string_type
        , reserved_string_key

   )
   values (
          data.reserved_string
        , data.reserved_string_type
        , data.reserved_string_key
 );
end loop;

end;
/
--rollback not required
