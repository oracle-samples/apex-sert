--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mzimon:create_package_spec_sert_core.reports_pkg_pks stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.reports_pkg
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
  );

function get_pref_value (p_pref_key in varchar2)
return varchar2;

end reports_pkg;
/
--rollback not required
