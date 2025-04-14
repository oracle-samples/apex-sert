--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_spec_sert_core.log_pkg_1721803470813 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.log_pkg
as

g_log_evals varchar2(100);

function get_log_key
return varchar2;

procedure log
  (
   p_log            in varchar2 default null
  ,p_application_id in number   default null
  ,p_log_type       in varchar2 default 'GENERIC'
  ,p_log_key        in varchar2 default null
  ,p_log_clob       in varchar2 default null
  ,p_id             in varchar2 default null
  ,p_id_col         in varchar2 default null
  );

function error
  (
  p_error in apex_error.t_error
  )
return apex_error.t_error_result;

end log_pkg;
/
--rollback not required
