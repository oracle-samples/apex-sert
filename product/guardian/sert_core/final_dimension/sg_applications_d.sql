--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_applications_d endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_applications_d');
create table sert_core.sg_applications_d (
    application_wid         number
                            generated always as identity (
                                start with 1 increment by 1 cache 100
                            ),
    application_id          number        not null,
    workspace_id            number        not null,
    workspace               varchar2(255) not null,
    application_name        varchar2(255) not null,
    pages                   number        not null,
    app_size                varchar2(2)
                            generated always as (
                                case
                                    when pages <= 5 then 'XS'
                                    when pages <= 15 then 'S'
                                    when pages <= 30 then 'M'
                                    when pages <= 50 then 'L'
                                    else 'XL'
                                end
                            ),
    app_size_seq            number
                            generated always as (
                                case
                                    when pages <= 5  then 1
                                    when pages <= 15 then 2
                                    when pages <= 30 then 3
                                    when pages <= 50 then 4
                                    else 5
                                end
                            ),
    avg_page_complexity     number        not null,
    eval_on                 timestamp with local time zone not null,
    constraint sg_applications_d_pk primary key (application_wid) rely
);
--rollback drop table sert_core.sg_applications_d cascade constraints purge;

--changeset mlancast:create_index_sert_core.sg_applications_d_idx1 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedresult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_applications_d') and index_name = upper('sg_applications_d_idx1');
create unique index sert_core.sg_applications_d_idx1
    on sert_core.sg_applications_d (application_id, workspace_id)
    compress;

alter table sert_core.sg_applications_d
add constraint sg_applications_d_uk
    unique (application_id, workspace_id)
    using index sert_core.sg_applications_d_idx1;
--rollback not required

--changeset mlancast:create_index_sert_core.sg_applications_d_idx2 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedresult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_applications_d') and index_name = upper('sg_applications_d_idx2');
create        index sert_core.sg_applications_d_idx2 on sert_core.sg_applications_d (workspace_id);
--rollback not required

--changeset mlancast:create_index_sert_core.sg_applications_d_idx3 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedresult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_applications_d') and index_name = upper('sg_applications_d_idx3');
create        index sert_core.sg_applications_d_idx3 on sert_core.sg_applications_d (workspace);
--rollback not required

--changeset mlancast:create_index_sert_core.sg_applications_d_idx4 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedresult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_applications_d') and index_name = upper('sg_applications_d_idx4');
create bitmap index sert_core.sg_applications_d_idx4 on sert_core.sg_applications_d (app_size);
--rollback not required
