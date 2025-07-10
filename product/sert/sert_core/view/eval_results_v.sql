--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.eval_results_v_1721804236611 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace force view sert_core.eval_results_v
as
with
  comment_cnt   as (select * from comment_cnt_v)
 ,exception_cnt as (select result as result2, cnt, current_value, eval_result_id from exception_cnt_v)
select
   case
     when jt.result = 'PASS' then jt.result
     else nvl(exception_cnt.result2, jt.result)
   end as result
  ,listagg(jt.reason, ', ') as reason
  ,er.eval_id
  ,er.eval_result_id
  ,e.rule_set_id
  ,e.workspace_id
  ,er.application_id
  ,er.page_id
  ,er.page_name
  ,er.component_id
  ,er.component_name
  ,er.region_name
  ,er.column_name
  ,er.item_name
  ,er.shared_comp_name
  ,dbms_lob.substr(er.current_value,3999,1) as current_value
  ,er.valid_values
  ,er.created_by
  ,er.created_on
  ,er.updated_by
  ,er.updated_on
  ,er.rule_id
  ,comment_cnt.cnt as comment_cnt
  ,exception_cnt.cnt as exception_cnt
  ,exception_cnt.current_value as exception_value
from
   eval_results er
  ,evals e
  ,comment_cnt
  ,exception_cnt
  ,json_table(result, '$' columns
     (
       nested path '$.reasons[*]'
         columns
           (
           reason varchar2(4000) path '$.reason'
           ),
         result varchar2(100) path '$.result'
     )
   ) jt
where
  e.eval_id = er.eval_id
  and er.eval_result_id = comment_cnt.eval_result_id(+)
  and er.eval_result_id = exception_cnt.eval_result_id(+)
group by
   case
     when jt.result = 'PASS' then jt.result
     else nvl(exception_cnt.result2, jt.result)
   end
  ,er.eval_id
  ,er.eval_result_id
  ,e.rule_set_id
  ,e.workspace_id
  ,er.application_id
  ,er.page_id
  ,er.page_name
  ,er.component_id
  ,er.component_name
  ,er.region_name
  ,er.column_name
  ,er.item_name
  ,er.shared_comp_name
  ,dbms_lob.substr(er.current_value,3999,1)
  ,er.valid_values
  ,er.created_by
  ,er.created_on
  ,er.updated_by
  ,er.updated_on
  ,er.rule_id
  ,comment_cnt.cnt
  ,exception_cnt.cnt
  ,exception_cnt.current_value
/
--rollback not required
