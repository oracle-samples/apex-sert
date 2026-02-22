--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:alter_table_sert_core.sg_etl_task_log_add_constraint_sg_etl_task_log_fk1 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from all_constraints where owner = upper('sert_core') and constraint_name = upper('sg_etl_task_log_fk1');
alter table sert_core.sg_etl_task_log add constraint sg_etl_task_log_fk1
    foreign key (log_id) references sert_core.sg_etl_execution_log (log_id)
    on delete cascade;
--rollback alter table sert_core.sg_etl_task_log drop constraint sg_etl_task_log_fk1;

--changeset mlancast:alter_table_sert_core.sg_etl_task_log_add_constraint_sg_etl_task_log_fk2 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from all_constraints where owner = upper('sert_core') and constraint_name = upper('sg_etl_task_log_fk2');
alter table sert_core.sg_etl_task_log add constraint sg_etl_task_log_fk2
    foreign key (task_id) references sert_core.sg_etl_tasks (task_id)
    on delete cascade;
--rollback alter table sert_core.sg_etl_task_log drop constraint sg_etl_task_log_fk2;





