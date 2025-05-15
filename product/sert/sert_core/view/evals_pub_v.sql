--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.evals_pub_v_1721804240211 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace force view sert_core.evals_pub_v
as
with exception_cnt as
(
select
  er.eval_id
 ,sum(cnt) as cnt
from
  exception_cnt_v ec,
  eval_results_v er
where
  er.eval_result_id = ec.eval_result_id(+)
  and er.result = 'PENDING'
group by
  er.eval_id
),
  apex_version as (select v('G_APEX_VERSION') as version from dual)
  ,low_score  as (select pref_value as val from prefs where pref_key = 'LOW_SCORE_VALUE')
  ,high_score as (select pref_value as val from prefs where pref_key = 'HIGH_SCORE_VALUE')
select
   e.eval_id
  ,e.workspace_id
  ,e.workspace
  ,e.application_id
  ,e.application_name
  ,e.application_id || ' : ' || e.application_name as title
  ,e.last_updated_on
  ,e.rule_set_id
  ,e.rule_set_name
  ,e.rule_set_key
  ,e.rule_set_active_yn
  ,'Rule Set: ' || rule_set_name as rule_set
  ,e.eval_on
  ,e.eval_on_date
  ,e.eval_by
  ,'Evaluated ' || apex_util.get_since(eval_on) || ' by ' || eval_by
    || case when eval_on_date < last_updated_on then ' / Application updated ' || apex_util.get_since(eval_on_date + (last_updated_on - eval_on_date)) else null end
    as eval_by_long
  ,(select max(file_name)
      from APEX_APPLICATION_STATIC_FILES
     where application_id = e.application_id
       and FILE_NAME LIKE 'icons/app-icon-512.png') as app_icon
  ,'r/' || workspace || '/' || application_id || '/files/static/v6/icons/app-icon-512.png' as app_image
  ,case
    when eval_on_date < last_updated_on then 'Stale'
    when e.apex_version != apex_version.version then 'Stale Rules'
    else initcap(job_status)
   end as job_status
  ,case
    when eval_on_date < last_updated_on then 'danger'
    when e.apex_version != apex_version.version then 'danger'
    when upper(job_status) = 'COMPLETED' then 'success'
    when upper(job_status) = 'FAILED' then 'danger'
    when upper(job_status) = 'RUNNING' then 'warning'
    else null end as job_status_css
  ,case when score is null then 0 else score end as score
  ,e.pending_score
  ,e.approved_score
  ,case
    when score < low_score.val then 'danger'
    when score between low_score.val and high_score.val then 'warning'
    when score >= high_score.val then 'success'
    else null
   end as score_css
  ,e.summary
  ,e.job_name
  ,nvl(ec.cnt,0) as exception_cnt
  ,e.apex_version
  ,e.created_by
  ,e.created_on
  ,e.updated_by
  ,e.updated_on
from
   evals_v e
  ,exception_cnt ec
  ,low_score
  ,high_score
  ,apex_version
where 1=1
  and e.eval_id = ec.eval_id(+)
/
--rollback not required
