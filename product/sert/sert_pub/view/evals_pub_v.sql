--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_pub.evals_pub_v_1722223775768 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
create or replace force view sert_pub.evals_pub_v
as
select
   eval_id
  ,workspace_id
  ,workspace
  ,application_id
  ,application_name
  ,title
  ,last_updated_on
  ,rule_set_id
  ,rule_set_name
  ,rule_set_key
  ,rule_set
  ,rule_set_active_yn
  ,eval_on
  ,eval_on_date
  ,eval_by
  ,eval_by_long
  ,app_image
  ,summary
  ,job_name
  ,job_status
  ,job_status_css
  ,score
  ,score_css
  ,pending_score
  ,approved_score
  ,exception_cnt
  ,apex_version
  ,created_by
  ,created_on
  ,updated_by
  ,updated_on
from
  sert_core.evals_pub_v e
;
--rollback not required
