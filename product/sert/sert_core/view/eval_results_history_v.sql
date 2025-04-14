--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.eval_results_history_v_1721804346648 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
create or replace view sert_core.eval_results_history_v as
select
   eval_results_history_id
  ,eval_history_id
  ,rule_name
  ,rule_key
  ,category_name
  ,category_key
  ,application_id
  ,page_id
  ,component_name
  ,item_name
  ,column_name
  ,shared_comp_name
  ,result
  ,current_value
  ,valid_values
  ,apex_version
from
  (
  select
     er.eval_results_history_id
    ,er.eval_history_id
    ,er.rule_name
    ,er.rule_key
    ,er.category_name
    ,er.category_key
    ,e.application_id
    ,er.page_id
    ,er.component_name
    ,er.item_name
    ,er.column_name
    ,er.shared_comp_name
    ,j.result
    ,er.current_value
    ,er.valid_values
    ,e.apex_version
  from
     eval_results_history er
    ,eval_history e
    ,json_table
      (
       er.result
      ,'$[*]'
     columns
        (
         result varchar path '$.result'
        )
      ) j
  where
    e.eval_history_id = er.eval_history_id
  )
/
--rollback not required
