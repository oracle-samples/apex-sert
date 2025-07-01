set serveroutput on size unlimited

set define &

define grant_schema_name     = '&1'

undefine 1

declare
    type sys_priv_rt is record(
        privilege_name  sys.dba_sys_privs.privilege%type        not null    default 'zzz',
        admin_option    boolean                                 not null    default false
    );
    type sys_priv_ct is table of sys_priv_rt;

    type role_priv_rt is record(
        role_name       sys.dba_role_privs.granted_role%type    not null    default 'zzz',
        admin_option    boolean                                 not null    default false
    );
    type role_priv_ct is table of role_priv_rt;

    type tab_priv_rt is record(
        object_owner    sys.dba_tab_privs.owner%type            not null    default 'zzz',
        object_name     sys.dba_tab_privs.table_name%type       not null    default 'zzz',
        privilege       sys.dba_tab_privs.privilege%type        not null    default 'zzz',
        grantable       boolean                                 not null    default false,
        is_directory    boolean                                 not null    default false
    );
    type tab_priv_ct is table of tab_priv_rt;

    type unable_to_grant_rt is record(
        grant_type      varchar2(255)                           not null    default 'zzz',
        grant_target    varchar2(255)                           not null    default 'zzz',
        reason          varchar2(255)                           not null    default 'UNKNOWN'
    );
    type unable_to_grant_ct is table of unable_to_grant_rt;

    c_schema_name               constant    varchar2(255)       :=  upper('&&grant_schema_name');
    l_test                                  varchar2(255);
    l_sys_privs                             sys_priv_ct;
    l_roles                                 role_priv_ct;
    l_tab_privs                             tab_priv_ct;
    l_failures                              unable_to_grant_ct  := unable_to_grant_ct();
    l_count                                 number;
    l_identifier                            varchar2(4000);
    l_sql                                   varchar2(32767);

    l_insufficient_privs_excp               exception;
    l_insufficient_privs_erno   constant    number          :=  -1031;
    pragma exception_init(l_insufficient_privs_excp, l_insufficient_privs_erno);
