--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:alter_table_sert_core.comments_add_constraint_c_rule_sets_fk_1721799850435 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'C_RULE_SETS_FK';
ALTER TABLE sert_core.comments
    ADD CONSTRAINT c_rule_sets_fk FOREIGN KEY ( rule_set_id )
        REFERENCES sert_core.rule_sets ( rule_set_id )
    NOT DEFERRABLE;
--rollback alter table sert_core.comments drop constraint C_RULE_SETS_FK;

--changeset mipotter:alter_table_sert_core.comments_add_constraint_c_rules_fk_1721799858160 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'C_RULES_FK';
ALTER TABLE sert_core.comments
    ADD CONSTRAINT c_rules_fk FOREIGN KEY ( rule_id )
        REFERENCES sert_core.rules ( rule_id )
            ON DELETE CASCADE
    NOT DEFERRABLE;
--rollback alter table sert_core.comments drop constraint C_RULES_FK;
