# Release Notes

## 24.2.27
### Automate extension subscription for new workspaces

- Optionally allow installer to configure a scheduled job that will subscribe all workspaces that have not been subscribed. After the job executes ALL existing workspaces (not SERT or APEX product) will be subscribed.  reference [install guide](install_guide.md)

### Bulk Comments

- Add a Bulk Add Comment action to the evaluation results page (App 2100) that lets a user apply a single comment to all findings for a selected rule, with an optional filter by finding status.
- ensure user can see fix/info data for a rule, when doing bulk operations 

### release version refactor

A housekeeping measure to put the statement setting SERT version, into it's own file and changeset for easier management
`product/sert/sert_core/seed_data/052_prefs_release.sql` now contains the preference `RELEASE_VERSION`

## 24.2.26

### improved AI behaviour for Exception scoring

Redesigned the AI-powered exception scoring feature in to produce richer, more contextually accurate scores.
Scoring now uses rule name, info, fix guidance, valid exceptions, category, OWASP risk code/name, and severity - previously it only used sample exception reasons to evaluate against, now the system will use the available information to score, in addition to any examples.

Smarter skip logic: scoring is skipped when both info and valid_exceptions are null, avoiding low-quality AI calls

## 24.2.25 

### Updated Security Rule: Unprotected Substitution Variables

An existing rule for detecting unprotected APEX substitution variables (`&WORD.` / `&WORD`) was overhauled. A new `linter_util` package provides a proper PL/SQL tokenizer (`tokenize_plsql`, `stmt_has_unprotected_subst`, `sql_injection_item_syntax`) that strips comments, upper-cases statements, and checks each statement individually — replacing a simpler pattern-match approach. The rule criteria in `080_rule_criteria_merge.sql` was updated to invoke this logic, returning `FAIL` only when an unprotected substitution variable appears outside an `apex_escape` wrapper.

### Scheduling Refactor

- `schedule_api`: new `add_schedule_job_flex` procedure supporting explicit `DAILY`/`WEEKLY` modes with 24-hour time input; also adds `schedule_job_ot` object type and `schedule_job_nt` nested-table type for structured job metadata.
- APEX 2100 page 50: conditional show/hide of scheduling UI items during active scheduling workflows.
- **Guardian**: new `sg_scheduler` package (`create_schedule`, `remove_schedule`, `job_exists`) bringing the same scheduling capability to Guardian (app 2102 page 10).

### Exception Summary Download

`data_api` gains `exceptions_summary` (returns JSON CLOB grouped by `rule_key`) and `apex_download_exceptions_summary` for streaming it as a file download from APEX.

### New Preference

`DELETE_EVAL_EXCEPTIONS` preference added (default `'N'`) — controls whether comments and exceptions are automatically deleted when an evaluation is deleted.

### Infrastructure & Dev Scripts

New `export_apex.sh`, `push_release.sh`, `sert_eval.sh`, and `add_license.sh` scripts; seed scripts split into per-APEX-version JSON files (`24_1`, `24_2`, `25_1`); version bumped to `24.2.24` across apps 2100, 2101, and 2102.

## 24.2.24

This release improves rule accuracy, adds more control over evaluation cleanup, and makes rule management a little easier in the APEX UI. It also includes updated APEX application exports and a broad round of PL/SQL cleanup and refactoring work.

### Functional changes

#### Improved duplicate submission rule logic

The **Allow Duplicate Submissions** rule was updated to reduce false positives.
Previously, the rule relied on a direct page attribute check. It now uses a custom query that evaluates whether a page has characteristics that make duplicate submissions riskier, including:

- submit-time page processes,
- editable Interactive Grids,
- dynamic actions, and
- computations.

This makes the rule more selective and should produce findings that better reflect genuine risk.

#### New preference for deleting evaluation comments and exceptions

A new preference, **`DELETE_EVAL_EXCEPTIONS`**, was added in seed data.
Evaluation deletion flows in the SERT application were updated so that delete operations now pass this setting into backend evaluation deletion logic. This allows deployments to control whether related comments and exceptions should also be removed when an evaluation is deleted.
**Default value:** `N`

