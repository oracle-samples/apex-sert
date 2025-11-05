--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.prefs_api stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.prefs_api as

    -- -----------------------------------------------------------------------------
    -- Function: pref_value
    -- Purpose: Return the preference value for the given key.
    -- Parameters:
    --   p_pref_key - Preference key.
    -- Returns:
    --   Preference value as varchar2.
    -- Exceptions:
    --   no_data_found - Propagated to caller.
    --   others        - Propagated.
    -- -----------------------------------------------------------------------------
    function pref_value (
        p_pref_key in varchar2)
        return varchar2
    is
        l_value  sert_core.prefs.pref_value%type;
    begin
        select pref_value
          into l_value
          from sert_core.prefs
         where pref_key = p_pref_key;

        return l_value;
    exception
        when no_data_found then
            -- Preference key not found. Propagate to caller.
            raise;
        when others then
            -- Unexpected error. Propagate.
            raise;
    end pref_value;

    -- -----------------------------------------------------------------------------
    -- Function: pref_true
    -- Purpose: Return true when the preference identified by p_pref_key has value 'Y'.
    -- Parameters:
    --   p_pref_key - Preference key.
    -- Returns:
    --   Boolean result.
    -- Exceptions:
    --   no_data_found - Handled and returns false.
    --   others        - Propagated.
    -- -----------------------------------------------------------------------------
    function pref_true (
        p_pref_key in varchar2)
        return boolean
    is
        l_value  sert_core.prefs.pref_value%type;
    begin
        l_value := pref_value(p_pref_key);

        if l_value = 'Y' then
            return true;
        else
            return false;
        end if; -- l_value = 'Y'
    exception
        when no_data_found then
            return false;
        when others then
            raise;
    end pref_true;

    -- -----------------------------------------------------------------------------
    -- Procedure: upsert_pref
    -- Purpose: Insert or update a preference row identified by p_pref_key.
    -- Parameters:
    --   p_pref_name   - Preference display name.
    --   p_pref_key    - Preference key.
    --   p_pref_value  - Preference value.
    --   p_internal_yn - Internal-only flag, defaults to 'Y'.
    -- Returns:
    --   None.
    -- Exceptions:
    --   others - Propagated.
    -- -----------------------------------------------------------------------------
    procedure upsert_pref (
        p_pref_name   in sert_core.prefs.pref_name%type,
        p_pref_key    in sert_core.prefs.pref_key%type,
        p_pref_value  in sert_core.prefs.pref_value%type default null,
        p_internal_yn in sert_core.prefs.internal_yn%type default 'Y')
    is
    begin
        merge into sert_core.prefs dst
        using (
            select
                p_pref_name    as pref_name,
                p_pref_key     as pref_key,
                p_pref_value   as pref_value,
                p_internal_yn  as internal_yn
              from dual
        ) src
           on (src.pref_key = dst.pref_key)
        when matched then
            update set
                dst.pref_value   = src.pref_value,
                dst.internal_yn  = src.internal_yn
        when not matched then
            insert (
                pref_name,
                pref_key,
                pref_value,
                internal_yn
            )
            values (
                src.pref_name,
                src.pref_key,
                src.pref_value,
                src.internal_yn
            );
    exception
        when others then
            raise;
    end upsert_pref;

end prefs_api;
/
--rollback not required
