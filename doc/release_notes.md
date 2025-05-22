# Release Notes
## 24.2.10

- remove oracle specific links from install guide md
Bug (Non BugDB)
- "add exception" regression bug casues UI to fail on adding exception

## 24.2.9

- APEX applications upgraded to 24.2
- automated migration script fails when custom ruleset is installed
- github #22 provide support for sqlcl 24.4+ where & character is respected as a DEFINEd variable
- github #23 international decimal seperator (,) used by default in non english environment for apex_sert_verson preference and should not be
- escape special characters in exception text like &, single quote for safer export/import of exceptions

## 24.2.8

[GAT-435] - Remove APEX version from exception checksum checks in exception export/import

[GAT-436] - github#16 When custom image used for application, it does not render in SERT

[GAT-423] - avoid reference to sert_core tables within APP for AOP and DocGen

[GAT-427] - SERT Open Source - How to enable AOP

[GAT-431] - move sert_pub AOP grants to aop product folder

[GAT-432] - comments don't appear after creation when running sert in other workspaces

[GAT-433] - sert_core.schedule_api.process_eval_summary_results fails with large result sets

[GAT-434] - After uploading exception from API, no exceptions are logged
