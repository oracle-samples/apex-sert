# SERT Guardian Star Schema Design

The **SERT Guardian** star schema is designed to facilitate efficient analysis and reporting of evaluation data. It consists of a one or more fact tables surrounded by dimension tables, enabling flexible querying and insights into application security evaluations.

A data warehousing solution where the **star schema is in the same database** as the source tables and **uses the same primary keys** is typically described as an **In-Database Data Mart** or a **Decoupled Operational Data Store (ODS) / Data Mart Hybrid**.

The most defining feature is the collocation of source and target schemas.

* **Same Database:** Storing the star schema within the same database as the source tables means the data is not physically extracted and loaded into a separate, dedicated environment. The data warehouse tables (fact and dimension) are often built as views or materialised views on top of the source system tables.
* **Decoupling:** Even though they are in the same database, the star schema tables still represent a logical separation. They are structured for **reporting and analysis** (denormalized, optimized for queries), not for transactional processing, effectively creating a dedicated reporting layer or "data mart" right next to the operational data.

This type of solution is often chosen when **low data latency** and **ease of implementation** are higher priorities than long-term historical data capture and insulation from source system changes.

## 📐 Design Rules

* Existing SERT tables are source tables only. An ETL will populate data into the star schema tables.
* All star schema tables will be prefixed with `SG_`
* Fact tables will be suffixed with `_F`, dimension tables will be suffixed with `_D`
* Staging tables will be suffixed with `_FS` for fact staging tables, and `_DS` for dimension staging tables.
* Primary keys for star schema tables should be suffixed with `_WID` (warehouse id) to distinguish them from source system PKs (`_ID` or `_KEY`).
* Aggregate Facts use sparse design where you only store rows when the measure is greater than zero.
* Fact table foreign keys are created using `RELY DISABLE NOVALIDATE`, and Dimension primary keys are created using `RELY`. This improves data load performance while maintaining relationships for queries, as discussed in [FKs in data warehouse](https://danischnider.wordpress.com/2015/12/01/foreign-key-constraints-in-an-oracle-data-warehouse/). Data consistency is guarenteed by the ETL jobs, if this were not the case constraints should be enabled and validated.

## 🌟 Star Schema tables

The star schema design allows for efficient querying and analysis of evaluation data across various dimensions, including time, application, rule, and workspace. This facilitates comprehensive insights into application security and supports informed decision-making.

### Facts

* **SG_AGG_APP_RULE_RESULTS_F**     - aggregates SERT rule findings by application, rule, and result
* **SG_APP_RULE_FAILS_F**           - combines failed SERT rule findings with exception reasons. Filters by application, page, rule, and result dimensions.
* **SG_DAILY_APP_ACTIVITY_F**       - daily activity summary by application for last 4 weeks
* **SG_INSTANCE_METRICS_F**         - instance summary metrics for APEX and SERT by date
* **SG_MOST_4WK_APP_ACTIVITY_F**    - top daily activity by application for last 4 weeks

### Dimensions

* **SG_APPLICATION_PAGES_D**        - application page attributes - names, complexity, and eval_on
* **SG_APPLICATIONS_D**             - application attributes - names, page count, app size, avg page complexity, and eval on
* **SG_RESULTS_D**                  - result combinations for eval result (pass/fail) and final result (pass/fail/approved/pending/stale/rejected)
* **SG_RULES_D**                    - SERT rule attributes - name, type, impact, category, risk, criteria type, severity, active_yn
