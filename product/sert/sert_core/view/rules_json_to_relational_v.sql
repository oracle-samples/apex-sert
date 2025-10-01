--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.rules_json_to_relational_v_1721804191191 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace force view sert_core.rules_json_to_relational_v as
select
   j.rule_name
  ,j.rule_key
  ,j.category_name
  ,j.category_key
  ,j.risk_code
  ,j.risk_name
  ,j.apex_version
  ,j.help_url
  ,j.builder_url_key
  ,j.impact
  ,j.active_yn
  ,j.internal_yn
  ,j.rule_type
  ,j.view_name
  ,j.column_to_evaluate
  ,j.component_id
  ,j.component_name
  ,j.column_name
  ,j.item_name
  ,j.shared_comp_name
  ,j.operand
  ,j.val_char
  ,j.val_number
  ,j.case_sensitive_yn
  ,j.rule_criteria_type_key
  ,j.additional_where
  ,j.custom_query
  ,j.info
  ,j.fix
  ,j.time_to_fix
  ,j.valid_exceptions
  ,j.rule_severity_name
  ,j.rule_severity_key
  ,j.description
  ,j.created_by
  ,j.created_on
  ,j.updated_by
  ,j.updated_on
  ,f.name
from
  apex_application_temp_files f
  ,json_table
    (
    f.blob_content
    ,'$[*]'
   columns
      (
       rule_name              varchar path '$.ruleName'
      ,rule_key               varchar path '$.ruleKey'
      ,category_name          varchar path '$.categoryName'
      ,category_key           varchar path '$.categoryKey'
      ,risk_code              varchar path '$.riskCode'
      ,risk_name              varchar path '$.riskName'
      ,apex_version           number  path '$.apexVersion'
      ,help_url               varchar path '$.helpUrl'
      ,builder_url_key        varchar path '$.builderUrlKey'
      ,impact                 varchar path '$.impact'
      ,active_yn              varchar path '$.activeYN'
      ,internal_yn            varchar path '$.internalYN'
      ,rule_type              varchar path '$.ruleType'
      ,view_name              varchar path '$.viewName'
      ,column_to_evaluate     varchar path '$.columnToEvaluate'
      ,component_id           varchar path '$.componentId'
      ,component_name         varchar path '$.componentName'
      ,column_name            varchar path '$.columnName'
      ,item_name              varchar path '$.itemName'
      ,shared_comp_name       varchar path '$.sharedCompName'
      ,operand                varchar path '$.operand'
      ,val_char               varchar path '$.valChar'
      ,val_number             number  path '$.valNumber'
      ,case_sensitive_yn      varchar path '$.caseSensitiveYN'
      ,rule_criteria_type_key varchar path '$.ruleCriteriaTypeKey'
      ,additional_where       varchar path '$.additionalWhere'
      ,custom_query           varchar path '$.customQuery'
      ,info                   varchar path '$.info'
      ,fix                    varchar path '$.fix'
      ,time_to_fix            varchar path '$.timeToFix'
      ,valid_exceptions       varchar path '$.validExceptions'
      ,rule_severity_name     varchar path '$.ruleSeverityName'
      ,rule_severity_key      varchar path '$.ruleSeverityKey'
      ,description            varchar path '$.description'
      ,created_by             varchar path '$.createdBy'
      ,created_on             date    path '$.createdOn'
      ,updated_by             varchar path '$.updatedBy'
      ,updated_on             date    path '$.updatedOn'
      )
    ) j
/
--rollback not required
