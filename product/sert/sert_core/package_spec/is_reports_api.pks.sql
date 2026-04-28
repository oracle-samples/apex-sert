--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mzimon:create_package_spec_sert_core.is_reports_api_pks stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.is_reports_api
as
   c_evaluation_summary_report   constant varchar2(30) := 'EVALUATION_SUMMARY_REPORT';
   c_evaluation_detail_report    constant varchar2(30) := 'EVALUATION_DETAIL_REPORT';
   c_evaluation_exception_report constant varchar2(32) := 'EVALUATION_EXCEPTION_REPORT';
   c_attributes_master_report    constant varchar2(24) := 'ATTRIBUTES_MASTER_REPORT';

   c_unknown_report_type constant varchar2(19) := 'unknown_report_type';

   c_log_type_is_report constant varchar2(9) := 'IS_REPORT';
   c_log_type_is_export constant varchar2(9) := 'IS_EXPORT';
   c_log_type_error     constant varchar2(5) := 'ERROR';

   ----------------------------------------------------------------------------------------------------------------------------
   -- FUNCTION: R E P O R T _ G E N E R A T E
   ----------------------------------------------------------------------------------------------------------------------------
   -- Generate and download an IS report document using the configured layout
   ----------------------------------------------------------------------------------------------------------------------------
   -- report_generate
   -- purpose: generate a document for a requested report type and stream it back to the caller.
   -- behavior: resolves the output filename by report type, generates the document through apex_print, downloads it,
   --   and returns success status with an OUT error message when generation fails.
   -- parameters:
   --   p_application_id         - application id used by the print engine.
   --   p_data                   - report payload sent to the print engine.
   --   p_report_layout_static_id - static id of the report layout.
   --   p_output_type            - requested print output type.
   --   p_content_type           - mime type used for the download response.
   --   p_report_name            - report selector used to derive the output filename.
   --   p_error_message          - OUT error text returned when generation fails.
   -- returns: boolean success flag.
   -- usage:
   --   if is_reports_api.report_generate(
   --      p_application_id          => p_application_id,
   --      p_data                    => p_data,
   --      p_report_layout_static_id => p_report_layout_static_id,
   --      p_output_type             => p_output_type,
   --      p_content_type            => p_content_type,
   --      p_report_name             => p_report_name,
   --      p_error_message           => p_error_message
   --   ) then
   --      null;
   --   end if;
   ----------------------------------------------------------------------------------------------------------------------------
   function report_generate (
      p_application_id NUMBER,
      p_data           CLOB,
      p_report_layout_static_id VARCHAR2,
      p_output_type    VARCHAR2,
      p_content_type   VARCHAR2,
      p_report_name    VARCHAR2,
      p_error_message  OUT VARCHAR2)
      return BOOLEAN;

   ----------------------------------------------------------------------------------------------------------------------------
   -- FUNCTION: E V A L U A T I O N _ S U M M A R Y _ R E P O R T _ J S O N
   ----------------------------------------------------------------------------------------------------------------------------
   -- Build summary report JSON for one evaluation
   ----------------------------------------------------------------------------------------------------------------------------
   -- evaluation_summary_report_json
   -- purpose: create the summary JSON payload consumed by the IS report generator.
   -- behavior: aggregates failed findings by category and nested rule details for the supplied evaluation id.
   -- parameters:
   --   p_eval_id - evaluation id to summarize.
   --   p_app_id  - application id used for logging context.
   -- returns: clob JSON payload for the summary report.
   -- usage:
   --   l_json := is_reports_api.evaluation_summary_report_json(
   --      p_eval_id => p_eval_id,
   --      p_app_id  => p_app_id
   --   );
   ----------------------------------------------------------------------------------------------------------------------------
   function evaluation_summary_report_json (
      p_eval_id NUMBER,
      p_app_id  NUMBER)
      return clob;

   ----------------------------------------------------------------------------------------------------------------------------
   -- FUNCTION: E V A L U A T I O N _ D E T A I L _ R E P O R T _ J S O N
   ----------------------------------------------------------------------------------------------------------------------------
   -- Build detailed report JSON for one evaluation
   ----------------------------------------------------------------------------------------------------------------------------
   -- evaluation_detail_report_json
   -- purpose: create the detailed JSON payload used for report generation.
   -- behavior: aggregates non-pass findings by category and rule, including rule metadata and finding details.
   -- parameters:
   --   p_eval_id - evaluation id to export.
   --   p_app_id  - application id used for logging context.
   -- returns: clob JSON payload for the detail report.
   -- usage:
   --   l_json := is_reports_api.evaluation_detail_report_json(
   --      p_eval_id => p_eval_id,
   --      p_app_id  => p_app_id
   --   );
   ----------------------------------------------------------------------------------------------------------------------------
   function evaluation_detail_report_json (
      p_eval_id NUMBER,
      p_app_id  NUMBER)
      return clob;

   ----------------------------------------------------------------------------------------------------------------------------
   -- FUNCTION: E V A L U A T I O N _ E X C E P T I O N _ R E P O R T _ J S O N
   ----------------------------------------------------------------------------------------------------------------------------
   -- Build exception report JSON for one evaluation
   ----------------------------------------------------------------------------------------------------------------------------
   -- evaluation_exception_report_json
   -- purpose: create the exception-focused JSON payload for report generation.
   -- behavior: aggregates exception findings by category and rule for the supplied evaluation id.
   -- parameters:
   --   p_eval_id - evaluation id to export.
   --   p_app_id  - application id used for logging context.
   -- returns: clob JSON payload for the exception report.
   -- usage:
   --   l_json := is_reports_api.evaluation_exception_report_json(
   --      p_eval_id => p_eval_id,
   --      p_app_id  => p_app_id
   --   );
   ----------------------------------------------------------------------------------------------------------------------------
   function evaluation_exception_report_json (
      p_eval_id NUMBER,
      p_app_id  NUMBER)
      return clob;

   ----------------------------------------------------------------------------------------------------------------------------
   -- FUNCTION: A T T R I B U T E S _ M A S T E R _ R E P O R T _ J S O N
   ----------------------------------------------------------------------------------------------------------------------------
   -- Build attributes master report JSON for one evaluation and APEX version
   ----------------------------------------------------------------------------------------------------------------------------
   -- attributes_master_report_json
   -- purpose: create the attributes master JSON payload for report generation.
   -- behavior: aggregates rule counts by category for the requested APEX version and evaluation context.
   -- parameters:
   --   p_eval_id      - evaluation id used for report context.
   --   p_app_id       - application id used for logging context.
   --   p_apex_version - apex version used to filter rule metadata.
   -- returns: clob JSON payload for the attributes master report.
   -- usage:
   --   l_json := is_reports_api.attributes_master_report_json(
   --      p_eval_id      => p_eval_id,
   --      p_app_id       => p_app_id,
   --      p_apex_version => p_apex_version
   --   );
   ----------------------------------------------------------------------------------------------------------------------------
   function attributes_master_report_json (
      p_eval_id       NUMBER,
      p_app_id        NUMBER,
      p_apex_version  VARCHAR2)
      return clob;

end is_reports_api;
/
--rollback not required
