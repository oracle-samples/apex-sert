--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.exceptions_json_to_rel_v_1721804290818 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
-- View: sert_core.exceptions_json_to_rel_v
-- Purpose:
--   Produce a canonical JSON document of all exception rows per (application_id, rule_set_id)
--   based on sert_core.exceptions_v. Returns one row per group with a CLOB JSON array in json_doc.
-- Columns:
--   application_id - APEX application identifier for the group.
--   rule_set_id    - SERT rule set identifier for the group.
--   num_rows       - Number of exception rows aggregated for the group.
--   json_doc       - CLOB containing a JSON array where each element represents a single exception
--                    with fields: ruleSetKey, ruleKey, apexVersion, exception, workspaceId,
--                    applicationId, pageId, componentId, columnName, itemName, sharedCompName,
--                    result, reason, exceptionScore, exceptionScoreReason, currentValue, createdBy,
--                    createdOn, updatedBy, updatedOn, actionedBy, actionedOn, componentName, checksum.
-- Notes:
--   - Textual columns are cast to CLOB and exception text is escaped via utl_i18n.escape_reference
--     to preserve special characters in JSON.
--   - json_object / json_arrayagg / json_serialize use 'returning clob' to ensure a CLOB payload.
create or replace force view sert_core.exceptions_json_to_rel_v as
select
  application_id
 ,rule_set_id
 ,max(rownum) as num_rows
 ,json_serialize(
    json_arrayagg(
      json_object(
        'ruleSetKey'            is rule_set_key
       ,'ruleKey'               is rule_key
       ,'apexVersion'           is apex_version
       ,'exception'             is to_clob(utl_i18n.escape_reference(exception))
       ,'workspaceId'           is workspace_id
       ,'applicationId'         is application_id
       ,'pageId'                is page_id
       ,'componentId'           is component_id
       ,'columnName'            is column_name
       ,'itemName'              is item_name
       ,'sharedCompName'        is shared_comp_name
       ,'result'                is to_clob(result)
       ,'reason'                is to_clob(reason)
       ,'exceptionScore'        is exception_score
       ,'exceptionScoreReason'  is exception_score_reason
       ,'currentValue'          is to_clob(current_value)
       ,'createdBy'             is created_by
       ,'createdOn'             is created_on
       ,'updatedBy'             is updated_by
       ,'updatedOn'             is updated_on
       ,'actionedBy'            is actioned_by
       ,'actionedOn'            is actioned_on
       ,'componentName'         is to_clob(component_name)
       ,'checksum'              is checksum
        returning clob
      )
      format json returning clob
    )
    returning clob
  ) as json_doc
from
  sert_core.exceptions_v
group by
  application_id
 ,rule_set_id
/
--rollback not required
