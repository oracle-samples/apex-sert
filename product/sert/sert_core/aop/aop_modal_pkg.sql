--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset SERT:aop_modal_package-create runOnChange:true endDelimiter:/ stripComments=false
--preconditions onFail:MARK_RAN onError:HALT

create or replace procedure sert_core.aop_outputto_email (
  p_output_blob      in blob,
  p_output_filename  in varchar2,
  p_output_mime_type in varchar2
) is
-- epoch 1727425551
  l_mail_id              number;
  l_downsubscr_output_id aop_downsubscr_output.id%type;
  l_email_body_text      varchar2(4000);
begin
  -- the AOP Plug-in will store the email form in the AOP_OUTPUTTO collection
  -- epoch 1727653515
  for r in (select
              c001 as app_id,
              c002 as page_id,
              c003 as region_pipe_report_ids,
              c004 as app_user,
              c005 as template_type,
              c006 as template_source,
              c007 as output_type,
              c008 as output_to,
              c009 as output_procedure,
              c010 as email_from,
              c011 as email_to,
              c012 as email_cc,
              c013 as email_bcc,
              c014 as email_subject,
              c015 as email_body_text,
              c016 as email_body_html,
              c017 as email_download_link,
              c018 as email_blob_size,
              c019 as save_log,
              c020 as downsubscr_id
              from apex_collections
             where collection_name = 'AOP_OUTPUTTO')
  loop
    -- loop will happen only 1 time, for ease of coding used a for loop

    -- for small files, send directly with email
    if dbms_lob.getlength(p_output_blob) < 500000
    then
      l_mail_id := apex_mail.send(
                      p_from  => r.email_from,
                      p_to    => r.email_to,
                      p_cc    => r.email_cc,
                      p_bcc   => r.email_bcc,
                      p_subj  => r.email_subject,
                      p_body  => r.email_body_text
                  );

      -- we send the document as attachment
      apex_mail.add_attachment(
          p_mail_id    => l_mail_id,
          p_attachment => p_output_blob,
          p_filename   => p_output_filename,
          p_mime_type  => p_output_mime_type);

    else
      -- for large files, we will send a link to the document.
      insert into aop_downsubscr_output(
        downsubscr_id,
        output_filename,
        output_blob,
        output_mime_type
      ) values(
        r.downsubscr_id,
        p_output_filename,
        p_output_blob,
        p_output_mime_type
      ) returning id into l_downsubscr_output_id;

      if instr(r.email_body_text,'#DOWNLOAD_LINK#')>0
      then
          l_email_body_text := replace(r.email_body_text, '#DOWNLOAD_LINK#', r.email_download_link||chr(38)||'aop_downsubscr_output_id=' || l_downsubscr_output_id);
      else
          l_email_body_text := r.email_body_text || CHR(10) || ' <br/>As the file was too big, click to <a href="' || r.email_download_link||chr(38)||'aop_downsubscr_output_id=' || l_downsubscr_output_id || '">download the file</a>.';
      end if;

      l_mail_id := apex_mail.send(
                          p_from => r.email_from,
                          p_to   => r.email_to,
                          p_cc   => r.email_cc,
                          p_bcc  => r.email_bcc,
                          p_subj => r.email_subject,
                          p_body => l_email_body_text);
      -- no attachment
    end if;

  end loop;

  -- push queue
  apex_mail.push_queue;

end aop_outputto_email;
/

create or replace package sert_core.aop_modal_api_pkg
as

