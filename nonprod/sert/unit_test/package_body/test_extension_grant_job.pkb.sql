--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_unit_test.test_extension_grant_job stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body unit_test.test_extension_grant_job
as

------------------------------------------------------------
-- remove_when_no_job_is_silent
-- Verifies remove_extension_grant_job does not raise when
-- the job does not exist.
------------------------------------------------------------
procedure remove_when_no_job_is_silent
as
begin
  -- ensure the job is absent before the test
  begin
    dbms_scheduler.drop_job(job_name => 'SERT_EXTENSION_GRANT_JOB', force => true);
  exception
    when others then null;
  end;

  sert_core.extension_xapi.remove_extension_grant_job;

  -- reaching here means no exception was raised
  ut.expect(1).to_equal(1);
end remove_when_no_job_is_silent;

------------------------------------------------------------
-- create_with_bad_workspace_raises
-- Verifies create_extension_grant_job raises NO_DATA_FOUND
-- when the workspace does not exist.
------------------------------------------------------------
procedure create_with_bad_workspace_raises
as
  l_raised boolean := false;
begin
  begin
    sert_core.extension_xapi.create_extension_grant_job(
      p_to_workspace => 'WORKSPACE_DOES_NOT_EXIST_UT99');
  exception
    when no_data_found then
      l_raised := true;
  end;
  ut.expect(l_raised).to_be_true;
end create_with_bad_workspace_raises;

------------------------------------------------------------
-- create_and_remove_default_interval
-- Verifies create_extension_grant_job creates the scheduler
-- job with default repeat_interval when not specified.
-- Tests the default parameter behavior.
------------------------------------------------------------
procedure create_and_remove_default_interval
as
  l_count  number;
  l_action varchar2(4000);
begin
  -- clean up in case a previous test run left the job
  sert_core.extension_xapi.remove_extension_grant_job;

  -- create the job without specifying repeat_interval (uses default)
  sert_core.extension_xapi.create_extension_grant_job(
    p_to_workspace => 'SERT');

  -- verify job exists with default repeat interval
  select count(*), max(job_action)
    into l_count, l_action
    from user_scheduler_jobs
   where job_name        = 'SERT_EXTENSION_GRANT_JOB'
     and repeat_interval = 'FREQ=MINUTELY;INTERVAL=10';

  ut.expect(l_count).to_equal(1);
  ut.expect(l_action).to_be_like('%grant_extension_workspace%');
  ut.expect(l_action).to_be_like('%SERT%');

  -- remove and verify it is gone
  sert_core.extension_xapi.remove_extension_grant_job;

  select count(*)
    into l_count
    from user_scheduler_jobs
   where job_name = 'SERT_EXTENSION_GRANT_JOB';

  ut.expect(l_count).to_equal(0);
end create_and_remove_default_interval;

------------------------------------------------------------
-- create_with_custom_frequency_interval
-- Verifies create_extension_grant_job honors a custom
-- repeat_interval string passed as parameter.
-- Tests: FREQ=HOURLY;INTERVAL=6
------------------------------------------------------------
procedure create_with_custom_frequency_interval
as
  l_count  number;
  l_repeat varchar2(100);
begin
  -- clean up
  sert_core.extension_xapi.remove_extension_grant_job;

  -- create with custom frequency/interval
  sert_core.extension_xapi.create_extension_grant_job(
    p_to_workspace    => 'SERT',
    p_repeat_interval => 'FREQ=HOURLY;INTERVAL=6');

  -- verify job was created with the custom repeat_interval
  select count(*), max(repeat_interval)
    into l_count, l_repeat
    from user_scheduler_jobs
   where job_name = 'SERT_EXTENSION_GRANT_JOB';

  ut.expect(l_count).to_equal(1);
  ut.expect(l_repeat).to_equal('FREQ=HOURLY;INTERVAL=6');

  -- clean up
  sert_core.extension_xapi.remove_extension_grant_job;
end create_with_custom_frequency_interval;

------------------------------------------------------------
-- create_with_daily_frequency
-- Verifies create_extension_grant_job works with DAILY
-- frequency and a custom interval.
-- Tests: FREQ=DAILY;INTERVAL=1
------------------------------------------------------------
procedure create_with_daily_frequency
as
  l_count  number;
  l_repeat varchar2(100);
begin
  -- clean up
  sert_core.extension_xapi.remove_extension_grant_job;

  -- create with daily frequency
  sert_core.extension_xapi.create_extension_grant_job(
    p_to_workspace    => 'SERT',
    p_repeat_interval => 'FREQ=DAILY;INTERVAL=1');

  -- verify job was created
  select count(*), max(repeat_interval)
    into l_count, l_repeat
    from user_scheduler_jobs
   where job_name = 'SERT_EXTENSION_GRANT_JOB';

  ut.expect(l_count).to_equal(1);
  ut.expect(l_repeat).to_equal('FREQ=DAILY;INTERVAL=1');

  -- clean up
  sert_core.extension_xapi.remove_extension_grant_job;
end create_with_daily_frequency;

end test_extension_grant_job;
/
--rollback not required
