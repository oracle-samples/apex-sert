--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:rule_criteria_types_merge_1722422306644 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
declare
  l_json clob;
begin

  -- Load data in JSON object
  l_json := q'!
[
{
"RULE_CRITERIA_TYPE_NAME":"SQL Injection"
,"RULE_CRITERIA_TYPE_KEY":"SQLI"
}
,{
"RULE_CRITERIA_TYPE_NAME":"Cross-Site Scripting - Item Syntax"
,"RULE_CRITERIA_TYPE_KEY":"XSS_ITEM_SYNTAX"
}
,{
"RULE_CRITERIA_TYPE_NAME":"Cross-Site Scripting - Unescaped htp.p"
,"RULE_CRITERIA_TYPE_KEY":"XSS_UNESCAPED_HTP"
}
,{
"RULE_CRITERIA_TYPE_NAME":"Hidden Item Value Protected"
,"RULE_CRITERIA_TYPE_KEY":"HIDDEN_ITEM_VALUE_PROTECTED"
}
,{
"RULE_CRITERIA_TYPE_NAME":"Incorrect Item Substitution Syntax"
,"RULE_CRITERIA_TYPE_KEY":"INCORRECT_ITEM_SUBSTITUTION_SYNTAX_XSS"
}
]

!';

for data in (
  select *
  from json_table(l_json, '$[*]' columns
        RULE_CRITERIA_TYPE_NAME varchar2(250)  path '$.RULE_CRITERIA_TYPE_NAME'
      , RULE_CRITERIA_TYPE_KEY varchar2(250)  path '$.RULE_CRITERIA_TYPE_KEY'

   )
) LOOP
   merge into sert_core.rule_criteria_types dest
      using (
         select
           data.rule_criteria_type_key rule_criteria_type_key
         from dual
      ) src
      on (1 = 1
          and dest.rule_criteria_type_key = src.rule_criteria_type_key
       )
   when matched then
      update
         set
          dest.rule_criteria_type_name = data.rule_criteria_type_name

   when not matched then
      insert (
          rule_criteria_type_name
        , rule_criteria_type_key

   )
   values (
          data.rule_criteria_type_name
        , data.rule_criteria_type_key
 );
end loop;

end;
/
--rollback not required
