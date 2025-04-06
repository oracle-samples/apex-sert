
-- instance admin allow hosting extensions
-- requires patch on ADB for bug 36753968
--https://bug.oraclecorp.com/pls/bug/webbug_edit.edit_info_top?rptno=36753968&report_title=&rptno_count=19&pos=5&query_id=453900
begin
  apex_instance_admin.set_workspace_parameter('SERT', 'ALLOW_HOSTING_EXTENSIONS', 'Y');
end;
/

-- https://docs.oracle.com/en/database/oracle/apex/24.1/aeapi/APEX_EXTENSION.ADD_MENU_ENTRY-Procedure.html#GUID-3F5696AC-5BCE-4915-9169-8F45D60ED28C
BEGIN
  APEX_EXTENSION.ADD_MENU_ENTRY (
    p_label            =>'APEX SERT',
    p_url              => 'r/sert/sert/home?session=&APP_SESSION_ID.&P1_BUILDER_SESSION_ID=&APP_SESSION_ID.',
    p_display_sequence => 10,
    p_description      => 'APEX SERT Security and standards scanner',
    p_is_public        => true,
    p_workspace        =>'SERT' )
END;
/

-- https://docs.oracle.com/en/database/oracle/apex/24.1/aeapi/GRANT_EXTENSION_WORKSPACE-Procedure.html#GUID-170786CB-23FF-43FB-BED6-F41E28029C1B
BEGIN
dbms_output.put_line('APEX version '||apex_application.g_flow_schema_owner);
    for rec in
      (select workspace from apex_workspaces aw
        where aw.workspace <> 'SERT'
        and   not exists ( select workspace_name from apex_workspace_schemas ws
                            where ws.workspace_name = aw.workspace and schema = apex_application.g_flow_schema_owner)
        minus
        select grantor_workspace workspace
        from apex_workspace_extension_grant
        where grantee_workspace = 'SERT' )
    loop
      dbms_output.put_line(rec.workspace);
      apex_instance_admin.grant_extension_workspace(
          p_from_workspace      => rec.workspace,
          p_to_workspace        => 'SERT',
          p_read_access         => true
      );
    end loop;
end;
/

/*******************************************
** statements in the workspace export.
******************************************/

begin
-- public API is APEX_EXTENSION.ADD_MENU_ENTRY
wwv_imp_workspace.create_extension_link(
 p_id=>wwv_flow_imp.id(10395017022757818)
,p_name=>'SERT Next' -- p_label
,p_url=>'r/sert/sert/home?session=&APP_SESSION_ID.&P1_BUILDER_SESSION_ID=&APP_SESSION_ID.'
,p_description=>'SERT Next'
,p_display_sequence=>10
,p_is_public=>true
);
end;
/

prompt ... Extension Grants

begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/


prompt ... Extension Grants

begin
wwv_imp_workspace.create_extension_grant(
 p_id=>wwv_flow_imp.id(10482516654792036)
,p_extension_workspace=>'SERT'
,p_has_read_access=>true
);
end;
/
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
