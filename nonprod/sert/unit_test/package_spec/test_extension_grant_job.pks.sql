--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_spec_unit_test.test_extension_grant_job stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package unit_test.test_extension_grant_job
as

   --%suite(extension_grant_job)
   --%suitepath(sert_core)

   --%test(remove_extension_grant_job succeeds silently when job does not exist)
   procedure remove_when_no_job_is_silent;

   --%test(create_extension_grant_job raises no_data_found for unknown workspace)
   procedure create_with_bad_workspace_raises;

   --%test(create then remove job with default interval (10 minutes))
   procedure create_and_remove_default_interval;

   --%test(create job with custom frequency and interval (HOURLY, interval 6))
   procedure create_with_custom_frequency_interval;

   --%test(create job with DAILY frequency)
   procedure create_with_daily_frequency;

end test_extension_grant_job;
/
--rollback not required
