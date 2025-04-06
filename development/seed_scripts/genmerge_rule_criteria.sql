set serveroutput on
set feedback off
spool rule_criteria_merge.json
------------------------------------------------------------------------------
-- Produce ONLY the json for rule_criteria merge
-- this is because we need to make a more complex join for merging
-- and the simplest approach is to have a non generated merge script and
-- just inject the JSON produced to the script ot update.
------------------------------------------------------------------------------
declare
   cur           sys_refcursor;
   curid         number;
   desctab       dbms_sql.desc_tab;
   colcnt        number;
   namevar       varchar2(4000);
   numvar        number;
   datevar       date;
   l_sql         varchar2(32767);
   l_count       number;
  --  l_match_list  apex_t_varchar2 := apex_string.split(replace(match_columns, ' ', ''), ',');
  --  l_column_list apex_t_varchar2 := apex_string.split(replace(column_list, ' ', ''), ',');
    cursor c1 is
    select rc.rule_criteria_name      as "ruleCriteriaName"
          ,rc.rule_criteria_key       as "ruleCriteriaKey"
          ,rct.rule_criteria_type_key as "ruleCriteriaTypeKey"
          ,rc.rule_criteria_sql       as "ruleCriteriaSQL"
          ,rc.reason                  as "reason"
    from sert_core.rule_criteria rc
    join sert_core.rule_criteria_types rct on rct.rule_criteria_type_id = rc.rule_criteria_type_id;
begin
-- ===================================================
-- PREP WORK
-- ===================================================
l_sql := q'#
    select rc.rule_criteria_name      as "ruleCriteriaName"
          ,rc.rule_criteria_key       as "ruleCriteriaKey"
          ,rct.rule_criteria_type_key as "ruleCriteriaTypeKey"
          ,rc.rule_criteria_sql       as "ruleCriteriaSQL"
          ,rc.reason                  as "reason"
    from sert_core.rule_criteria rc
    join sert_core.rule_criteria_types rct on rct.rule_criteria_type_id = rc.rule_criteria_type_id
#';
--Now dump the data from the table into a JSON object
--
-- Initialize the clob output so we can capture it
--
   apex_json.free_output;
   apex_json.initialize_clob_output;
-- Dump the data from the cursor above in JSON format
   open cur for l_sql;
   apex_json.write(cur);
-- Dump the JSON out to the OUTPUT buffer
   dbms_output.put_line(apex_json.get_clob_output);
-- Free the CLOB
   apex_json.free_output;
-- Finish off the quoted string


--AND WERE DONE

end;
/
spool off