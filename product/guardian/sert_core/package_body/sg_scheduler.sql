--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mik:create_package_body_sert_core.sg_scheduler endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false

create or replace package body sert_core.sg_scheduler as

gc_full_job_name constant varchar2(200) := 'SERT_CORE.' || gc_job_name;

--
-- Returns a random hour in the range 0-23, chosen once at schedule-creation
-- time to spread load across database instances.
--
function random_hour return number is
begin
    return trunc(dbms_random.value(0, 24));
end random_hour;

--
-- Returns a random minute in the range 0-59, chosen once at schedule-creation
-- time to avoid thundering-herd effects.
--
function random_minute return number is
begin
    return trunc(dbms_random.value(0, 60));
end random_minute;

--
-- Builds the DBMS_SCHEDULER repeat_interval string from the given frequency,
-- interval, days, hour, and minute parameters.
--
function build_repeat_interval (
    p_frequency  in varchar2,
    p_interval_n in number,
    p_days       in varchar2,
    p_hour       in number,
    p_minute     in number )
    return varchar2
is
    l_hour   number := nvl(p_hour,   random_hour);
    l_minute number := nvl(p_minute, random_minute);
begin
    case upper(p_frequency)

        when gc_freq_hourly then
            -- Run every N hours at a fixed minute offset.
            -- p_hour is ignored for HOURLY schedules.
            return    'FREQ=HOURLY'
                   || ';INTERVAL=' || nvl(p_interval_n, 1)
                   || ';BYMINUTE=' || l_minute
                   || ';BYSECOND=0';

        when gc_freq_daily then
            return    'FREQ=DAILY'
                   || ';BYHOUR='   || l_hour
                   || ';BYMINUTE=' || l_minute
                   || ';BYSECOND=0';

        when gc_freq_weekly then
            if p_days is null then
                raise_application_error(
                    -20002,
                    'sg_scheduler.create_schedule: at least one day must be selected for WEEKLY frequency'
                );
            end if;
            return    'FREQ=WEEKLY'
                   || ';BYDAY='    || upper(p_days)
                   || ';BYHOUR='   || l_hour
                   || ';BYMINUTE=' || l_minute
                   || ';BYSECOND=0';

        else
            raise_application_error(
                -20001,
                'sg_scheduler.create_schedule: invalid frequency "' || p_frequency || '"'
                || ' — expected DAILY, WEEKLY or HOURLY'
            );

    end case;
end build_repeat_interval;

--
-- Create (or replace) the recurring Guardian ETL main schedule.
-- Drops any existing job before creating the new one.
--
procedure create_schedule (
    p_frequency   in varchar2,
    p_interval_n  in number   default 1,
    p_days        in varchar2 default null,
    p_hour        in number   default null,
    p_minute      in number   default null )
is
    l_repeat_interval varchar2(500);
begin
    -- Enforce single-schedule rule: drop existing job first.
    remove_schedule;

    l_repeat_interval := build_repeat_interval(
        p_frequency  => p_frequency,
        p_interval_n => nvl(p_interval_n, 1),
        p_days       => p_days,
        p_hour       => p_hour,
        p_minute     => p_minute
    );

    dbms_scheduler.create_job(
        job_name        => gc_full_job_name,
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'begin sert_core.sg_util.run_main_etl; end;',
        repeat_interval => l_repeat_interval,
        enabled         => true,
        auto_drop       => false,
        comments        => 'Guardian ETL main schedule — created '
                           || to_char(systimestamp, 'YYYY-MM-DD HH24:MI:SS TZH:TZM')
    );
end create_schedule;

--
-- Drop the ETL schedule job if it exists.
--
procedure remove_schedule is
begin
    if job_exists then
        dbms_scheduler.drop_job(
            job_name => gc_full_job_name,
            force    => true
        );
    end if;
end remove_schedule;

--
-- Return TRUE when the schedule job currently exists in the database.
--
function job_exists return boolean is
    l_count number;
begin
    select count(1)
      into l_count
      from user_scheduler_jobs
     where job_name = gc_job_name;

    return l_count > 0;
end job_exists;

--
-- Return a human-readable one-line description of the current schedule
-- (repeat_interval + next run date + enabled status), or NULL when no
-- schedule exists.
--
function get_schedule_info return varchar2 is
    l_interval   user_scheduler_jobs.repeat_interval%type;
    l_next       user_scheduler_jobs.next_run_date%type;
    l_enabled    user_scheduler_jobs.enabled%type;
    l_freq       varchar2(20);
    l_interval_n varchar2(10);
    l_byday      varchar2(200);
    l_byhour     varchar2(10);
    l_byminute   varchar2(10);
    l_desc       varchar2(500);
begin
    begin
        select repeat_interval
             , next_run_date
             , enabled
          into l_interval
             , l_next
             , l_enabled
          from user_scheduler_jobs
         where job_name = gc_job_name;
    exception
        when no_data_found then
            return null;
    end;

    -- Parse individual tokens from the repeat_interval string.
    l_freq       := regexp_substr(l_interval, 'FREQ=([^;]+)',     1, 1, 'i', 1);
    l_interval_n := regexp_substr(l_interval, 'INTERVAL=([^;]+)', 1, 1, 'i', 1);
    l_byday      := regexp_substr(l_interval, 'BYDAY=([^;]+)',    1, 1, 'i', 1);
    l_byhour     := regexp_substr(l_interval, 'BYHOUR=([^;]+)',   1, 1, 'i', 1);
    l_byminute   := regexp_substr(l_interval, 'BYMINUTE=([^;]+)', 1, 1, 'i', 1);

    case upper(l_freq)
        when 'HOURLY' then
            l_desc := 'Every ' || nvl(l_interval_n, '1') || ' hour(s) at :'
                   || lpad(nvl(l_byminute, '0'), 2, '0');
        when 'DAILY' then
            l_desc := 'Daily at '
                   || lpad(nvl(l_byhour, '0'),   2, '0') || ':'
                   || lpad(nvl(l_byminute, '0'), 2, '0');
        when 'WEEKLY' then
            l_desc := 'Weekly on ' || l_byday || ' at '
                   || lpad(nvl(l_byhour, '0'),   2, '0') || ':'
                   || lpad(nvl(l_byminute, '0'), 2, '0');
        else
            l_desc := l_interval;
    end case;

    l_desc := l_desc
           || ' | Next: '
           || to_char(cast(l_next as date), 'YYYY-MM-DD HH24:MI')
           || ' | '
           || case when l_enabled = 'TRUE' then 'Enabled' else 'Disabled' end;

    return l_desc;
end get_schedule_info;

end sg_scheduler;
/
--rollback not required
