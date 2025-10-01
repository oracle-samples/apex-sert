--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mzimon:create_view_sert_core.eval_results_exc_pub_v endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace force view sert_core.eval_results_exc_pub_v
as
  select er.EVAL_RESULT_ID
       ,er.EVAL_ID
       ,er.RULE_SET_ID
       ,er.WORKSPACE_ID
       ,er.APPLICATION_ID
       ,er.PAGE_ID
       ,er.PAGE_NAME
       ,er.PAGE
       ,er.FULL_PAGE_NAME
       ,er.DESCRIPTION
       ,er.REGION_NAME
       ,er.COMPONENT_ID
       ,er.COMPONENT_NAME
       ,er.COLUMN_NAME
       ,er.ITEM_NAME
       ,er.SHARED_COMP_NAME
       ,er.SHARED_COMP_TYPE
       ,er.CATEGORY_NAME
       ,er.CATEGORY_KEY
       ,er.CURRENT_VALUE
       ,er.EXCEPTION_VALUE
       ,er.VALID_VALUES
       ,er.RESULT
       ,er.RESULT_COLOR
       ,er.REASON
       ,er.RULE_ID
       ,er.RULE_NAME
       ,er.RISK_NAME
       ,er.RISK_URL
       ,er.RISK
       ,er.HELP_URL
       ,er.IMPACT
       ,er.RULE_CRITERIA_TYPE_NAME
       ,er.COMMENT_CNT
       ,er.COMMENT_ICON
       ,er.CREATED_BY
       ,er.CREATED_ON
       ,er.UPDATED_BY
       ,er.UPDATED_ON
       ,ep.exception_score
       ,ep.exception_color
       ,ep.exception_score_reason
       ,ep.exception_id
       ,ep.created_by exception_created_by
       ,ep.actioned_by exception_actioned_by
       ,ep.exception_key
       ,ep.exception exception_justification
       ,ep.reason exception_reason
       ,case
          when er.result = 'PENDING' and ep.exception_id is not null and ep.created_by <> sys_context( 'APEX$SESSION' ,'APP_USER' )
            then 'fa-star fa-lg'
          else null
        end as pending_icon
       ,case when ep.exception_id is not null and er.result='PENDING'
             then 'Raised by '||ep.created_by
           when exception_id is not null and er.result='APPROVED'
             then  'Approved by '||ep.actioned_by
           else null
        end as exception_description
       ,er.rule_severity_id
       ,er.rule_severity_name
       ,er.rule_severity_key
  from sert_core.EVAL_RESULTS_PUB_V er,
  sert_core.exceptions_pub_v ep
  where
        ( ep.rule_set_id(+) || ':' ||
          ep.rule_id(+) || ':' ||
          ep.workspace_id(+) || ':' ||
          ep.application_id(+)  || ':' ||
          ep.page_id(+)         || ':' ||
          ep.component_id(+)    || ':' ||
          ep.item_name(+)       || ':' ||
          ep.column_name(+)     || ':' ||
          ep.shared_comp_name(+)
         =
          er.rule_set_id || ':' ||
          er.rule_id || ':' ||
          er.workspace_id || ':' ||
          er.application_id  || ':' ||
          er.page_id         || ':' ||
          er.component_id    || ':' ||
          er.item_name       || ':' ||
          er.column_name     || ':' ||
          er.shared_comp_name
        )
/
--rollback not required
