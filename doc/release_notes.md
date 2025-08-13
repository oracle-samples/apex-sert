# Release Notes

## 24.2.17

* [GAT-466] - Rule "List Entry Does Not Contain &ITEM. Syntax" - wrong component_id #42
* [GAT-467] - product/sert/post_install/9001_check_invalids.sql throws error when using sqlcl24.1
* [GAT-468] - DB 19.2x Error on installing product/sert/post_install/9001_check_invalids.sql SERT_CORE.EXCEPTIONS_API #40

## 24.2.16

* [GAT-465] - EVAL_RESULTS_EXC_PUB_V will not compile with ANSI join on PDB 19.27 #38
* [GAT-440] - Provide uninstall script / documentation #12

## 24.2.15

* [GAT-459] - improve performance of evaluation dashboard and details page load
* [GAT-462] - move acdc setup script to util directory
* [GAT-460] - tune finding details page load - don't test for apex page update on each render
* [GAT-461] - workspace name hard-coded in build_options install script
* [GAT-452] - Add options for ordering results in dashboard

## 24.2.14

* [GAT-438] - github #19 Expose Severity attribute to main report
* [GAT-439] - Check App ID availability in sert.properties before starting #11
* [GAT-448] - Exclude File Browse item from Encrypted Items check #27
* [GAT-449] - Run authz on public pages should be ignored if authz scheme = must not be public user #28
* [GAT-457] - Doc: ora-22905 in exceptions API when referencing a table sql_macro #34
* [GAT-458] - Expose Severity attribute to main report #19

## 24.2.13

* [GAT-456] - error in eval_pkg causes pending exceptions to be marked stale

## 24.2.12

* [GAT-437] - Application "Scoreboard" not updating asynchronously #17
* [GAT-447] - Compatibility Version should be updated in rules #26
* [GAT-453] - 2000_upgrade_sert_apex_version.sql fails due to string-number conversion in international format #32
* [GAT-454] - SERT Stale Exceptions, whitespace affects the STALENESS
* [GAT-455] - add ability to ignore checksums on exception upload

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