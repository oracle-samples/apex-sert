--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset mipotter:9001_check_invalids_1750135149958 endDelimiter:; runOnChange:true runAlways:true rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:1 select case when count(status) > 0 then 1 else 0 end as mycount from dba_objects where owner in ('SERT_CORE','SERT_PUB') and status = 'INVALID';
set serveroutput on
exec dbms_output.put_line('testing...');
prompt "********************************************************************************"
prompt "** Invalid Objects"
prompt "********************************************************************************"
set pagesize 50000
select owner
      ,object_type
      ,object_name
 from dba_objects
where status = 'INVALID'
  and owner in ('SERT_CORE','SERT_PUB');

prompt "********************************************************************************"
prompt "** Object Errors"
prompt "********************************************************************************"
select /*ansiconsole*/
    owner||'.'||name invalid_object
    ,type
    ,sequence
    ,line
    ,position
    ,nvl(regexp_substr(regexp_replace(text, '^PL/SQL: '), '^(ORA|PLS|PLW)'), 'PLS') message_type
    ,regexp_replace(regexp_replace(text, '^PL/SQL: '), '(ORA|PLS|PLW)-[0-9]+: ') text
from dba_errors
where owner in ('SERT_CORE','SERT_PUB')
order by owner, type, name, sequence;

-- now raise an error!
exec RAISE_APPLICATION_ERROR (-20001, 'Errors found after compiling SERT schemas!');

--rollback not required
