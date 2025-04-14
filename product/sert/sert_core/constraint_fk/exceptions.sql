--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:alter_table_sert_core.exceptions_add_constraint_e_rule_sets_fkv2_1721800204018 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'E_RULE_SETS_FKV2';
ALTER TABLE sert_core.exceptions
    ADD CONSTRAINT e_rule_sets_fkv2 FOREIGN KEY ( rule_set_id )
        REFERENCES sert_core.rule_sets ( rule_set_id )
    NOT DEFERRABLE;
--rollback alter table sert_core.exceptions drop constraint E_RULE_SETS_FKV2;

--changeset mipotter:alter_table_sert_core.exceptions_add_constraint_e_rules_fk_1721800211397 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'E_RULES_FK';
ALTER TABLE sert_core.exceptions
    ADD CONSTRAINT e_rules_fk FOREIGN KEY ( rule_id )
        REFERENCES sert_core.rules ( rule_id )
            ON DELETE CASCADE
    NOT DEFERRABLE;
--rollback alter table sert_core.exceptions drop constraint E_RULES_FK;
