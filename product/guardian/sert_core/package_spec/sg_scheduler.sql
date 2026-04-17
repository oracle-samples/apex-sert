--liquibase formatted sql
--------------------------------------------------------------------------------
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mik:create_package_spec_sert_core.sg_scheduler endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
--rollback drop package sert_core.sg_scheduler;

create or replace package sert_core.sg_scheduler as

    gc_job_name   constant varchar2(100) := 'SG_ETL_MAIN_SCHEDULE';

    gc_freq_daily   constant varchar2(10) := 'DAILY';
    gc_freq_weekly  constant varchar2(10) := 'WEEKLY';
    gc_freq_hourly  constant varchar2(10) := 'HOURLY';

    /*
    ** Create (or replace) the recurring Guardian ETL main schedule.
    **
    ** Only one schedule may exist at a time.  Calling this procedure drops
    ** any existing job before creating the new one.
    **
    ** p_frequency   DAILY | WEEKLY | HOURLY
    ** p_interval_n  For HOURLY: run every N hours (1-23).  Default 1.
    ** p_days        For WEEKLY: comma-separated Oracle BYDAY abbreviations
    **               (MON, TUE, WED, THU, FRI, SAT, SUN).
    ** p_hour        Hour of day 0-23.  NULL = randomise (unused for HOURLY).
    ** p_minute      Minute of hour 0-59.  NULL = randomise.
    **
    ** Hours and minutes are randomised once at job-creation time and stored
    ** in the repeat_interval — they do not change on each run.
    */
    procedure create_schedule (
        p_frequency   in varchar2,
        p_interval_n  in number   default 1,
        p_days        in varchar2 default null,
        p_hour        in number   default null,
        p_minute      in number   default null
    );

    -- Drop the ETL schedule job if it exists.
    procedure remove_schedule;

    -- Return TRUE when the schedule job currently exists in the database.
    function job_exists return boolean;

    -- Return a human-readable one-line description of the current schedule
    -- (repeat interval + next run date + enabled status), or NULL when no
    -- schedule exists.
    function get_schedule_info return varchar2;

end sg_scheduler;
/
