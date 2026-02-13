--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:seed_main_etl_inc endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
declare
    type r_sg_etl_task is record (
        task_id              number,
        pipeline_id          number,
        task_phase           number,
        task_name            varchar2(100),
        plsql_procedure_name varchar2(100),
        is_active            varchar2(1)
    );

    type t_sg_etl_task is table of r_sg_etl_task;

    l_task_list t_sg_etl_task := t_sg_etl_task(
        r_sg_etl_task(10, 1, 1,     'Load SG_APP_RULE_FAILS_FS',                                'sg_etl_task.load_sg_app_rule_fails_fs', 'Y'),
        r_sg_etl_task(20, 1, 1,     'Load SG_AGG_APP_RULE_RESULTS_FS',                          'sg_etl_task.load_sg_agg_app_rule_results_fs', 'Y'),
        --
        r_sg_etl_task(30, 1, 2,     'Remove stale apps from SG_APP_RULE_FAILS_F',               'sg_etl_task.del_sg_app_rule_fails_f_1', 'Y'),
        r_sg_etl_task(40, 1, 2,     'Remove stale evals from SG_APP_RULE_FAILS_F',              'sg_etl_task.del_sg_app_rule_fails_f_2', 'Y'),
        r_sg_etl_task(50, 1, 2,     'Remove stale eval results from SG_APP_RULE_FAILS_F',       'sg_etl_task.del_sg_app_rule_fails_f_3', 'Y'),
        r_sg_etl_task(60, 1, 2,     'Remove stale apps from SG_AGG_APP_RULE_RESULTS_F',         'sg_etl_task.del_sg_agg_app_rule_results_f_1', 'Y'),
        r_sg_etl_task(70, 1, 2,     'Remove stale apps from SG_DAILY_APP_ACTIVITY_F',           'sg_etl_task.del_sg_daily_app_activity_f_1', 'Y'),
        --
        r_sg_etl_task(80, 1, 3,     'Remove stale apps from SG_APPLICATIONS_D',                 'sg_etl_task.del_sg_applications_d_1', 'Y'),
        r_sg_etl_task(90, 1, 3,     'Remove stale app pages from SG_APPLICATION_PAGES_D',       'sg_etl_task.del_sg_application_pages_d_1', 'Y'),
        --
        r_sg_etl_task(100, 1, 4,    'Remove apps without evals from SG_APPLICATIONS_D',        'sg_etl_task.del_sg_applications_d_2', 'Y'),
        r_sg_etl_task(110, 1, 4,    'Remove apps without evals from SG_APPLICATION_PAGES_D',   'sg_etl_task.del_sg_application_pages_d_2', 'Y'),
        --
        r_sg_etl_task(120, 1, 5,    'Load SG_APPLICATION_PAGES_D',                             'sg_etl_task.load_sg_application_pages_d', 'Y'),
        --
        r_sg_etl_task(130, 1, 6,    'Load SG_APPLICATIONS_D',                                  'sg_etl_task.load_sg_applications_d', 'Y'),
        r_sg_etl_task(140, 1, 6,    'Load SG_RULES_D',                                         'sg_etl_task.load_sg_rules_d', 'Y'),
        r_sg_etl_task(150, 1, 6,    'Load SG_RESULTS_D',                                       'sg_etl_task.load_sg_results_d', 'Y'),
        --
        r_sg_etl_task(160, 1, 7,    'Remove stale results from SG_AGG_APP_RULE_RESULTS_F',     'sg_etl_task.del_sg_agg_app_rule_results_f_2', 'Y'),
        --
        r_sg_etl_task(170, 1, 8,    'Load SG_APP_RULE_FAILS_F',                                'sg_etl_task.load_sg_app_rule_fails_f', 'Y'),
        r_sg_etl_task(180, 1, 8,    'Load SG_AGG_APP_RULE_RESULTS_F',                          'sg_etl_task.load_sg_agg_app_rule_results_f', 'Y'),
        r_sg_etl_task(190, 1, 8,    'Load SG_DAILY_APP_ACTIVITY_F',                            'sg_etl_task.load_sg_daily_app_activity_f', 'Y'),
        r_sg_etl_task(200, 1, 8,    'Load SG_INSTANCE_METRICS_F',                              'sg_etl_task.load_sg_instance_metrics_f', 'Y'),
        --
        r_sg_etl_task(210, 1, 9,    'Load SG_MOST_4WK_APP_ACTIVITY_F',                         'sg_etl_task.load_sg_most_4wk_app_activity_f', 'Y'),
        --
        r_sg_etl_task(220, 1, 10,   'Gather statistics',                                       'sg_etl_task.gather_guardian_stats', 'Y')
    );

begin
    -- SG_ETL_PIPELINES
    merge into sert_core.sg_etl_pipelines tgt
    using (
        select 1                        as pipeline_id,
               'MAIN_ETL_INC'           as pipeline_name,
               'Main ETL (incremental)' as job_description,
               'INCREMENTAL'            as load_type,
               'Y'                      as is_active
        from dual
    ) src
    on (tgt.pipeline_id = src.pipeline_id)
    when matched then
        update set
            tgt.pipeline_name = src.pipeline_name,
            tgt.job_description = src.job_description,
            tgt.load_type = src.load_type,
            tgt.is_active = src.is_active
    when not matched then
        insert (pipeline_id, pipeline_name, job_description, load_type, is_active)
        values (src.pipeline_id, src.pipeline_name, src.job_description, src.load_type, src.is_active);

    -- SG_ETL_PIPELINE_PARAMETERS
    merge into sert_core.sg_etl_pipeline_parameters tgt
    using (
        select 1                as pipeline_id,
               'p_cutoff_date'  as parameter_name,
               'DATE'           as data_type,
               'Y'              as is_required,
               'yyyy-mm-dd'     as format_mask
        from dual
    ) src
    on (
        tgt.pipeline_id = src.pipeline_id
        and tgt.parameter_name = src.parameter_name
    )
    when matched then
        update set
            tgt.data_type = src.data_type,
            tgt.is_required = src.is_required,
            tgt.format_mask = src.format_mask
    when not matched then
        insert (pipeline_id, parameter_name, data_type, is_required, format_mask)
        values (src.pipeline_id, src.parameter_name, src.data_type, src.is_required, src.format_mask);

    -- SG_ETL_TASKS
    forall l_idx in 1 .. l_task_list.count
        merge into sert_core.sg_etl_tasks tgt
        using (
            select
                l_task_list(l_idx).task_id as task_id,
                l_task_list(l_idx).pipeline_id as pipeline_id,
                l_task_list(l_idx).task_phase as task_phase,
                l_task_list(l_idx).task_name as task_name,
                l_task_list(l_idx).plsql_procedure_name as plsql_procedure_name,
                l_task_list(l_idx).is_active as is_active
            from dual
        ) src
        on (
            tgt.task_id = src.task_id
            and tgt.pipeline_id = src.pipeline_id
        )
        when matched then
            update set
                tgt.task_phase = src.task_phase,
                tgt.task_name = src.task_name,
                tgt.plsql_procedure_name = src.plsql_procedure_name,
                tgt.is_active = src.is_active
        when not matched then
            insert (task_id, pipeline_id, task_phase, task_name, plsql_procedure_name, is_active)
            values (src.task_id, src.pipeline_id, src.task_phase, src.task_name, src.plsql_procedure_name, src.is_active);
end;
/
--rollback not required
