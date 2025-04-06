--liquibase formatted sql
--changeset mipotter:010_set_build_options_aop_disable endDelimiter:/ runOnChange:true runAlways:false stripComments:false

declare
  l_build_status varchar2(1000);
begin
  -- dbms_output.put_line('${sert_aop_url}');
  if ('${sert_aop_url}' = ''  or '$' || '{sert_aop_url}' = '${sert_aop_url}' ) then
    l_build_status := apex_application_admin.c_build_option_status_exclude;
  else
    l_build_status := apex_application_admin.c_build_option_status_include;
  end if;

  sert_core.sert_util.set_build_option(
      p_workspace         => 'SERT',
      p_application_alias => 'APEX_SERT',
      p_build_option_name => 'AOP',
      p_build_status      => l_build_status
      );
end;
/
--rollback not required