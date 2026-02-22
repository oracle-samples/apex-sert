--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_table_sert_core.sg_most_4wk_app_activity_f endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_tables where owner = upper('sert_core') and table_name = upper('sg_most_4wk_app_activity_f');
create table sert_core.sg_most_4wk_app_activity_f (
    workspace_id          number not null,          -- identifies workspace
    application_id        number not null,          -- identifies application
    --
    workspace             varchar2(255) not null,   -- workspace name
    application_name      varchar2(255) not null,   -- application name
    pages                 number not null,          -- count of application pages
    app_size              varchar2(2) not null,     -- application size XS, S, M, L, XL
    log_day               date not null,            -- identifies day
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
    workspace_login_events number not null,         -- total page events for APEX Workspace Login (4550:1)
    --
    sparkline_data         varchar2(500) not null,  -- csv list of daily total page events for last 28 days since data sync
    --
    constraint sg_most_4wk_app_activity_f_pk primary key (workspace_id, application_id)
);
--rollback drop table sert_core.sg_most_4wk_app_activity_f cascade constraints purge;