begin
    sys.dbms_output.put_line('--');
    sys.dbms_output.put_line('-- Grants for install schema');
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
    -- List of roles to grant to schema
    ----------------------------------------------------------------------------
    l_roles := role_priv_ct(
        role_priv_rt('apex_administrator_read_role',    true),
        role_priv_rt('apex_administrator_role',         true),
        role_priv_rt('connect',                         true),
        role_priv_rt('ords_administrator_role',         false),
        role_priv_rt('pdb_dba',                         true),
        role_priv_rt('resource',                        true),
        role_priv_rt('select_catalog_role',             true)
    );

    ----------------------------------------------------------------------------
    -- List of object privileges to grant to schema
    ----------------------------------------------------------------------------
    l_tab_privs := tab_priv_ct(
        -- C##CLOUD$SERVICE objects
        tab_priv_rt('c##cloud$service', 'dbms_cloud',                       'execute',  true,   false),

        -- ORDS_METADATA objects
        tab_priv_rt('ords_metadata',    'dba_ords_schemas',                 'read',     false,  false),
        tab_priv_rt('ords_metadata',    'dba_ords_url_mappings',            'read',     false,  false),

        -- SYS objects
        tab_priv_rt('sys',              'data_pump_dir',                    'read',     false,  true),
        tab_priv_rt('sys',              'data_pump_dir',                    'write',    false,  true),
        tab_priv_rt('sys',              'dba_col_comments',                 'read',     true,   false),
        tab_priv_rt('sys',              'dba_cons_columns',                 'read',     true,   false),
        tab_priv_rt('sys',              'dba_constraints',                  'read',     true,   false),
        tab_priv_rt('sys',              'dba_context',                      'read',     false,  false),
        tab_priv_rt('sys',              'dba_credentials',                  'read',     true,   false),
        tab_priv_rt('sys',              'dba_data_files',                   'read',     true,   false),
        tab_priv_rt('sys',              'dba_dependencies',                 'read',     true,   false),
        tab_priv_rt('sys',              'dba_dml_locks',                    'read',     true,   false),
        tab_priv_rt('sys',              'dba_free_space',                   'read',     true,   false),
        tab_priv_rt('sys',              'dba_host_aces',                    'read',     true,   false),
        tab_priv_rt('sys',              'dba_ind_columns',                  'read',     true,   false),
        tab_priv_rt('sys',              'dba_indexes',                      'read',     true,   false),
        tab_priv_rt('sys',              'dba_jobs',                         'read',     true,   false),
        tab_priv_rt('sys',              'dba_mview_comments',               'read',     true,   false),
        tab_priv_rt('sys',              'dba_network_acl_privileges',       'read',     true,   false),
        tab_priv_rt('sys',              'dba_network_acls',                 'read',     true,   false),
        tab_priv_rt('sys',              'dba_objects',                      'read',     true,   false),
        tab_priv_rt('sys',              'dba_role_privs',                   'read',     true,   false),
        tab_priv_rt('sys',              'dba_scheduler_job_run_details',    'select',   true,   false),
        tab_priv_rt('sys',              'dba_scheduler_jobs',               'select',   true,   false),
        tab_priv_rt('sys',              'dba_scheduler_jobs',               'read',     true,   false),
        tab_priv_rt('sys',              'dba_scheduler_running_jobs',       'read',     true,   false),
        tab_priv_rt('sys',              'dba_segments',                     'read',     true,   false),
        tab_priv_rt('sys',              'dba_sys_privs',                    'read',     true,   false),
        tab_priv_rt('sys',              'dba_tab_cols',                     'read',     true,   false),
        tab_priv_rt('sys',              'dba_tab_columns',                  'read',     true,   false),
        tab_priv_rt('sys',              'dba_tab_comments',                 'read',     true,   false),
        tab_priv_rt('sys',              'dba_tab_privs',                    'read',     true,   false),
        tab_priv_rt('sys',              'dba_tables',                       'read',     true,   false),
        tab_priv_rt('sys',              'dba_tablespaces',                  'read',     true,   false),
        tab_priv_rt('sys',              'dba_temp_files',                   'read',     true,   false),
        tab_priv_rt('sys',              'dba_views',                        'read',     true,   false),
        tab_priv_rt('sys',              'dbms_aq',                          'execute',  true,   false),
        tab_priv_rt('sys',              'dbms_aqadm',                       'execute',  false,  false),
        tab_priv_rt('sys',              'dbms_crypto',                      'execute',  true,   false),
        tab_priv_rt('sys',              'dbms_flashback_archive',           'execute',  true,   false),
        tab_priv_rt('sys',              'dbms_lock',                        'execute',  true,   false),
        tab_priv_rt('sys',              'dbms_network_acl_admin',           'execute',  true,   false),
        tab_priv_rt('sys',              'dbms_rls',                         'execute',  false,  false),
        tab_priv_rt('sys',              'gv_$database',                     'read',     true,   false),
        tab_priv_rt('sys',              'gv_$instance',                     'read',     true,   false),
        tab_priv_rt('sys',              'gv_$latch',                        'read',     true,   false),
        tab_priv_rt('sys',              'gv_$latchholder',                  'read',     true,   false),
        tab_priv_rt('sys',              'gv_$latchname',                    'read',     true,   false),
        tab_priv_rt('sys',              'gv_$lock',                         'read',     true,   false),
        tab_priv_rt('sys',              'gv_$locked_object',                'read',     true,   false),
        tab_priv_rt('sys',              'gv_$session',                      'read',     true,   false),
        tab_priv_rt('sys',              'gv_$sgastat',                      'read',     true,   false),
        tab_priv_rt('sys',              'registry$history',                 'read',     true,   false),
        tab_priv_rt('sys',              'v_$active_instances',              'read',     true,   false),
        tab_priv_rt('sys',              'v_$diag_alert_ext',                'read',     true,   false),
        tab_priv_rt('sys',              'v_$encryption_wallet',             'read',     false,  false),
        tab_priv_rt('sys',              'v_$locked_object',                 'read',     true,   false),
        tab_priv_rt('sys',              'v_$pdbs',                          'read',     true,   false),
        tab_priv_rt('sys',              'v_$resource_limit',                'read',     true,   false),
        tab_priv_rt('sys',              'v_$session',                       'read',     true,   false),
        tab_priv_rt('sys',              'v_$sesstat',                       'read',     true,   false),
        tab_priv_rt('sys',              'v_$sqlarea',                       'read',     true,   false),
        tab_priv_rt('sys',              'v_$statname',                      'read',     true,   false)
    );

    ----------------------------------------------------------------------------
    -- List of system privileges to grant to schema
    ----------------------------------------------------------------------------
    l_sys_privs := sys_priv_ct(
        sys_priv_rt('administer database trigger',      true),
        sys_priv_rt('alter any analytic view',          false),
        sys_priv_rt('alter any attribute dimension',    false),
        sys_priv_rt('alter any hierarchy',              false),
        sys_priv_rt('alter any index',                  false),
        sys_priv_rt('alter any materialized view',      false),
        sys_priv_rt('alter any mining model',           false),
        sys_priv_rt('alter any procedure',              true),
        sys_priv_rt('alter any sequence',               false),
        sys_priv_rt('alter any table',                  true),
        sys_priv_rt('alter any trigger',                true),
        sys_priv_rt('alter any type',                   false),
        sys_priv_rt('alter session',                    true),
        sys_priv_rt('alter tablespace',                 false),
        sys_priv_rt('alter user',                       false),
        sys_priv_rt('comment any table',                true),
        sys_priv_rt('create any analytic view',         false),
        sys_priv_rt('create any attribute dimension',   false),
        sys_priv_rt('create any context',               true),
        sys_priv_rt('create any hierarchy',             false),
        sys_priv_rt('create any index',                 false),
        sys_priv_rt('create any job',                   true),
        sys_priv_rt('create any materialized view',     false),
        sys_priv_rt('create any mining model',          false),
        sys_priv_rt('create any procedure',             true),
        sys_priv_rt('create any sequence',              true),
        sys_priv_rt('create any synonym',               true),
        sys_priv_rt('create any table',                 true),
        sys_priv_rt('create any trigger',               true),
        sys_priv_rt('create any type',                  true),
        sys_priv_rt('create any view',                  true),
        sys_priv_rt('create cluster',                   true),
        sys_priv_rt('create dimension',                 true),
        sys_priv_rt('create indextype',                 true),
        sys_priv_rt('create job',                       true),
        sys_priv_rt('create materialized view',         true),
        sys_priv_rt('create operator',                  true),
        sys_priv_rt('create procedure',                 true),
        sys_priv_rt('create public synonym',            true),
        sys_priv_rt('create public database link',      true),
        sys_priv_rt('create sequence',                  true),
        sys_priv_rt('create session',                   true),
        sys_priv_rt('create synonym',                   true),
        sys_priv_rt('create table',                     true),
        sys_priv_rt('create tablespace',                false),
        sys_priv_rt('create trigger',                   true),
        sys_priv_rt('create type',                      true),
        sys_priv_rt('create user',                      false),
        sys_priv_rt('create view',                      true),
        sys_priv_rt('delete any table',                 false),
        sys_priv_rt('drop any analytic view',           false),
        sys_priv_rt('drop any attribute dimension',     false),
        sys_priv_rt('drop any context',                 false),
        sys_priv_rt('drop any hierarchy',               false),
        sys_priv_rt('drop any index',                   false),
        sys_priv_rt('drop any materialized view',       false),
        sys_priv_rt('drop any mining model',            false),
        sys_priv_rt('drop any procedure',               true),
        sys_priv_rt('drop any sequence',                true),
        sys_priv_rt('drop any synonym',                 true),
        sys_priv_rt('drop any table',                   true),
        sys_priv_rt('drop any trigger',                 true),
        sys_priv_rt('drop any type',                    true),
        sys_priv_rt('drop any view',                    true),
        sys_priv_rt('drop public synonym',              false),
        sys_priv_rt('drop tablespace',                  false),
        sys_priv_rt('drop user',                        false),
        sys_priv_rt('execute any procedure',            true),
        sys_priv_rt('execute any type',                 false),
        sys_priv_rt('flashback archive administer',     false),
        sys_priv_rt('grant any object privilege',       true),
        sys_priv_rt('insert any table',                 false),
        sys_priv_rt('manage scheduler',                 true),
        sys_priv_rt('manage tablespace',                false),
        sys_priv_rt('merge any view',                   false),
        sys_priv_rt('select any dictionary',            true),
        sys_priv_rt('select any sequence',              false),
        sys_priv_rt('select any table',                 true),
        sys_priv_rt('unlimited tablespace',             false),
        sys_priv_rt('update any table',                 false)
    );

    ----------------------------------------------------------------------------
    -- Grant roles to schema
    ----------------------------------------------------------------------------
    sys.dbms_output.put_line('-- Grant roles');
    for idx in 1 .. l_roles.count loop
        select count(1)
        into l_count
        from dba_roles
        where upper(role) = upper(l_roles(idx).role_name);

        l_identifier := l_roles(idx).role_name;

        if l_count = 0 then

            l_failures.extend();
            l_failures(l_failures.last) := unable_to_grant_rt(
                'ROLE',
                l_identifier,
                'Role does not exist'
            );
        else
            l_sql := 'grant ' || l_identifier || ' to ' || c_schema_name;

            if l_roles(idx).admin_option then
                l_sql := l_sql || ' with admin option';
            end if;

            begin
                execute immediate (l_sql);
            exception
                when l_insufficient_privs_excp then
                    l_failures.extend();
                    l_failures(l_failures.last) := unable_to_grant_rt(
                        'ROLE',
                        l_identifier,
                        'Insufficient privileges to grant'
                    );
                when others then
                    l_failures.extend();
                    l_failures(l_failures.last) := unable_to_grant_rt(
                        'ROLE',
                        l_identifier,
                        sqlerrm
                    );
            end;
        end if;
    end loop;
    sys.dbms_output.put_line('Completed.');
    sys.dbms_output.put_line('');

    ----------------------------------------------------------------------------
    -- Grant object privileges to schema
    ----------------------------------------------------------------------------
    sys.dbms_output.put_line('-- Grant object privileges');
    for idx in 1 .. l_tab_privs.count loop
        select count(1)
        into l_count
        from all_objects
        where upper(owner) = upper(l_tab_privs(idx).object_owner)
            and upper(object_name) = upper(l_tab_privs(idx).object_name);

        l_identifier := l_tab_privs(idx).privilege || ' on';

        if l_tab_privs(idx).is_directory then
            l_identifier := l_identifier || ' directory';
        end if;

        l_identifier := l_identifier || ' ' || l_tab_privs(idx).object_owner || '.' || l_tab_privs(idx).object_name;

        if l_count = 0 then

            l_failures.extend();
            l_failures(l_failures.last) := unable_to_grant_rt(
                'OBJECT',
                l_identifier,
                'Object does not exist'
            );
        else
            l_sql := 'grant ' || l_identifier || ' to ' || c_schema_name;

            if l_tab_privs(idx).grantable then
                l_sql := l_sql || ' with grant option';
            end if;

            begin
                execute immediate (l_sql);
            exception
                when l_insufficient_privs_excp then
                    l_failures.extend();
                    l_failures(l_failures.last) := unable_to_grant_rt(
                        'OBJECT',
                        l_identifier,
                        'Insufficient privileges to grant'
                    );
                when others then

                    l_failures.extend();
                    l_failures(l_failures.last) := unable_to_grant_rt(
                        'OBJECT',
                        l_identifier,
                        sqlerrm
                    );
            end;
        end if;
    end loop;
    sys.dbms_output.put_line('Completed.');
    sys.dbms_output.put_line('');

    ----------------------------------------------------------------------------
    -- Grant system privileges to schema
    ----------------------------------------------------------------------------
    sys.dbms_output.put_line('-- Grant system privileges');
    for idx in 1 .. l_sys_privs.count loop
        select count(1)
        into l_count
        from dba_sys_privs
        where upper(privilege) = upper(l_sys_privs(idx).privilege_name);

        l_identifier := l_sys_privs(idx).privilege_name;

        if l_count = 0 then

            l_failures.extend();
            l_failures(l_failures.last) := unable_to_grant_rt(
                'SYSTEM',
                l_identifier,
                'Privilege does not exist'
            );
        else
            l_sql := 'grant ' || l_identifier || ' to ' || c_schema_name;

            if l_sys_privs(idx).admin_option then
                l_sql := l_sql || ' with admin option';
            end if;

            begin
                execute immediate (l_sql);
            exception
                when l_insufficient_privs_excp then

                    l_failures.extend();
                    l_failures(l_failures.last) := unable_to_grant_rt(
                        'SYSTEM',
                        l_identifier,
                        'Insufficient privileges to grant'
                    );
                when others then

                    l_failures.extend();
                    l_failures(l_failures.last) := unable_to_grant_rt(
                        'SYSTEM',
                        l_identifier,
                        sqlerrm
                    );
            end;
        end if;
    end loop;
    sys.dbms_output.put_line('Completed.');
    sys.dbms_output.put_line('');

    ----------------------------------------------------------------------------
    -- List failed grants
    ----------------------------------------------------------------------------
    if (l_failures.count > 0) then
        sys.dbms_output.put_line('WARNING: "' || c_schema_name || '" did not recieve all defined grants.');
        sys.dbms_output.put_line('         This is usually not cause for concern; some privileges are not available in ADB');
        sys.dbms_output.put_line('         or cannot be granted to non-ADMIN schemas');
        sys.dbms_output.put_line('');
        sys.dbms_output.put_line('-- Failed grants');
        sys.dbms_output.put_line(
            rpad('TYPE', 8) || ' | ' ||
            rpad('GRANT', 50) || ' | ' ||
            'REASON'
        );
        sys.dbms_output.put_line(rpad('-', 70, '-'));
        for idx in 1 .. l_failures.count loop
            sys.dbms_output.put_line(
                rpad(l_failures(idx).grant_type, 8) || ' | ' ||
                rpad(l_failures(idx).grant_target, 50) || ' | ' ||
                l_failures(idx).reason
            );
        end loop;
    end if;
end;
/

undefine grant_schema_name
