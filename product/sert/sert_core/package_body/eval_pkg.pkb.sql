--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.eval_pkg_1721803503544 stripComments:false endDelimiter:/ runOnChange:true stripComments:false runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.eval_pkg
as
  g_log_key varchar2(10) := log_pkg.get_log_key;
  g_log_type varchar2(100) := 'EVAL';


----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: C O U N T _ B I N D S
----------------------------------------------------------------------------------------------------------------------------
-- use flow utility to count binds in a code block
----------------------------------------------------------------------------------------------------------------------------

  function count_binds
  (
    p_sql in clob
  )
  return number is
  begin
    return wwv_flow_utilities.get_binds(p_sql).count;
  end count_binds;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: G E T _ S C O R E _ R A N G E
----------------------------------------------------------------------------------------------------------------------------
-- Returns the high and low score ranges
----------------------------------------------------------------------------------------------------------------------------
function get_score_range
  (
   p_range_key in varchar2
  )
return number
is
begin
for x in (select pref_value as val from prefs where pref_key = p_range_key)
loop
  return x.val;
end loop;

return null;

end get_score_range;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: C A L C _ S C O R E
----------------------------------------------------------------------------------------------------------------------------
-- Calculates the score for a specific evaluation
----------------------------------------------------------------------------------------------------------------------------
procedure calc_score
  (
    p_eval_id in number
  )
is
  l_denominator number;
begin

select count(*) into l_denominator from eval_results_v where eval_id = p_eval_id;
if l_denominator = 0 then

update
  evals
set
  score = 100
  ,pending_score = 100
  ,approved_score = 100
where
  eval_id = p_eval_id;


else

update
  evals
set
  score =
    round
    (
      (select count(*) from eval_results_v where eval_id = p_eval_id and result = 'PASS') / l_denominator * 100
    )
  ,pending_score =
    round
    (
      (select count(*) from eval_results_v where eval_id = p_eval_id and result in ('PASS','PENDING'))  / l_denominator * 100
    )
  ,approved_score =
    round
    (
      (select count(*) from eval_results_v where eval_id = p_eval_id and result in('PASS','APPROVED')) / l_denominator * 100
    )
where
  eval_id = p_eval_id;
end if;

end calc_score;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: E V A L _ C R I T E R I A
----------------------------------------------------------------------------------------------------------------------------
-- Evaluates a column for a specific criteria
----------------------------------------------------------------------------------------------------------------------------
function eval_criteria
  (
   p_column_to_evaluate     in clob
  ,p_return_details         in varchar2 default 'Y'
  ,p_rule_criteria_type_key in varchar2
  ,p_application_id         in number
  )
return varchar2
is
  l_return                varchar2(100)  := 'PASS';
  l_source                varchar2(32765) := upper(p_column_to_evaluate);
  l_cnt                   number;
  l_rule_criteria_type_id number;
begin

log_pkg.log(p_log => 'Criteria started for ' || p_rule_criteria_type_key, p_log_key => g_log_key, p_log_type => g_log_type, p_application_id => p_application_id);
log_pkg.log(p_log => 'Column to Evaluate (l_source)', p_log_clob => p_column_to_evaluate, p_log_key => g_log_key, p_log_type => g_log_type, p_application_id => p_application_id);

-- get the rule_criteria_type_id
select rule_criteria_type_id into l_rule_criteria_type_id from rule_criteria_types where rule_criteria_type_key = p_rule_criteria_type_key;

-- initialize the JSON document
apex_json.initialize_clob_output;
apex_json.open_object; -- {
apex_json.open_array('reasons'); -- "reasons": [

-- Remove built-in substitution strings to avoid false positives
for x in (select * from reserved_strings_v where active_yn = 'Y' and reserved_string_type = 'SUBSTITUTION_STRING')
loop
  l_source := REPLACE(l_source, x.reserved_string, NULL);
end loop;

-- loop through all rule criteria
for x in (select * from rule_criteria_v where rule_criteria_type_id = l_rule_criteria_type_id and active_yn = 'Y')
loop

  log_pkg.log(p_log => 'SQL for ' || x.rule_criteria_key, p_log_clob => x.rule_criteria_sql, p_log_key => g_log_key, p_log_type => g_log_type, p_application_id => p_application_id);

  execute immediate x.rule_criteria_sql into l_cnt using l_source;
  if l_cnt > 0 then
    l_return := 'FAIL';
    apex_json.open_object; -- {
    apex_json.write('reason', x.reason); -- 1
    apex_json.close_object; -- }
  end if;

end loop;

-- Close the JSON document
apex_json.close_array; -- ]
apex_json.write('result', l_return); -- 1
apex_json.close_object; -- }

