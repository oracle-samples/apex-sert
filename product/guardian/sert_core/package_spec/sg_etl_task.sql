--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_package_sert_core.sg_etl_task endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
create or replace package sert_core.sg_etl_task as

c_min_cutoff_date   constant date := date '2025-01-01'; -- Minimum cutoff date used to extract evaluation and application data

--==============================================================================
-- Facts
--==============================================================================

-- SG_APP_RULE_FAILS_F
--      - combines failed SERT rule findings with exception reasons
procedure load_sg_app_rule_fails_f (p_task_log_id in number);
procedure del_sg_app_rule_fails_f_1 (p_task_log_id in number); -- Remove stale apps. Must be run before delete dimensions.
procedure del_sg_app_rule_fails_f_2 (p_task_log_id in number);
procedure del_sg_app_rule_fails_f_3 (p_task_log_id in number);

-- SG_APP_RULE_FAILS_FS
--      - staging table
procedure load_sg_app_rule_fails_fs (p_task_log_id in number, p_cutoff_date in date);

-- SG_AGG_APP_RULE_RESULTS_F
--      - aggregates SERT rule evaluations by application, rule, and result
procedure load_sg_agg_app_rule_results_f (p_task_log_id in number);
procedure del_sg_agg_app_rule_results_f_1 (p_task_log_id in number); -- Remove stale apps. Must be run before delete dimensions.
procedure del_sg_agg_app_rule_results_f_2 (p_task_log_id in number); -- Dependant on dimensions being loaded, and load_sg_agg_app_rule_results_fs.

-- SG_AGG_APP_RULE_RESULTS_FS
--      - staging table
procedure load_sg_agg_app_rule_results_fs (p_task_log_id in number, p_cutoff_date in date);

-- SG_DAILY_APP_ACTIVITY_F
--      - Daily activity summary by application for last 4 weeks
procedure load_sg_daily_app_activity_f (p_task_log_id in number);
procedure del_sg_daily_app_activity_f_1 (p_task_log_id in number);

-- SG_MOST_4WK_APP_ACTIVITY_F
--      - Most active day summary by application for last 4 weeks
procedure load_sg_most_4wk_app_activity_f (p_task_log_id in number);

-- SG_INSTANCE_METRICS_F
--      - Instance summary metrics for APEX and SERT by date
procedure load_sg_instance_metrics_f (p_task_log_id in number);

--==============================================================================
-- Dimensions
--==============================================================================

-- SG_APPLICATION_PAGES_D
--      - hybrid dimension/fact containing application page attributes - names, complexity, and eval on
--      - overwrite dimension (type 1), with obsolete data deleted
procedure del_sg_application_pages_d_1 (p_task_log_id in number);
procedure del_sg_application_pages_d_2 (p_task_log_id in number);
procedure load_sg_application_pages_d (p_task_log_id in number);

-- SG_APPLICATIONS_D
--      - hybrid dimension/fact containing application attributes - names, page count, app size, avg page complexity, and eval on
--      - overwrite dimension (type 1), with obsolete data deleted
procedure del_sg_applications_d_1 (p_task_log_id in number);
procedure del_sg_applications_d_2 (p_task_log_id in number);
procedure load_sg_applications_d (p_task_log_id in number);

-- SG_RESULTS_D
--      - result combinations for eval result (pass/fail) and final result (pass/fail/approved/pending/stale/rejected)
--      - fixed dimension (type 0)
procedure load_sg_results_d (p_task_log_id in number);

-- SG_RULES_D
--      - SERT rule attributes for latest apex version - name, type, impact, category, risk, criteria type, severity, active_yn
--      - overwrite dimension (type 1)
procedure load_sg_rules_d (p_task_log_id in number);


--==============================================================================
-- Other
--==============================================================================
procedure gather_guardian_stats (p_task_log_id in number);

end sg_etl_task;
/
--rollback not required