#### Copy Rule page now shows rule set version

In application **2101**, the **Copy Rule** page was improved so the **Add to Rule Sets** shuttle now displays the rule set name together with its APEX version.
Example format:

- `Rule Set Name (24.2.x)`

This makes it easier to choose the correct target rule set when multiple versions exist with similar names.

### Key changes

PL/SQL package refactoring and standards cleanup
Several SERT core packages were reformatted or refactored, including:

- `eval_pkg.pkb.sql`
- `data_api.pkb.sql`
- `exceptions_api.pkb.sql`
- `extension_xapi.pkb.sql`
- `comments_api.pkb.sql`
- `sert_util.pkb.sql`
- `is_reports_api.pkb.sql`
- `is_reports_api.pks.sql`

Notable work includes:

- `refactor eval_pkg` for improved modularisation/maintenance
  - extracted private helpers for criteria-type lookup, execution gating, APEX view SQL construction, custom query SQL construction, insert SQL wrapping, stale-exception marking, eval completion/scoring, history capture, and result-name enrichment.
- formatting normalization
- routine banner/documentation alignment
- SQL/PLSQL standards cleanup
- extraction of shared constants in `is_reports_api`

### tickets

- [GAT-510] - reduce false positives for Allow Duplicate Submissions rule by checking for Processes,IG and DAs
- [GAT-517] - Deleting an Evaluation and all exceptions should be limited to prevent accidental data loss #54
Task
- [GAT-519] - refactor eval_pkg
Change - Standard
- [GAT-518] - 2101:2012 Copy Rule Page - update LOV to show ruleset version



## 24.2.23

[SERT Guardian](guardian/sert-guardian.md) is a new "opt-in" feature for security specialists and technical leads.

- [GAT-376] - SERT Guardian: A holistic view of findings across a whole instance in one place
- [GAT-512] - Create Guardian star schema
- [GAT-513] - Create SG ETL Controller
- [GAT-514] - Create Guardian application
- [GAT-515] - Add Guardian Documentation

## 24.2.22

- [GAT-501] - Create new lov for Select Rule in Exception bulk approve/reject to improve performance
- [GAT-500] - Exception bulk approve/reject performance improvement
- [GAT-503] - Amend rule exception select process - performance
- [GAT-504] - Amend rule exception accept/reject project - performance
- [GAT-509] - improve admin app 2101:2010 to provide documentation link for ease of test/verifying
- [GAT-516] - improve reporting (add and cleanup columns) for Reports -> Evaluation Details

## 24.2.21

- [GAT-502] - Replace new lov in line code with a view rules_by_exception_v.
- [GAT-507] - procedure to mitigate invalidation of exceptions_api on db updates
- [GAT-484] - remove preferences for docgen as they are redundant
- [GAT-498] - show the most recent evaluator for a scan
- [GAT-499] - Rules: Interactive Grid SQLi and Interactive Report SQLi display nothing in About this Rule or How to Fix sections.

## 24.2.20

- [GAT-485] - Button AuthZ Inconsistency cater for using page AuthZ when no AuthZ on button
- [GAT-486] - Interactive Report Column AuthZ Inconsistency support pages AuthZ when column has not authZ
- [GAT-487] - List Entry AuthZ Inconsistency cater for must_no_be_public_user and none for target page
- [GAT-488] - Interactive Grid Column AuthZ Inconsistency: support page level AuthZ
- [GAT-489] - Classic Report Column AuthZ Inconsistency:: support page level AuthZ
- [GAT-490] - Interactive Report Link AuthZ Inconsistency: support page level AuthZ
- [GAT-491] - improve performance of bulk exceptions LOV
- [GAT-492] - EVAL_RESULTS_V fails when column current_value is too long, even when using substr
- [GAT-493] - improve performance of bulk exceptions
- [GAT-494] - improve performance of calc_score
- [GAT-496] - Application 2101:2010: View Comments item shows view comments from all installed APEX versions, should show only latest
- [GAT-497] - SQLi incorrect &ITEM. syntax regular expression causes too many false positives

