--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_pub.exceptions_pub_v_1722223785585 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
create or replace force view sert_pub.exceptions_pub_v
as
select
   e.exception_id
  ,e.exception
  ,e.rule_set_id
  ,e.rule_id
  ,e.workspace_id
  ,e.application_id
  ,e.page_id
  ,e.component_id
  ,e.component_name
  ,e.column_name
  ,e.shared_comp_name
  ,e.item_name
  ,e.current_value
  ,e.exception_key
  ,e.result
  ,e.reason
  ,e.valid_exceptions
  ,e.exception_score
  ,e.exception_score_reason
  ,e.exception_color
  ,e.created_on
  ,e.created_by
  ,e.updated_on
  ,e.updated_by
  ,e.actioned_by
  ,e.actioned_on
from
  sert_core.exceptions_pub_v e
;
--rollback not required
