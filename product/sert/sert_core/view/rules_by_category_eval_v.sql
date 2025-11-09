--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.rules_by_category_eval_v endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
-- View: sert_core.rules_by_category_eval_v
-- Purpose: Present each rule evaluation with its rule and category, including the
--          derived result, application, and workspace identifiers for reporting.
-- Method:  json_table extracts the result value from er.result JSON; joins rules,
--          categories, eval_results, and evals; projects a concise set of columns.

create or replace force editionable view sert_core.rules_by_category_eval_v as
with
ex as
(
select
   exception_id
   ,result ex_result
   ,current_value
   ,exception as justification
   ,  rule_set_id    || ':'
   || rule_id        || ':'
   || workspace_id   || ':'
   || application_id || ':'
   || page_id        || ':'
   || component_id   || ':'
   || component_name || ':'
   || item_name      || ':'
   || column_name    || ':'
   || shared_comp_name
      as key
from
  sert_core.exceptions
),
ev as (
  select
     er.eval_id
    ,r.rule_id
    ,r.rule_name
    ,r.rule_key
    ,r.category_id
    ,c.category_name
    ,jt.result ev_result
    ,er.application_id
    ,e.workspace_id
    , e.rule_set_id    || ':'
   || er.rule_id        || ':'
   || e.workspace_id   || ':'
   || er.application_id || ':'
   || er.page_id        || ':'
   || er.component_id   || ':'
   || er.component_name || ':'
   || er.item_name      || ':'
   || er.column_name    || ':'
   || er.shared_comp_name key

  from
     sert_core.rules r
    ,sert_core.categories c
    ,sert_core.eval_results er
    ,sert_core.evals e
    ,json_table(er.result, '$' columns (
        result varchar2(100) path '$.result'
      )
     ) jt
  where
        c.category_id = r.category_id
    and er.rule_id    = r.rule_id
    and e.eval_id     = er.eval_id
  )
select eval_id
  ,rule_id
  ,rule_name
  ,rule_key
  ,category_id
  ,category_name
  ,case
    when ev.ev_result = 'PASS' then ev.ev_result
    else nvl(ex.ex_result, ev.ev_result)
    end as result
  ,application_id
  ,workspace_id
from ex,
    ev
where ex.key(+) = ev.key
/
--rollback not required
