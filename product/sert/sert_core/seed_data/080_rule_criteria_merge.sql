--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:rule_criteria_merge_1722422311560 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
-- ---------------------------------------------------------------------------
-- This script needs to run AFTER rule_criteria_types_merge
-- It converts the criteria type KEY into the criteria_type_id value so that
-- the script does not rely on ID which could change on different environments
-- ---------------------------------------------------------------------------
declare
  l_json clob;
  l_rule_criteria_type_id sert_core.rule_criteria_types.rule_criteria_type_id%type;
begin
  -- Load data in JSON object
  l_json := q'!
   [

      {"ruleCriteriaName" : "Incorrect Item Substitution Syntax",
        "ruleCriteriaKey" : "INCORRECT_ITEM_SUBSTITUTION_SYNTAX_SQLI",
        "ruleCriteriaTypeKey" : "SQLI",
        "ruleCriteriaSQL" : "with string as ( select :l_source as s from dual) select count(*) from string where (REGEXP_LIKE((string.s), '&[[:alnum:]]+.', 'ix') and REGEXP_INSTR(string.s,'&+\w+(!STRIPHTML.)',1,1,0,'i') = 0)",
        "reason" : "Incorrect item substitution syntax"},
      {"ruleCriteriaName" : "Usage of EXECUTE IMMEDIATE",
        "ruleCriteriaKey" : "USAGE_OF_EXECUTE_IMMEDIATE",
        "ruleCriteriaTypeKey" : "SQLI",
        "ruleCriteriaSQL" : "select count(*) from dual where REGEXP_LIKE((:l_source), 'EXECUTE+[ ]+IMMEDIATE', 'i')",
        "reason" : "EXECUTE IMMEDIATE found; please investigate"},
      {"ruleCriteriaName" : "Usage of DBMS_SQL",
        "ruleCriteriaKey" : "USAGE_OF_DBMS_SQL",
        "ruleCriteriaTypeKey" : "SQLI",
        "ruleCriteriaSQL" : "select count(*) from dual where REGEXP_LIKE((:l_source), 'dbms_sql', 'i')",
        "reason" : "DBMS_SQL found; please investigate"},
      {"ruleCriteriaName" : "Usage of HTP without SYS prefix",
       "ruleCriteriaKey" : "USAGE_OF_HTP_WITHOUT_SYS_PREFIX",
       "ruleCriteriaTypeKey" : "SQLI",
       "ruleCriteriaSQL" : "with string as (select :l_source as s from dual) select regexp_count(string.s,'htp\\.',1,'i') - regexp_count(string.s,'(^[^(a-z_0-9)]?|[^(a-z_0-9)])sys\\.htp\\.',1,'i') DIFF from string",
       "reason" : "Be sure to include the SYS prefix when making calls to HTP"},
      {"ruleCriteriaName" : "Incorrect Item Substitution Syntax",
        "ruleCriteriaKey" : "INCORRECT_ITEM_SUBSTITUTION_SYNTAX_XSS",
        "ruleCriteriaTypeKey" : "XSS_ITEM_SYNTAX",
        "ruleCriteriaSQL" : "with string as ( select :l_source as s from dual) select count(*) from string where (REGEXP_LIKE((string.s), '&[[:alnum:]]+.', 'ix') and REGEXP_INSTR(string.s,'&+\w+(!STRIPHTML.)',1,1,0,'i') = 0)",
        "reason" : "Incorrect item substitution syntax"},
      { "ruleCriteriaName" : "Hidden Item Value Protected",
        "ruleCriteriaKey"  : "HIDDEN_ITEM_VALUE_PROTECTED",
        "ruleCriteriaTypeKey" : "HIDDEN_ITEM_VALUE_PROTECTED",
        "ruleCriteriaSQL"     : "select count(*) from dual where json_value(:l_source,'$.VALUE_PROTECTED') = 'N'",
        "reason"              :"Value Protected is set to No"
}
]

   ]!';

for data in (
  select *
  from json_table(l_json, '$[*]' columns
        RULE_CRITERIA_NAME varchar2(250)  path '$.ruleCriteriaName'
      , RULE_CRITERIA_KEY varchar2(250)  path '$.ruleCriteriaKey'
      , RULE_CRITERIA_TYPE_KEY varchar2(250)  path '$.ruleCriteriaTypeKey'
      , RULE_CRITERIA_SQL varchar2(4000)  path '$.ruleCriteriaSQL'
      , REASON varchar2(4000)  path '$.reason'

   )
) LOOP
   select rule_criteria_type_id
   into l_rule_criteria_type_id
   from sert_core.rule_criteria_types
   where rule_criteria_type_key = data.rule_criteria_type_key;

   merge into sert_core.rule_criteria dest
      using (
         select
           data.rule_criteria_key rule_criteria_key
         from dual
      ) src
      on (1 = 1
          and dest.rule_criteria_key = src.rule_criteria_key
       )
   when matched then
      update
         set
          dest.rule_criteria_name = data.rule_criteria_name
        , dest.rule_criteria_type_id = l_rule_criteria_type_id
        , dest.rule_criteria_sql = data.rule_criteria_sql
        , dest.reason = data.reason

   when not matched then
      insert (
          rule_criteria_name
        , rule_criteria_type_id
        , rule_criteria_sql
        , reason
        , rule_criteria_key

   )
   values (
          data.rule_criteria_name
        , l_rule_criteria_type_id
        , data.rule_criteria_sql
        , data.reason
        , data.rule_criteria_key
 );
end loop;

end;
/
--rollback not required
