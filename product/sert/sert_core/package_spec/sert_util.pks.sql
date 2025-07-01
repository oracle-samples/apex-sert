--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_spec_sert_core.sert_util stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.sert_util
as

  procedure set_build_option(
    p_application_id    in number,
    p_build_option_name in varchar2,
    p_build_status      in varchar2 default apex_application_admin.c_build_option_status_include
    );

  procedure set_build_option(
    p_workspace      in varchar2,
    p_application_alias in varchar2,
    p_build_option_name in varchar2,
    p_build_status in varchar2 default apex_application_admin.c_build_option_status_include
    );

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: m a t c h _ s t r i n g.
----------------------------------------------------------------------------------------------------------------------------
-- strips whitespace, and compares if string 1 matches string 2
-- is string 1 is SHORTER than string 2, match up to length of string 1
-- returns TRUE if matched
----------------------------------------------------------------------------------------------------------------------------
  function match_string (
    p_string1 in varchar2,
    p_string2 in varchar2
  ) return boolean;

----------------------------------------------------------------------------------------------------------------------------
-- m a t c h _ s t r i n g _ y n
-- returns Y is strings match excluding whitespace
-- is string 1 is SHORTER than string 2, match up to length of string 1
-- returns N otherwise
----------------------------------------------------------------------------------------------------------------------------
  function match_string_yn (
    p_string1 in varchar2,
    p_string2 in varchar2
  ) return varchar2;

end sert_util;
/
--rollback not required

