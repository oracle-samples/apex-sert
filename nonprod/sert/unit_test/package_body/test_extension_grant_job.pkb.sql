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
-- create_and_remove_lifecycle
-- Verifies create_extension_grant_job creates the scheduler
-- job with correct attributes and remove_extension_grant_job
-- drops it cleanly.
-- NOTE: requires unit_test to have CREATE JOB privilege
-- (see nonprod/sert/_dba/grant_system_privs_unit_test.sql)
------------------------------------------------------------
procedure create_and_remove_lifecycle
as
  l_count  number;
  l_action varchar2(4000);
begin
  -- clean up in case a previous test run left the job
  sert_core.extension_xapi.remove_extension_grant_job;

  -- create the job (runs as unit_test due to AUTHID CURRENT_USER)
  sert_core.extension_xapi.create_extension_grant_job(
    p_to_workspace => 'SERT');

  -- verify job exists with correct repeat interval
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
end create_and_remove_lifecycle;

end test_extension_grant_job;
/
--rollback not required