log_pkg.log(p_log => 'Criteria ended for ' || p_rule_criteria_type_key, p_log_key => g_log_key, p_log_type => g_log_type, p_application_id => p_application_id);

-- return the JSON
return apex_json.get_clob_output;

end eval_criteria;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: P R O C E S S _ R U L E S
----------------------------------------------------------------------------------------------------------------------------
-- Process all rules for a specific evaluation
----------------------------------------------------------------------------------------------------------------------------
procedure process_rules
  (
   p_application_id in number
  ,p_page_id        in number default null
  ,p_eval_id        in number
  ,p_rule_set_id    in number
  )
is
  cursor                  l_cursor is
                          select r.*
                          from rules r,
                               rule_set_rules rsr
                          where r.rule_id = rsr.rule_id
                          and rsr.rule_set_id = p_rule_set_id
                          and r.active_yn = 'Y';
  l_row                    l_cursor%rowtype;
  l_result                 varchar2(1000);
  l_sql                    varchar2(32765);
  l_rule_criteria_type_key varchar2(250);
  l_eval_history_id        number;
begin

-- start the evaluation
log_pkg.log(p_log => 'Evaluation started', p_log_key => g_log_key, p_log_type => g_log_type, p_application_id => p_application_id);

-- open the rules cursor
open l_cursor;
  loop
    fetch l_cursor into l_row;
    exit when l_cursor%notfound;

    -- record which rule is being evaluated
    log_pkg.log(p_log => 'Evaluating rule ' || l_row.rule_name || ' (' || l_row.rule_key || ')', p_id => l_row.rule_id, p_id_col => 'rule_id', p_log_key => g_log_key, p_log_type => g_log_type, p_application_id => p_application_id);

    -- process each rule for the application
    case
      when l_row.rule_type = 'APEX_VIEW' then

      l_sql :=
         'select '
      -- include the corresponding eval_id
      || '  ' || p_eval_id     || ' as eval_id'

      -- include the corresponding rule_id from the cursor
      || ' ,' || l_row.rule_id || ' as rule_id'

      -- always include application_id
      || ' ,application_id'

      -- include page_id if the impact is not Application or Shared Components
      || case when l_row.impact in ('APP', 'SC') then ',null as page_id' else ',page_id' end

      -- include component_id
      || ' ,' || nvl(l_row.component_id, 'null') || ' as component_id'

      -- include the component_name
