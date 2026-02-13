--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:alter_table_sert_core.sg_etl_pipeline_parameters_add_constraint_sg_etl_pipeline_parameters_fk endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from all_constraints where owner = upper('sert_core') and constraint_name = upper('sg_etl_pipeline_parameters_fk');
alter table sert_core.sg_etl_pipeline_parameters add constraint sg_etl_pipeline_parameters_fk
    foreign key (pipeline_id) references sert_core.sg_etl_pipelines (pipeline_id);
--rollback alter table sert_core.sg_etl_pipeline_parameters drop constraint sg_etl_pipeline_parameters_fk;
