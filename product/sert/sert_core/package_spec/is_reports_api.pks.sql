--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mzimon:create_package_spec_sert_core.is_reports_api_pks stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.is_reports_api
as

  function report_generate (
     p_application_id NUMBER,
     p_data           CLOB,
     p_report_layout_static_id VARCHAR2,
     p_output_type    VARCHAR2,
     p_content_type   VARCHAR2,
     p_report_name    VARCHAR2,
     p_error_message  OUT VARCHAR2)
  return BOOLEAN;
        

  function evaluation_summary_report_json (
    p_eval_id NUMBER,
    p_app_id NUMBER)
  return clob;

  function evaluation_detail_report_json (
    p_eval_id NUMBER,
    p_app_id NUMBER)
  return clob;
  
  function evaluation_exception_report_json (
    p_eval_id NUMBER,
    p_app_id NUMBER)
  return clob;
  
  function attributes_master_report_json (
    p_eval_id NUMBER,
    p_app_id NUMBER)
  return clob;  

end is_reports_api;
/
--rollback not required
