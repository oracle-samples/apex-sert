--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:alter_table_sert_core.rules_add_constraint_r_categories_fk_1721800287183 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'R_CATEGORIES_FK';
ALTER TABLE sert_core.rules
    ADD CONSTRAINT r_categories_fk FOREIGN KEY ( category_id )
        REFERENCES sert_core.categories ( category_id )
            ON DELETE CASCADE
    NOT DEFERRABLE;
--rollback alter table sert_core.rules drop constraint R_CATEGORIES_FK;

--changeset mipotter:alter_table_sert_core.rules_add_constraint_r_risks_fk_1721800295041 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'R_RISKS_FK';
ALTER TABLE sert_core.rules
    ADD CONSTRAINT r_risks_fk FOREIGN KEY ( risk_id )
        REFERENCES sert_core.risks ( risk_id )
    NOT DEFERRABLE;
--rollback alter table sert_core.rules drop constraint R_RISKS_FK;

--changeset mipotter:alter_table_sert_core.rules_add_constraint_r_rule_criteria_type_fk_1721800301848 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'R_RULE_CRITERIA_TYPE_FK';
ALTER TABLE sert_core.rules
    ADD CONSTRAINT r_rule_criteria_type_fk FOREIGN KEY ( rule_criteria_type_id )
        REFERENCES sert_core.rule_criteria_types ( rule_criteria_type_id )
    NOT DEFERRABLE;
--rollback alter table sert_core.rules drop constraint R_RULE_CRITERIA_TYPE_FK;

--changeset mipotter:alter_table_sert_core.rules_add_constraint_r_rule_severity_fk_1721800313485 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'R_RULE_SEVERITY_FK';
ALTER TABLE sert_core.rules
    ADD CONSTRAINT r_rule_severity_fk FOREIGN KEY ( rule_severity_id )
        REFERENCES sert_core.rule_severity ( rule_severity_id )
    NOT DEFERRABLE;
--rollback alter table sert_core.rules drop constraint R_RULE_SEVERITY_FK;

--changeset mipotter:alter_table_sert_core.rules_add_constraint_rules_builder_urls_fk_1721800319553 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'RULES_BUILDER_URLS_FK';
ALTER TABLE sert_core.rules
    ADD CONSTRAINT rules_builder_urls_fk FOREIGN KEY ( builder_url_id )
        REFERENCES sert_core.builder_urls ( builder_url_id )
    NOT DEFERRABLE;
--rollback alter table sert_core.rules drop constraint RULES_BUILDER_URLS_FK;
