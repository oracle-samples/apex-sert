--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_spec_sert_core.rules_pkg_1721803474952 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.rules_pkg
as

procedure import
  (
   p_name in varchar2
  );

procedure export;

procedure add_rule_to_rule_set
  (
   p_rule_id in number
  ,p_rule_sets in varchar2
  );

procedure copy_rule
  (
   p_rule_id   in out number
  ,p_rule_name in varchar2
  ,p_rule_key  in varchar2
  ,p_rule_sets in varchar2 default null
  );

procedure upgrade_rules;

end rules_pkg;
/
--rollback not required
