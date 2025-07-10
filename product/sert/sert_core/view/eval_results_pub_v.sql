--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.eval_results_pub_v_1721804342058 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace force view sert_core.eval_results_pub_v
as
select
   er.eval_result_id
  ,er.eval_id
  ,er.rule_id
  ,er.rule_set_id
  ,r.rule_name
  ,er.workspace_id
  ,er.application_id
  ,er.page_id
  ,case when er.page_id is not null then er.page_id || ': ' || er.page_name else null end as page
  ,case when er.page_id is null then 'Shared Component' else er.page_name end as page_name
  ,case when er.page_id is not null then er.page_id || ' - ' || er.page_name else 'Shared Component' end as full_page_name
  ,case when r.impact = 'SC' then shared_comp_type || case when shared_comp_type is not null then ' / ' else null end || shared_comp_name else null end
    || case when er.page_id is not null then er.page_id || ': '  || er.page_name else null end
    || case when er.region_name       is not null then ' / ' || er.region_name else null end
    || case when er.component_name is not null then ' / ' || er.component_name else null end
    || case when er.column_name       is not null then ' / ' || er.column_name else null end
    || case when er.item_name         is not null then ' / ' || case when er.region_name is null then null else er.region_name || ' / ' end || item_name   else null end
   as description
  ,r.view_name
  ,er.component_id
  ,er.component_name
  ,er.region_name as region_name
  ,er.column_name
  ,er.shared_comp_name
  ,r.shared_comp_type
  ,er.item_name
  ,r.category_name
  ,r.category_key
  ,nvl(er.current_value, 'None') as current_value
  ,er.exception_value
  ,case when er.valid_values = 'Criteria' then rule_criteria_type_name else er.valid_values end as valid_values
  ,er.result
  ,case
    when er.result = 'PENDING' then 'warning'
    when er.result in ('APPROVED', 'PASS') then 'success'
    else 'danger'
    end as result_color
  ,nvl(er.reason, 'n/a')  as reason
  ,case when er.comment_cnt = 0 then null else er.comment_cnt end as comment_cnt
  ,case when er.comment_cnt > 0 then 'fa fa-comments-o' else null end comment_icon
  ,case when er.exception_cnt > 0 then null else er.exception_cnt end as exception_cnt
  ,er.created_by
  ,er.created_on
  ,er.updated_by
  ,er.updated_on
  ,risk_name
  ,risk_url
  ,case
    when risk_url is null then nvl(risk_name, 'n/a')
    else '<a href="' || apex_escape.html(risk_url) || '">' || apex_escape.html(risk_name) || '</a>'
    end as risk
  ,help_url
  ,impact
  ,nvl(rule_criteria_type_name, 'n/a') as rule_criteria_type_name
  ,r.rule_severity_id
  ,r.rule_severity_name
  ,r.rule_severity_key
from
   eval_results_v er
  ,rules_pub_v r
where 1=1
  and er.rule_id = r.rule_id
/
--rollback not required
