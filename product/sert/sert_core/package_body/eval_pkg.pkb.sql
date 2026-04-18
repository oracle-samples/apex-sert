--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.eval_pkg_1721803503544 stripComments:false endDelimiter:/ runOnChange:true stripComments:false runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.eval_pkg as
  g_log_key  varchar2(10)   := log_pkg.get_log_key;
  g_log_type varchar2(100)  := 'EVAL';


----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: C O U N T _ B I N D S
----------------------------------------------------------------------------------------------------------------------------
-- Counts bind placeholders in a SQL or PL/SQL statement
----------------------------------------------------------------------------------------------------------------------------
-- count_binds
-- purpose: return the number of bind placeholders found in a SQL/PLSQL text payload.
-- behavior: delegates parsing to wwv_flow_utilities.get_binds and returns the collection count.
--   This routine is used as a lightweight guard/diagnostic when validating dynamic SQL content.
-- parameters:
--   p_sql - SQL or PL/SQL text to inspect for bind variables (for example :P1_ITEM, :APP_ID).
-- returns:
--   number - total bind placeholders detected in p_sql.
-- usage:
--   l_bind_count := eval_pkg.count_binds(p_sql => l_sql);
----------------------------------------------------------------------------------------------------------------------------

function count_binds(
    p_sql in clob )
    return number
  as
  begin
    return wwv_flow_utilities.get_binds(p_sql).count;
  end count_binds;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: G E T _ S C O R E _ R A N G E
----------------------------------------------------------------------------------------------------------------------------
-- Reads a numeric score threshold from preferences
----------------------------------------------------------------------------------------------------------------------------
-- get_score_range
-- purpose: return a score boundary value stored in the prefs table.
-- behavior: queries prefs by key and returns the matching pref_value; returns null when no row is found.
--   Expected keys include threshold-style preference entries used by score presentation logic.
-- parameters:
--   p_range_key - preference key to resolve (for example LOW_SCORE_RANGE or HIGH_SCORE_RANGE).
-- returns:
--   number - numeric preference value for the key, or null when no preference exists.
-- usage:
--   l_low_score  := eval_pkg.get_score_range(p_range_key => 'LOW_SCORE_RANGE');
--   l_high_score := eval_pkg.get_score_range(p_range_key => 'HIGH_SCORE_RANGE');
----------------------------------------------------------------------------------------------------------------------------
function get_score_range(
    p_range_key in varchar2 )
    return number
  as
  begin
    for c_pref in (
      select pref_value as val
        from prefs
       where pref_key = p_range_key
    )
    loop

      return c_pref.val;

    end loop; -- for c_pref in (select pref_value ...)

    return null;
  end get_score_range;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: C A L C _ S C O R E
----------------------------------------------------------------------------------------------------------------------------
-- Recomputes evaluation score metrics from eval results
----------------------------------------------------------------------------------------------------------------------------
-- calc_score
-- purpose: calculate and persist overall, pending, and approved score percentages for one evaluation.
-- behavior: derives an effective result per row by combining eval_results JSON output with exception overrides,
--   aggregates pass/pending/approved counts, converts to percentages, and updates evals.
--   When the denominator is zero, score values default to 100.
-- parameters:
--   p_eval_id - target evals.eval_id whose score, pending_score, and approved_score are updated.
-- usage:
--   eval_pkg.calc_score(p_eval_id => p_eval_id);
----------------------------------------------------------------------------------------------------------------------------
procedure calc_score(
    p_eval_id in number )
  as
    l_score           evals.score%type;
    l_pending_score   evals.pending_score%type;
    l_approved_score  evals.approved_score%type;
  begin

    with eff as
      (
        select
          case
            when json_value(er.result, '$.result' returning varchar2(20)) = 'PASS'
              then 'PASS'
            else nvl(ex.result, json_value(er.result, '$.result' returning varchar2(20)))
          end as effective_result
        from
          sert_core.eval_results er
          left join sert_core.evals e on  er.eval_id = e.eval_id
          left join sert_core.exceptions ex
            on     ex.rule_set_id    = e.rule_set_id
              and ex.workspace_id   = e.workspace_id
              and ex.application_id = e.application_id
              and ex.rule_id        = er.rule_id
              and nvl(ex.page_id,          -1   ) = nvl(er.page_id,          -1   )
              and nvl(ex.component_id,     'N/A') = nvl(er.component_id,     'N/A')
              and nvl(ex.column_name,      'N/A') = nvl(er.column_name,      'N/A')
              and nvl(ex.item_name,        'N/A') = nvl(er.item_name,        'N/A')
              and nvl(ex.shared_comp_name, 'N/A') = nvl(er.shared_comp_name, 'N/A')
        where
          e.eval_id = p_eval_id
      )
    select
      round((case when denom = 0 then 1 else pass_cnt / denom end) * 100) as score,
      round((case when denom = 0 then 1 else pass_or_pending_cnt / denom end) * 100) as pending_score,
      round((case when denom = 0 then 1 else pass_or_approved_cnt / denom end) * 100) as approved_score
    into
      l_score,
      l_pending_score,
      l_approved_score
    from
      (
        select
          count(*)                                                   as denom,
          sum(case when effective_result = 'PASS' then 1 else 0 end) as pass_cnt,
          sum(case when effective_result in ('PASS','PENDING') then 1 else 0 end)
                                                                      as pass_or_pending_cnt,
          sum(case when effective_result in ('PASS','APPROVED') then 1 else 0 end)
                                                                      as pass_or_approved_cnt
        from
          eff
      );

    update evals e
       set score          = l_score,
           pending_score  = l_pending_score,
           approved_score = l_approved_score
     where
       e.eval_id = p_eval_id;
  end calc_score;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: E V A L _ C R I T E R I A
