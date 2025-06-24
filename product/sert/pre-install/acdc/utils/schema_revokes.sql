set serveroutput on size unlimited

set define &

define revoke_all_schema_name     = '&1'

undefine 1

declare
    type sys_priv_rt is record(
        privilege_name  sys.dba_sys_privs.privilege%type        not null    default 'zzz'
    );
    type sys_priv_ct is table of sys_priv_rt;

    type role_priv_rt is record(
        role_name       sys.dba_role_privs.granted_role%type    not null    default 'zzz'
    );

    type role_priv_ct is table of role_priv_rt;

    type tab_priv_rt is record(
        object_owner    sys.dba_tab_privs.owner%type            not null    default 'zzz',
        object_name     sys.dba_tab_privs.table_name%type       not null    default 'zzz',
        privilege       sys.dba_tab_privs.privilege%type        not null    default 'zzz',
        is_directory    boolean                                 not null    default false
    );
    type tab_priv_ct is table of tab_priv_rt;

    type unable_to_revoke_rt is record(
        revoke_stmt      varchar2(255)                           not null    default 'zzz',
        reason          varchar2(255)                           not null    default 'UNKNOWN'
    );
    type unable_to_revoke_ct is table of unable_to_revoke_rt;

    c_schema_name   constant    varchar2(255)   :=  upper('&&revoke_all_schema_name');
    l_test                      varchar2(255);
    l_count                     number;
    l_failures                  unable_to_revoke_ct  := unable_to_revoke_ct();
    l_sys_privs                 sys_priv_ct;
    l_roles                     role_priv_ct;
    l_tab_privs                 tab_priv_ct;
    l_identifier                varchar2(4000);
    l_sql                       varchar2(32767);
    l_not_my_priv_excp          exception;
    l_not_my_priv_erno   constant    number          :=  -1927;
    pragma exception_init(l_not_my_priv_excp, l_not_my_priv_erno);
begin
    sys.dbms_output.put_line('--');
    sys.dbms_output.put_line('-- Revoke any existing privileges for schema');
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

    ----------------------------------------------------------------------------
    -- List of roles to revoke from  schema
    ----------------------------------------------------------------------------
    l_roles := role_priv_ct(
        -- role_priv_rt('dinner')
        );

    ----------------------------------------------------------------------------
    -- List of object privileges to revoke from  schema
    ----------------------------------------------------------------------------
    l_tab_privs := tab_priv_ct(
        -- tab_priv_rt('sys','not_a_real_table','read',false)
    );

    ----------------------------------------------------------------------------
    -- List of system privileges to revoke from  schema
    ----------------------------------------------------------------------------
    l_sys_privs := sys_priv_ct(
        -- sys_priv_rt('do whatever I want')
        );
    ----------------------------------------------------------------------------
    -- Revoke roles from schema
    ----------------------------------------------------------------------------

    sys.dbms_output.put_line('-- Revoke privileges');

    for idx in 1 .. l_roles.count loop
        l_identifier := l_roles(idx).role_name;
        l_sql := 'revoke ' || l_identifier || ' from ' || c_schema_name;
        begin
            execute immediate (l_sql);
        exception
            when l_not_my_priv_excp then
                sys.dbms_output.put_line(
                    rpad(l_identifier, 50) || ': ' ||
                    'Cannot revoke ungranted privilege'
                );

                l_failures.extend();
                l_failures(l_failures.last) := unable_to_revoke_rt(
                    l_identifier,
                    'Insufficient privileges'
                );
            when others then
                sys.dbms_output.put_line(
                    rpad(l_identifier, 50) || ': ' ||
                    'UNEXPECTED ERROR'
                );

                l_failures.extend();
                l_failures(l_failures.last) := unable_to_revoke_rt(
                    l_identifier,
                    sqlerrm
                );
        end;
    end loop;
    sys.dbms_output.put_line('Completed.');
    sys.dbms_output.put_line('');

    ----------------------------------------------------------------------------
    -- Revoke object privileges from schema
    ----------------------------------------------------------------------------
    sys.dbms_output.put_line('-- Revoke object privileges');
    for idx in 1 .. l_tab_privs.count loop

        l_identifier := l_tab_privs(idx).privilege || ' on';

        if l_tab_privs(idx).is_directory then
            l_identifier := l_identifier || ' directory';
        end if;

        l_identifier := l_identifier || ' ' || l_tab_privs(idx).object_owner || '.' || l_tab_privs(idx).object_name;

        l_sql := 'revoke ' || l_identifier || ' from ' || c_schema_name;

        begin
            execute immediate (l_sql);
        exception
            when l_not_my_priv_excp then
                sys.dbms_output.put_line(
                    rpad(l_identifier, 50) || ': ' ||
                    'Cannot revoke ungranted privilege'
                );

                l_failures.extend();
                l_failures(l_failures.last) := unable_to_revoke_rt(
                    l_identifier,
                    'Insufficient privileges'
                );
            when others then
                sys.dbms_output.put_line(
                    rpad(l_identifier, 50) || ': ' ||
                    'UNEXPECTED ERROR'
                );

                l_failures.extend();
                l_failures(l_failures.last) := unable_to_revoke_rt(
                    l_identifier,
                    sqlerrm
                );
        end;
    end loop;
    sys.dbms_output.put_line('Completed.');
    sys.dbms_output.put_line('');

    ----------------------------------------------------------------------------
    -- Revoke system privileges to schema
    ----------------------------------------------------------------------------
    sys.dbms_output.put_line('-- Revoke system privileges');
    for idx in 1 .. l_sys_privs.count loop

        l_identifier := l_sys_privs(idx).privilege_name;
        l_sql := 'revoke ' || l_identifier || ' from ' || c_schema_name;

        begin
            execute immediate (l_sql);
        exception
            when l_not_my_priv_excp then
                sys.dbms_output.put_line(
                    rpad(l_identifier, 50) || ': ' ||
                    'Cannot revoke ungranted privilege'
                );

                l_failures.extend();
                l_failures(l_failures.last) := unable_to_revoke_rt(
                    l_identifier,
                    'Insufficient privileges'
                );
            when others then
                sys.dbms_output.put_line(
                    rpad(l_identifier, 50) || ': ' ||
                    'UNEXPECTED ERROR'
                );

                l_failures.extend();
                l_failures(l_failures.last) := unable_to_revoke_rt(
                    l_identifier,
                    sqlerrm
                );
        end;

    end loop;
    sys.dbms_output.put_line('Completed.');
    sys.dbms_output.put_line('');

    if l_failures.count = 0 then
        sys.dbms_output.put_line('All grant revocations completed.');
    else
        sys.dbms_output.put_line('WARNING: NOT ALL PRIVILEGES WERE REVOKED FROM ' || c_schema_name);
        sys.dbms_output.put_line('');
        sys.dbms_output.put_line('-- Failed revoke statements');
        sys.dbms_output.put_line(rpad('-', 70, '-'));
        for idx in 1 .. l_failures.count loop
            sys.dbms_output.put_line(l_failures(idx).revoke_stmt);
            sys.dbms_output.put_line('Reason: ' || l_failures(idx).reason);
            sys.dbms_output.put_line('');
        end loop;
    end if;
    sys.dbms_output.put_line('');
end;
/

undefine revoke_all_schema_name
