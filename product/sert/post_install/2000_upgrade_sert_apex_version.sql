--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:check_upgrade_sert_apex_version endDelimiter:/ runOnChange:true runAlways:true rollbackEndDelimiter:/ stripComments:false
declare
  l_apex_version      number := 0;
  l_sert_apex_version number := 0;
  l_rule_set_version  number := 0;
begin
  -- we ONLY want to update this where:
  -- 1: apex release > deployed_sert_apex_version
  -- 2: there exists a sert-security ruleset for the apex_release ( so we can migrate to it)
  -- this should only run when the pref is not updated yet, once it matches it should no longer trigger.
  select
    substr(VERSION_NO, 1, instr(version_no,'.',1)+1) as apex_version,
    (select to_number(pref_value,'99.9') from sert_core.prefs where pref_key = 'SERT_APEX_VERSION') as sert_apex_version,
    (select apex_version
      from sert_core.rule_sets where rule_Set_key = 'SERT-SECURITY' and active_yn = 'Y'
      and apex_version = (select substr(VERSION_NO, 1, instr(version_no,'.',1)+1) from apex_release)
    ) as rule_set_version
  into l_apex_version,l_sert_apex_version,l_rule_set_version
  from apex_release;

  -- apex_version is above the deployed version, AND we have pre-populated a ruleset to match the current release.
  if ( l_apex_version > l_sert_apex_version and l_apex_version = l_rule_set_version ) then
    sert_core.rules_pkg.upgrade_rules;
  end if;

end;
/
--rollback not required