----------------------------------------------------------------------------------------------------------------------------
-- Executes rule-criteria checks for one source value
----------------------------------------------------------------------------------------------------------------------------
-- eval_criteria
-- purpose: evaluate one text value against all active entries in a criteria type and return a JSON decision payload.
-- behavior: normalizes input to uppercase, removes reserved substitution strings to reduce false positives,
--   executes each active rule_criteria_v SQL statement using the source value as a bind,
--   and builds JSON with a "result" plus a "reasons" array for matched failures.
-- parameters:
--   p_column_to_evaluate     - source text (typically component metadata) to evaluate.
--   p_return_details         - reserved detail flag ('Y'/'N'); currently accepted for compatibility.
--   p_rule_criteria_type_key - business key that identifies the criteria type bucket to execute.
--   p_application_id         - application id used in logging context.
-- returns:
--   varchar2 - JSON CLOB payload (as varchar2 return type) containing "result" and "reasons".
-- usage:
--   l_result_json := eval_pkg.eval_criteria(
--      p_column_to_evaluate     => l_source_value,
--      p_rule_criteria_type_key => 'SQL_PATTERN',
--      p_application_id         => :APP_ID
--   );
----------------------------------------------------------------------------------------------------------------------------
function eval_criteria(
    p_column_to_evaluate     in clob,
    p_return_details         in varchar2 default 'Y',
    p_rule_criteria_type_key in varchar2,
    p_application_id         in number )
    return varchar2
  as
    l_return                 varchar2(100)    := 'PASS';
    l_source                 varchar2(32765)  := upper(p_column_to_evaluate);
    l_cnt                    number;
    l_rule_criteria_type_id  number;
  begin
    log_pkg.log(
      p_log            => 'Criteria started for ' || p_rule_criteria_type_key,
      p_log_key        => g_log_key,
      p_log_type       => g_log_type,
      p_application_id => p_application_id
    );

    log_pkg.log(
      p_log            => 'Column to Evaluate (l_source)',
      p_log_clob       => p_column_to_evaluate,
      p_log_key        => g_log_key,
      p_log_type       => g_log_type,
      p_application_id => p_application_id
    );

    -- get the rule_criteria_type_id
    select rule_criteria_type_id
      into l_rule_criteria_type_id
      from rule_criteria_types
     where rule_criteria_type_key = p_rule_criteria_type_key;

    -- initialize the JSON document
    apex_json.initialize_clob_output;
    apex_json.open_object; -- {
    apex_json.open_array('reasons'); -- "reasons": [

    -- Remove built-in substitution strings to avoid false positives
    for c_resv in (
      select *
        from reserved_strings_v
       where active_yn = 'Y'
         and reserved_string_type = 'SUBSTITUTION_STRING'
    )
    loop

      l_source := replace(l_source, c_resv.reserved_string, null);

    end loop; -- for c_resv in (reserved_strings_v)

    -- loop through all rule criteria
    for c_rule in (
      select *
        from rule_criteria_v
       where rule_criteria_type_id = l_rule_criteria_type_id
         and active_yn = 'Y'
    )
    loop

      log_pkg.log(
        p_log            => 'SQL for ' || c_rule.rule_criteria_key,
        p_log_clob       => c_rule.rule_criteria_sql,
        p_log_key        => g_log_key,
        p_log_type       => g_log_type,
        p_application_id => p_application_id
      );

      execute immediate c_rule.rule_criteria_sql into l_cnt using l_source;

      if l_cnt > 0 then

        l_return := 'FAIL';
        apex_json.open_object; -- {
        apex_json.write('reason', c_rule.reason); -- 1
        apex_json.close_object; -- }

      end if; -- l_cnt > 0

    end loop; -- for c_rule in (rule_criteria_v)

    -- Close the JSON document
    apex_json.close_array; -- ]
    apex_json.write('result', l_return); -- 1
    apex_json.close_object; -- }

    log_pkg.log(
      p_log            => 'Criteria ended for ' || p_rule_criteria_type_key,
      p_log_key        => g_log_key,
      p_log_type       => g_log_type,
      p_application_id => p_application_id
    );

    -- return the JSON
    return apex_json.get_clob_output;
  end eval_criteria;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: G E T _ R U L E _ C R I T E R I A _ T Y P E _ K E Y
----------------------------------------------------------------------------------------------------------------------------
-- Resolves criteria type key from criteria type id
----------------------------------------------------------------------------------------------------------------------------
-- get_rule_criteria_type_key
-- purpose: translate a numeric rule_criteria_type_id into its corresponding key value.
-- behavior: queries rule_criteria_types and returns rule_criteria_type_key for the provided id.
-- parameters:
--   p_rule_criteria_type_id - primary key from rule_criteria_types.
-- returns:
--   varchar2 - rule_criteria_type_key for the provided id.
-- usage:
--   l_key := eval_pkg.get_rule_criteria_type_key(p_rule_criteria_type_id => l_type_id);
----------------------------------------------------------------------------------------------------------------------------
function get_rule_criteria_type_key(
    p_rule_criteria_type_id in number )
    return varchar2
  as
    l_rule_criteria_type_key  rule_criteria_types.rule_criteria_type_key%type;
  begin
    select rule_criteria_type_key
      into l_rule_criteria_type_key
      from rule_criteria_types
     where rule_criteria_type_id = p_rule_criteria_type_id;

    return l_rule_criteria_type_key;
  end get_rule_criteria_type_key;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: S H O U L D _ E X E C U T E _ R U L E
----------------------------------------------------------------------------------------------------------------------------
-- Determines whether a rule is in-scope for current execution context
----------------------------------------------------------------------------------------------------------------------------
-- should_execute_rule
-- purpose: centralize the decision for whether a rule should run during process_rules.
-- behavior: returns true when evaluating the full application, or when the rule impact is page-level.
--   Returns false for APP/SC impacts when execution is restricted to a single page.
-- parameters:
--   p_page_id - optional page filter; null means full application evaluation.
--   p_impact  - rule impact code (for example APP, SC, ITEM, COLUMN).
-- returns:
--   boolean - true when the rule should execute for the current context.
-- usage:
--   if eval_pkg.should_execute_rule(p_page_id => p_page_id, p_impact => l_row.impact) then
--      execute immediate l_sql;
--   end if;
----------------------------------------------------------------------------------------------------------------------------
function should_execute_rule(
    p_page_id in number,
    p_impact  in varchar2 )
    return boolean
  as
  begin
    return p_page_id is null or p_impact not in ('APP', 'SC');
  end should_execute_rule;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: B U I L D _ A P E X _ V I E W _ R E S U L T _ S Q L
