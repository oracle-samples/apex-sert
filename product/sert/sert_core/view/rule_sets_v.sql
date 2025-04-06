--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.rule_sets_v_1721804187590 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
create or replace force view sert_core.rule_sets_v
as
with cnt as (select rule_set_id, sum(rule_hash) as rule_set_hash, count(*) cnt from rule_set_rules_v group by rule_set_id)
    ,av as (select apex_version_item as apex_version from apex_version_v)
select
   rs.rule_set_id
  ,rs.rule_set_type_id
  ,rst.rule_set_type_name
  ,rst.rule_set_type_key
  ,rs.rule_set_name
  ,rs.rule_set_key
  ,rs.apex_version
  ,rs.active_yn
  ,case
    when rs.apex_version != av.apex_version then 'warning'
    when rs.active_yn = 'Y' then 'success'
    else 'danger'
   end active_color
  ,case
    when rs.apex_version != av.apex_version then 'Stale'
    when rs.active_yn = 'Y' then 'Active'
    else 'Inactive'
   end active_value
  ,rs.internal_yn
  ,rs.description
  ,rs.created_by
  ,rs.created_on
  ,rs.updated_by
  ,rs.updated_on
  ,nvl(cnt.cnt,0) as cnt
  ,rule_set_hash
from
   rule_sets rs
  ,rule_set_types rst
  ,cnt
  ,av
where
  rs.rule_set_type_id = rst.rule_set_type_id
  and rs.rule_set_id = cnt.rule_set_id(+)
/
--rollback not required
