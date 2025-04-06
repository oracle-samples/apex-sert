--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.rule_criteria_v_1721804175111 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
create or replace force view sert_core.rule_criteria_v
as
select
   rc.rule_criteria_id
  ,rc.rule_criteria_name
  ,rc.rule_criteria_key
  ,rc.rule_criteria_type_id
  ,rct.rule_criteria_type_name
  ,rct.rule_criteria_type_key
  ,rc.rule_criteria_sql
  ,rc.reason
  ,rc.active_yn
  ,rc.internal_yn
  ,case when rc.active_yn = 'Y' then 'Active' else 'Inactive' end as active_value
  ,case when rc.active_yn = 'Y' then 'success' else 'danger' end as active_color
  ,rc.description
  ,rc.created_by
  ,rc.created_on
  ,rc.updated_by
  ,rc.updated_on
from
  rule_criteria rc
  ,rule_criteria_types rct
where
  rc.rule_criteria_type_id = rct.rule_criteria_type_id
/
--rollback not required