----------------------------------------------------------------------------------------------------------------------------
-- Builds the dynamic SQL result expression for APEX_VIEW rules
----------------------------------------------------------------------------------------------------------------------------
-- build_apex_view_result_sql
-- purpose: generate the calculated "result" expression appended to an APEX view rule query.
-- behavior: returns a SQL fragment based on operand and case-sensitivity settings.
--   For CRITERIA operands, resolves and returns a call to eval_pkg.eval_criteria and sets
--   p_rule_criteria_type_key for downstream logging.
-- parameters:
--   p_operand                - comparison mode (EQUALS, DOES_NOT_EQUAL, GREATER_THAN, LESS_THAN, IS_NULL, etc.).
--   p_case_sensitive_yn      - case sensitivity flag ('Y'/'N') for character comparisons.
--   p_column_to_evaluate     - source column/expression used in generated SQL.
--   p_val_char               - character comparison value(s), colon-delimited where applicable.
--   p_val_number             - numeric comparison value for numeric operands.
--   p_rule_criteria_type_id  - criteria type id used when operand = CRITERIA.
--   p_application_id         - application context passed through to eval_criteria.
--   p_rule_criteria_type_key - out parameter populated for CRITERIA operand logging.
-- returns:
--   varchar2 - SQL fragment beginning with "," and ending with "as result".
-- usage:
--   l_result_sql := eval_pkg.build_apex_view_result_sql(
--      p_operand                => l_row.operand,
--      p_case_sensitive_yn      => l_row.case_sensitive_yn,
--      p_column_to_evaluate     => l_row.column_to_evaluate,
--      p_val_char               => l_row.val_char,
--      p_val_number             => l_row.val_number,
--      p_rule_criteria_type_id  => l_row.rule_criteria_type_id,
--      p_application_id         => p_application_id,
--      p_rule_criteria_type_key => l_rule_criteria_type_key
--   );
----------------------------------------------------------------------------------------------------------------------------
function build_apex_view_result_sql(
    p_operand                in varchar2,
    p_case_sensitive_yn      in varchar2,
    p_column_to_evaluate     in varchar2,
    p_val_char               in varchar2,
    p_val_number             in number,
    p_rule_criteria_type_id  in number,
    p_application_id         in number,
    p_rule_criteria_type_key in out varchar2 )
    return varchar2
  as
  begin
    case
      when p_operand = 'EQUALS' then
        if p_case_sensitive_yn = 'Y' then
          return ', case when ' || p_column_to_evaluate || ' in (''' || p_val_char || ''') then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
        else
          return ', case when upper(to_char(' || p_column_to_evaluate || ')) in (upper(''' || replace(p_val_char,':','''),upper(''') || ''')) then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
        end if;
      when p_operand = 'DOES_NOT_EQUAL' then
        if p_case_sensitive_yn = 'Y' then
          return ', case when ' || p_column_to_evaluate || ' not in (''' || p_val_char || ''') then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
        else
          return ', case when upper(to_char(' || p_column_to_evaluate || ')) not in (upper(''' || replace(p_val_char,':','''),upper(''') || ''')) then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
        end if;
      when p_operand = 'GREATER_THAN' then
        return ', case when ' || p_column_to_evaluate || ' > ' || p_val_number || ' then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
      when p_operand = 'LESS_THAN' then
        return ', case when ' || p_column_to_evaluate || ' < ' || p_val_number || ' then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
      when p_operand = 'IS_NOT_NULL' then
        return ', case when ' || p_column_to_evaluate || ' is not null then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
      when p_operand = 'IS_NULL' then
        return ', case when ' || p_column_to_evaluate || ' is null then ''{ "result":"PASS"}'' else ''{ "result":"FAIL"}'' end as result';
      when p_operand = 'CRITERIA' then
        p_rule_criteria_type_key := get_rule_criteria_type_key(p_rule_criteria_type_id => p_rule_criteria_type_id);

        return ', eval_pkg.eval_criteria(p_column_to_evaluate => ' || p_column_to_evaluate ||
          ', p_rule_criteria_type_key => ''' || p_rule_criteria_type_key ||
          ''', p_application_id => ' || p_application_id || ') as result';
      else
        return null;
    end case;
  end build_apex_view_result_sql;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: B U I L D _ A P E X _ V I E W _ S Q L
----------------------------------------------------------------------------------------------------------------------------
-- Builds full dynamic SQL for APEX_VIEW rule evaluation
----------------------------------------------------------------------------------------------------------------------------
-- build_apex_view_sql
-- purpose: construct a SELECT statement that projects eval_results-compatible columns for one APEX_VIEW rule.
-- behavior: embeds evaluation context columns, applies impact-specific page/item/column/shared component handling,
--   appends computed result SQL, and applies application/page/additional filters.
-- parameters:
--   p_eval_id                - eval id to stamp into output rows.
--   p_application_id         - application id filter for the source view.
--   p_page_id                - optional page filter for page-scoped runs.
--   p_rule_id                - rule id to stamp into output rows.
--   p_impact                 - rule impact code controlling projection logic.
--   p_component_id           - component id expression or literal for output projection.
--   p_component_name         - component name expression, supports colon-delimited path rendering.
--   p_column_name            - column name expression for COLUMN impact rules.
--   p_item_name              - item name expression for ITEM or applicable SC rules.
--   p_shared_comp_name       - shared component expression used for SC impact rules.
--   p_column_to_evaluate     - source expression evaluated by operand logic.
--   p_operand                - operand key controlling result expression generation.
--   p_val_char               - character valid value(s) used by character-based operands.
--   p_val_number             - numeric valid value used by numeric operands.
--   p_case_sensitive_yn      - case-sensitivity flag for character comparisons.
--   p_rule_criteria_type_id  - criteria type id used by CRITERIA operands.
--   p_view_name              - source APEX view name used in FROM clause.
--   p_additional_where       - extra SQL predicate appended to generated WHERE clause.
--   p_rule_criteria_type_key - out parameter populated when CRITERIA logic is used.
-- returns:
--   varchar2 - complete SELECT statement used as source for eval_results insert.
-- usage:
--   l_sql := eval_pkg.build_apex_view_sql(
--      p_eval_id                => p_eval_id,
--      p_application_id         => p_application_id,
--      p_page_id                => p_page_id,
--      p_rule_id                => l_row.rule_id,
--      p_impact                 => l_row.impact,
--      p_component_id           => l_row.component_id,
--      p_component_name         => l_row.component_name,
--      p_column_name            => l_row.column_name,
--      p_item_name              => l_row.item_name,
--      p_shared_comp_name       => l_row.shared_comp_name,
--      p_column_to_evaluate     => l_row.column_to_evaluate,
--      p_operand                => l_row.operand,
--      p_val_char               => l_row.val_char,
--      p_val_number             => l_row.val_number,
--      p_case_sensitive_yn      => l_row.case_sensitive_yn,
--      p_rule_criteria_type_id  => l_row.rule_criteria_type_id,
--      p_view_name              => l_row.view_name,
--      p_additional_where       => l_row.additional_where,
--      p_rule_criteria_type_key => l_rule_criteria_type_key
--   );
----------------------------------------------------------------------------------------------------------------------------
function build_apex_view_sql(
    p_eval_id                in number,
    p_application_id         in number,
    p_page_id                in number,
    p_rule_id                in number,
    p_impact                 in varchar2,
    p_component_id           in varchar2,
    p_component_name         in varchar2,
    p_column_name            in varchar2,
    p_item_name              in varchar2,
    p_shared_comp_name       in varchar2,
    p_column_to_evaluate     in varchar2,
    p_operand                in varchar2,
    p_val_char               in varchar2,
    p_val_number             in number,
    p_case_sensitive_yn      in varchar2,
    p_rule_criteria_type_id  in number,
    p_view_name              in varchar2,
    p_additional_where       in varchar2,
    p_rule_criteria_type_key in out varchar2 )
    return varchar2
  as
    l_sql     varchar2(32765);
    l_result  varchar2(1000);
  begin
    l_sql :=
       'select '
    || '  ' || p_eval_id || ' as eval_id'
    || ' ,' || p_rule_id || ' as rule_id'
    || ' ,application_id'
    || case
         when p_impact in ('APP', 'SC') then ',null as page_id'
         else ',page_id'
       end
    || ' ,' || nvl(p_component_id, 'null') || ' as component_id'
    || ' ,' || nvl(replace(p_component_name, ':', ' || '' / '' || '), ' null') || ' as component_name '
    || case
         when p_impact in ('COLUMN') then ' ,' || p_column_name || ' as column_name'
         else ',null as column_name'
       end
    || case
         when p_impact = 'ITEM'
           or (p_impact = 'SC' and p_item_name is not null)
         then ' ,' || p_item_name || ' as item_name '
         else ' ,null as item_name '
       end
    || ' ,' || case
                 when p_impact = 'SC'
                   then nvl(replace(p_shared_comp_name, ':', ' || '' / '' || '), ' null') || ' as shared_comp_name '
                 else ' null as shared_comp_name '
               end
    || ' ,' || p_column_to_evaluate || ' as current_value'
    || ' ,''' || initcap(replace(p_operand,'_',' ')) || ' ' || nvl(replace(p_val_char,':',', '),p_val_number) || ''' as valid_values';

    l_result := build_apex_view_result_sql(
      p_operand                => p_operand,
      p_case_sensitive_yn      => p_case_sensitive_yn,
      p_column_to_evaluate     => p_column_to_evaluate,
      p_val_char               => p_val_char,
      p_val_number             => p_val_number,
      p_rule_criteria_type_id  => p_rule_criteria_type_id,
      p_application_id         => p_application_id,
      p_rule_criteria_type_key => p_rule_criteria_type_key
    );

    l_sql := l_sql || l_result;
    l_sql := l_sql
      || ' from ' || p_view_name
      || ' where 1=1'
      || ' and application_id = ' || p_application_id
      || case
           when p_page_id is not null and p_impact not in ('APP', 'SC')
             then ' and page_id = ' || p_page_id
           else null
         end;

    l_sql := l_sql || ' ' || p_additional_where;

    return l_sql;
  end build_apex_view_sql;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: B U I L D _ C U S T O M _ Q U E R Y _ S Q L
----------------------------------------------------------------------------------------------------------------------------
-- Builds full dynamic SQL for CUSTOM_QUERY rule evaluation
----------------------------------------------------------------------------------------------------------------------------
-- build_custom_query_sql
-- purpose: prepare executable SQL for CUSTOM_QUERY rules by resolving supported placeholders.
-- behavior: replaces #EVAL_ID#, #APP_ID#, and #RULE_ID# tokens, wraps the query,
--   and enforces application/page filtering to keep result scope aligned with runtime context.
-- parameters:
--   p_custom_query    - query template containing supported placeholders.
--   p_eval_id         - eval id token value used for #EVAL_ID# replacement.
--   p_application_id  - application id token value and enforced filter value.
--   p_page_id         - optional page filter applied when impact is not APP/SC.
--   p_rule_id         - rule id token value used for #RULE_ID# replacement.
--   p_impact          - rule impact code used to decide whether page filter applies.
-- returns:
--   varchar2 - executable SELECT statement for insertion into eval_results.
-- usage:
--   l_sql := eval_pkg.build_custom_query_sql(
--      p_custom_query    => l_row.custom_query,
--      p_eval_id         => p_eval_id,
--      p_application_id  => p_application_id,
--      p_page_id         => p_page_id,
--      p_rule_id         => l_row.rule_id,
--      p_impact          => l_row.impact
--   );
----------------------------------------------------------------------------------------------------------------------------
function build_custom_query_sql(
    p_custom_query    in varchar2,
    p_eval_id         in number,
    p_application_id  in number,
    p_page_id         in number,
    p_rule_id         in number,
    p_impact          in varchar2 )
    return varchar2
  as
    l_sql  varchar2(32765);
  begin
    l_sql := replace(p_custom_query, '#EVAL_ID#', p_eval_id);
    l_sql := replace(l_sql, '#APP_ID#', p_application_id);
    l_sql := replace(l_sql, '#RULE_ID#', p_rule_id);

    return ' select * from (' || l_sql || ' ) where application_id = ' || p_application_id ||
      case
        when p_page_id is not null and p_impact not in ('APP', 'SC')
          then ' and page_id = ' || p_page_id
        else null
      end;
  end build_custom_query_sql;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: B U I L D _ E V A L _ R E S U L T S _ I N S E R T _ S Q L
----------------------------------------------------------------------------------------------------------------------------
-- Wraps a result SELECT query with eval_results INSERT prefix
----------------------------------------------------------------------------------------------------------------------------
-- build_eval_results_insert_sql
-- purpose: prepend the standard eval_results insert column list to a generated SELECT statement.
-- behavior: returns static insert-into prefix concatenated with caller-provided SQL.
-- parameters:
--   p_sql - SELECT statement that projects eval_results-compatible columns.
-- returns:
--   varchar2 - full insert statement ready for execute immediate.
-- usage:
--   l_sql := eval_pkg.build_eval_results_insert_sql(p_sql => l_sql);
----------------------------------------------------------------------------------------------------------------------------
function build_eval_results_insert_sql(
    p_sql in varchar2 )
    return varchar2
  as
  begin
    return 'insert into eval_results (eval_id, rule_id, application_id, page_id, component_id, component_name, column_name, item_name, shared_comp_name, current_value, valid_values, result) '
      || p_sql;
  end build_eval_results_insert_sql;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: M A R K _ S T A L E _ E X C E P T I O N S
----------------------------------------------------------------------------------------------------------------------------
-- Marks exceptions as STALE when evaluated values have changed
----------------------------------------------------------------------------------------------------------------------------
-- mark_stale_exceptions
-- purpose: identify exceptions tied to p_eval_id where current values no longer match the latest evaluation results.
-- behavior: compares composite exception identity columns and uses sert_util.match_string_yn for value comparison;
--   updates matching exception rows to result = 'STALE'.
-- parameters:
--   p_eval_id - eval id whose current result set is used as the comparison baseline.
-- usage:
--   eval_pkg.mark_stale_exceptions(p_eval_id => p_eval_id);
----------------------------------------------------------------------------------------------------------------------------
procedure mark_stale_exceptions(
    p_eval_id in number )
  as
  begin
    update exceptions
       set result = 'STALE'
     where exception_id in (
             select e.exception_id
               from eval_results_v er,
                    exceptions     e
              where er.rule_set_id     || ':'
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
                and sert_core.sert_util.match_string_yn(e.current_value, er.current_value) = 'N'
                and er.eval_id = p_eval_id
           );
  end mark_stale_exceptions;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: C O M P L E T E _ E V A L
----------------------------------------------------------------------------------------------------------------------------
-- Finalizes evaluation status and recalculates score metrics
----------------------------------------------------------------------------------------------------------------------------
-- complete_eval
-- purpose: complete an evaluation lifecycle step after rule processing has finished.
-- behavior: sets evals status/timestamps/user to completed values and invokes calc_score.
-- parameters:
--   p_eval_id - eval id to finalize.
-- usage:
--   eval_pkg.complete_eval(p_eval_id => p_eval_id);
----------------------------------------------------------------------------------------------------------------------------
procedure complete_eval(
    p_eval_id in number )
  as
  begin
    update evals
       set job_status   = 'COMPLETED',
           eval_on_date = sysdate,
           eval_on      = systimestamp,
           eval_by      = coalesce(sys_context('APEX$SESSION','APP_USER'), user)
     where eval_id = p_eval_id;

    calc_score(p_eval_id => p_eval_id);
  end complete_eval;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: C A P T U R E _ E V A L _ H I S T O R Y
----------------------------------------------------------------------------------------------------------------------------
-- Persists evaluation snapshot data into history tables
----------------------------------------------------------------------------------------------------------------------------
-- capture_eval_history
-- purpose: store point-in-time evaluation metadata and optional result details for audit/reporting.
-- behavior: when p_log_eval_history is true, inserts one eval_history row for p_eval_id;
--   when p_log_eval_result_history is also true, inserts associated eval_results_history detail rows.
-- parameters:
--   p_eval_id                 - source eval id whose snapshot is being captured.
--   p_rule_set_id             - rule set id used to enrich history with rule set metadata.
--   p_application_id          - application id used for logging context.
--   p_log_eval_history        - controls whether eval_history row is inserted.
--   p_log_eval_result_history - controls whether eval_results_history detail rows are inserted.
-- usage:
--   eval_pkg.capture_eval_history(
--      p_eval_id                 => p_eval_id,
--      p_rule_set_id             => p_rule_set_id,
--      p_application_id          => p_application_id,
--      p_log_eval_history        => l_log_eval_history,
--      p_log_eval_result_history => l_log_eval_result_history
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure capture_eval_history(
    p_eval_id                 in number,
    p_rule_set_id             in number,
    p_application_id          in number,
    p_log_eval_history        in boolean,
    p_log_eval_result_history in boolean )
  as
    l_eval_history_id  number;
  begin
    if ( p_log_eval_history ) then
      log_pkg.log(
        p_log            => 'Capturing evaluation history',
        p_log_key        => g_log_key,
        p_log_type       => g_log_type,
        p_application_id => p_application_id
      );
      for c_eval in (
        select e.*,
              rs.rule_set_name,
              rs.rule_set_key,
              rs.apex_version
          from evals e,
              rule_sets rs
         where e.rule_set_id = rs.rule_set_id
           and rs.rule_set_id = p_rule_set_id
           and e.eval_id = p_eval_id
      )
      loop
        insert into eval_history (
          workspace_id,
          application_id,
          rule_set_name,
          rule_set_key,
          apex_version,
          eval_on,
          eval_on_date,
          eval_by,
          summary,
          score,
          pending_score,
          approved_score
        )
        values (
          c_eval.workspace_id,
          c_eval.application_id,
          c_eval.rule_set_name,
          c_eval.rule_set_key,
          c_eval.apex_version,
          c_eval.eval_on,
          c_eval.eval_on_date,
          c_eval.eval_by,
          c_eval.summary,
          c_eval.score,
          c_eval.pending_score,
          c_eval.approved_score
        )
        returning eval_history_id into l_eval_history_id;

        if ( p_log_eval_result_history ) then
          insert into eval_results_history (
            eval_history_id,
            rule_name,
            rule_key,
            category_name,
            category_key,
            page_id,
            component_name,
            item_name,
            column_name,
            shared_comp_name,
            result,
            current_value,
            valid_values
          )
          select l_eval_history_id,
                r.rule_name,
                r.rule_key,
                c.category_name,
                c.category_key,
                er.page_id,
                er.component_name,
                er.item_name,
                er.column_name,
                er.shared_comp_name,
                er.result,
                er.current_value,
                er.valid_values
            from eval_results er,
                rules       r,
                categories  c
          where er.eval_id = p_eval_id
            and er.rule_id = r.rule_id
            and r.category_id = c.category_id;
        end if;
      end loop;
    end if;
  end capture_eval_history;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: E N R I C H _ E V A L _ R E S U L T S _ N A M E S
----------------------------------------------------------------------------------------------------------------------------
-- Enriches eval_results with page and region display names
----------------------------------------------------------------------------------------------------------------------------
-- enrich_eval_results_names
-- purpose: populate human-readable page and region names in eval_results after raw result capture.
-- behavior: merges page names from apex_application_pages and region names from
--   apex_application_page_regions / apex_application_page_items depending on row context.
-- parameters:
--   p_eval_id        - eval id identifying eval_results rows to enrich.
--   p_application_id - application id used to query APEX dictionary views.
-- usage:
--   eval_pkg.enrich_eval_results_names(
--      p_eval_id        => p_eval_id,
--      p_application_id => p_application_id
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure enrich_eval_results_names(
    p_eval_id        in number,
    p_application_id in number )
  as
  begin
    log_pkg.log(
      p_log            => 'Evaluation merge section start',
      p_log_key        => g_log_key,
      p_log_type       => g_log_type,
      p_application_id => p_application_id
    );

    merge into sert_core.eval_results er
    using (
      select page_id, page_name
        from apex_application_pages
       where application_id = p_application_id
    ) np
       on (np.page_id = er.page_id and er.eval_id = p_eval_id)
     when matched then update set er.page_name = np.page_name;

    merge into sert_core.eval_results er
    using (
      select region_id, region_name
        from apex_application_page_regions
       where application_id = p_application_id
    ) np
       on (np.region_id = er.component_id and er.eval_id = p_eval_id and er.item_name is null)
     when matched then update set er.region_name = np.region_name;

    merge into sert_core.eval_results er
    using (
      select item_id, region
        from apex_application_page_items
       where application_id = p_application_id
    ) np
       on (np.item_id = er.component_id and er.eval_id = p_eval_id and er.item_name is not null)
     when matched then update set er.region_name = np.region;

    log_pkg.log(
      p_log            => 'Evaluation merge section end',
      p_log_key        => g_log_key,
      p_log_type       => g_log_type,
      p_application_id => p_application_id
    );
  end enrich_eval_results_names;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: P R O C E S S _ R U L E S
----------------------------------------------------------------------------------------------------------------------------
-- Executes all active rules for a given evaluation and rule set
----------------------------------------------------------------------------------------------------------------------------
-- process_rules
-- change history:
--   ssasanka   03-jul-2025   capture all pages and regions in a hash map to improve performance.
-- purpose: run rule evaluation for one eval id and persist generated findings into eval_results.
-- behavior: fetches active rules in p_rule_set_id, builds executable SQL per rule type,
--   applies page/impact scoping via should_execute_rule, logs diagnostic SQL context,
--   executes insert statements for matching rows, then performs post-processing steps:
--   mark stale exceptions, complete and score the evaluation, capture optional history,
--   and enrich result rows with page/region names.
--   On unhandled exceptions, writes an UNHANDLED log entry and marks eval as FAILED.
-- parameters:
--   p_application_id - application id being evaluated.
--   p_page_id        - optional page id filter; null processes all pages in-scope.
--   p_eval_id        - target eval id receiving generated eval_results rows.
--   p_rule_set_id    - rule set id whose active rules are executed.
-- usage:
--   eval_pkg.process_rules(
--      p_application_id => p_application_id,
--      p_page_id        => p_page_id,
--      p_eval_id        => p_eval_id,
--      p_rule_set_id    => l_rule_set_id
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure process_rules(
    p_application_id in number,
    p_page_id        in number default null,
    p_eval_id        in number,
    p_rule_set_id    in number )
  as
    cursor c_rules is
      select r.*
        from rules r,
             rule_set_rules rsr
       where r.rule_id = rsr.rule_id
         and rsr.rule_set_id = p_rule_set_id
         and r.active_yn = 'Y';

    l_row                     c_rules%rowtype;
    l_sql                     varchar2(32765);
    l_rule_criteria_type_key  varchar2(250);
    l_log_eval_history        boolean;
    l_log_eval_result_history boolean;
  begin
    l_log_eval_history        := prefs_api.pref_true('LOG_EVAL_HISTORY');
    l_log_eval_result_history := prefs_api.pref_true('LOG_EVAL_RESULT_HISTORY');

    -- start the evaluation
    log_pkg.log(
      p_log            => 'Evaluation started',
      p_log_key        => g_log_key,
      p_log_type       => g_log_type,
      p_application_id => p_application_id
    );

    -- Open the rules cursor and iterate through every active rule in the selected rule set.
    open c_rules;
    loop

      -- Fetch next rule and terminate the loop when all rows have been processed.
      fetch c_rules into l_row;
      exit when c_rules%notfound;

      -- record which rule is being evaluated
      log_pkg.log(
        p_log            => 'Evaluating rule ' || l_row.rule_name || ' (' || l_row.rule_key || ')',
        p_id             => l_row.rule_id,
        p_id_col         => 'rule_id',
        p_log_key        => g_log_key,
        p_log_type       => g_log_type,
        p_application_id => p_application_id
      );

      -- Build rule SQL according to rule_type.
      case
        when l_row.rule_type = 'APEX_VIEW' then
          -- APEX_VIEW rules are generated from metadata-driven view definitions.
          l_rule_criteria_type_key := null;
          l_sql := build_apex_view_sql(
            p_eval_id                => p_eval_id,
            p_application_id         => p_application_id,
            p_page_id                => p_page_id,
            p_rule_id                => l_row.rule_id,
            p_impact                 => l_row.impact,
            p_component_id           => l_row.component_id,
            p_component_name         => l_row.component_name,
            p_column_name            => l_row.column_name,
            p_item_name              => l_row.item_name,
            p_shared_comp_name       => l_row.shared_comp_name,
            p_column_to_evaluate     => l_row.column_to_evaluate,
            p_operand                => l_row.operand,
            p_val_char               => l_row.val_char,
            p_val_number             => l_row.val_number,
            p_case_sensitive_yn      => l_row.case_sensitive_yn,
            p_rule_criteria_type_id  => l_row.rule_criteria_type_id,
            p_view_name              => l_row.view_name,
            p_additional_where       => l_row.additional_where,
            p_rule_criteria_type_key => l_rule_criteria_type_key
          );

        when l_row.rule_type = 'CUSTOM_QUERY' then
          -- CUSTOM_QUERY rules use author-provided SQL templates with token replacement.
          l_sql := build_custom_query_sql(
            p_custom_query    => l_row.custom_query,
            p_eval_id         => p_eval_id,
            p_application_id  => p_application_id,
            p_page_id         => p_page_id,
            p_rule_id         => l_row.rule_id,
            p_impact          => l_row.impact
          );
      end case; -- l_row.rule_type

      -- Log execution context and generated criteria key before statement execution.
      log_pkg.log(
        p_log_key        => g_log_key,
        p_log            => 'pre exec immediate page_id = ' || p_page_id || '; rule_id ' || l_row.rule_id
                            || chr(10) || 'l_row.rule_type =' || l_row.rule_type
                            || chr(10) || 'eval_criteria(p_column_to_evaluate => ' || l_row.column_to_evaluate || ', p_rule_criteria_type_key => ' || l_rule_criteria_type_key
                            || chr(10),
        p_log_type       => 'EVAL',
        p_id             => l_row.rule_id,
        p_id_col         => 'rule_id',
        p_application_id => p_application_id
      );

      -- Wrap the generated SELECT in the standard eval_results INSERT statement.
      l_sql := build_eval_results_insert_sql(p_sql => l_sql);

      -- Log the final dynamic SQL for troubleshooting and audit visibility.
      log_pkg.log(
        p_log_key        => g_log_key,
        p_log            => 'SQL for Rule ' || l_row.rule_name || ' (' || l_row.rule_key || ')',
        p_log_type       => 'EVAL',
        p_log_clob       => l_sql,
        p_id             => l_row.rule_id,
        p_id_col         => 'rule_id',
        p_application_id => p_application_id
      );

      -- Execute only when rule scope matches the requested run context.
      if should_execute_rule(
           p_page_id => p_page_id,
           p_impact  => l_row.impact
         )
      then
        execute immediate l_sql;
      end if; -- should_execute_rule(...)

      -- Reset buffer before processing the next rule iteration.
      l_sql := null;
    end loop; -- rule iteration loop

    -- Close cursor before post-processing actions.
    close c_rules;

    -- Complete post-processing after all rule rows are captured.
    mark_stale_exceptions(p_eval_id => p_eval_id);
    complete_eval(p_eval_id => p_eval_id);
    capture_eval_history(
      p_eval_id                 => p_eval_id,
      p_rule_set_id             => p_rule_set_id,
      p_application_id          => p_application_id,
      p_log_eval_history        => l_log_eval_history,
      p_log_eval_result_history => l_log_eval_result_history
    );
    enrich_eval_results_names(
      p_eval_id        => p_eval_id,
      p_application_id => p_application_id
    );

    log_pkg.log(
      p_log            => 'Evaluation completed',
      p_log_key        => g_log_key,
      p_log_type       => g_log_type,
      p_application_id => p_application_id
    );

  exception
    when others then
      -- Log and mark failed status for any unhandled processing error.
      log_pkg.log(
        p_log            => 'An unhandled error has occured',
        p_log_key        => g_log_key,
        p_log_type       => 'UNHANDLED',
        p_application_id => p_application_id
      );

      update evals
         set job_status = 'FAILED'
       where eval_id = p_eval_id;
  end process_rules;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: E V A L
----------------------------------------------------------------------------------------------------------------------------
-- Main evaluation procedure that will run and record an evaluation
----------------------------------------------------------------------------------------------------------------------------
-- eval
-- purpose: orchestrate an evaluation run for an application/rule-set, optionally in the background.
-- behavior: resolves rule_set_id and workspace_id; creates a new eval record when p_eval_id is null (removing older
--   evals for the same app/rule-set) else reuses and clears prior results (optionally only for a page);
-- if p_run_in_background = 'Y', schedules dbms_scheduler job to call process_rules and marks job RUNNING;
-- otherwise calls process_rules inline.
-- parameters:
--   p_application_id    - target application id to evaluate.
--   p_page_id           - optional page id for partial evaluation; null runs across all applicable pages.
--   p_eval_id           - existing eval id to reuse; null creates a fresh eval record.
--   p_rule_set_key      - business key identifying which rule set/version to execute.
--   p_eval_by           - username stored as evaluator in evals.
--   p_run_in_background - 'Y' schedules dbms_scheduler execution, otherwise runs inline.
--   p_eval_id_out       - out parameter returning the eval id created/reused for this run.
-- notes: updates evals.job_status and timestamps; logs errors and marks FAILED on exception.
-- usage:
--   eval_pkg.eval(
--      p_application_id    => :APP_ID,
--      p_page_id           => null,
--      p_eval_id           => null,
--      p_rule_set_key      => 'INTERNAL',
--      p_eval_by           => :APP_USER,
--      p_run_in_background => 'Y',
--      p_eval_id_out       => l_eval_id
--   );
----------------------------------------------------------------------------------------------------------------------------
procedure eval(
    p_application_id    in number,
    p_page_id           in number   default null,
    p_eval_id           in number   default null,
    p_rule_set_key      in varchar2 default 'INTERNAL',
    p_eval_by           in varchar2 default coalesce(sys_context('APEX$SESSION','APP_USER'), user),
    p_run_in_background in varchar2 default 'Y',
    p_eval_id_out       out number )
  as
    l_rule_set_id  rule_sets.rule_set_id%type;
    l_eval_id      evals.eval_id%type;
    l_workspace_id number;
    l_job_name     varchar2(250);
  begin
    -- set logging
    -- validate_exceptions_api();
    select pref_value
      into log_pkg.g_log_evals
      from prefs
     where pref_key = 'LOG_EVALUATIONS';
    -- log_pkg.g_log_eval_history := prefs_api.pref_value('LOG_EVAL_HISTORY');
    -- set the log_key
    apex_util.set_session_state('G_LOG_KEY', g_log_key);

    -- get the rule_set_id
    select rule_set_id
      into l_rule_set_id
      from rule_sets
     where rule_set_key = p_rule_set_key
       and apex_version = (select apex_version from apex_version_v);

    -- get the workspace_id
    select workspace_id
      into l_workspace_id
      from apex_applications
     where application_id = p_application_id;

    -- create a new evaluation if eval_id is null
    if p_eval_id is null then

      -- delete any older evals for that application / rule set combination
      delete from evals
       where application_id = p_application_id
         and rule_set_id = l_rule_set_id;

      insert into evals (
        application_id,
        workspace_id,
        rule_set_id,
        eval_on,
        eval_by,
        job_name,
        eval_on_date
      )
      values (
        p_application_id,
        l_workspace_id,
        l_rule_set_id,
        systimestamp,
        p_eval_by,
        l_job_name,
        sysdate
      )
      returning eval_id into p_eval_id_out;

    else

      -- set the local variable to one that was passed in
      p_eval_id_out := p_eval_id;

      -- if evaluating for a page only, remove that page from the current eval; otherwise remove the full eval
      if p_page_id is not null then

        delete from eval_results
         where eval_id = p_eval_id_out
           and page_id = p_page_id;

      else

        delete from eval_results
         where eval_id = p_eval_id_out;

      end if; -- p_page_id is not null

    end if; -- p_eval_id is null

    if p_run_in_background = 'Y' then
      -- set the evaluation to run in the background
      l_job_name := 'SERT_BACKGROUND_' || to_char(p_application_id) || '_' || replace(p_rule_set_key,'-','_') || '_' || to_char(p_eval_id_out);

      dbms_scheduler.create_job(
        job_name  => l_job_name,
        job_type  => 'PLSQL_BLOCK',
        job_action => 'declare l_eval_id number; begin
          eval_pkg.process_rules
            (
            p_application_id => ' || p_application_id ||
              case when p_page_id is not null then '
            ,p_page_id       => ' || p_page_id else null end || '
            ,p_eval_id        => ' || p_eval_id_out || '
            ,p_rule_set_id    => ' || l_rule_set_id || '
            );
          end;',
              start_date => systimestamp,
              enabled    => true
      );

      -- update the evaluation record with the job_name and status
      update evals
         set job_name = l_job_name,
             job_status = 'RUNNING',
             eval_on = systimestamp,
             eval_on_date = sysdate
       where eval_id = p_eval_id_out;

    else
      -- process all rules for the rule set in real time
      process_rules(
        p_application_id => p_application_id,
        p_page_id        => p_page_id,
        p_eval_id        => p_eval_id_out,
        p_rule_set_id    => l_rule_set_id
      );

    end if; -- p_run_in_background = 'Y'
  exception
    when others then
      log_pkg.log(p_log => 'An unhandled error has occured', p_log_key => g_log_key, p_log_type => 'UNHANDLED');
      update evals
         set job_status = 'FAILED'
       where eval_id = p_eval_id_out;
      raise;
  end eval;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: D E L E T E _ E V A L
----------------------------------------------------------------------------------------------------------------------------
-- Delete an evaluation
----------------------------------------------------------------------------------------------------------------------------
-- delete_eval
-- purpose: delete an evaluation and optionally associated comments/exceptions for the same app/workspace/rule_set.
-- behavior: when p_delete_comments = 'Y', deletes from comments and exceptions based on the application/workspace/rule_set
--   context of the eval; then deletes the eval row itself.
-- parameters:
--   p_eval_id         - eval id to delete.
--   p_delete_comments - 'Y' also deletes matching comments and exceptions; 'N' removes only eval row.
-- usage:
--   eval_pkg.delete_eval(p_eval_id => p_eval_id, p_delete_comments => 'Y');
----------------------------------------------------------------------------------------------------------------------------
procedure delete_eval(
    p_eval_id         in number,
    p_delete_comments in varchar2 default 'Y' )
  as
  begin
    -- delete all comments and exceptions, if selected
    if p_delete_comments = 'Y' then

      for c_eval in (select * from evals where eval_id = p_eval_id)
      loop

        delete from comments
         where rule_set_id || workspace_id || application_id = c_eval.rule_set_id || c_eval.workspace_id || c_eval.application_id;

        delete from exceptions
         where rule_set_id || workspace_id || application_id = c_eval.rule_set_id || c_eval.workspace_id || c_eval.application_id;

      end loop; -- for c_eval in (select * from evals ...)

    end if; -- p_delete_comments = 'Y'

    -- delete the evaluation
    delete from evals
     where eval_id = p_eval_id;
  end delete_eval;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: A P E X _ L I N K
----------------------------------------------------------------------------------------------------------------------------
-- Generates the link to the APEX Builder
----------------------------------------------------------------------------------------------------------------------------
-- apex_link
-- purpose: produce a Builder link attribute (data-link=...) and related data-* attributes for a result row.
-- behavior: when a builder url template is present, builds page/workflow link replacing component id; for Task components,
--   constructs a link to the Task Definitions page using apex_page.get_url and prepares it via apex_util.prepare_url;
--   otherwise returns a default data-* attributes string when no template exists.
-- parameters:
--   p_eval_result_id     - eval_results primary key used to resolve rule and component link metadata.
--   p_builder_session_id - active APEX builder session id used to construct navigable builder URLs.
-- returns:
--   varchar2 - HTML data-* attribute string containing data-link and related metadata for UI navigation.
-- usage:
--   l_link_attr := eval_pkg.apex_link(
--      p_eval_result_id     => er.eval_result_id,
--      p_builder_session_id => :G_BUILDER_SESSION_ID
--   );
----------------------------------------------------------------------------------------------------------------------------
function apex_link(
    p_eval_result_id     in number,
    p_builder_session_id in number )
    return varchar2
  as
    l_data_link varchar2(1000);
    l_task      varchar2(1) := 'N';
    l_url       varchar2(1000);
  begin
    -- loop through a row to get the required link attributes
    for c_link in (
      select er.application_id,
             er.page_id,
             er.component_id,
             r.view_name,
             bu.data_type_id,
             bu.data_link
        from eval_results er,
             rules_pub_v  r,
             builder_urls bu
       where er.eval_result_id = p_eval_result_id
         and er.rule_id = r.rule_id
         and r.builder_url_id = bu.builder_url_id(+)
    )
    loop

      if c_link.data_link is null then

        return 'data-link=""'
          || ' data-appid="'       || c_link.application_id || '" '
          || ' data-pageid="'      || nvl(c_link.page_id,0) || '" '
          || ' data-typeid="'      || c_link.data_type_id   || '" '
          || ' data-componentid="' || c_link.component_id   || '" '
          || ' data-designer="'    || case when c_link.data_type_id in (8820,8830,8840,8850,8860) then 'workflow' else 'page' end || '"';

      else
        -- check if scan item is a Task
        begin
          select 'Y'
            into l_task
            from apex_appl_taskdefs
           where task_def_id = c_link.component_id
             and application_id = c_link.application_id;
        exception
          when others then
            l_task := 'N';
        end;

        if l_task = 'Y' then
          -- For Task do this special code.
          -- ATM We cannot get to individual task.
          -- Instead, we prepare a Task list link.
          -- Uncomment to work on individual task link.

          l_url := apex_page.get_url(
            p_application        => 'app-builder',
            p_page               => 'task-definitions', -- 'edit-task-definition'
            p_session            => p_builder_session_id,
            p_request            => null,
            p_debug              => null,
            p_clear_cache        => null, -- 'RP,9502',
            p_items              => null, -- 'p9502_id',
            p_values             => null, -- c_link.component_id,  -- c_link.component_id||','||c_link.application_id
            p_printer_friendly   => null,
            p_trace              => null,
            p_triggering_element => 'this',
            p_plain_url          => true
          );

          l_url := replace(l_url,'/sert/apex_sert/r','');
          l_url := apex_util.prepare_url(p_url => l_url, p_checksum_type => 'SESSION');
          l_url := 'data-link="' || l_url  || '"';
          return l_url;

        else
          -- non Task link
          return 'data-link="' || 'r/apex/app-builder/' || replace(c_link.data_link, '#COMPONENT_ID#', c_link.component_id)
                 || '&fb_flow_id=' || c_link.application_id || '&session=' || p_builder_session_id || '"';

        end if; -- l_task = 'Y'

      end if; -- c_link.data_link is null

    end loop; -- for c_link in (result context)
  end apex_link;

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end eval_pkg;
/
--rollback not required
