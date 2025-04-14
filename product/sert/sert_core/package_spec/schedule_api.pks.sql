--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_spec_sert_core.schedule_api_1721803479481 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.schedule_api
AUTHID CURRENT_USER
as

procedure add_schedule_job
  (
   p_frequency    in varchar2
  ,p_hour         in varchar2
  ,p_min          in number
  ,p_ampm         in varchar2
  ,p_eval_id      in number
  ,p_app_id       in number
  ,p_rule_set_key in varchar2
  );

procedure remove_schedule_job
  (
   p_app_id       in number
  ,p_rule_set_key in varchar2
  );


procedure remove_schedule_job(
   p_job_name     in varchar2
  );

procedure run_schedule_job(
   p_job_name     in varchar2
  );


procedure schedule_jobs (
   p_frequency    in varchar2
  ,p_hour         in varchar2
  ,p_min          in number
  ,p_ampm         in varchar2
  ,p_rule_set_key in varchar2
  );

procedure process_eval_summary_results (
  p_application_id_list in varchar2,
  p_result out clob);

end schedule_api;
/
--rollback not required
