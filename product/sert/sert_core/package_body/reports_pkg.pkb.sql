--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mzimon:create_package_spec_sert_core.reports_pkg_pkb stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.reports_pkg
as

procedure send_password_email
  (
   p_report_name  in varchar2
  ,p_to           in varchar2 default NULL
  ,p_from         in varchar2 default NULL
  ,p_filename     in varchar2
  ,p_password     in varchar2
  ,p_subj         in varchar2
  ,p_ws           in varchar2
  ) is

  l_body   varchar2(1000);
  l_from   SERT_CORE.PREFS.PREF_VALUE%TYPE;
  l_to     varchar2(100);
  l_smtp_configured number ;

  cursor c_prefs is
    select pref_value
    from sert_core.prefs
    where pref_key = 'EMAIL_FROM';

  cursor c_to is
    select email
    from apex_workspace_apex_users
    where user_name = nvl(v('app_user'), user)
    and workspace_name = p_ws;

begin
  -- check email configuration
  select count(value)
  into l_smtp_configured
  from APEX_INSTANCE_PARAMETERS
  where name = 'SMTP_HOST_ADDRESS';

  if (l_smtp_configured > 0) then
    log_pkg.log(p_log => 'START: send password email for report: ' || p_report_name);

    if p_to is not NULL then
      l_to := p_to;
    else
      open c_to;
      fetch c_to into l_to;
      close c_to;
    end if;

    if p_from is not NULL then
      l_from := p_from;
    else
      open c_prefs;
      fetch c_prefs into l_from;
      close c_prefs;
    end if;

    l_body := 'Your APEX-SERT ' || p_filename || ' PDF password is :' || p_password || utl_tcp.crlf;

    apex_mail.send(
      p_to   => l_to,
      p_from => l_from,
      p_body => l_body,
      p_subj => p_subj);

    log_pkg.log(p_log => 'END: send password email for report: ' || p_report_name);
  else
    log_pkg.log(p_log => 'reports_pkg.send_password_email SMTP not configured');
  end if;
exception
  when OTHERS then
    log_pkg.log(p_log => 'An unhandled error has occured:' || SQLERRM, p_log_type => 'UNHANDLED');
    raise;
end send_password_email;


function get_pref_value (p_pref_key in varchar2)
return varchar2 is

  l_pref_value   SERT_CORE.PREFS.PREF_VALUE%TYPE;

  cursor c_prefs is
    select pref_value
    from sert_core.prefs
    where pref_key = p_pref_key;

begin

  log_pkg.log(p_log => 'START: fetch pref_value for pref_key: ' || p_pref_key);

  open c_prefs;
  fetch c_prefs into l_pref_value;
  close c_prefs;

  if l_pref_value is NULL then
    l_pref_value := 'UNDEFINED';
  end if;

  log_pkg.log(p_log => 'END: fetch pref_value for pref_key: ' || p_pref_key || ' - pref_value: ' || l_pref_value);
  return l_pref_value;

exception
  when OTHERS then
    log_pkg.log(p_log => 'An unhandled error has occured:' || SQLERRM, p_log_type => 'UNHANDLED');
    raise;
end get_pref_value;

end reports_pkg;
/
--rollback not required
