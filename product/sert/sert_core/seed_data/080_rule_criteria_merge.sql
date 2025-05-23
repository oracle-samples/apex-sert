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
-- script update from github hanielburton
-- RULE_CRITERIA table was empty after installing on Autonomous.
-- After fully escaping special characters, I was able parse the JSON and re-wrote the merge so it happens in a single SQL statement
-- (makes it easier to copy out the using clause and test that it parses) instead of a loop
-- ---------------------------------------------------------------------------
merge into sert_core.rule_criteria dest
   using (
      with
         json_data as (
            select
               q'!
                  [
                     {"ruleCriteriaName" : "Incorrect Item Substitution Syntax",
                       "ruleCriteriaKey" : "INCORRECT_ITEM_SUBSTITUTION_SYNTAX_SQLI",
                       "ruleCriteriaTypeKey" : "SQLI",
                       "ruleCriteriaSQL" : "with string as ( select :l_source as s from dual) select count(*) from string where (REGEXP_LIKE((string.s), \u0027\u0026[[:alnum:]]+.\u0027, \u0027ix\u0027) and REGEXP_INSTR(string.s,\u0027\u0026+\u005Cw+(!STRIPHTML.)\u0027,1,1,0,\u0027i\u0027) = 0)",
                       "reason" : "Incorrect item substitution syntax"},
                     {"ruleCriteriaName" : "Usage of EXECUTE IMMEDIATE",
                       "ruleCriteriaKey" : "USAGE_OF_EXECUTE_IMMEDIATE",
                       "ruleCriteriaTypeKey" : "SQLI",
                       "ruleCriteriaSQL" : "select count(*) from dual where REGEXP_LIKE((:l_source), \u0027EXECUTE+[ ]+IMMEDIATE\u0027, \u0027i\u0027)",
                       "reason" : "EXECUTE IMMEDIATE found; please investigate"},
                     {"ruleCriteriaName" : "Usage of DBMS_SQL",
                       "ruleCriteriaKey" : "USAGE_OF_DBMS_SQL",
                       "ruleCriteriaTypeKey" : "SQLI",
                       "ruleCriteriaSQL" : "select count(*) from dual where REGEXP_LIKE((:l_source), \u0027dbms_sql\u0027, \u0027i\u0027)",
                       "reason" : "DBMS_SQL found; please investigate"},
                     {"ruleCriteriaName" : "Usage of HTP without SYS prefix",
                      "ruleCriteriaKey" : "USAGE_OF_HTP_WITHOUT_SYS_PREFIX",
                      "ruleCriteriaTypeKey" : "SQLI",
                      "ruleCriteriaSQL" : "with string as (select :l_source as s from dual) select regexp_count(string.s,\u0027htp\u005C\u005C.\u0027,1,\u0027i\u0027) - regexp_count(string.s,\u0027(^[^(a-z_0-9)]?|[^(a-z_0-9)])sys\u005C\u005C.htp\u005C\u005C.\u0027,1,\u0027i\u0027) DIFF from string",
                      "reason" : "Be sure to include the SYS prefix when making calls to HTP"},
                     {"ruleCriteriaName" : "Incorrect Item Substitution Syntax",
                       "ruleCriteriaKey" : "INCORRECT_ITEM_SUBSTITUTION_SYNTAX_XSS",
                       "ruleCriteriaTypeKey" : "XSS_ITEM_SYNTAX",
                       "ruleCriteriaSQL" : "with string as ( select :l_source as s from dual) select count(*) from string where (REGEXP_LIKE((string.s), \u0027\u0026[[:alnum:]]+.\u0027, \u0027ix\u0027) and REGEXP_INSTR(string.s,\u0027\u0026+\u005Cw+(!STRIPHTML.)\u0027,1,1,0,\u0027i\u0027) = 0)",
                       "reason" : "Incorrect item substitution syntax"},
                     { "ruleCriteriaName" : "Hidden Item Value Protected",
                       "ruleCriteriaKey"  : "HIDDEN_ITEM_VALUE_PROTECTED",
                       "ruleCriteriaTypeKey" : "HIDDEN_ITEM_VALUE_PROTECTED",
                       "ruleCriteriaSQL"     : "select count(*) from dual where json_value(:l_source,\u0027$.VALUE_PROTECTED\u0027) = \u0027N\u0027",
                       "reason"              :"Value Protected is set to No"
                     }
               ]!' rule_criteria
            from dual
         )
      select
         jt.*
       , rct.rule_criteria_type_id
      from
         json_data,
         json_table(
            json_data.rule_criteria, '$[*]'
            columns
               RULE_CRITERIA_NAME     varchar2(250)   path '$.ruleCriteriaName'
             , RULE_CRITERIA_KEY      varchar2(250)   path '$.ruleCriteriaKey'
             , RULE_CRITERIA_TYPE_KEY varchar2(250)   path '$.ruleCriteriaTypeKey'
             , RULE_CRITERIA_SQL      varchar2(4000)  path '$.ruleCriteriaSQL'
             , REASON                 varchar2(4000)  path '$.reason'
         ) jt,
         sert_core.rule_criteria_types rct
      where
         rct.rule_criteria_type_key = jt.rule_criteria_type_key
   ) src
   on (1=1 and dest.rule_criteria_key = src.rule_criteria_key)
when matched then
   update set
       dest.rule_criteria_name    = src.rule_criteria_name
     , dest.rule_criteria_type_id = src.rule_criteria_type_id
     , dest.rule_criteria_sql     = src.rule_criteria_sql
     , dest.reason                = src.reason
when not matched then
   insert (
      rule_criteria_name
    , rule_criteria_type_id
    , rule_criteria_sql
    , reason
    , rule_criteria_key
   )
   values (
      src.rule_criteria_name
    , src.rule_criteria_type_id
    , src.rule_criteria_sql
    , src.reason
    , src.rule_criteria_key
   );
   --rollback not required
