--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.eval_history_pub_v_1721804350397 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
create or replace view sert_core.eval_history_pub_v
as
select
   eval_history_id
  ,workspace_id
  ,application_id
  ,rule_set_name
  ,rule_set_key
  ,apex_version
  ,eval_on
  ,eval_on_date
  ,eval_by
  ,summary
  ,score
  ,pending_score
  ,approved_score
from
  eval_history
/
--rollback not required
