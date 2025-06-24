set serveroutput on size unlimited

set define &

define additional_setup_schema_name = '&1'

undefine 1

declare
    c_schema_name   constant    varchar2(255)   :=  upper('&&additional_setup_schema_name');
    c_profile       constant    varchar2(255)   :=  upper('ORA_APP_PROFILE');
    l_test                      varchar2(255);
    l_count                     number;
    l_insufficient_privs_excp   exception;
    l_insufficient_privs_erno   constant number :=  -1031;
    pragma exception_init(l_insufficient_privs_excp, l_insufficient_privs_erno);
begin
    sys.dbms_output.put_line('--');
    sys.dbms_output.put_line('-- Additional setup for schema');
    sys.dbms_output.put_line('--');
    sys.dbms_output.put_line('');

    sys.dbms_output.put_line('-- Schema name');
    sys.dbms_output.put_line(c_schema_name);
    sys.dbms_output.put_line('');

    sys.dbms_output.put_line('-- Check schema name');
    l_test := dbms_assert.schema_name(
        str => c_schema_name
    );
    sys.dbms_output.put_line('Completed.');
    sys.dbms_output.put_line('');

    sys.dbms_output.put_line('-- Add ' || c_profile || ' profile to schema');
    select count(1)
    into l_count
    from dba_profiles
    where upper(profile) = c_profile
      and not exists (select username
                        from dba_users
                       where username = c_schema_name
                         and upper(profile) = c_profile);

    if l_count > 0 then
        execute immediate 'alter user ' || c_schema_name || ' profile ' || c_profile;
        sys.dbms_output.put_line('Completed.');
    else
        sys.dbms_output.put_line('Profile "' || c_profile || '" does not exist or is already assigned.');
    end if;
    sys.dbms_output.put_line('');

    commit;
exception
    when l_insufficient_privs_excp then
        sys.dbms_output.put_line('Insufficient privileges to assign ' || c_profile || ' to ' || c_schema_name);
    when others then
        sys.dbms_output.put_line('UNEXPECTED ERROR assigning ' || c_profile || ' to ' || c_schema_name || ': ' || sqlerrm);
end;
/

-- Grant access to OCI resource principal
-- Only valid for ADBs, and will throw compilation errors in PDB.
-- So we do something objectively terrible to catch it

declare
  l_count number := 0;
  l_comp_err   exception;
  l_comp_erno  constant number :=  -6550;
  pragma exception_init(l_comp_err, l_comp_erno);

begin
    select count(*)
      into l_count
      from all_tab_privs
     where grantee='ACDC'
       and table_name='OCI$RESOURCE_PRINCIPAL';
    begin
    if 	l_count = 0
        then
        dbms_output.put_line('Granting OCI resource principal access to ACDC...');
        execute immediate('begin dbms_cloud_admin.enable_resource_principal(username => ''ACDC''); end;');
        end if;
    exception
      when l_comp_err
        then dbms_output.put_line('WARNING: Unable to grant resource principal; probably not ADB');
      when others
        then dbms_output.put_line('Unexpected error when granting OCI resource principal:' || regexp_replace(sqlerrm,'ORA-[[:digit:]]+: *','',1,0));
    end;
end;
/

-- Release "management" objects

declare
    l_count number := 0;
    create_tbl_stmt varchar2(500);
begin
    select count(*)
      into l_count
      from dba_tables
     where owner = 'ACDC'
       and table_name = 'ACDC_RELEASE_HISTORY';

    if l_count = 0
    then
        create_tbl_stmt := 'create table
                            acdc.acdc_release_history (
                                  release_tag varchar2(40) default on null
                                    to_char(sysdate,''YYYY.MM.DD'') || ''_manual'' not null
                                , applied_on date default on null sysdate not null
                            )';
        execute immediate create_tbl_stmt;
    end if;
exception
    when others then
        sys.dbms_output.put_line('UNEXPECTED ERROR creating release history table: ' || sqlerrm);
end;
/

--Is this a dumb way to do this? Maybe. Check back when ACDC is on its 10,000th release.

create or replace view acdc.acdc_release_v
as
select release_tag
  from acdc_release_history
 where applied_on=(select max(applied_on) from acdc_release_history);

create or replace synonym acdc.acdc_release for acdc.acdc_release_v;

--Update release table

declare
    release_tag varchar2(40) := '__ACDC_RELEASE__'; --Set by packaging script, update with care
begin
    if regexp_like(release_tag,'RELEASE')
    then
        dbms_output.put_line('ACDC_RELEASE not set; assuming manual execution.');
        dbms_output.put_line('ACDC release table will be updated with today''s date');
        release_tag := to_char(sysdate,'YYYY.MM.DD') || '_manual';
    end if;
    insert into acdc.acdc_release_history (release_tag, applied_on)
                                        values
                                        (release_tag, sysdate);
    commit;


exception
    when others then
        sys.dbms_output.put_line('UNEXPECTED ERROR updating version history: ' || sqlerrm);
end;
/

prompt "ACDC release set to:"
select * from acdc.acdc_release;

undefine additional_setup_schema_name
