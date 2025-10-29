--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mzimon:create_package_spec_sert_core.reports_pkg_pkb stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.reports_pkg as

----------------------------------------------------------------------------------------------------------------------------
-- send_password_email
-- purpose: email the PDF password for a generated report to the target recipient.
-- behavior: checks APEX SMTP configuration; resolves recipient/from when not supplied (recipient from workspace user
--   v('app_user') within p_ws; sender from prefs('EMAIL_FROM')); constructs the message body and sends via apex_mail;
--   logs start/end or logs when SMTP is not configured; re-raises errors after logging.
-- parameters:
--   p_report_name  - logical report identifier used in logging
--   p_to           - explicit recipient email; when null, derived from workspace user (v('app_user')) in p_ws
--   p_from         - explicit sender email; when null, derived from SERT_CORE.PREFS('EMAIL_FROM')
--   p_filename     - filename referenced in the message body
--   p_password     - password included in the email body
--   p_subj         - email subject
--   p_ws           - APEX workspace name used to resolve recipient when p_to is null
----------------------------------------------------------------------------------------------------------------------------
  procedure send_password_email (
    p_report_name in varchar2,
    p_to          in varchar2 default null,
    p_from        in varchar2 default null,
    p_filename    in varchar2,
    p_password    in varchar2,
    p_subj        in varchar2,
    p_ws          in varchar2
  ) is
    l_body            varchar2(1000);
    l_from            sert_core.prefs.pref_value%type;
    l_to              varchar2(100);
    l_smtp_configured number;

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
    select count(value)
      into l_smtp_configured
      from apex_instance_parameters
     where name = 'SMTP_HOST_ADDRESS';

    if (l_smtp_configured > 0) then

      log_pkg.log(p_log => 'START: send password email for report: ' || p_report_name);

      if p_to is not null then
        l_to := p_to;
      else
        open c_to;
        fetch c_to into l_to;
        close c_to;
      end if; -- p_to is not null

      if p_from is not null then
        l_from := p_from;
      else
        open c_prefs;
        fetch c_prefs into l_from;
        close c_prefs;
      end if; -- p_from is not null

      l_body := 'Your APEX-SERT ' || p_filename || ' PDF password is :' || p_password || utl_tcp.crlf;

      apex_mail.send(
        p_to   => l_to,
        p_from => l_from,
        p_body => l_body,
        p_subj => p_subj
      );

      log_pkg.log(p_log => 'END: send password email for report: ' || p_report_name);

    else
      log_pkg.log(p_log => 'reports_pkg.send_password_email SMTP not configured');
    end if; -- l_smtp_configured > 0
  exception
    when others then
      log_pkg.log(p_log => 'An unhandled error has occured:' || sqlerrm, p_log_type => 'UNHANDLED');
      raise;
  end send_password_email;


----------------------------------------------------------------------------------------------------------------------------
-- get_pref_value
-- purpose: fetch a configuration value from SERT_CORE.PREFS by key.
-- behavior: logs start/end; reads pref_value via explicit cursor; substitutes 'UNDEFINED' when the value is null.
-- parameters:
--   p_pref_key - preference key to lookup
-- returns: varchar2 preference value or 'UNDEFINED' when no value is found
----------------------------------------------------------------------------------------------------------------------------
  function get_pref_value (
    p_pref_key in varchar2
  ) return varchar2
  is
    l_pref_value sert_core.prefs.pref_value%type;

    cursor c_prefs is
      select pref_value
        from sert_core.prefs
       where pref_key = p_pref_key;
  begin

    log_pkg.log(p_log => 'START: fetch pref_value for pref_key: ' || p_pref_key);

    open c_prefs;
    fetch c_prefs into l_pref_value;
    close c_prefs;

    if l_pref_value is null then

      l_pref_value := 'UNDEFINED';

    end if; -- l_pref_value is null

    log_pkg.log(p_log => 'END: fetch pref_value for pref_key: ' || p_pref_key || ' - pref_value: ' || l_pref_value);
    return l_pref_value;
  exception
    when others then
      log_pkg.log(p_log => 'An unhandled error has occured:' || sqlerrm, p_log_type => 'UNHANDLED');
      raise;
  end get_pref_value;

end reports_pkg;
/
--rollback not required
