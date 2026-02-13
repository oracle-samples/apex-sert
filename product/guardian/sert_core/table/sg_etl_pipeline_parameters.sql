--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_etl_pipeline_parameters endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_etl_pipeline_parameters');
-- Defines the parameters expected by an ETL pipeline, enforcing data type and conversion mask rules.
create table sert_core.sg_etl_pipeline_parameters (
    pipeline_id                 number not null,
    parameter_name              varchar2(128) not null,
    data_type                   varchar2(20) not null,
    is_required                 char(1) default 'Y' not null,
    format_mask                 varchar2(100),
    constraint sg_etl_pipeline_parameters_pk
        primary key (pipeline_id, parameter_name),
    constraint sg_etl_pipeline_parameters_cc1
        check (data_type in ('VARCHAR2', 'NUMBER', 'DATE', 'TIMESTAMP')),
    constraint sg_etl_pipeline_parameters_cc2
        check (is_required in ('Y', 'N')),
    constraint sg_etl_pipeline_parameters_cc3
        check (
            (data_type = 'VARCHAR2' and format_mask is null) or
            (data_type = 'NUMBER') or
            (data_type in ('DATE', 'TIMESTAMP') and format_mask is not null)
        )
);
--rollback drop table sert_core.sg_etl_pipeline_parameters cascade constraints purge;

--changeset mlancast:create_index_sert_core.sg_etl_job_param_fk_idx endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_indexes where owner = upper('sert_core') and index_name = upper('sg_etl_job_param_fk_idx');
create index sert_core.sg_etl_job_param_fk_idx on sert_core.sg_etl_pipeline_parameters (pipeline_id);
--rollback not required
