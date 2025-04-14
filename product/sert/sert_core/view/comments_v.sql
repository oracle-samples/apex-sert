--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.comments_v_1721804353244 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
create or replace force view sert_core.comments_v
as
select
   c.comment_id
  ,c.rule_set_id
  ,c.rule_id
  ,c.workspace_id
  ,c.application_id
  ,c.page_id
  ,c.component_id
  ,c.component_name
  ,c.column_name
  ,c.item_name
  ,c.shared_comp_name
  ,c.comments
  ,c.created_on
  ,c.created_by
  ,c.updated_on
  ,c.updated_by
from
  comments c
/
--rollback not required
