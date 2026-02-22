# SERT Guardian Roadmap

SERT Guardian provides an holistic view of APEX application security at the instance level.

It aggregates data across workspaces providing insights on sizing, activity, coverage levels, average compliance scores, and insights for individal evaluation rules.
Combined with APEX activity logs, it can also be used to prioritise further SERT security checks.

## Timeline

- December 2025 : Data design
- January 2026  : ETL build
- February 2026 : Application build

## Backend

### Facts

- [X] SG_APP_RULE_FAILS_F           : combines failed SERT rule findings with exception reasons. Filters by application, page, rule, and result dimensions.
- [X] SG_AGG_APP_RULE_RESULTS_F     : aggregates SERT rule findings by application, rule, and result
- [X] SG_INSTANCE_METRICS_F         : instance summary metrics for APEX and SERT by date
- [X] SG_DAILY_APP_ACTIVITY_F       : daily activity summary by application for last 4 weeks
- [X] SG_MOST_4WK_APP_ACTIVITY_F    : top daily activity by application for last 4 weeks

### Dimensions

- [X] SG_APPLICATION_PAGES_D        : application page attributes - names, complexity, and eval_on
- [X] SG_APPLICATIONS_D             : application attributes - names, page count, app size, avg page complexity, and eval on
- [X] SG_RESULTS_D                  : result combinations for eval result (pass/fail) and final result (pass/fail/approved/pending/stale/rejected)
- [X] SG_RULES_D                    : SERT rule attributes - name, type, impact, category, risk, criteria type, severity, active_yn

### Staging tables

- [X] SG_AGG_APP_RULE_RESULTS_FS
- [X] SG_APP_RULE_FAILS_FS

### ETL Controller

- Tables
  - [X] SG_ETL_PIPELINES            : stores metadata for the overall ETL job (e.g. job name, default load type)
  - [X] SG_ETL_JOB_TASK             : defines the individual PL/SQL procedures (tasks) that run within an ETL job, including their execution phase
  - [X] SG_ETL_PIPELINE_PARAMETERS  : defines the parameters expected by an ETL job, enforcing data type and conversion mask rules
  - [X] SG_ETL_EXECUTION_LOG        : logs the start, end, and overall status of each entire ETL job run
  - [X] SG_ETL_TASK_LOG             : logs the detailed execution, metrics, and status of each individual task within an ETL run
  - [X] SG_ETL_CONTROLLER_LOCK      : single-row table used for autonomous transaction locking to enforce single-instance execution
- Types
  - [X] SG_PARAMETER
  - [X] SG_PARAMETERS
- Packages
  - [X] SG_ETL_CONTROLLER           : core control logic for executing and managing structured ETL processes
  - [X] SG_ETL_TASK                 : contains individual task procedures

### General project tasks

- [X] Customize liquibase controllers for Guardian conditional installation
- [X] Add liquibase comments to code
- [X] Run SERT evaluation, cleanup rule fails
- [ ] Update SERT documentation

## Frontend

- Instance Dashboard (Level 1 page)
  - [X] Context : Showing workspaces, apps, pages, sert workspaces, sert apps, sert pages, evaluations, avg score, app coverage
  - [X] Most active applications by daily activity for the last 4 weeks chart
    - [X] button link to Activity Log page
    - [X] click-thru to Application Details page
  - [X] SERT applications by size : showing pie-chart for XS, S, M, L, XL sizes
    - [X] button link to SERT Applications with filters cleared
    - [X] click-thru to SERT Applications with filter set for app size
  - [X] Most common evaluation rule fails chart
    - [X] button link to Rule Fails page
    - [X] click-thru to Individual Rule Fails page
  - [X] Most Active Apps Report : rank, workspace, app id, app name, activity level, score...

- Level 2 pages
  - [X] Activity Log : Facet report showing last 4 weeks daily activity by application, optionally showing most active day per application only.
        Facets: workspace, application, app size, SERT evaluation.
  - [X] SERT Applications: Facet report showing SERT applications details including page count, app size, avg page complexity, and eval on.
        Facets: workspace, application, app size
    - [X] link to Application Details
  - [X] Rule Fails : Facet report showing graphs and details for an individual rule failures and exception reason.
        Facets: workspace, application, app size, final status, rule severity, rule category, rule name.
    - [X] link to Individual Rule Fails page

- Level 3 pages
  - [X] Individual Rule Fails : Details about an individual rule, along with a facet report showing failures and exception reason
        Facets: workspace, application, app size, final status
  - [X] Application Details - app summary, 12 month activity
    - [X] button to evaluate app
    - [X] link to rule fails

- Other pages
  - [X] Synchronization Log: Shows summary logs and task details for timings, rows processed, error messages.

## Known issues

None.
