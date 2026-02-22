--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.rules_by_exception_v endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
-- View: sert_core.rules_by_exception_v
-- Purpose: Present each rule evaluation with its rule and category, including the
--          derived result, application, and workspace identifiers for reporting.
-- Method:  json_table extracts the result value from er.result JSON; joins rules,
--          categories, eval_results, and evals; projects a concise set of columns.

create or replace force editionable view sert_core.rules_by_exception_v as
with er_key as
(
select
      er.eval_id
   ,  er.eval_result_id
   , jt.result er_result
   ,  e.rule_set_id     || ':'
   || er.rule_id        || ':'
   || e.workspace_id    || ':'
   || er.application_id || ':'
   || er.page_id        || ':'
   || er.component_id   || ':'
   || er.component_name || ':'
   || er.item_name      || ':'
   || er.column_name    || ':'
   || er.shared_comp_name
      as key
from
    sert_core.eval_results er
  , sert_core.evals_v e
  , json_table( er.result,
                '$' columns ( result varchar2(100) path '$.result' )
    ) jt
where
  e.eval_id = er.eval_id
),
e as
(
select
   exc.exception_id
   ,exc.result
   ,exc.current_value
   ,exc.rule_id
   ,exc.created_by
   ,exc.application_id
   ,exc.workspace_id
   ,exc.exception as justification
   ,  exc.rule_set_id    || ':'
   || exc.rule_id        || ':'
   || exc.workspace_id   || ':'
   || exc.application_id || ':'
   || exc.page_id        || ':'
   || exc.component_id   || ':'
   || exc.component_name || ':'
   || exc.item_name      || ':'
   || exc.column_name    || ':'
   || exc.shared_comp_name
      as key,
  rul.rule_name
from
  sert_core.exceptions exc,
  sert_core.rules rul
where exc.rule_id = rul.rule_id
and exc.result = 'PENDING'
)
select
   er_key.eval_id,
   e.rule_id ,
   e.rule_name ,
   r.rule_key,
   r.category_name ,
   e.application_id ,
   e.workspace_id,
   e.created_by,
   e.result as exception_result,
   er_key.er_result as scan_result
from
   e
  ,er_key
  ,sert_core.rules_v r
where
  er_key.key = e.key
  and r.rule_id = e.rule_id
/
-- rollback not required
