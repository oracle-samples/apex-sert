--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_spec_sert_core.rule_criteria_api stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.rule_criteria_api
as
  -- -----------------------------------------------------------------------------
  -- Procedure: upsert_rule_criteria
  -- Purpose: Insert or update a rule criteria row identified by p_rule_criteria_key.
  -- Parameters:
  --  p_rule_criteria_name      : Name of the Description
  --  p_rule_criteria_key       : unique character KEY of the criteria
  --  p_rule_criteria_type_key  : Key for the Crtieria type, converted to criteria_type_id for upsert
  --  p_rule_criteria_sql       : SQL to be executed
  --  p_reason                  : descriptive text to display as the reason for a failure
  -- Returns:
  --   None.
  -- Exceptions:
  --   others - Propagated.
  -- -----------------------------------------------------------------------------
  procedure upsert_rule_criteria (
    p_rule_criteria_name      in sert_core.rule_criteria.rule_criteria_name%type,
    p_rule_criteria_key       in sert_core.rule_criteria.rule_criteria_key%type,
    p_rule_criteria_type_key  in sert_core.rule_criteria_types.rule_criteria_type_key%type,
    p_rule_criteria_sql       in sert_core.rule_criteria.rule_criteria_sql%type,
    p_reason                  in sert_core.rule_criteria.reason%type );

end rule_criteria_api;
/
--rollback not required
