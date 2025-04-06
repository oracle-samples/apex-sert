--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:alter_table_sert_core.eval_results_history_add_constraint_erh_eval_history_fk_1721800141546 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'ERH_EVAL_HISTORY_FK';
ALTER TABLE sert_core.eval_results_history
    ADD CONSTRAINT erh_eval_history_fk FOREIGN KEY ( eval_history_id )
        REFERENCES sert_core.eval_history ( eval_history_id )
            ON DELETE CASCADE
    NOT DEFERRABLE;
--rollback alter table sert_core.eval_results_history drop constraint ERH_EVAL_HISTORY_FK;
