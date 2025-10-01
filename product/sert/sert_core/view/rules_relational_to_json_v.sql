--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.rules_relational_to_json_v_1721804198841 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace force view sert_core.rules_relational_to_json_v
as
select
   max (rownum) as num_rows
  ,json_arrayagg
    (
    json_object
      (
         'ruleName'             is rule_name
        ,'ruleKey'              is rule_key
        ,'categoryName'         is category_name
        ,'categoryKey'          is category_key
        ,'riskCode'             is risk_code
        ,'riskName'             is risk_name
        ,'apexVersion'          is apex_version
        ,'helpUrl'              is help_url
        ,'builderUrlKey'        is builder_url_key
        ,'impact'               is impact
        ,'activeYN'             is active_yn
        ,'internalYN'           is internal_yn
        ,'ruleType'             is rule_type
        ,'viewName'             is view_name
        ,'columnToEvaluate'     is column_to_evaluate
        ,'componentId'          is component_id
        ,'componentName'        is component_name
        ,'columnName'           is column_name
        ,'itemName'             is item_name
        ,'sharedCompName'       is shared_comp_name
        ,'operand'              is operand
        ,'valChar'              is val_char
        ,'valNumber'            is val_number
        ,'caseSensitiveYN'      is case_sensitive_yn
        ,'ruleCriteriaTypeKey'  is rule_criteria_type_key
        ,'additionalWhere'      is additional_where
        ,'customQuery'          is custom_query
        ,'info'                 is info
        ,'fix'                  is fix
        ,'timeToFix'            is time_to_fix
        ,'validExceptions'      is valid_exceptions
        ,'ruleSeverityName'     is rule_severity_name
        ,'ruleSeverityKey'      is rule_severity_key
        ,'description'          is description
        ,'createdBy'            is created_by
        ,'createdOn'            is null
        ,'updatedBy'            is updated_by
        ,'updatedOn'            is null
      returning clob
      ) order by apex_version,rule_key  returning clob
  ) as json_doc
from
  rules_v
/
--rollback not required