## 24.2.19

- [GAT-479] - APEX 25.1 rule preparation
- [GAT-473] - have exception json download files use predictable names (no timestamp)
- [GAT-478] - Add a preference to enable/disable eval_history logging
- [GAT-477] - ORA-40478: output value too large (maximum: 4000) on download exceptions
- [GAT-481] - Page Item Encryption - do not flag native image and start/stop html table region types
- [GAT-482] - Maximum Row Count, Max Rows to Query - Classic Report, set consistent value of 1000

## 24.2.18

- [GAT-469] - Implement AI support for scoring exception justifications
- [GAT-476] - performance: sert_core.evals_pub_v is very poor when eval_results is large (100K+) #48
- [GAT-475] - fix schema for eval_results_eval_id_idx

## 24.2.17

- [GAT-466] - Rule "List Entry Does Not Contain &ITEM. Syntax" - wrong component_id #42
- [GAT-467] - product/sert/post_install/9001_check_invalids.sql throws error when using sqlcl24.1
- [GAT-468] - DB 19.2x Error on installing product/sert/post_install/9001_check_invalids.sql SERT_CORE.EXCEPTIONS_API #40

## 24.2.16

- [GAT-465] - EVAL_RESULTS_EXC_PUB_V will not compile with ANSI join on PDB 19.27 #38
- [GAT-440] - Provide uninstall script / documentation #12

## 24.2.15

- [GAT-459] - improve performance of evaluation dashboard and details page load
- [GAT-462] - move acdc setup script to util directory
- [GAT-460] - tune finding details page load - don't test for apex page update on each render
- [GAT-461] - workspace name hard-coded in build_options install script
- [GAT-452] - Add options for ordering results in dashboard

## 24.2.14

- [GAT-438] - github #19 Expose Severity attribute to main report
- [GAT-439] - Check App ID availability in sert.properties before starting #11
- [GAT-448] - Exclude File Browse item from Encrypted Items check #27
- [GAT-449] - Run authz on public pages should be ignored if authz scheme = must not be public user #28
- [GAT-457] - Doc: ora-22905 in exceptions API when referencing a table sql_macro #34
- [GAT-458] - Expose Severity attribute to main report #19

## 24.2.13

- [GAT-456] - error in eval_pkg causes pending exceptions to be marked stale

## 24.2.12

- [GAT-437] - Application "Scoreboard" not updating asynchronously #17
- [GAT-447] - Compatibility Version should be updated in rules #26
- [GAT-453] - 2000_upgrade_sert_apex_version.sql fails due to string-number conversion in international format #32
- [GAT-454] - SERT Stale Exceptions, whitespace affects the STALENESS
- [GAT-455] - add ability to ignore checksums on exception upload

## 24.2.11

- No Rule Criteria imported during install #30

## 24.2.10

- remove oracle specific links from install guide md
Bug (Non BugDB)
- "add exception" regression bug casues UI to fail on adding exception
- - No Rule Criteria imported during install #30

## 24.2.9

- APEX applications upgraded to 24.2
- automated migration script fails when custom ruleset is installed
- github #22 provide support for sqlcl 24.4+ where & character is respected as a DEFINEd variable
- github #23 international decimal seperator (,) used by default in non english environment for apex_sert_verson preference and should not be
- escape special characters in exception text like &, single quote for safer export/import of exceptions

## 24.2.8

- Remove APEX version from exception checksum checks in exception export/import
- github#16 When custom image used for application, it does not render in SERT
- avoid reference to sert_core tables within APP for AOP and DocGen
- SERT Open Source - How to enable AOP
- move sert_pub AOP grants to aop product folder
- comments don't appear after creation when running sert in other workspaces
- sert_core.schedule_api.process_eval_summary_results fails with large result sets
- After uploading exception from API, no exceptions are logged