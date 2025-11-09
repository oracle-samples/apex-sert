--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_spec_sert_core.prefs_api stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.prefs_api
as
  function pref_value (
      p_pref_key in varchar2)
      return varchar2;

  function pref_true (
    p_pref_key in varchar2
  )
    return boolean;

  procedure upsert_pref (
    p_pref_name   in sert_core.prefs.pref_name%type,
    p_pref_key    in sert_core.prefs.pref_key%type,
    p_pref_value  in sert_core.prefs.pref_value%type default null,
    p_internal_yn in sert_core.prefs.internal_yn%type default 'Y'
  );
end prefs_api;
/
--rollback not required
