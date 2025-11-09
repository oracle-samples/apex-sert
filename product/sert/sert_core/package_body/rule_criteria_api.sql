--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.rule_criteria_api stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.rule_criteria_api as

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
        p_reason                  in sert_core.rule_criteria.reason%type )
    is
    begin

    merge into sert_core.rule_criteria dst
    using (
      select  p_rule_criteria_name  as rule_criteria_name
            , p_rule_criteria_key   as rule_criteria_key
            , (select rule_criteria_type_id
                 from sert_core.rule_criteria_types ct
                where ct.rule_criteria_type_key = p_rule_criteria_type_key
              ) as rule_criteria_type_id
            , p_rule_criteria_sql    as rule_criteria_sql
            , p_reason as reason
      from dual
    ) src
    on ( src.rule_criteria_key = dst.rule_criteria_key)
      when matched then
        update set
            rule_criteria_name      = src.rule_criteria_name
          , rule_criteria_type_id   = src.rule_criteria_type_id
          , rule_criteria_sql       = src.rule_criteria_sql
          , reason                  = src.reason
      when not matched then
        insert (
          rule_criteria_name
          ,rule_criteria_type_id
          ,rule_criteria_sql
          ,reason
          ,rule_criteria_key
        ) values (
          src.rule_criteria_name
          ,src.rule_criteria_type_id
          ,src.rule_criteria_sql
          ,src.reason
          ,src.rule_criteria_key
        );

    exception
        when others then
            raise;
    end upsert_rule_criteria;

end rule_criteria_api;
/
--rollback not required
