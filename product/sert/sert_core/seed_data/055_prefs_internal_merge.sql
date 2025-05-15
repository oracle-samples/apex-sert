--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:prefs_apex_version endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
declare
  l_count number := 0;
  l_current_sert_apex_version number;
  l_deploy_version number := 24.1;
begin
  -- determine the currently installed sert_apex_version
  -- value 0 indicates a fresh install
  --
  -- scenarios:
  -- a. fresh install
  --    no pref exists -> upsert
  -- b. existing install ( eg, on the deployed verion 24.1 )
  --    pref_value < deploy value
  --    update pref value.
  --    pref value = deployed value -> take no action to update?
  -- existing install previously updated to current/later than the "deployed" sert_version
  --      do nothing.
  -- later in post-install we will look at upgrade steps and updating sert_apex_version. not to be done here...

  select to_number(coalesce(max(pref_value),'0'))
  into l_current_sert_apex_version
  from sert_core.prefs
  where pref_key = 'SERT_APEX_VERSION';

  if ( l_current_sert_apex_version < l_deploy_version ) then
    merge into sert_core.prefs dst
    using ( select 'SERT APEX Version' as pref_name, 'SERT_APEX_VERSION' as pref_key, to_char(l_deploy_version) as pref_value, 'Y' as internal_yn from dual ) src
    on ( src.pref_key = dst.pref_key)
      when matched then
        update set dst.pref_value = src.pref_value ,dst.internal_yn = src.internal_yn
      when not matched then
        insert (pref_name, pref_key, pref_value,internal_yn)
        values (src.pref_name,src.pref_key,src.pref_value,src.internal_yn);
  end if; --( l_current_sert_apex_version = 0)
end;
/
--rollback not required

--changeset mipotter:prefs_internal_merge endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
begin
    merge into sert_core.prefs dst
    using ( select 'Sert Help URL' as pref_name
                  , 'SERT_HELP_URL' as pref_key
                  , 'https://docs.oracle.com/en/database/oracle/apex/' as pref_value
                  , 'Y' as internal_yn from dual ) src
    on ( src.pref_key = dst.pref_key)
      when matched then
        update set dst.pref_value = src.pref_value ,dst.internal_yn = src.internal_yn
      when not matched then
        insert (pref_name, pref_key, pref_value,internal_yn)
        values (src.pref_name,src.pref_key,src.pref_value,src.internal_yn);

    merge into sert_core.prefs dst
    using ( select 'Release Version' as pref_name
                  , 'RELEASE_VERSION' as pref_key
                  , '24.2.8' as pref_value
                  , 'Y' as internal_yn from dual ) src
    on ( src.pref_key = dst.pref_key)
      when matched then
        update set dst.pref_value = src.pref_value ,dst.internal_yn = src.internal_yn
      when not matched then
        insert (pref_name, pref_key, pref_value,internal_yn)
        values (src.pref_name,src.pref_key,src.pref_value,src.internal_yn);
end;
/
--rollback not required
