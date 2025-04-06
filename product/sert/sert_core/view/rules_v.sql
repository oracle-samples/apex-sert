--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.rules_v_1721804204840 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
create or replace force view sert_core.rules_v
as
with av as (select apex_version_item as apex_version from apex_version_v)
select
   r.rule_id
  ,r.rule_name
  ,r.rule_key
  ,r.category_id
  ,r.risk_id
  ,k.risk_code
  ,k.risk_name
  ,k.risk_code || ' - ' || k.risk_name as risk
  ,k.url as risk_url
  ,c.category_name
  ,c.category_key
  ,r.apex_version
  ,r.help_url
  ,r.builder_url_id
  ,bu.builder_url_key
  ,r.impact
  ,r.active_yn
  ,case
    when r.impact = 'SC' then 'Shared Component'
    else initcap(r.impact)
    end as impact_rpt
  ,case
    when r.apex_version != av.apex_version then 'warning'
    when r.active_yn = 'Y' then 'success'
    else 'danger'
   end active_color
  ,case
    when r.apex_version != av.apex_version then 'Stale'
    when r.active_yn = 'Y' then 'Active'
    else 'Inactive'
   end active_value
  ,r.internal_yn
  ,r.rule_type
  ,r.view_name
  ,r.column_to_evaluate
  ,r.component_id
  ,r.component_name
  ,r.column_name
  ,r.item_name
  ,r.shared_comp_name
  ,r.operand
  ,case
     when r.rule_type = 'CUSTOM_QUERY' then 'Custom Query'
     when r.operand = 'CRITERIA' then ct.rule_criteria_type_name
     else initcap(replace(r.operand,'_', ' '))
   end
   || case
       when val_char is not null then ' ' || replace(val_char, ':', ', ')
       when val_number is not null then ' ' || to_char(val_number)
       else null end
   as operand_rpt
  ,r.val_char
  ,r.val_number
  ,r.case_sensitive_yn
  ,r.additional_where
  ,r.custom_query
  ,r.info
  ,r.fix
  ,r.time_to_fix
  ,r.rule_severity_id
  ,rs.rule_severity_name
  ,rs.rule_severity_key
  ,rs.seq as rule_severity_seq
  ,ct.rule_criteria_type_name
  ,ct.rule_criteria_type_key
  ,case
    when rs.rule_severity_key = 'HIGH' then 'danger'
    when rs.rule_severity_key = 'MEDIUM' then 'warning'
    when rs.rule_severity_key = 'LOW' then 'success'
    else null
   end as rule_severity_badge
  ,sc.shared_comp_type
  ,r.description
  ,r.created_by
  ,r.created_on
  ,r.updated_by
  ,r.updated_on
  ,ora_hash
    (
       r.rule_name
    || r.rule_key
    || r.apex_version
    || r.view_name
    || r.column_to_evaluate
    || r.component_id
    || r.column_name
    || r.item_name
    || r.shared_comp_name
    || r.operand
    || r.val_char
    || r.val_number
    || r.case_sensitive_yn
    || r.rule_criteria_type_id
    || r.additional_where
    || r.custom_query
    || r.component_name
    ) as rule_hash
from
  rules r
  ,categories_v c
  ,rule_severity rs
  ,risks k
  ,rule_criteria_types ct
  ,shared_comp_views sc
  ,builder_urls bu
  ,av
where
  r.category_id = c.category_id
  and r.rule_criteria_type_id = ct.rule_criteria_type_id(+)
  and r.rule_severity_id = rs.rule_severity_id
  and r.risk_id = k.risk_id(+)
  and r.view_name = sc.shared_comp_view(+)
  and r.builder_url_id = bu.builder_url_id(+)
--  and r.apex_version = av.apex_version(+)
/
--rollback not required
