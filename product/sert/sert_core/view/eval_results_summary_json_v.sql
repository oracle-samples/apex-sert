--liquibase formatted sql

--changeset mzimon:create_view_eval_results_summary_json_v endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
 create or replace force view sert_core.eval_results_summary_json_v ("APPLICATION_ID", "JSON_DOC") as
  select eva.application_id,
        json_serialize(
                        json_object('application_id'   value eva.application_id,
                                    'application_name' value eva.application_name,
                                    'workspace_id'     value eva.workspace_id,
                                    'rule_set_key'     value eva.rule_set_key,
                                    'result'           value eva2.application_result,
                                    'passed_count'     value eva2.passed_points,
                                    'failed_count'     value (eva2.total_points - eva2.passed_points)
                                    returning clob
                                    )
        returning clob pretty)
from sert_core.evals_v eva,
    (select eva3.application_id,
            eva3.total_points,
            eva3.passed_points,
            case
            when eva3.total_points - eva3.passed_points = 0 then 'pass'
            else 'fail'
            end application_result
     from (select
              application_id,
              sum(case
                  when result in ('PASS','APPROVED') then 1
                  else 0
                 end) passed_points,
              count(eval_result_id) total_points
           from sert_core.eval_results_pub_v group by application_id) eva3
    ) eva2
where eva.application_id = eva2.application_id
/
--rollback not required