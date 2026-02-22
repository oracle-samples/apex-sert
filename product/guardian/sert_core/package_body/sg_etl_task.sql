--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_package_body_sert_core.sg_etl_task endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
create or replace package body sert_core.sg_etl_task as

procedure load_sg_app_rule_fails_f (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    merge into sert_core.sg_app_rule_fails_f target
    using (
        select a.application_wid,
               r.rule_wid,
               res.result_wid,
               coalesce(pg.page_wid,0) as page_wid,
               fs.eval_id,
               fs.eval_result_id,
               fs.exception_id,
               fs.exception_reason
          from sert_core.sg_app_rule_fails_fs fs
          join sert_core.sg_applications_d a on (fs.application_id = a.application_id and fs.workspace_id = a.workspace_id)
          join sert_core.sg_rules_d r on (fs.rule_key = r.rule_key)
          join sert_core.sg_results_d res on ('FAIL' = res.eval_result and fs.final_result = res.final_result)
          left join sert_core.sg_application_pages_d pg on (fs.application_id = pg.application_id and fs.page_id = pg.page_id and fs.workspace_id = pg.workspace_id)
    ) source
    on (target.eval_result_id  = source.eval_result_id)
    when not matched then
        insert (
            application_wid,
            rule_wid,
            result_wid,
            page_wid,
            eval_id,
            eval_result_id,
            exception_id,
            exception_reason
        )
        values (
            source.application_wid,
            source.rule_wid,
            source.result_wid,
            source.page_wid,
            source.eval_id,
            source.eval_result_id,
            source.exception_id,
            source.exception_reason
       )
    when matched then
        update set
            target.result_wid       = source.result_wid,
            target.exception_id     = source.exception_id,
            target.exception_reason = source.exception_reason
        where
            target.result_wid       <> source.result_wid
         or (source.exception_reason is not null and source.exception_reason <> coalesce(target.exception_reason, '~][~') );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Successfully loaded %0 rows into %1', l_rows_changed, 'SG_APP_RULE_FAILS_F') );

end load_sg_app_rule_fails_f;

procedure del_sg_app_rule_fails_f_1 (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- Delete results for APEX applications that no longer exist
    delete sert_core.sg_app_rule_fails_f
     where application_wid in (
                select sa.application_wid
                  from sert_core.sg_applications_d sa
                  left join apex_applications a on (sa.workspace_id = a.workspace_id and sa.application_id = a.application_id)
                 where a.application_id is null );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Deleted %0 rows from %1 for APEX applications that no longer exist', l_rows_changed, 'SG_APP_RULE_FAILS_F') );

end del_sg_app_rule_fails_f_1;

procedure del_sg_app_rule_fails_f_2 (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- Delete SERT evaluations that no longer exist
    delete sert_core.sg_app_rule_fails_f f
     where not exists (
            select 1
              from sert_core.evals r
             where r.eval_id = f.eval_id
               and r.job_status = 'COMPLETED' );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Deleted %0 rows from %1 for SERT evaluations that no longer exist', l_rows_changed, 'SG_APP_RULE_FAILS_F') );

end del_sg_app_rule_fails_f_2;

procedure del_sg_app_rule_fails_f_3 (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- Delete SERT evaluation results that no longer exist
    delete sert_core.sg_app_rule_fails_f f
     where not exists (
            select 1
              from sert_core.eval_results r
             where r.eval_result_id = f.eval_result_id );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Deleted %0 rows from %1 for SERT evaluation results that no longer exist', l_rows_changed, 'SG_APP_RULE_FAILS_F') );

end del_sg_app_rule_fails_f_3;

procedure load_sg_app_rule_fails_fs (
    p_task_log_id in number,
    p_cutoff_date in date )
is
    l_rows_changed number := 0;
begin
    delete sert_core.sg_app_rule_fails_fs;

    -- Fetch evaluations that have been updated after the cutoff date,
    -- either as new evaluations, or by modifying the pending/approved scores.
    insert into sert_core.sg_app_rule_fails_fs (
        application_id,
        workspace_id,
        page_id,
        rule_key,
        eval_id,
        eval_result_id,
        exception_id,
        final_result,
        exception_reason
    )
    with data as (
        select er.eval_result_id,
               er.eval_id,
               r.rule_key,
               er.rule_id,
               e.rule_set_id,
               e.workspace_id,
               er.application_id,
               er.page_id,
               er.component_id,
               er.column_name,
               er.item_name
          from sert_core.eval_results er
          join sert_core.evals e on er.eval_id = e.eval_id
          join sert_core.rules r on er.rule_id = r.rule_id
         where e.job_status = 'COMPLETED'
           and e.updated_on >= p_cutoff_date
           and json_value(er.result, '$.result') = 'FAIL'
    )
    select d.application_id,
           d.workspace_id,
           d.page_id,
           d.rule_key,
           d.eval_id,
           d.eval_result_id,
           x.exception_id,
           coalesce(x.result, 'FAIL') final_result,
           x.exception exception_reason
      from data d
      left join sert_core.exceptions x on (
            -- UK must match result keys
                x.rule_set_id    = d.rule_set_id
            and x.rule_id        = d.rule_id
            and x.workspace_id   = d.workspace_id
            and x.application_id = d.application_id
                -- optional keys
            and (x.page_id      = d.page_id      or (x.page_id is null and d.page_id is null) )
            and (x.component_id = d.component_id or (x.component_id is null and d.component_id is null) )
            and (x.column_name  = d.column_name  or (x.column_name is null and d.column_name is null) )
            and (x.item_name    = d.item_name    or (x.item_name is null and d.item_name is null) ) );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Successfully loaded %0 rows into %1', l_rows_changed, 'SG_APP_RULE_FAILS_FS') );

end load_sg_app_rule_fails_fs;

procedure load_sg_agg_app_rule_results_f (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    merge into sert_core.sg_agg_app_rule_results_f target
    using (
        select a.application_wid,
               r.rule_wid,
               fs.eval_id,
               res.result_wid,
               fs.ct_findings
          from sert_core.sg_agg_app_rule_results_fs fs
          join sert_core.sg_applications_d a on (fs.application_id = a.application_id and fs.workspace_id = a.workspace_id)
          join sert_core.sg_rules_d r on (fs.rule_key = r.rule_key)
          join sert_core.sg_results_d res on (fs.eval_result = res.eval_result and fs.final_result = res.final_result)
    ) source
    on (target.application_wid = source.application_wid
        and target.rule_wid = source.rule_wid
        and target.eval_id = source.eval_id
        and target.result_wid = source.result_wid)
    when not matched then
        insert (
            application_wid,
            rule_wid,
            eval_id,
            result_wid,
            ct_findings
        )
        values (
            source.application_wid,
            source.rule_wid,
            source.eval_id,
            source.result_wid,
            source.ct_findings
        )
    when matched then
        update set
            target.ct_findings = source.ct_findings
        where
            target.ct_findings <> source.ct_findings;

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Successfully loaded %0 rows into %1', l_rows_changed, 'SG_AGG_APP_RULE_RESULTS_F') );

end load_sg_agg_app_rule_results_f;

procedure del_sg_agg_app_rule_results_f_1 (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- Delete results for apex applications that no longer exist
    delete sert_core.sg_agg_app_rule_results_f
     where application_wid in (
                select sa.application_wid
                  from sert_core.sg_applications_d sa
                  left join apex_applications a on (sa.workspace_id = a.workspace_id and sa.application_id = a.application_id)
                 where a.application_id is null );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Deleted %0 rows from %1 for apex applications that no longer exist', l_rows_changed, 'SG_AGG_APP_RULE_RESULTS_F') );

end del_sg_agg_app_rule_results_f_1;

procedure del_sg_agg_app_rule_results_f_2 (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- Delete applications with stale result combinations, e.g. No PENDING exceptions because converted to APPROVED/REJECTED
    delete sert_core.sg_agg_app_rule_results_f target
    where exists (
        -- 1. Ensure a result exists for the application and rule is present in the staging table (pre-filter)
        select 1
        from sert_core.sg_agg_app_rule_results_fs fs
        join sert_core.sg_applications_d a on (fs.application_id = a.application_id and fs.workspace_id = a.workspace_id)
        join sert_core.sg_rules_d r on (fs.rule_key = r.rule_key)
        join sert_core.sg_results_d res on (fs.eval_result = res.eval_result and fs.final_result = res.final_result)
        where
            a.application_wid = target.application_wid
        and r.rule_wid = target.rule_wid
        and fs.eval_id = target.eval_id
    )
    and not exists (
        -- 2. Ensure the result for the application and rule is not present in the staging table
        select 1
        from sert_core.sg_agg_app_rule_results_fs fs
        join sert_core.sg_applications_d a on (fs.application_id = a.application_id and fs.workspace_id = a.workspace_id)
        join sert_core.sg_rules_d r on (fs.rule_key = r.rule_key)
        join sert_core.sg_results_d res on (fs.eval_result = res.eval_result and fs.final_result = res.final_result)
        where
            a.application_wid = target.application_wid
        and r.rule_wid = target.rule_wid
        and fs.eval_id = target.eval_id
        and res.result_wid = target.result_wid
    );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Deleted %0 rows from %1 for applications with stale result combinations', l_rows_changed, 'SG_AGG_APP_RULE_RESULTS_F') );

end del_sg_agg_app_rule_results_f_2;


procedure load_sg_agg_app_rule_results_fs (
    p_task_log_id in number,
    p_cutoff_date in date )
is
    l_rows_changed number := 0;
begin
    delete sert_core.sg_agg_app_rule_results_fs;

    -- Fetch evaluations that have been updated after the cutoff date,
    -- either as new evaluations, or by modifying the pending/approved scores.
    insert into sert_core.sg_agg_app_rule_results_fs (
        application_id,
        workspace_id,
        rule_key,
        eval_id,
        eval_result,
        final_result,
        ct_findings
    )
    with data as (
        select er.eval_result_id,
               er.eval_id,
               r.rule_key,
               er.rule_id,
               e.rule_set_id,
               e.workspace_id,
               er.application_id,
               er.page_id,
               er.component_id,
               er.column_name,
               er.item_name,
               json_value(er.result, '$.result') eval_result
          from sert_core.eval_results er
          join sert_core.evals e on er.eval_id = e.eval_id
          join sert_core.rules r on er.rule_id = r.rule_id
         where e.job_status = 'COMPLETED'
           and e.updated_on >= p_cutoff_date
    ),
    final_data as (
        select d.eval_result_id,
               d.eval_id,
               d.rule_key,
               d.workspace_id,
               d.application_id,
               d.page_id,
               d.eval_result,
               case d.eval_result
                    when 'PASS' then 'PASS'
                    else coalesce((select result
                                     from sert_core.exceptions x
                                    where -- UK must match result keys
                                          x.rule_set_id    = d.rule_set_id
                                      and x.rule_id        = d.rule_id
                                      and x.workspace_id   = d.workspace_id
                                      and x.application_id = d.application_id
                                          -- optional keys
                                      and (x.page_id      = d.page_id      or (x.page_id is null and d.page_id is null) )
                                      and (x.component_id = d.component_id or (x.component_id is null and d.component_id is null) )
                                      and (x.column_name  = d.column_name  or (x.column_name is null and d.column_name is null) )
                                      and (x.item_name    = d.item_name    or (x.item_name is null and d.item_name is null)  )
                                  ), d.eval_result )
                    end as final_result
          from data d
    )
    select application_id, workspace_id, rule_key, eval_id, eval_result, final_result, count(*) ct_findings
      from final_data
     group by application_id, workspace_id, rule_key, eval_id, eval_result, final_result
     order by application_id, workspace_id, rule_key, eval_id, eval_result, final_result;

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Successfully loaded %0 rows into %1', l_rows_changed, 'SG_AGG_APP_RULE_RESULTS_FS') );

end load_sg_agg_app_rule_results_fs;


-- procedures from etl_sg_application_pages_d.sql
procedure del_sg_application_pages_d_1 (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- Delete pages that no longer exist
    -- Record with page_wid = 0 is the "unspecified" row.
    delete sert_core.sg_application_pages_d target
    where page_wid > 0
      and not exists (
           select 1
             from apex_application_pages source
            where source.workspace = target.workspace
              and source.application_id = target.application_id
              and source.page_id = target.page_id
          );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Deleted %0 rows from %1 for application pages that no longer exist', l_rows_changed, 'SG_APPLICATION_PAGES_D') );

end del_sg_application_pages_d_1;

procedure del_sg_application_pages_d_2 (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- Delete pages for applications without evaluations
    -- Record with page_wid = 0 is the "unspecified" row.
    delete sert_core.sg_application_pages_d target
    where page_wid > 0
      and not exists (
            select 1
              from sert_core.evals source
             where source.workspace_id = target.workspace_id
               and source.application_id = target.application_id
          );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Deleted %0 rows from %1 for applications without evaluations', l_rows_changed, 'SG_APPLICATION_PAGES_D') );

end del_sg_application_pages_d_2;

procedure load_sg_application_pages_d (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- Load the "unspecified" row, used when a rule fails against an shared component not associate with a page
    insert into sert_core.SG_APPLICATION_PAGES_D(
        page_wid,
        application_id,
        page_id,
        workspace_id,
        workspace,
        application_name,
        page_name,
        complexity_score,
        eval_on )
    select  0                   as page_wid,
            -1                  as application_id,
            -1                  as page_id,
            -1                  as workspace_id,
            'n/a'               as workspace,
            'n/a'               as application_name,
            'n/a'               as page_name,
            0                   as complexity_score,
            date '2025-01-01'   as eval_on
      from dual
     where not exists (
            select null
              from sert_core.SG_APPLICATION_PAGES_D
             where page_wid = 0 );

    l_rows_changed := sql%rowcount;

    -- Load application pages
    merge into sert_core.sg_application_pages_d t
    using (
        with sert_apps as (
            select w.workspace_id, w.workspace, e.application_id, max(e.eval_on) eval_on
              from apex_workspaces w,
                   sert_core.evals e
             where e.workspace_id = w.workspace_id
               and e.job_status = 'COMPLETED'
             group by w.workspace_id, w.workspace, e.application_id
        )
        select a.application_id, pg.page_id, a.workspace_id,
               a.workspace,
               pg.application_name,
               pg.page_name,
               (pg.regions * 10) + (pg.items * 3) + (pg.buttons * 2) + (pg.computations * 4) +
                    (pg.validations * 2) + nvl(pg.report_columns,0) + (pg.processes * 4) complexity_score,
               a.eval_on
          from apex_application_pages pg,
               sert_apps a
         where pg.workspace = a.workspace
           and pg.application_id = a.application_id
    ) src
    on (t.application_id = src.application_id
        and t.page_id = src.page_id)
    when matched then
        update set
            t.workspace_id     = src.workspace_id,
            t.workspace        = src.workspace,
            t.application_name = src.application_name,
            t.page_name        = src.page_name,
            t.complexity_score = src.complexity_score,
            t.eval_on          = src.eval_on
        where t.eval_on <> src.eval_on
    when not matched then
        insert (
            t.application_id,
            t.page_id,
            t.workspace_id,
            t.workspace,
            t.application_name,
            t.page_name,
            t.complexity_score,
            t.eval_on
        )
        values (
            src.application_id,
            src.page_id,
            src.workspace_id,
            src.workspace,
            src.application_name,
            src.page_name,
            src.complexity_score,
            src.eval_on
        );

    l_rows_changed := l_rows_changed + sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Successfully loaded %0 rows into %1', l_rows_changed, 'SG_APPLICATION_PAGES_D') );

end load_sg_application_pages_d;

-- procedures from etl_sg_applications_d.sql
procedure del_sg_applications_d_1 (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- Delete applications that no longer exist
    delete sert_core.sg_applications_d target
    where not exists (
        select 1
          from apex_applications source
         where source.workspace_id = target.workspace_id
           and source.application_id = target.application_id
    );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Deleted %0 rows from %1 for applications that no longer exist', l_rows_changed, 'SG_APPLICATIONS_D') );

end del_sg_applications_d_1;

procedure del_sg_applications_d_2 (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- Delete applications without evaluations
    delete sert_core.sg_applications_d target
    where not exists (
        select 1
          from sert_core.evals source
         where source.workspace_id = target.workspace_id
           and source.application_id = target.application_id
           and source.job_status = 'COMPLETED'
    );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Deleted %0 rows from %1 for applications without evaluations', l_rows_changed, 'SG_APPLICATIONS_D') );

end del_sg_applications_d_2;

procedure load_sg_applications_d (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- Dependency: must be run after load_sg_application_pages_d
    merge into sert_core.sg_applications_d t
    using (
         select pg.application_id,
                pg.workspace_id,
                pg.workspace,
                pg.application_name,
                count(*) pages,
                sum(pg.complexity_score)/count(*) avg_page_complexity,
                max(pg.eval_on) eval_on
           from sert_core.sg_application_pages_d pg
          where pg.page_wid > 0     -- exclude unspecified record
          group by pg.application_id,
                   pg.workspace_id,
                   pg.workspace,
                   pg.application_name
    ) src
    on (t.application_id = src.application_id
        and t.workspace_id = src.workspace_id)
    when matched then
        update set
            t.workspace           = src.workspace,
            t.application_name    = src.application_name,
            t.pages               = src.pages,
            t.avg_page_complexity = src.avg_page_complexity,
            t.eval_on             = src.eval_on
        where t.eval_on <> src.eval_on
    when not matched then
        insert (
            t.application_id,
            t.workspace_id,
            t.workspace,
            t.application_name,
            t.pages,
            t.avg_page_complexity,
            t.eval_on
        )
        values (
            src.application_id,
            src.workspace_id,
            src.workspace,
            src.application_name,
            src.pages,
            src.avg_page_complexity,
            src.eval_on
        );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Successfully loaded %0 rows into %1', l_rows_changed, 'SG_APPLICATIONS_D') );

end load_sg_applications_d;

function log_day_cutoff(p_days in number default 28) return date is
    l_max_log_day date;
begin
    -- Find most recent log_day from the log archive, populated by once-a-day job that usually runs at 1 am.
    -- Depending on when this is run, yesterdays logs may not have been archived, or data may not exist.
    -- When either scenario occurs and no logs found, use 2 days ago as the max log day.
    select coalesce(max(log_day), trunc(sysdate) - 2 )
      into l_max_log_day
      from apex_workspace_log_archive
     where log_day >= trunc(sysdate) - 2; -- Force query to use desired index for fast response on large sites.

    -- Want default 28 days of data, so subtract p_days - 1 to get the cutoff date
    return l_max_log_day - (p_days - 1);
end log_day_cutoff;


procedure load_sg_daily_app_activity_f (
    p_task_log_id in number )
is
    c_cutoff_day            constant date := log_day_cutoff;
    l_max_source_log_day    date;
    l_max_target_log_day    date;
    l_rows_changed          number        := 0;
    l_run_statement         boolean;
begin
    --
    -- Check there is new data to load
    --
    select max(log_day) into l_max_source_log_day from apex_workspace_log_archive where log_day >= c_cutoff_day;
    select max(log_day) into l_max_target_log_day from sg_daily_app_activity_f    where log_day >= c_cutoff_day;

    l_run_statement := case
        when l_max_source_log_day is null then false        -- there is no data to load
        when l_max_target_log_day is null  then true        -- there is data to load that is not in the target table
        else (l_max_source_log_day > l_max_target_log_day)  -- true when there more recent data to load
        end;

    if l_run_statement then
        -- Add new records (APEX never updates these)
        -- Pages calculation is best effort based on current size, or distinct_pages visited if the app has been deleted
        merge into sert_core.sg_daily_app_activity_f target
        using (select a.*,
                      (select greatest(count(*), a.distinct_pages) from apex_application_pages p where p.workspace = a.workspace and p.application_id = a.application_id) pages
                 from apex_workspace_log_archive a
                where a.log_day >= c_cutoff_day
                  and a.application_id is not null
                  and a.application_id not between 4000 and 4850 -- exclude APEX Builder apps
              ) source
           on (    target.workspace_id   = source.workspace_id
               and target.application_id = source.application_id
               and target.log_day        = source.log_day
              )
        when not matched then
            insert (
                log_day,
                workspace_id,
                workspace,
                application_id,
                application_name,
                pages,
                page_events,
                page_views,
                page_accepts,
                partial_page_views,
                rows_fetched,
                ir_searches,
                distinct_pages,
                distinct_users,
                distinct_sessions,
                average_render_time,
                median_render_time,
                maximum_render_time,
                total_render_time,
                content_length,
                error_count,
                public_page_events,
                workspace_login_events
            )
            values (
                source.log_day,
                source.workspace_id,
                source.workspace,
                source.application_id,
                coalesce(source.application_name, 'n/a'),
                source.pages,
                source.page_events,
                source.page_views,
                source.page_accepts,
                source.partial_page_views,
                coalesce(source.rows_fetched, 0),
                source.ir_searches,
                source.distinct_pages,
                source.distinct_users,
                source.distinct_sessions,
                source.average_render_time,
                source.median_render_time,
                source.maximum_render_time,
                source.total_render_time,
                source.content_length,
                source.error_count,
                source.public_page_events,
                source.workspace_login_events
            );

        l_rows_changed := sql%rowcount;

        sg_etl_controller.set_task_completed(
            p_task_log_id    => p_task_log_id,
            p_rows_changed   => l_rows_changed,
            p_status_message => apex_string.format('Successfully loaded %0 rows into %1', l_rows_changed, 'SG_DAILY_APP_ACTIVITY_F') );

    else
        sg_etl_controller.set_task_completed(
            p_task_log_id    => p_task_log_id,
            p_rows_changed   => l_rows_changed,
            p_status_message => apex_string.format('Skipped loading data into %1 - existing data is current.', 'SG_DAILY_APP_ACTIVITY_F') );
    end if;
end load_sg_daily_app_activity_f;

procedure del_sg_daily_app_activity_f_1 (
    p_task_log_id in number )
is
    c_cutoff_day   constant date := log_day_cutoff;
    l_rows_changed number := 0;
begin
    -- Remove old data
    delete sert_core.sg_daily_app_activity_f where log_day < c_cutoff_day;

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Deleted %0 rows from %1 for data logged prior to activity cutoff day', l_rows_changed, 'SG_DAILY_APP_ACTIVITY_F') );

end del_sg_daily_app_activity_f_1;

procedure load_sg_most_4wk_app_activity_f (
    p_task_log_id in number )
is
    c_days         constant number      := 28;
    c_cutoff_day   constant date        := log_day_cutoff(p_days => c_days);

    l_max_source_log_day    date;
    l_max_target_log_day    date;
    l_rows_changed          number      := 0;
    l_run_statement         boolean;
begin
    --
    -- Check there is new data to load
    --
    select max(log_day) into l_max_source_log_day from sg_daily_app_activity_f    where log_day >= c_cutoff_day;
    select max(log_day) into l_max_target_log_day from sg_most_4wk_app_activity_f where log_day >= c_cutoff_day;

    l_run_statement := case
        when l_max_source_log_day is null then false        -- there is no data to load
        when l_max_target_log_day is null  then true        -- there is data to load that is not in the target table
        else (l_max_source_log_day > l_max_target_log_day)  -- true when there more recent data to load
        end;

    if l_run_statement then
        -- Remove old data
        delete sert_core.sg_most_4wk_app_activity_f;

        insert into sert_core.sg_most_4wk_app_activity_f(
            workspace_id,
            application_id,
            workspace,
            application_name,
            pages,
            app_size,
            log_day,
            page_events,
            page_views,
            page_accepts,
            partial_page_views,
            rows_fetched,
            ir_searches,
            distinct_pages,
            distinct_users,
            distinct_sessions,
            average_render_time,
            median_render_time,
            maximum_render_time,
            total_render_time,
            content_length,
            error_count,
            public_page_events,
            workspace_login_events,
            sparkline_data
        )
        with dates as (
            -- generate dates for 28 days
            select c_cutoff_day + level - 1 as log_day
            from dual
            connect by level <= c_days
        ),
        apps as (
            select distinct
                   workspace_id,
                   application_id
              from sert_core.sg_daily_app_activity_f
             where log_day >= c_cutoff_day
        ),
        app_date_spine as (
            select a.application_id,
                   a.workspace_id,
                   d.log_day
            from apps a
            cross join dates d
        )
        select
            ads.workspace_id,
            ads.application_id,
            -- Descriptors
            max(a.workspace)              keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as workspace,
            max(a.application_name)       keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as application_name,
            max(a.pages)                  keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as pages,
            max(a.app_size)               keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as app_size,
            -- Measure values from the best row
            max(a.log_day)                keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as log_day,
            max(a.page_events)                                                                                             as page_events,
            max(a.page_views)             keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as page_views,
            max(a.page_accepts)           keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as page_accepts,
            max(a.partial_page_views)     keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as partial_page_views,
            max(a.rows_fetched)           keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as rows_fetched,
            max(a.ir_searches)            keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as ir_searches,
            max(a.distinct_pages)         keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as distinct_pages,
            max(a.distinct_users)         keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as distinct_users,
            max(a.distinct_sessions)      keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as distinct_sessions,
            max(a.average_render_time)    keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as average_render_time,
            max(a.median_render_time)     keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as median_render_time,
            max(a.maximum_render_time)    keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as maximum_render_time,
            max(a.total_render_time)      keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as total_render_time,
            max(a.content_length)         keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as content_length,
            max(a.error_count)            keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as error_count,
            max(a.public_page_events)     keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as public_page_events,
            max(a.workspace_login_events) keep (dense_rank first order by a.page_events desc nulls last, ads.log_day desc) as workspace_login_events,
            listagg(nvl(a.page_events, 0), ',') within group (order by ads.log_day asc) as sparkline_data
        from app_date_spine ads
        left join sert_core.sg_daily_app_activity_f a
          on ads.application_id = a.application_id and ads.workspace_id = a.workspace_id and ads.log_day = a.log_day
        group by
            ads.workspace_id,
            ads.application_id;

        l_rows_changed := sql%rowcount;

        sg_etl_controller.set_task_completed(
            p_task_log_id    => p_task_log_id,
            p_rows_changed   => l_rows_changed,
            p_status_message => apex_string.format('Successfully loaded %0 rows into %1', l_rows_changed, 'SG_MOST_4WK_APP_ACTIVITY_F') );

    else
        sg_etl_controller.set_task_completed(
            p_task_log_id    => p_task_log_id,
            p_rows_changed   => l_rows_changed,
            p_status_message => apex_string.format('Skipped loading data into %1 - existing data is current.', 'SG_MOST_4WK_APP_ACTIVITY_F') );
    end if;
end load_sg_most_4wk_app_activity_f;

procedure load_sg_instance_metrics_f (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    --
    -- Instance metrics are "live" so always load
    --
    merge into sert_core.sg_instance_metrics_f target
    using (
        with instance as (
            select (select count(*)
                      from apex_workspaces
                     where workspace not in ('INTERNAL', 'COM.ORACLE.APEX.REPOSITORY', 'COM.ORACLE.CUST.REPOSITORY', 'COM.ORACLE.APEX.INTERNAL') ) workspaces,
                   (select count(*)
                      from apex_applications
                     where workspace not in ('INTERNAL', 'COM.ORACLE.APEX.REPOSITORY', 'COM.ORACLE.CUST.REPOSITORY', 'COM.ORACLE.APEX.INTERNAL') ) applications,
                   (select count(*)
                      from apex_application_pages
                     where workspace not in ('INTERNAL', 'COM.ORACLE.APEX.REPOSITORY', 'COM.ORACLE.CUST.REPOSITORY', 'COM.ORACLE.APEX.INTERNAL') ) pages
              from dual
        ),
        sert as (
            select count(distinct e.workspace_id) as sert_workspaces,
                   count(distinct e.workspace_id||'~'||e.application_id) as sert_applications,
                   coalesce(sum(case when e.rn = 1 then a.pages end), 0) as sert_pages,
                   count(*) as evaluations,
                   coalesce(avg(e.score), 0) as avg_score
              from ( select e.workspace_id, e.application_id, e.score,
                            row_number() over (partition by e.workspace_id, e.application_id order by e.workspace_id, e.eval_id) rn
                      from sert_core.evals e
                     where e.job_status = 'COMPLETED' ) e
              join apex_applications a on a.workspace_id = e.workspace_id and a.application_id = e.application_id
        )
        select trunc(sysdate) date_wid,
               i.workspaces,
               i.applications,
               i.pages,
               s.sert_workspaces,
               s.sert_applications,
               s.sert_pages,
               s.evaluations,
               s.avg_score,
               100*s.sert_applications/i.applications app_coverage,
               systimestamp etl_load_ts
          from instance i
          cross join sert s
    ) source
    on (target.date_wid = source.date_wid)
    when not matched then
        insert (
            date_wid,
            workspaces,
            applications,
            pages,
            sert_workspaces,
            sert_applications,
            sert_pages,
            evaluations,
            avg_score,
            app_coverage,
            etl_load_ts
        )
        values (
            source.date_wid,
            source.workspaces,
            source.applications,
            source.pages,
            source.sert_workspaces,
            source.sert_applications,
            source.sert_pages,
            source.evaluations,
            source.avg_score,
            source.app_coverage,
            source.etl_load_ts
        )
    when matched then
        update set
            target.workspaces        = source.workspaces,
            target.applications      = source.applications,
            target.pages             = source.pages,
            target.sert_workspaces   = source.sert_workspaces,
            target.sert_applications = source.sert_applications,
            target.sert_pages        = source.sert_pages,
            target.evaluations       = source.evaluations,
            target.avg_score         = source.avg_score,
            target.app_coverage      = source.app_coverage,
            target.etl_load_ts       = source.etl_load_ts;

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Successfully loaded %0 rows into %1', l_rows_changed, 'SG_INSTANCE_METRICS_F') );

end load_sg_instance_metrics_f;

-- procedures from etl_sg_results_d.sql
procedure load_sg_results_d (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    merge into sert_core.sg_results_d t
    using (
        select 1 as result_wid, 'PASS' as eval_result, 'Pass' as eval_status, 'PASS'     as final_result, 'Passed rule check'   as final_status, 'Pass' as final_pass_or_fail from dual union all
        select 2 as result_wid, 'FAIL' as eval_result, 'Fail' as eval_status, 'FAIL'     as final_result, 'Failed rule check'   as final_status, 'Fail' as final_pass_or_fail from dual union all
        select 3 as result_wid, 'FAIL' as eval_result, 'Fail' as eval_status, 'APPROVED' as final_result, 'Passed by exception' as final_status, 'Pass' as final_pass_or_fail from dual union all
        select 4 as result_wid, 'FAIL' as eval_result, 'Fail' as eval_status, 'PENDING'  as final_result, 'Pending exception'   as final_status, 'Fail' as final_pass_or_fail from dual union all
        select 5 as result_wid, 'FAIL' as eval_result, 'Fail' as eval_status, 'STALE'    as final_result, 'Stale exception'     as final_status, 'Fail' as final_pass_or_fail from dual union all
        select 6 as result_wid, 'FAIL' as eval_result, 'Fail' as eval_status, 'REJECTED' as final_result, 'Rejected exception'  as final_status, 'Fail' as final_pass_or_fail from dual
    ) s
    on (t.result_wid = s.result_wid)
    when matched then
        update set
            t.eval_result = s.eval_result,
            t.eval_status = s.eval_status,
            t.final_result = s.final_result,
            t.final_status = s.final_status,
            t.final_pass_or_fail = s.final_pass_or_fail
        where (
               t.eval_result <> s.eval_result
            or t.eval_status <> s.eval_status
            or t.final_result <> s.final_result
            or t.final_status <> s.final_status
            or t.final_pass_or_fail <> s.final_pass_or_fail )
    when not matched then
        insert (result_wid, eval_result, eval_status, final_result, final_status, final_pass_or_fail)
        values (s.result_wid, s.eval_result, s.eval_status, s.final_result, s.final_status, s.final_pass_or_fail);

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Successfully loaded %0 rows into %1', l_rows_changed, 'SG_RESULTS_D') );

end load_sg_results_d;

-- procedures from etl_sg_rules_d.sql
procedure load_sg_rules_d (
    p_task_log_id in number )
is
    l_rows_changed number := 0;
begin
    -- The keep-dense_rank-first method avoids the overhead of generating all rows in the subquery and then filtering the result set.
    -- It's designed to return the non-aggregated column value corresponding to the maximum/minimum of another column within a group.
    merge into sert_core.sg_rules_d target
    using (
            with latest_rules_by_key as (
                select r.rule_key,
                       max(r.apex_version)                                                                  as apex_version,
                       max(r.rule_name) keep (dense_rank first order by r.apex_version desc)                as rule_name,
                       max(r.category_id) keep (dense_rank first order by r.apex_version desc)              as category_id,
                       max(r.risk_id) keep (dense_rank first order by r.apex_version desc)                  as risk_id,
                       max(r.rule_severity_id) keep (dense_rank first order by r.apex_version desc)         as rule_severity_id,
                       max(r.rule_type) keep (dense_rank first order by r.apex_version desc)                as rule_type,
                       max(r.impact) keep (dense_rank first order by r.apex_version desc)                   as impact,
                       max(r.view_name) keep (dense_rank first order by r.apex_version desc)                as view_name,
                       max(r.column_to_evaluate) keep (dense_rank first order by r.apex_version desc)       as column_to_evaluate,
                       max(r.component_id) keep (dense_rank first order by r.apex_version desc)             as component_id,
                       max(r.component_name) keep (dense_rank first order by r.apex_version desc)           as component_name,
                       max(r.item_name) keep (dense_rank first order by r.apex_version desc)                as item_name,
                       max(r.shared_comp_name) keep (dense_rank first order by r.apex_version desc)         as shared_comp_name,
                       max(r.rule_criteria_type_id) keep (dense_rank first order by r.apex_version desc)    as rule_criteria_type_id,
                       max(r.active_yn) keep (dense_rank first order by r.apex_version desc)                as active_yn,
                       max(r.created_on) keep (dense_rank first order by r.apex_version desc)               as created_on,
                       max(r.updated_on) keep (dense_rank first order by r.apex_version desc)               as updated_on
                  from sert_core.rules r
                 group by r.rule_key
            )
            select r.rule_key,
                   r.apex_version,
                   r.rule_name,
                   r.rule_type,
                   case when r.impact is null then 'n/a'
                        when r.impact = 'SC' then 'Shared Component'
                        else initcap(r.impact)
                        end                                     as impact,
                   coalesce(r.view_name, 'n/a')                 as view_name,
                   coalesce(r.column_to_evaluate, 'n/a')        as column_to_evaluate,
                   coalesce(r.component_id, 'n/a')              as component_id,
                   coalesce(r.component_name, 'n/a')            as component_name,
                   coalesce(r.item_name, 'n/a')                 as item_name,
                   coalesce(r.shared_comp_name, 'n/a')          as shared_comp_name,
                   r.active_yn                                  as rule_active_yn,
                   greatest(
                       coalesce(r.updated_on, r.created_on),
                       coalesce(c.updated_on, c.created_on),
                       coalesce(rsk.updated_on, rsk.created_on, c_min_cutoff_date ),
                       coalesce(rct.updated_on, rct.created_on, c_min_cutoff_date ),
                       coalesce(rsev.updated_on, rsev.created_on)
                   )                                            as updated_on,
                   r.category_id,
                   c.category_key,
                   c.category_name,
                   coalesce(r.risk_id, 0)                       as risk_id,
                   coalesce(rsk.risk_code, 'n/a')               as risk_code,
                   coalesce(rsk.risk_name, 'n/a')               as risk_name,
                   coalesce(r.rule_criteria_type_id, 0)         as rule_criteria_type_id,
                   coalesce(rct.rule_criteria_type_key, 'n/a')  as rule_criteria_type_key,
                   coalesce(rct.rule_criteria_type_name, 'n/a') as rule_criteria_type_name,
                   coalesce(rct.active_yn, 'N')                 as rule_critera_type_active_yn,
                   r.rule_severity_id,
                   rsev.rule_severity_key,
                   rsev.rule_severity_name,
                   rsev.seq                                     as rule_severity_seq
              from latest_rules_by_key r,
                   sert_core.categories c,
                   sert_core.risks rsk,
                   sert_core.rule_criteria_types rct,
                   sert_core.rule_severity rsev
             where r.category_id = c.category_id
               and r.risk_id = rsk.risk_id (+)
               and r.rule_criteria_type_id = rct.rule_criteria_type_id (+)
               and r.rule_severity_id = rsev.rule_severity_id
    ) source
    on (target.rule_key = source.rule_key)
    when matched then
        update set
            target.apex_version                = source.apex_version,
            target.rule_name                   = source.rule_name,
            target.rule_type                   = source.rule_type,
            target.impact                      = source.impact,
            target.view_name                   = source.view_name,
            target.column_to_evaluate          = source.column_to_evaluate,
            target.component_id                = source.component_id,
            target.component_name              = source.component_name,
            target.item_name                   = source.item_name,
            target.shared_comp_name            = source.shared_comp_name,
            target.rule_active_yn              = source.rule_active_yn,
            target.updated_on                  = source.updated_on,
            target.category_id                 = source.category_id,
            target.category_key                = source.category_key,
            target.category_name               = source.category_name,
            target.risk_id                     = source.risk_id,
            target.risk_code                   = source.risk_code,
            target.risk_name                   = source.risk_name,
            target.rule_criteria_type_id       = source.rule_criteria_type_id,
            target.rule_criteria_type_key      = source.rule_criteria_type_key,
            target.rule_criteria_type_name     = source.rule_criteria_type_name,
            target.rule_critera_type_active_yn = source.rule_critera_type_active_yn,
            target.rule_severity_id            = source.rule_severity_id,
            target.rule_severity_key           = source.rule_severity_key,
            target.rule_severity_name          = source.rule_severity_name,
            target.rule_severity_seq           = source.rule_severity_seq
         where
               target.updated_on <> source.updated_on
            or target.apex_version <> source.apex_version
    when not matched then
        insert (
            rule_key,
            apex_version,
            rule_name,
            rule_type,
            impact,
            view_name,
            column_to_evaluate,
            component_id,
            component_name,
            item_name,
            shared_comp_name,
            rule_active_yn,
            updated_on,
            category_id,
            category_key,
            category_name,
            risk_id,
            risk_code,
            risk_name,
            rule_criteria_type_id,
            rule_criteria_type_key,
            rule_criteria_type_name,
            rule_critera_type_active_yn,
            rule_severity_id,
            rule_severity_key,
            rule_severity_name,
            rule_severity_seq
        )
        values (
            source.rule_key,
            source.apex_version,
            source.rule_name,
            source.rule_type,
            source.impact,
            source.view_name,
            source.column_to_evaluate,
            source.component_id,
            source.component_name,
            source.item_name,
            source.shared_comp_name,
            source.rule_active_yn,
            source.updated_on,
            source.category_id,
            source.category_key,
            source.category_name,
            source.risk_id,
            source.risk_code,
            source.risk_name,
            source.rule_criteria_type_id,
            source.rule_criteria_type_key,
            source.rule_criteria_type_name,
            source.rule_critera_type_active_yn,
            source.rule_severity_id,
            source.rule_severity_key,
            source.rule_severity_name,
            source.rule_severity_seq
        );

    l_rows_changed := sql%rowcount;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => apex_string.format('Successfully loaded %0 rows into %1', l_rows_changed, 'SG_RULES_D') );

end load_sg_rules_d;


procedure gather_guardian_stats (
    p_task_log_id in number )
is
    c_owner      constant varchar2(30)  := 'SERT_CORE';
    c_method_opt constant varchar2(100) := 'for all columns size auto';

    l_rows_changed number := 0;
begin
    -- Gather stats for final facts and dimensions, ensuring dimensions are gathered first
    -- to assist with star transformation logic.
    for l_table in (
        select table_name,
               substr(table_name, instr(table_name, '_', -1)+1) suffix
          from all_tables
         where owner      = c_owner
           and table_name like 'SG\_%' escape '\'
           and substr(table_name, instr(table_name, '_', -1)+1) in ('F','D')
         order by suffix, table_name )
    loop
        -- gather statistics for each individual table found
        dbms_stats.gather_table_stats(
            ownname          => c_owner,
            tabname          => l_table.table_name,
            estimate_percent => dbms_stats.auto_sample_size,
            method_opt       => c_method_opt,
            degree           => dbms_stats.auto_degree,
            cascade          => true,
            options          => 'gather auto' );
    end loop;

    sg_etl_controller.set_task_completed(
        p_task_log_id    => p_task_log_id,
        p_rows_changed   => l_rows_changed,
        p_status_message => 'Gathered statistics for final dimensions and facts.' );

end gather_guardian_stats;

end sg_etl_task;
/
--rollback not required
