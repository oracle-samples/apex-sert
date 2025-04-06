--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.comments_api_1721803496824 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.comments_api
as

-- PROCEDURE: A D D _ C O M M E N T
procedure add_comment
  (
   p_rule_set_id      in number
  ,p_rule_id          in number
  ,p_workspace_id     in number
  ,p_application_id   in number
  ,p_page_id          in number   default null
  ,p_component_id     in varchar2 default null
  ,p_component_name   in varchar2 default null
  ,p_column_name      in varchar2 default null
  ,p_item_name        in varchar2 default null
  ,p_shared_comp_name in varchar2 default null
  ,p_comments         in varchar2
  )
is
begin

insert into comments
  (
   rule_set_id
  ,rule_id
  ,workspace_id
  ,application_id
  ,page_id
  ,component_id
  ,component_name
  ,column_name
  ,item_name
  ,shared_comp_name
  ,comments
  )
values
  (
   p_rule_set_id
  ,p_rule_id
  ,p_workspace_id
  ,p_application_id
  ,p_page_id
  ,p_component_id
  ,p_component_name
  ,p_column_name
  ,p_item_name
  ,p_shared_comp_name
  ,p_comments
  );

end add_comment;

procedure delete_comment
  (
   p_comment_id in number
  ,p_created_by in varchar2 default v('APP_USER')
  )
is
begin

delete from comments where comment_id = p_comment_id and created_by = p_created_by;

end delete_comment;

end comments_api;
/
--rollback not required
