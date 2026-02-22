--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_rules_d endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_rules_d');
create table sert_core.sg_rules_d (
    rule_wid                    number
                                generated always as identity (
                                    start with 1 increment by 1 cache 100
                                ),
    rule_key                    varchar2(250) not null,
    apex_version                number        not null,
    rule_name                   varchar2(250) not null,
    rule_type                   varchar2(250) not null,
    impact                      varchar2(250) not null,
    view_name                   varchar2(250) not null,
    column_to_evaluate          varchar2(250) not null,
    component_id                varchar2(250) not null,
    component_name              varchar2(250) not null,
    item_name                   varchar2(250) not null,
    shared_comp_name            varchar2(250) not null,
    rule_active_yn              varchar2(1)   not null,
    updated_on                  timestamp with local time zone not null,
    category_id                 number        not null,
    category_key                varchar2(250) not null,
    category_name               varchar2(250) not null,
    risk_id                     number        not null,
    risk_code                   varchar2(250) not null,
    risk_name                   varchar2(250) not null,
    rule_criteria_type_id       number        not null,
    rule_criteria_type_key      varchar2(250) not null,
    rule_criteria_type_name     varchar2(250) not null,
    rule_critera_type_active_yn varchar2(1)   not null,
    rule_severity_id            number        not null,
    rule_severity_key           varchar2(250) not null,
    rule_severity_name          varchar2(250) not null,
    rule_severity_seq           number        not null,
    --
    constraint sg_rules_d_pk primary key (rule_wid) rely
);
--rollback drop table sert_core.sg_rules_d cascade constraints purge;

--changeset mlancast:create_index_sert_core.sg_rules_d_idx1 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedresult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_rules_d') and index_name = upper('sg_rules_d_idx1');
create unique index sert_core.sg_rules_d_idx1 on sert_core.sg_rules_d (rule_key);
--rollback not required