--      || ' ,' || nvl(l_row.component_name, 'null') || ' as component_name'
      || ' ,' || nvl(replace(l_row.component_name, ':', ' || '' / '' || '), ' null') || ' as component_name '

      -- include column_name when selected
      || case when l_row.impact in ('COLUMN') then ' ,' || l_row.column_name || ' as column_name' else ',null as column_name' end

      -- include item_name when selected
      || case when l_row.impact = 'ITEM' or (l_row.impact = 'SC' and l_row.item_name is not null) then
        ' ,' || l_row.item_name || ' as item_name '
      else
        ' ,null as item_name '
      end

      -- display the shared component name
      || ' ,' || case when l_row.impact = 'SC' then nvl(replace(l_row.shared_comp_name, ':', ' || '' / '' || '), ' null') || ' as shared_comp_name ' else ' null as shared_comp_name ' end

      -- display the current value of the column being investigated
      || ' ,' || l_row.column_to_evaluate || ' as current_value'

      -- display the list of value values for this rule
      || ' ,''' || initcap(replace(l_row.operand,'_',' ')) || ' ' || nvl(replace(l_row.val_char,':',', '),l_row.val_number) || ''' as valid_values';

      -- determine the result
      case
        -- EQUALS
        when l_row.operand = 'EQUALS' then
          if l_row.case_sensitive_yn = 'Y' then
            l_result := l_result || ', case when '|| l_row.column_to_evaluate || ' in (''' || l_row.val_char || ''') then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
          else
            l_result := l_result || ', case when upper(to_char(' || l_row.column_to_evaluate || ')) in (upper(''' || replace(l_row.val_char,':','''),upper(''') || ''')) then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
          end if;

        -- NOT_EQUALS
        when l_row.operand = 'DOES_NOT_EQUAL' then
          if l_row.case_sensitive_yn = 'Y' then
            l_result := l_result || ', case when '|| l_row.column_to_evaluate || ' not in (''' || l_row.val_char || ''') then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
          else
            l_result := l_result || ', case when upper(to_char(' || l_row.column_to_evaluate || ')) not in (upper(''' || replace(l_row.val_char,':','''),upper(''') || ''')) then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
          end if;

        -- GREATER_THAN
        when l_row.operand = 'GREATER_THAN' then
          l_result := ', case when ' || l_row.column_to_evaluate || ' > ' || l_row.val_number || ' then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';

        -- LESS_THAN
        when l_row.operand = 'LESS_THAN' then
          l_result := ', case when ' || l_row.column_to_evaluate || ' < ' || l_row.val_number || ' then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';

        -- IS_NOT_NULL
        when l_row.operand = 'IS_NOT_NULL' then
          l_result := ', case when ' || l_row.column_to_evaluate || ' is not null then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';

        -- IS_NULL
        when l_row.operand = 'IS_NULL' then
          l_result := ', case when ' || l_row.column_to_evaluate || ' is null then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';

        -- CRITERIA TYPE
        when l_row.operand = 'CRITERIA' then
          -- get the rule_criteria_type_id
          select rule_criteria_type_key into l_rule_criteria_type_key from rule_criteria_types where rule_criteria_type_id = l_row.rule_criteria_type_id;
          l_result := ', eval_pkg.eval_criteria(p_column_to_evaluate => ' || l_row.column_to_evaluate || ', p_rule_criteria_type_key => ''' || l_rule_criteria_type_key
            || ''', p_application_id => ' || p_application_id || ') as result';

        -- No match
        else null;

      end case;

      -- close the case statement
      l_sql := l_sql || l_result;

      -- add the from and where clause
      l_sql := l_sql
        || ' from ' || l_row.view_name
        || ' where 1=1'
        || ' and application_id = ' || p_application_id
        || case when p_page_id is not null and l_row.impact not in ('APP', 'SC') then ' and page_id = ' || p_page_id else null end;

      -- add the optional where clause
      l_sql := l_sql || ' ' || l_row.additional_where;

    -- Extract and prepare a custom query
    when l_row.rule_type = 'CUSTOM_QUERY' then
      -- replace the EVAL_ID
      l_sql := replace(l_row.custom_query, '#EVAL_ID#', p_eval_id);

      -- replace the APP_ID in case its used in a with or subquery
      l_sql := replace(l_sql, '#APP_ID#', p_application_id);

      -- replace the RULE_ID with the current one
      l_sql := replace(l_sql, '#RULE_ID#', l_row.rule_id);

      -- select the application_id from a outer query in case it has an alias on it
      l_sql := ' select * from (' || l_sql || ' ) where application_id = ' || p_application_id
        || case when p_page_id is not null and l_row.impact not in ('APP', 'SC') then ' and page_id = ' || p_page_id else null end;

    end case;
    log_pkg.log
      (
      p_log_key => g_log_key,
      p_log => 'pre exec immediate page_id = ' || p_page_id ||'; rule_id '||l_row.rule_id
      ||chr(10)||'l_row.rule_type ='||l_row.rule_type
      ||chr(10)||'eval_criteria(p_column_to_evaluate => ' || l_row.column_to_evaluate || ', p_rule_criteria_type_key => ' || l_rule_criteria_type_key
      ||chr(10)
      ,
      p_log_type => 'EVAL',
      -- p_log_clob => l_sql,
      p_id => l_row.rule_id,
      p_id_col => 'rule_id',
      p_application_id => p_application_id
      );

    -- add the insert statement
    l_sql := 'insert into eval_results (eval_id, rule_id, application_id, page_id, component_id, component_name, column_name, item_name, shared_comp_name, current_value, valid_values, result) ' || l_sql;
    -- run the sql, populating the eval_results table
    log_pkg.log
      (
      p_log_key => g_log_key,
      p_log => 'SQL for Rule ' || l_row.rule_name || ' (' || l_row.rule_key || ')',
      p_log_type => 'EVAL',
      p_log_clob => l_sql,
      p_id => l_row.rule_id,
      p_id_col => 'rule_id',
      p_application_id => p_application_id
      );

    -- if evaluating for a specific page only, ignore APP and SC rules as they do not have a page_id nad will create duplicate entries
    case
      when p_page_id is not null and l_row.impact not in ('APP','SC') then
        execute immediate l_sql;
      when p_page_id is null then
        execute immediate l_sql;
      else
        null;
    end case;

    -- reset the variables
    l_sql := null;
    l_result := null;

  end loop;

close l_cursor;

-- check for stale exceptions and mark them as such
update
 exceptions
set
  result = 'STALE'
where
  exception_id in
  (
  select
    e.exception_id
  from
    eval_results_v er
    ,exceptions e
  where
     er.rule_set_id     || ':'
  || er.rule_id         || ':'
  || er.workspace_id    || ':'
  || er.application_id  || ':'
  || er.page_id         || ':'
  || er.component_id    || ':'
  || er.component_name  || ':'
  || er.item_name       || ':'
  || er.column_name     || ':'
  || er.shared_comp_name
  =
     e.rule_set_id     || ':'
  || e.rule_id         || ':'
  || e.workspace_id    || ':'
  || e.application_id  || ':'
  || e.page_id         || ':'
  || e.component_id    || ':'
  || e.component_name  || ':'
  || e.item_name       || ':'
  || e.column_name     || ':'
  || e.shared_comp_name
  -- and er.current_value != e.current_value
  and sert_core.sert_util.compare_string_yn(e.current_value,er.current_value) = 'N'
  and er.eval_id = p_eval_id
  );

-- change the status and update the score
update
  evals
set
   job_status = 'COMPLETED'
  ,eval_on_date = sysdate
  ,eval_on = systimestamp
where
  eval_id = p_eval_id;

calc_score(p_eval_id => p_eval_id);

-- capture the evaluation in the _HISTORY tables
log_pkg.log(p_log => 'Capturing evaluation history', p_log_key => g_log_key, p_log_type => g_log_type, p_application_id => p_application_id);

for x in (select e.*, rs.rule_set_name, rs.rule_set_key, rs.apex_version from evals e, rule_sets rs where e.rule_set_id = rs.rule_set_id and rs.rule_set_id = p_rule_set_id and e.eval_id = p_eval_id)
loop
  -- first, insert the evaluation history
  insert into eval_history
    (
     workspace_id
    ,application_id
    ,rule_set_name
    ,rule_set_key
    ,apex_version
    ,eval_on
    ,eval_on_date
    ,eval_by
    ,summary
    ,score
    ,pending_score
    ,approved_score
    )
  values
    (
     x.workspace_id
    ,x.application_id
    ,x.rule_set_name
    ,x.rule_set_key
    ,x.apex_version
    ,x.eval_on
    ,x.eval_on_date
    ,x.eval_by
    ,x.summary
    ,x.score
    ,x.pending_score
    ,x.approved_score
    )
  returning
    eval_history_id into l_eval_history_id;

  -- next, insert all of the results
  insert into eval_results_history
    (
     eval_history_id
    ,rule_name
    ,rule_key
    ,category_name
    ,category_key
    ,page_id
    ,component_name
    ,item_name
    ,column_name
    ,shared_comp_name
    ,result
    ,current_value
    ,valid_values
    )
  select
    l_eval_history_id
    ,r.rule_name
    ,r.rule_key
    ,c.category_name
    ,c.category_key
    ,er.page_id
    ,er.component_name
    ,er.item_name
    ,er.column_name
    ,er.shared_comp_name
    ,er.result
    ,er.current_value
    ,er.valid_values
  from
     eval_results er
    ,rules r
    ,categories c
  where
    er.eval_id = p_eval_id
    and er.rule_id = r.rule_id
    and r.category_id = c.category_id;

end loop;

-- end the evaluation
log_pkg.log(p_log => 'Evaluation completed', p_log_key => g_log_key, p_log_type => g_log_type, p_application_id => p_application_id);

exception
  when others then
  log_pkg.log(p_log => 'An unhandled error has occured', p_log_key => g_log_key, p_log_type => 'UNHANDLED', p_application_id => p_application_id);
  update evals set job_status = 'FAILED' where eval_id = p_eval_id;


end process_rules;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: E V A L
----------------------------------------------------------------------------------------------------------------------------
-- Main evaluation procedure that will run and record an evaluation
----------------------------------------------------------------------------------------------------------------------------
procedure eval
  (
   p_application_id    in number
  ,p_page_id           in number   default null
  ,p_eval_id           in number   default null
  ,p_rule_set_key      in varchar2 default 'INTERNAL'
  ,p_eval_by           in varchar2 default coalesce(sys_context('APEX$SESSION','APP_USER'),user)
  ,p_run_in_background in varchar2 default 'Y'
  ,p_eval_id_out       out number
  )
is
  l_rule_set_id  rule_sets.rule_set_id%type;
  l_eval_id      evals.eval_id%type;
  l_workspace_id number;
  l_job_name     varchar2(250);
begin

-- set logging
select pref_value into log_pkg.g_log_evals from prefs where pref_key = 'LOG_EVALUATIONS';

-- set the log_key
apex_util.set_session_state('G_LOG_KEY', g_log_key);

-- get the rule_set_id
select rule_set_id into l_rule_set_id from rule_sets where rule_set_key = p_rule_set_key and apex_version = (select apex_version from apex_version_v);

-- get the workspace_id
select workspace_id into l_workspace_id from apex_applications where application_id = p_application_id;

-- create a new evaluation if eval_id is null
if p_eval_id is null then

  -- delete any older evals for that application / rule set combination
  delete from evals where application_id = p_application_id and rule_set_id = l_rule_set_id;

  insert into evals
    (
     application_id
    ,workspace_id
    ,rule_set_id
    ,eval_on
    ,eval_by
    ,job_name
    ,eval_on_date
    )
  values
    (
     p_application_id
    ,l_workspace_id
    ,l_rule_set_id
    ,systimestamp
    ,p_eval_by
    ,l_job_name
    ,sysdate
    )
  returning eval_id into p_eval_id_out;
else

  -- set the local variable to one that was passed in
  p_eval_id_out := p_eval_id;

  -- if evaluating for a page only, remove that page from the current eval; other wise remove the full eval
  if p_page_id is not null then
    delete from eval_results where eval_id = p_eval_id_out and page_id = p_page_id;
  else
    delete from eval_results where eval_id = p_eval_id_out;
  end if;

end if;

if p_run_in_background = 'Y' then
  -- set the evaluation to run in the background
  l_job_name := 'SERT_BACKGROUND_' || to_char(p_application_id) || '_' || replace(p_rule_set_key,'-','_') || '_' || to_char(p_eval_id_out);

  dbms_scheduler.create_job
    (
    job_name        => l_job_name,
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'declare l_eval_id number; BEGIN
    eval_pkg.process_rules
      (
       p_application_id => ' || p_application_id ||
    case when p_page_id is not null then '
      ,p_page_id       => ' || p_page_id
    else null end || '
      ,p_eval_id        => ' || p_eval_id_out || '
      ,p_rule_set_id    => ' || l_rule_set_id || '
      );
    end;',
    start_date      => systimestamp,
    enabled         => true
    );

  -- update the evaluation record with the job_name and status
  update evals set job_name = l_job_name, job_status = 'RUNNING', eval_on = systimestamp, eval_on_date = sysdate where eval_id = p_eval_id_out;

else
  -- process all rules for the rule set in real time
  process_rules
    (
     p_application_id => p_application_id
    ,p_page_id        => p_page_id
    ,p_eval_id        => p_eval_id_out
    ,p_rule_set_id    => l_rule_set_id
    );

end if;

exception
  when others then
    log_pkg.log(p_log => 'An unhandled error has occured', p_log_key => g_log_key, p_log_type => 'UNHANDLED');
    update evals set job_status = 'FAILED' where eval_id = p_eval_id_out;
    raise;

end eval;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: D E L E T E _ E V A L
----------------------------------------------------------------------------------------------------------------------------
-- Delete an evaluation
----------------------------------------------------------------------------------------------------------------------------
procedure delete_eval
  (
   p_eval_id in number
  ,p_delete_comments in varchar2 default 'Y'
  )
is
begin

-- delete all comments and exceptions, if selected
if p_delete_comments = 'Y' then
  for x in (select * from evals where eval_id = p_eval_id)
  loop
    delete from comments   where rule_set_id || workspace_id || application_id = x.rule_set_id || x.workspace_id || x.application_id;
    delete from exceptions where rule_set_id || workspace_id || application_id = x.rule_set_id || x.workspace_id || x.application_id;
  end loop;
end if;

-- delete the evaluation
delete from evals where eval_id = p_eval_id;

end delete_eval;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: A P E X _ L I N K
----------------------------------------------------------------------------------------------------------------------------
-- Generates the link to the APEX Builder
----------------------------------------------------------------------------------------------------------------------------
function apex_link
  (
   p_eval_result_id     in number
  ,p_builder_session_id in number
  )
return varchar2
is
  l_data_link varchar2(1000);
  l_task varchar2(1) := 'N';
  l_url varchar2(1000);
begin

-- loop through a row to get the required link attributes
for x in
  (
  select
     er.application_id
    ,er.page_id
    ,er.component_id
    ,r.view_name
    ,bu.data_type_id
    ,bu.data_link
  from
     eval_results er
    ,rules_pub_v r
    ,builder_urls bu
  where
    er.eval_result_id = p_eval_result_id
    and er.rule_id = r.rule_id
    and r.builder_url_id = bu.builder_url_id(+)
  )
loop

  if x.data_link is null then

    return 'data-link=""'
      || ' data-appid="'       || x.application_id || '" '
      || ' data-pageid="'      || nvl(x.page_id,0) || '" '
      || ' data-typeid="'      || x.data_type_id   || '" '
      || ' data-componentid="' || x.component_id   || '" '
      || ' data-designer="'    || case when x.data_type_id in (8820,8830,8840,8850,8860) then 'workflow' else 'page' end || '"';

  else

   --check if scan item is a Task
    begin
      select 'Y'
      into l_task
      from apex_appl_taskdefs
      where task_def_id = x.component_id
      and application_id = x.application_id;
    exception
      when others then
        l_task := 'N';
    end;

    if l_task = 'Y' then
      --For Task do this special code.
      --ATM We cannot get to individual task.
      --Instead, we prepare a Task list link.
      --Uncomment to work on individual task link.

      l_url := APEX_PAGE.GET_URL (
         p_application        => 'app-builder',
         p_page               => 'task-definitions', --'edit-task-definition'
         p_session            => P_BUILDER_SESSION_ID ,
         p_request            => NULL,
         p_debug              => NULL,
         p_clear_cache        => NULL, --'RP,9502',
         p_items              => NULL, --'p9502_id',
         p_values             => NULL, --x.component_id,  --x.component_id||','||x.application_id, --adding appid doesn't work
         p_printer_friendly   => NULL,
         p_trace              => NULL,
         p_triggering_element => 'this',
         p_plain_url          => TRUE );

      l_url := replace(l_url,'/sert/apex_sert/r','');
      l_url := APEX_UTIL.PREPARE_URL(p_url => l_url,p_checksum_type => 'SESSION');
      l_url := 'data-link="' || l_url  || '"';
      return l_url;

    else
      --non Task link
      return 'data-link="' || 'r/apex/app-builder/' || replace(x.data_link, '#COMPONENT_ID#', x.component_id) || '&fb_flow_id=' || x.application_id || '&session=' || p_builder_session_id || '"';
    end if;

  end if;

end loop;

end apex_link;

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end eval_pkg;
/
--rollback not required
