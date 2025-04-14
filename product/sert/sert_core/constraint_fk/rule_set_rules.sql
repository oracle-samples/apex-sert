--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:alter_table_sert_core.rule_set_rules_add_constraint_rule_set_rules_rule_sets_fk_1721800244613 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'RULE_SET_RULES_RULE_SETS_FK';
ALTER TABLE sert_core.rule_set_rules
    ADD CONSTRAINT rule_set_rules_rule_sets_fk FOREIGN KEY ( rule_set_id )
        REFERENCES sert_core.rule_sets ( rule_set_id )
            ON DELETE CASCADE
    NOT DEFERRABLE;
--rollback alter table sert_core.rule_set_rules drop constraint RULE_SET_RULES_RULE_SETS_FK;

--changeset mipotter:alter_table_sert_core.rule_set_rules_add_constraint_rule_set_rules_rules_fk_1721800251630 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'RULE_SET_RULES_RULES_FK';
ALTER TABLE sert_core.rule_set_rules
    ADD CONSTRAINT rule_set_rules_rules_fk FOREIGN KEY ( rule_id )
        REFERENCES sert_core.rules ( rule_id )
            ON DELETE CASCADE
    NOT DEFERRABLE;
--rollback alter table sert_core.rule_set_rules drop constraint RULE_SET_RULES_RULES_FK;
