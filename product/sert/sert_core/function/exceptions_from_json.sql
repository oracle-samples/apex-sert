--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset tschafer:create_function_exceptions_from_json stripComments:false endDelimiter:/ runOnChange:true rollbackEndDelimiter:/
create or replace function sert_core.exceptions_from_json
  (
   p_exceptions in blob
  )
return varchar2 sql_macro
as
begin
  return q'|

  select
     j.rule_set_key
    ,j.rule_key
    ,j.apex_version
    ,j.exception
    ,j.workspace_id
    ,j.application_id
    ,j.page_id
    ,j.component_id
    ,j.column_name
    ,j.item_name
    ,j.shared_comp_name
    ,j.result
    ,j.reason
    ,j.current_value
    ,j.created_by
    ,j.created_on
    ,j.updated_by
    ,j.updated_on
    ,j.actioned_by
    ,j.actioned_on
    ,j.component_name
    ,j.checksum
  from
    json_table
      (
      p_exceptions
      ,'$[*]'
     columns
        (
         rule_set_key           varchar path  '$.ruleSetKey'
        ,rule_key               varchar path  '$.ruleKey'
        ,apex_version           number  path  '$.apexVersion'
        ,exception              varchar path  '$.exception'
        ,workspace_id           number  path  '$.workspaceId'
        ,application_id         number  path  '$.applicationId'
        ,page_id                number  path  '$.pageId'
        ,component_id           number  path  '$.componentId'
        ,column_name            varchar path  '$.columnName'
        ,item_name              varchar path  '$.itemName'
        ,shared_comp_name       varchar path  '$.sharedCompName'
        ,result                 varchar path  '$.result'
        ,reason                 varchar path  '$.reason'
        ,current_value          varchar path  '$.currentValue'
        ,created_by             varchar path  '$.createdBy'
        ,created_on             varchar path  '$.createdOn'
        ,updated_by             varchar path  '$.updatedBy'
        ,updated_on             varchar path  '$.updatedOn'
        ,actioned_by            varchar path  '$.actionedBy'
        ,actioned_on            varchar path  '$.actionedOn'
        ,component_name         varchar path  '$.componentName'
        ,checksum               number path  '$.checksum'
        )
      ) j

  |';
end exceptions_from_json;
/
--rollback not required
