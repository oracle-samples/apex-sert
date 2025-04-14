--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_spec_sert_core.eval_pkg_1721803460974 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.eval_pkg
as

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: C O U N T _ B I N D S
----------------------------------------------------------------------------------------------------------------------------
-- use flow utility to count binds in a code block
----------------------------------------------------------------------------------------------------------------------------

  function count_binds
  (
    p_sql in clob
  )
  return number;

  function get_score_range
    (
    p_range_key in varchar2
    )
  return number;

  procedure calc_score
    (
    p_eval_id in number
    );

  function eval_criteria
    (
    p_column_to_evaluate     in clob
    ,p_return_details         in varchar2 default 'Y'
    ,p_rule_criteria_type_key in varchar2
    ,p_application_id         in number
    )
  return varchar2;

  procedure process_rules
    (
    p_application_id in number
    ,p_page_id        in number default null
    ,p_eval_id        in number
    ,p_rule_set_id    in number
    );

  procedure eval
    (
    p_application_id    in number
    ,p_page_id           in number   default null
    ,p_eval_id           in number   default null
    ,p_rule_set_key      in varchar2 default 'INTERNAL'
    ,p_eval_by           in varchar2 default coalesce(sys_context('APEX$SESSION','APP_USER'),user)
    ,p_run_in_background in varchar2 default 'Y'
    ,p_eval_id_out       out number
    );

  procedure delete_eval
    (
    p_eval_id in number
    ,p_delete_comments in varchar2 default 'Y'
    );

  function apex_link
    (
    p_eval_result_id in number
    ,p_builder_session_id in number
    )
  return varchar2;

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end eval_pkg;
/
--rollback not required
