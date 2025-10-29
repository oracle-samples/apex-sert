--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.comments_pub_v_1721804356169 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
-- View: sert_core.comments_pub_v
-- Purpose: public-safe projection of comments limited to the current workspace; escapes comment text for HTML display.
-- Method: selects from comments_v, applies apex_escape.html to comments, and filters by workspace_id = nv('G_WORKSPACE_ID').

create or replace force view sert_core.comments_pub_v as
select
  c.comment_id
  ,apex_escape.html(c.comments) as comments
  ,c.rule_set_id
  ,c.rule_id
  ,c.workspace_id
  ,c.application_id
  ,c.page_id
  ,c.component_id
  ,c.component_name
  ,c.column_name
  ,c.shared_comp_name
  ,c.item_name
  ,c.created_on
  ,c.created_by
  ,c.updated_on
  ,c.updated_by
from
  comments_v c
where
  workspace_id = (select nv('G_WORKSPACE_ID') from dual)
/
--rollback not required
