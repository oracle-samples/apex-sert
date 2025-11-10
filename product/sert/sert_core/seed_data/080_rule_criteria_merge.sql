--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- This script needs to run AFTER rule_criteria_types_merge
-- It converts the criteria type KEY into the criteria_type_id value so that
-- the script does not rely on ID which could change on different environments
-- script update from github hanielburton
-- RULE_CRITERIA table was empty after installing on Autonomous.
-- After fully escaping special characters, I was able parse the JSON and re-wrote the merge so it happens in a single SQL statement
-- (makes it easier to copy out the using clause and test that it parses) instead of a loop
-- ---------------------------------------------------------------------------
set define {;
--changeset mipotter:080_rule_criteria_merge_INCORRECT_ITEM_SUBSTITUTION_SYNTAX_SQLI endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
declare
  l_rule_criteria_name      sert_core.rule_criteria.rule_criteria_name%type;
  l_rule_criteria_key       sert_core.rule_criteria.rule_criteria_key%type;
  l_rule_criteria_type_key  sert_core.rule_criteria_types.rule_criteria_type_key%type;
  l_rule_criteria_sql       sert_core.rule_criteria.rule_criteria_sql%type;
  l_reason                  sert_core.rule_criteria.reason%type;
begin
  l_rule_criteria_name      := 'Incorrect Item Substitution Syntax';
  l_rule_criteria_key       := 'INCORRECT_ITEM_SUBSTITUTION_SYNTAX_SQLI';
  l_rule_criteria_type_key  := 'SQLI';
  l_reason                  := 'Incorrect item substitution syntax';
  l_rule_criteria_sql       := q'"with string as ( select :l_source as s from dual)
select count(*)
from string
where REGEXP_LIKE((string.s), '&[[:alnum:]]+.', 'ix')
and regexp_instr (s, '([^[:alnum:]_])(&[[:alpha:]][_}*[[:alnum:]]*\.)', 1, 1, 0, 'i',1 ) > 0"';

  sert_core.rule_criteria_api.upsert_rule_criteria (
        p_rule_criteria_name      => l_rule_criteria_name ,
        p_rule_criteria_key       => l_rule_criteria_key ,
        p_rule_criteria_type_key  => l_rule_criteria_type_key ,
        p_rule_criteria_sql       => l_rule_criteria_sql ,
        p_reason                  => l_reason
  );
end;
/
--rollback not required

--changeset mipotter:080_rule_criteria_merge_USAGE_OF_EXECUTE_IMMEDIATE endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
declare
  l_rule_criteria_name      sert_core.rule_criteria.rule_criteria_name%type;
  l_rule_criteria_key       sert_core.rule_criteria.rule_criteria_key%type;
  l_rule_criteria_type_key  sert_core.rule_criteria_types.rule_criteria_type_key%type;
  l_rule_criteria_sql       sert_core.rule_criteria.rule_criteria_sql%type;
  l_reason                  sert_core.rule_criteria.reason%type;
begin
  l_rule_criteria_name      := 'Usage of EXECUTE IMMEDIATE';
  l_rule_criteria_key       := 'USAGE_OF_EXECUTE_IMMEDIATE';
  l_rule_criteria_type_key  := 'SQLI';
  l_reason                  := 'EXECUTE IMMEDIATE found; please investigate';
  l_rule_criteria_sql       := q'"select count(*) from dual where REGEXP_LIKE((:l_source), 'EXECUTE+[ ]+IMMEDIATE', 'i')"';

  sert_core.rule_criteria_api.upsert_rule_criteria (
        p_rule_criteria_name      => l_rule_criteria_name ,
        p_rule_criteria_key       => l_rule_criteria_key ,
        p_rule_criteria_type_key  => l_rule_criteria_type_key ,
        p_rule_criteria_sql       => l_rule_criteria_sql ,
        p_reason                  => l_reason
  );
end;
/

--rollback not required

--changeset mipotter:080_rule_criteria_merge_USAGE_OF_DBMS_SQL endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
declare
  l_rule_criteria_name      sert_core.rule_criteria.rule_criteria_name%type;
  l_rule_criteria_key       sert_core.rule_criteria.rule_criteria_key%type;
  l_rule_criteria_type_key  sert_core.rule_criteria_types.rule_criteria_type_key%type;
  l_rule_criteria_sql       sert_core.rule_criteria.rule_criteria_sql%type;
  l_reason                  sert_core.rule_criteria.reason%type;
begin
  l_rule_criteria_name      := 'Usage of DBMS_SQL';
  l_rule_criteria_key       := 'USAGE_OF_DBMS_SQL';
  l_rule_criteria_type_key  := 'SQLI';
  l_reason                  := 'DBMS_SQL found; please investigate';
  l_rule_criteria_sql       := q'"select count(*) from dual where REGEXP_LIKE((:l_source), 'dbms_sql', 'i')"';

  sert_core.rule_criteria_api.upsert_rule_criteria (
        p_rule_criteria_name      => l_rule_criteria_name ,
        p_rule_criteria_key       => l_rule_criteria_key ,
        p_rule_criteria_type_key  => l_rule_criteria_type_key ,
        p_rule_criteria_sql       => l_rule_criteria_sql ,
        p_reason                  => l_reason
  );
end;
/
--rollback not required

--changeset mipotter:080_rule_criteria_merge_USAGE_OF_HTP_WITHOUT_SYS_PREFIX endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false

declare
  l_rule_criteria_name      sert_core.rule_criteria.rule_criteria_name%type;
  l_rule_criteria_key       sert_core.rule_criteria.rule_criteria_key%type;
  l_rule_criteria_type_key  sert_core.rule_criteria_types.rule_criteria_type_key%type;
  l_rule_criteria_sql       sert_core.rule_criteria.rule_criteria_sql%type;
  l_reason                  sert_core.rule_criteria.reason%type;
begin
  l_rule_criteria_name      := 'Usage of HTP without SYS prefix';
  l_rule_criteria_key       := 'USAGE_OF_HTP_WITHOUT_SYS_PREFIX';
  l_rule_criteria_type_key  := 'SQLI';
  l_reason                  := 'Be sure to include the SYS prefix when making calls to HTP';
  l_rule_criteria_sql       := q'"with string as (select :l_source as s from dual)
select regexp_count(string.s,'htp\\.',1,'i') - regexp_count(string.s,'(^[^(a-z_0-9)]?|[^(a-z_0-9)])sys\\.htp\\.',1,'i') DIFF
from string"';

  sert_core.rule_criteria_api.upsert_rule_criteria (
        p_rule_criteria_name      => l_rule_criteria_name ,
        p_rule_criteria_key       => l_rule_criteria_key ,
        p_rule_criteria_type_key  => l_rule_criteria_type_key ,
        p_rule_criteria_sql       => l_rule_criteria_sql ,
        p_reason                  => l_reason
  );
end;
/
--rollback not required

--changeset mipotter:080_rule_criteria_merge_INCORRECT_ITEM_SUBSTITUTION_SYNTAX_XSS endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false

declare
  l_rule_criteria_name      sert_core.rule_criteria.rule_criteria_name%type;
  l_rule_criteria_key       sert_core.rule_criteria.rule_criteria_key%type;
  l_rule_criteria_type_key  sert_core.rule_criteria_types.rule_criteria_type_key%type;
  l_rule_criteria_sql       sert_core.rule_criteria.rule_criteria_sql%type;
  l_reason                  sert_core.rule_criteria.reason%type;
begin
  l_rule_criteria_name      := 'XSS Incorrect Item Substitution Syntax';
  l_rule_criteria_key       := 'INCORRECT_ITEM_SUBSTITUTION_SYNTAX_XSS';
  l_rule_criteria_type_key  := 'XSS_ITEM_SYNTAX';
  l_reason                  := 'XSS Incorrect item substitution syntax';
  l_rule_criteria_sql       := q'"with string as ( select :l_source as s from dual)
select count(*)
from string
where REGEXP_LIKE((string.s), '&[[:alnum:]]+.', 'ix')
and regexp_instr (s, '([^[:alnum:]_])(&[[:alpha:]][_}*[[:alnum:]]*\.)', 1, 1, 0, 'i',1 ) > 0"';

  sert_core.rule_criteria_api.upsert_rule_criteria (
        p_rule_criteria_name      => l_rule_criteria_name ,
        p_rule_criteria_key       => l_rule_criteria_key ,
        p_rule_criteria_type_key  => l_rule_criteria_type_key ,
        p_rule_criteria_sql       => l_rule_criteria_sql ,
        p_reason                  => l_reason
  );
end;
/

--rollback not required

--changeset mipotter:080_rule_criteria_merge_HIDDEN_ITEM_VALUE_PROTECTED endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
declare
  l_rule_criteria_name      sert_core.rule_criteria.rule_criteria_name%type;
  l_rule_criteria_key       sert_core.rule_criteria.rule_criteria_key%type;
  l_rule_criteria_type_key  sert_core.rule_criteria_types.rule_criteria_type_key%type;
  l_rule_criteria_sql       sert_core.rule_criteria.rule_criteria_sql%type;
  l_reason                  sert_core.rule_criteria.reason%type;
begin
  l_rule_criteria_name      := 'Hidden Item Value Protected';
  l_rule_criteria_key       := 'HIDDEN_ITEM_VALUE_PROTECTED';
  l_rule_criteria_type_key  := 'HIDDEN_ITEM_VALUE_PROTECTED';
  l_reason                  := 'Value Protected is set to No';
  l_rule_criteria_sql       := q'"select count(*) from dual where json_value(:l_source,'$.VALUE_PROTECTED') = 'N'"';

  sert_core.rule_criteria_api.upsert_rule_criteria (
        p_rule_criteria_name      => l_rule_criteria_name ,
        p_rule_criteria_key       => l_rule_criteria_key ,
        p_rule_criteria_type_key  => l_rule_criteria_type_key ,
        p_rule_criteria_sql       => l_rule_criteria_sql ,
        p_reason                  => l_reason
  );
end;
/
--rollback not required