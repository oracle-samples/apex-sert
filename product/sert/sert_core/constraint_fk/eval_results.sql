--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:alter_table_sert_core.eval_results_add_constraint_er_evals_fk_1721800173790 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'ER_EVALS_FK';
ALTER TABLE sert_core.eval_results
    ADD CONSTRAINT er_evals_fk FOREIGN KEY ( eval_id )
        REFERENCES sert_core.evals ( eval_id )
            ON DELETE CASCADE
    NOT DEFERRABLE;
--rollback alter table sert_core.eval_results drop constraint ER_EVALS_FK;

--changeset mipotter:alter_table_sert_core.eval_results_add_constraint_er_rules_fk_1721800180952 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'ER_RULES_FK';
ALTER TABLE sert_core.eval_results
    ADD CONSTRAINT er_rules_fk FOREIGN KEY ( rule_id )
        REFERENCES sert_core.rules ( rule_id )
    NOT DEFERRABLE;
--rollback alter table sert_core.eval_results drop constraint ER_RULES_FK;
