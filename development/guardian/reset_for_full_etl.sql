--
-- Empty warehouse tables and logs
--
declare
    c_clear_log_tables constant boolean := false;

    -- select table_name
    --   from dba_tables
    --  where owner = 'SERT_CORE'
    --    and (table_name like 'SG\_%\_F' escape '\' or table_name like 'SG\_%\_D' escape '\')
    --  order by case when substr(table_name,-1) = 'F' then 1 else 2 end;

    l_tables apex_t_varchar2 := apex_t_varchar2(
        'SG_AGG_APP_RULE_RESULTS_F',
        'SG_APP_RULE_FAILS_F',
        'SG_DAILY_APP_ACTIVITY_F',
        'SG_INSTANCE_METRICS_F',
        'SG_MOST_4WK_APP_ACTIVITY_F',
        'SG_APPLICATIONS_D',
        'SG_APPLICATION_PAGES_D',
        'SG_RESULTS_D',
        'SG_RULES_D' );
begin
    for i in 1..l_tables.count loop
        execute immediate 'truncate table sert_core.'||l_tables(i);
    end loop;

    -- Clear logs to reset cutoff date
    -- Delete cascades to sert_core.sg_etl_task_log
    if c_clear_log_tables then
        delete sert_core.sg_etl_execution_log;
        commit;
    end if;
end;
/