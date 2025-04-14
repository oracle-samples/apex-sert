--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.rule_criteria_types_v_1721804170157 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
create or replace force view sert_core.rule_criteria_types_v
as
select
   rule_criteria_type_id
  ,rule_criteria_type_name
  ,rule_criteria_type_key
  ,active_yn
  ,case when active_yn = 'Y' then 'Active' else 'Inactive' end as active_value
  ,case when active_yn = 'Y' then 'success' else 'danger' end as active_color
  ,internal_yn
  ,description
  ,created_by
  ,created_on
  ,updated_by
  ,updated_on
from
  rule_criteria_types
/
--rollback not required
