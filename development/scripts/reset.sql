set serveroutput on

declare
  procedure drop_user(p_user in varchar2)
  as
    e_user_not_found exception;
    pragma exception_init(e_user_not_found, -01918);
  begin
    dbms_output.put_line('dropping user '||p_user);
    execute immediate 'drop user ' || p_user || ' cascade';
    -- if user doesnt exist, just continue without error
  exception when e_user_not_found then null;
  end drop_user;

  --

  procedure clear_lb_table(p_table in varchar2)
  as
    e_table_not_found exception;
    pragma exception_init(e_table_not_found, -00942);
  begin
    execute immediate 'truncate table acdc.' || p_table;
  -- if table doesnt exist, just continue without error
  exception when e_table_not_found then null;
  end clear_lb_table;

  --

  procedure remove_apex_workspace(p_workspace_name in varchar2)
  as
    e_workspace_not_found exception;
    pragma exception_init(e_workspace_not_found, -20987);
  begin

    for rec in (select grantor_workspace workspace
                from apex_workspace_extension_grant
                where grantee_workspace = upper('SERT' )
    ) loop
      apex_instance_admin.revoke_extension_workspace(p_from_workspace => rec.workspace,p_to_workspace => 'SERT');
    end loop;
     apex_extension.remove_menu_entry(p_label => 'APEX SERT', p_workspace => 'SERT');
    commit;
    --
    apex_instance_admin.remove_workspace(p_workspace_name);
  -- if workspace doesnt exist, just continue without error
    -- apex_extension.remove_menu_entry(p_label => 'APEX SERT', p_workspace => 'SERT');
  exception when e_workspace_not_found then null;
  end remove_apex_workspace;
begin

  dbms_output.put_line('Clear changelog tables');
  clear_lb_table(p_table => 'SERT_DATABASECHANGELOG');
  clear_lb_table(p_table => 'SERT_DATABASECHANGELOG_ACTIONS');
  clear_lb_table(p_table => 'SERT_DATABASECHANGELOGLOCK');

  dbms_output.put_line('Drop APEX workspace');
  remove_apex_workspace('SERT');
  -- commit;
  dbms_output.put_line('Drop sert schemas');
  drop_user('sert_core');
  drop_user('sert_pub');
end;
/