/* Copyright 2015-2023 - APEX RnD - United Codes
*/

  procedure subscribe_to_report(
    p_app_id                    in aop_downsubscr.app_id%type,
    p_page_id                   in aop_downsubscr.page_id%type,
    p_region_pipe_report_ids    in aop_downsubscr.region_pipe_report_ids%type, -- format: region_id|report_id
    p_items_in_session          in aop_downsubscr.items_in_session%type,       -- format: P1_X,P1_Y
    p_app_user                  in aop_downsubscr.app_user%type,
    p_report_format             in aop_downsubscr.output_type%type,
    p_template_sql              in aop_downsubscr.template_source%type,
    p_output_to                 in aop_downsubscr.output_to%type,
    p_output_procedure          in aop_downsubscr.output_procedure%type,
    p_email_from                in aop_downsubscr.email_from%type,
    p_email_to                  in aop_downsubscr.email_to%type,
    p_email_cc                  in aop_downsubscr.email_cc%type,
    p_email_bcc                 in aop_downsubscr.email_bcc%type,
    p_email_download_link       in varchar2,
    p_email_blob_size           in varchar2,
    p_save_log                  in varchar2,
    p_subject                   in aop_downsubscr.email_subject%type,
    p_body_text                 in aop_downsubscr.email_body_text%type,
    p_body_html                 in aop_downsubscr.email_body_html%type,
    p_when                      in varchar2,  -- now or scheduled
    p_start_date                in aop_downsubscr.start_date%type,
    p_end_date                  in aop_downsubscr.end_date%type,
    p_repeat_every              in aop_downsubscr.repeat_every%type,
    p_repeat_interval           in aop_downsubscr.repeat_interval%type,
    p_repeat_days               in aop_downsubscr.repeat_days%type,
    p_init_code                 in aop_downsubscr.init_code%type,
    po_downsubscr_output_id     out aop_downsubscr_output.id%type,
    po_output_blob              out aop_downsubscr_output.output_blob%type,
    po_output_filename          out aop_downsubscr_output.output_filename%type,
    po_output_mime_type         out aop_downsubscr_output.output_mime_type%type,
    po_job_name                 out aop_downsubscr.job_name%type
  );
  procedure run_scheduled_report(
    p_downsubscr_id in aop_downsubscr.id%type);

-- To force immediate job execution
procedure execute_job (
  p_job_name in user_scheduler_jobs.job_name%type);

-- Remove job from scheduler by name
procedure remove_job (
  p_job_name in user_scheduler_jobs.job_name%type) ;

-- Indicates whether the job is enabled (TRUE) or not (FALSE)
function is_job_enabled (
  p_job_name in user_scheduler_jobs.job_name%type)
return boolean;

-- Enable job from scheduler by name
procedure enable_job (
  p_job_name in user_scheduler_jobs.job_name%type);

-- Disable job from scheduler by name
procedure disable_job (
  p_job_name in user_scheduler_jobs.job_name%type);

end aop_modal_api_pkg;
/
create or replace package sert_core.aop_modal_pkg as

  /**
  * @project:
  *   United Codes APEX Office Print
  *
  * @description:
  *   The package contains the plug-in PL/SQL code implementing dynamic action plug-in
  *
  * @author:
  *  Bartosz Ostrowski
  *
  * @created:
  *   Dimitri Gielis
  *
  * United Codes
  * Copyright (C) 2015-2023 by United Codes
  *
  * Changelog:
  *
  *   v21.2   2021-10-05 - form elements can be validated using the plug-in attribute Initialization JavaScript Code
  *                        function( pOptions ) {
  *                          pOptions.validation.scheduleDateStart = function( pStartDateValue, pStartDateVisible, pEndDateValue, pEndDateVisible ) {
  *                            if ( 1 == 1 ) {
  *                              //validation failed
  *                              return 'Custom validation message';
  *                            }
  *                            //validation passed
  *                            return null;
  *                          };
  *
  *                          pOptions.validation.emailTo = function( pValue ) {
  *                            if ( 1 == 1 ) {
  *                              //validation failed
  *                              return 'Custom validation message';
  *                            }
  *
  *                            //validation passed
  *                            return null;
  *                          };
  *
  *                          return pOptions;
  *                        }
  *                      - date start and date end has built in validation checking if start date is before the date end
  *
  *   v21.1.3 2021-09-14 - email from can be now specified using the plug-in attribute Initialization JavaScript Code
  *                        example code:
  *                        function( pOptions ){
  *                          //pOptions.emailFrom = "ostrowski.bartosz@gmail.com"; // static assigment
  *                          //pOptions.emailFrom = apex.item('PX_ITEM_NAME');     // current value of a given APEX item
  *                          return pOptions;
  *                        }
  *
  */

  g_template_id_arr      apex_t_varchar2;
  g_template_name_arr    apex_t_varchar2;
  g_template_default_arr apex_t_varchar2;
  g_template_type_arr    apex_t_varchar2;
  g_mime_type_arr        apex_t_varchar2;

  g_default_cnt_arr      apex_t_number;
  g_blob                 blob;


  function render(
    p_dynamic_action in apex_plugin.t_dynamic_action,
    p_plugin         in apex_plugin.t_plugin
  ) return apex_plugin.t_dynamic_action_render_result;

  function ajax(
    p_dynamic_action in apex_plugin.t_dynamic_action,
    p_plugin         in apex_plugin.t_plugin
  ) return apex_plugin.t_dynamic_action_ajax_result;

end aop_modal_pkg;
/
--rollback not required
