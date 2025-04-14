--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.log_pkg_1721803522324 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.log_pkg
as

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: G E T _ L O G _ K E Y
----------------------------------------------------------------------------------------------------------------------------
-- Returns a random 10-character code that can be used to group similar log entries together for easier troubleshooting
----------------------------------------------------------------------------------------------------------------------------
function get_log_key
return varchar2
is
begin

return dbms_random.string('U', 10);

end get_log_key;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: L O G
----------------------------------------------------------------------------------------------------------------------------
-- Writes a row to the log table
----------------------------------------------------------------------------------------------------------------------------
procedure log
  (
   p_log            in varchar2 default null
  ,p_application_id in number   default null
  ,p_log_type       in varchar2 default 'GENERIC'
  ,p_log_key        in varchar2 default null
  ,p_log_clob       in varchar2 default null
  ,p_id             in varchar2 default null
  ,p_id_col         in varchar2 default null
  )
is
  pragma autonomous_transaction;
  l_log_evals varchar2(1);
begin

select pref_value into l_log_evals from prefs where pref_key = 'LOG_EVALUATIONS';

-- log the value if logging is enabled
if (l_log_evals = 'Y' and p_log_type in('EVAL','IMPORT','EXCEPTION_IMPORT','EXCEPTION_EXPORT','IS_REPORT') ) or p_log_type in ('ERROR','UNHANDLED')  then

  insert into logs
    (
     log_key
    ,log_type
    ,log
    ,log_clob
    ,id
    ,id_col
    ,application_id
    )
  values
    (
     nvl(p_log_key, apex_util.get_session_state('G_LOG_KEY'))
    ,p_log_type
    ,p_log
    ,dbms_utility.format_error_stack || dbms_utility.format_error_backtrace || p_log_clob
    ,p_id
    ,p_id_col
    ,p_application_id
    );

  commit;

end if;

end log;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: E R R O R
----------------------------------------------------------------------------------------------------------------------------
-- main error handler
----------------------------------------------------------------------------------------------------------------------------
function error
  (
  p_error in apex_error.t_error
  )
return apex_error.t_error_result
is
  l_result          apex_error.t_error_result;
begin

-- capture the result
l_result := apex_error.init_error_result (p_error => p_error);

-- log the full stack
-- //TODO determine how to pass Log Key here; not getting set
log(p_log => l_result.message, p_log_key => apex_util.get_session_state('G_LOG_KEY'), p_log_type => 'ERROR');

-- set the error message if it does not start with "ORA"
if l_result.message is null or substr(l_result.message, 1, 3) = 'ORA' then
  l_result.message := 'An unexpected error has occurred. Please review the log for details.';
end if;

-- return the result
return l_result;

end error;


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end log_pkg;
/
--rollback not required
