--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_pub.eval_results_pub_v_1722223761550 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
create or replace force view sert_pub.eval_results_pub_v
as
select
   eval_result_id
  ,eval_id
  ,rule_set_id
  ,workspace_id
  ,application_id
  ,page_id
  ,page_name
  ,page
  ,full_page_name
  ,description
  ,region_name
  ,component_id
  ,component_name
  ,column_name
  ,item_name
  ,shared_comp_name
  ,shared_comp_type
  ,category_name
  ,category_key
  ,current_value
  ,exception_value
  ,valid_values
  ,result
  ,result_color
  ,reason
  ,rule_id
  ,rule_name
  ,risk_name
  ,risk_url
  ,risk
  ,help_url
  ,impact
  ,rule_criteria_type_name
  ,comment_cnt
  ,comment_icon
  ,created_by
  ,created_on
  ,updated_by
  ,updated_on
from
   sert_core.eval_results_pub_v
;
--rollback not required
