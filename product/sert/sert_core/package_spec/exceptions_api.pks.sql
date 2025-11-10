--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_spec_sert_core.exceptions_api_1721803465112 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.exceptions_api
as

  function show_exception ( p_eval_result_id in number )
    return boolean;

  function exception_status ( p_exception_id in number )
    return varchar2;

  function is_stale(p_exception_id in number)
  return boolean;

  function show_exceptions_form (
    p_stale_eval    in varchar2
    ,p_exception_key in varchar2
    )
    return boolean;

  function show_add_exception_button
    (
    p_exception_key in varchar2
    )
  return boolean;

  function show_withdraw_exception_button
    (
    p_stale_eval    in varchar2
    ,p_exception_key in varchar2
    ,p_exception_id  in number
    ,p_app_user      in varchar2
    )
  return boolean;

  procedure resubmit_stale_exception
    ( p_exception_id in number
     ,p_eval_result_id in number
    );

  procedure withdraw_exception
    (
    p_exception_id in number
    ,p_eval_id     in number
    );

  procedure approve_or_reject_exception
    (
    p_exception_id in number
    ,p_result       in varchar2
    ,p_reason       in varchar2
    ,p_app_user     in varchar2
    ,p_eval_id      in number
    );

  procedure get_exception_score
    (
     p_rule_id                in number
    ,p_exception              in varchar2
    ,p_exception_score        out number
    ,p_exception_score_reason out varchar2
    );

  procedure bulk_add_exception
    (
     p_eval_id                in number
    ,p_workspace_id           in number
    ,p_application_id         in number
    ,p_rule_id                in number
    ,p_exception              in varchar2
    );

  procedure add_exception
    (
     p_rule_set_id            in number
    ,p_rule_id                in number
    ,p_workspace_id           in number
    ,p_application_id         in number
    ,p_page_id                in number   default null
    ,p_component_id           in varchar2 default null
    ,p_component_name         in varchar2 default null
    ,p_column_name            in varchar2 default null
    ,p_item_name              in varchar2 default null
    ,p_shared_comp_name       in varchar2 default null
    ,p_exception              in varchar2
    ,p_current_value          in varchar2
    ,p_eval_id                in number
    ,p_exception_score        in number   default null
    ,p_exception_score_reason in varchar2 default null
    );

  procedure download_exceptions
    (
    p_application_id in number
    ,p_eval_id        in number
    );

  procedure upload_exceptions_wizard
    (
    p_name      in varchar2
    ,p_eval_id   in number
    ,p_ignore_checksum   in boolean default FALSE
    );

  procedure process_exceptions
    (
    p_json_export_file      in blob
    ,p_eval_id              in number default null
    ,p_ignore_checksum   in boolean default FALSE
    );

end exceptions_api;
/
--rollback not required
