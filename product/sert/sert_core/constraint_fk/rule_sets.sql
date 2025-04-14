--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:alter_table_sert_core.rule_sets_add_constraint_rs_rule_set_types_fk_1721800259817 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_constraints where owner = 'SERT_CORE' and constraint_name = 'RS_RULE_SET_TYPES_FK';
ALTER TABLE sert_core.rule_sets
    ADD CONSTRAINT rs_rule_set_types_fk FOREIGN KEY ( rule_set_type_id )
        REFERENCES sert_core.rule_set_types ( rule_set_type_id )
    NOT DEFERRABLE;
--rollback alter table sert_core.rule_sets drop constraint RS_RULE_SET_TYPES_FK;
