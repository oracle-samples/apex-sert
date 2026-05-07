--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:prefs_release_version endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
begin
    merge into sert_core.prefs dst
    using ( select 'Release Version' as pref_name
                  , 'RELEASE_VERSION' as pref_key
                  , '24.2.27' as pref_value
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
