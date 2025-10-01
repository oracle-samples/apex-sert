--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.eval_exception_count_v endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace force view sert_core.eval_exception_count_v
as
  with er_key as
(
select
      er.eval_id
   ,  er.eval_result_id
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
  ,sert_core.evals e
where
  e.eval_id = er.eval_id
),
e as
(
select
   exception_id
   ,result
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
)
select
    er_key.eval_id
  , e.result
  , count(e.exception_id) as cnt
from
   e
  ,er_key
  ,eval_results er
where
  er_key.key = e.key(+)
  and er.eval_result_id = er_key.eval_result_id
group by
   er_key.eval_id
   ,e.result
/
--rollback not required
