--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mzimon:create_view_sert_core.exceptions_json_to_relational_v_1721804191192 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace force view sert_core.exceptions_json_to_relational_v as
select
     j.rule_set_key
    ,j.rule_key
    ,j.apex_version
    ,utl_i18n.unescape_reference(j.exception) as exception
    ,j.workspace_id
    ,j.application_id
    ,j.page_id
    ,j.component_id
    ,j.column_name
    ,j.item_name
    ,j.shared_comp_name
    ,j.result
    ,case
        when j.result in ('PENDING') then 'warning'
        when j.result in ('APPROVED') then 'success'
        when j.result in ('REJECTED','STALE') then 'danger'
        else 'info' end as result_color
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
    ,f.name
from
  apex_application_temp_files f
  ,json_table
    (
    f.blob_content
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
/
--rollback not required
