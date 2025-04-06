whenever sqlerror exit failure
set echo off
set verify off
set termout on
set serveroutput on size unlimited
set feedback on
set define &

set termout off

column create_acdc_schema_name     new_value create_acdc_schema_name
column create_acdc_schema_password new_value create_acdc_schema_password
column create_acdc_tablespace_data new_value create_acdc_tablespace_data
select
    q'[&1]' create_acdc_schema_name,
    q'[&2]' create_acdc_schema_password,
    q'[&3]' create_acdc_tablespace_data
from sys.dual;

set termout on

undefine 1 2 3

declare
    l_create_acdc_schema_name      constant varchar2(255)   := q'[&&create_acdc_schema_name]';
    l_create_acdc_schema_password  constant varchar2(255)   := q'[&&create_acdc_schema_password]';
    l_create_acdc_tablespace_data  constant varchar2(255)   := q'[&&create_acdc_tablespace_data]';
    l_test                                  varchar2(255);
    l_schema_count                          number;
begin
    sys.dbms_output.put_line('--');
    sys.dbms_output.put_line('-- Create install schema');
    sys.dbms_output.put_line('--');
    sys.dbms_output.put_line('');

    sys.dbms_output.put_line('-- Schema name');
    sys.dbms_output.put_line(l_create_acdc_schema_name);
    sys.dbms_output.put_line('');

    sys.dbms_output.put_line('-- Check schema name');
    l_test := dbms_assert.simple_sql_name(
        str =>  l_create_acdc_schema_name
    );
    sys.dbms_output.put_line('Completed.');
    sys.dbms_output.put_line('');

    select count(*)
      into l_schema_count
      from dba_users
     where username = upper(l_create_acdc_schema_name);
    if l_schema_count > 0
    then
      sys.dbms_output.put_line('User "' || l_create_acdc_schema_name || '" already exists');
      sys.dbms_output.put_line('');
    else
      execute immediate (
        'create user ' || l_create_acdc_schema_name || ' ' ||
        'identified by "' || l_create_acdc_schema_password || '"' || ' ' ||
        'default tablespace ' || l_create_acdc_tablespace_data || ' ' ||
        'quota unlimited on ' || l_create_acdc_tablespace_data
      );
      sys.dbms_output.put_line('User "' || l_create_acdc_schema_name || '" created');
      sys.dbms_output.put_line('');
    end if;

exception when others then
    raise;
end;
/

@@utils/schema_grants.sql '&&create_acdc_schema_name'
@@utils/schema_revokes.sql '&&create_acdc_schema_name'
@@utils/schema_additional_setup.sql '&&create_acdc_schema_name'

undefine create_acdc_schema_name
undefine create_acdc_schema_password
undefine create_acdc_tablespace_data

exit
