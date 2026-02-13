set serveroutput on
set define ^
set serveroutput on size unlimited
set sqlformat    default
set termout      on
set timing       off
set verify       off

declare
    l_views apex_t_varchar2 := apex_t_varchar2(
        'SG_LAST_COMPLETED_MAIN_ETL_V',
        'SG_ETL_EXECUTION_TASKS_LOG_V',
        'SG_ETL_EXECUTION_LOG_V' );

    l_tables apex_t_varchar2 := apex_t_varchar2(
        'SG_MOST_4WK_APP_ACTIVITY_F',
        'SG_INSTANCE_METRICS_F',
        'SG_DAILY_APP_ACTIVITY_F',
        'SG_APP_RULE_FAILS_F',
        'SG_AGG_APP_RULE_RESULTS_F',
        'SG_RULES_D',
        'SG_RESULTS_D',
        'SG_APPLICATION_PAGES_D',
        'SG_APPLICATIONS_D',
        'SG_ETL_TASK_LOG',
        'SG_ETL_TASKS',
        'SG_ETL_EXECUTION_LOG',
        'SG_ETL_PIPELINE_PARAMETERS',
        'SG_ETL_PIPELINES',
        'SG_ETL_CONTROLLER_LOCK',
        'SG_APP_RULE_FAILS_FS',
        'SG_AGG_APP_RULE_RESULTS_FS' );

    l_types apex_t_varchar2 := apex_t_varchar2(
        'SG_PARAMETERS',
        'SG_PARAMETER' );

    l_packages apex_t_varchar2 := apex_t_varchar2(
        'SG_UTIL',
        'SG_ETL_TASK',
        'SG_ETL_CONTROLLER' );

    l_objects_found boolean := false;
    l_sql_rowcount  number := 0;

    e_object_missing exception;
    pragma exception_init(e_object_missing, -942);

    e_object_does_not_exist exception;
    pragma exception_init(e_object_does_not_exist, -4043);

    procedure remove_apex_application is
        l_removed boolean := false;
    begin
        for c in (
            select workspace, application_id, application_name, alias
              from apex_applications
             where workspace = 'SERT'
               and alias = 'SERT-GUARDIAN' )
        loop
            apex_application_install.clear_all;
            apex_application_install.set_workspace(c.workspace);
            apex_application_install.set_keep_sessions(false);
            apex_application_install.remove_application(c.application_id);

            dbms_output.put_line('Removed SERT Guardian APEX application');
            l_removed := true;
        end loop;

        if not l_removed then
            dbms_output.put_line('WARNING: Did not find SERT Guardian APEX application to remove. Manual check required.');
        end if;
    end remove_apex_application;

    procedure drop_etl_jobs is
    begin
        execute immediate 'begin sert_core.sg_etl_controller.abort_etl; end';
        dbms_output.put_line('Aborted running synchronization ETL');
    exception
        when others then
            if sqlcode = -20006 then
                null; --No ETL job is currently running to abort.
            elsif sqlcode = -6550 then
                null; -- package is invalid (probably already deleted)
            else
                dbms_output.put_line(sqlcode||' -> '||sqlerrm);
                -- do not re-raise
            end if;
    end drop_etl_jobs;

    procedure drop_guardian_views is
    begin
        dbms_output.put_line('Dropping views');
        for i in 1..l_views.count loop
            begin
                execute immediate 'drop view sert_core.'||l_views(i);
                dbms_output.put_line('....'||l_views(i) );
            exception
                when e_object_missing then null;
            end;
        end loop;
    end drop_guardian_views;

    procedure drop_guardian_tables is
    begin
        dbms_output.put_line('Dropping tables');
        for i in 1..l_tables.count loop
            begin
                execute immediate 'drop table sert_core.'||l_tables(i)||' purge';
                dbms_output.put_line('....'||l_tables(i) );
            exception
                when e_object_missing then null;
            end;
        end loop;
    end drop_guardian_tables;

    procedure drop_guardian_types is
    begin
        dbms_output.put_line('Dropping types');
        for i in 1..l_types.count loop
            begin
                execute immediate 'drop type sert_core.'||l_types(i);
                dbms_output.put_line('....'||l_types(i) );
            exception
                when e_object_does_not_exist then null;
            end;
        end loop;
    end drop_guardian_types;

    procedure drop_guardian_packages is
    begin
        dbms_output.put_line('Dropping packages');
        for i in 1..l_packages.count loop
            begin
                execute immediate 'drop package sert_core.'||l_packages(i);
                dbms_output.put_line('....'||l_packages(i) );
            exception
                when e_object_does_not_exist then null;
            end;
        end loop;
    end drop_guardian_packages;

begin
    dbms_output.put_line('------------------------------------');
    dbms_output.put_line('Uninstalling SERT Guardian');
    dbms_output.put_line('------------------------------------');
    remove_apex_application;
    drop_etl_jobs;
    drop_guardian_packages;
    drop_guardian_views;
    drop_guardian_tables;
    drop_guardian_types;

    -- delete changelog entries
    delete sert_core.sert_databasechangelog
     where instr(filename, 'product/guardian') > 0;

    l_sql_rowcount := sql%rowcount;
    dbms_output.put_line('Removing changelog entries');
    dbms_output.put_line('....deleted '||l_sql_rowcount||' changlog entries for "product/guardian"');

    COMMIT;

    -- Verify we are done
    dbms_output.put_line('------------------------------------');
    dbms_output.put_line('Verifying no Guardian objects exist:');
    for c in (
        select object_type, owner, object_name
          from dba_objects
         where owner = 'SERT_CORE'
           and object_name like 'SG\_%' escape '\' )
    loop
        l_objects_found := true;
        dbms_output.put_line('Found '||c.object_type||' '||c.owner||'.'||c.object_name);
    end loop;

    if l_objects_found then
        raise_application_error(-20000, 'SERT Guardian objects found - further cleanup required.');
    else
        dbms_output.put_line('....no obects detected.');
        dbms_output.put_line('------------------------------------');
    end if;
end;
/
