--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_daily_app_activity_f endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_daily_app_activity_f');
create table sert_core.sg_daily_app_activity_f (
    log_day               date not null,            -- identifies day
    workspace_id          number not null,          -- identifies workspace
    workspace             varchar2(255) not null,   -- workspace name
    application_id        number not null,          -- identifies application
    application_name      varchar2(255) not null,   -- application name
    pages                 number not null,
    app_size              varchar2(2)
                          generated always as (
                              case
                                  when pages <= 5 then 'XS'
                                  when pages <= 15 then 'S'
                                  when pages <= 30 then 'M'
                                  when pages <= 50 then 'L'
                                  else 'XL'
                              end
                          ),
    --
    page_events           number not null,          -- total page events of all type
    page_views            number not null,          -- count of page gets
    page_accepts          number not null,          -- count of page posts
    partial_page_views    number not null,          -- count of partial page requests
    rows_fetched          number not null,          -- sum of rows fetched
    ir_searches           number not null,          -- count of events that are interactive report filtered executions
    --
    distinct_pages        number not null,          -- count of distinct pages viewed
    distinct_users        number not null,          -- count of distinct usernames
    distinct_sessions     number not null,          -- count of distinct sessions
    --
    average_render_time   number not null,          -- averge elapsed page generation time
    median_render_time    number not null,          -- median  elapsed page generation time
    maximum_render_time   number not null,          -- maximum elapsed page generation time
    total_render_time     number not null,          -- total elapsed page generation time
    content_length        number not null,          -- total content size in bytes
    error_count           number not null,          -- number of page events that raised errors
    --
    public_page_events     number not null,         -- total page events for public pages
    workspace_login_events number not null          -- total page events for APEX Workspace Login (4550:1)
);
--rollback drop table sert_core.sg_daily_app_activity_f cascade constraints purge;

--changeset mlancast:create_index_sert_core.sg_daily_app_activity_f_idx1 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedresult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_daily_app_activity_f') and index_name = upper('sg_daily_app_activity_f_idx1');
create unique index sert_core.sg_daily_app_activity_f_idx1 on sert_core.sg_daily_app_activity_f (workspace_id, application_id, log_day) compress;
--rollback not required

--changeset mlancast:create_index_sert_core.sg_daily_app_activity_f_idx2 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedresult:0 select count(*) from dba_indexes where owner = upper('sert_core') and table_name = upper('sg_daily_app_activity_f') and index_name = upper('sg_daily_app_activity_f_idx2');
create index sert_core.sg_daily_app_activity_f_idx2 on sert_core.sg_daily_app_activity_f (log_day, workspace_id) compress;
--rollback not required
