--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.exceptions_v_1721804304583 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
create or replace force view sert_core.exceptions_v
as
select
   e.exception_id
  ,e.rule_set_id
  ,rs.rule_set_key
  ,e.rule_id
  ,r.rule_key
  ,rs.apex_version
  ,e.workspace_id
  ,e.application_id
  ,e.page_id
  ,e.component_id
  ,e.component_name
  ,e.column_name
  ,e.item_name
  ,e.shared_comp_name
  ,e.current_value
  ,e.exception
  ,e.result
  ,e.reason
  ,e.created_on
  ,e.created_by
  ,e.updated_on
  ,e.updated_by
  ,e.actioned_by
  ,e.actioned_on
  ,ora_hash
    (
    r.rule_key
    || e.page_id
    || e.component_name
    || e.column_name
    || e.item_name
    || e.shared_comp_name
    || e.current_value
    || e.exception
    || e.result
    || e.reason
    || e.created_by
    || e.updated_by
    || e.actioned_by
    ) as checksum
from
   exceptions e
  ,rules r
  ,rule_sets rs
where
  e.rule_id = r.rule_id
  and e.rule_set_id = rs.rule_set_id
/
--rollback not required
