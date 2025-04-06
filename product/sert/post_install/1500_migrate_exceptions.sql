--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset mzimon:migrate_exceptions_sert_2024 runOnChange:true runAlways:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:1 select count(*) from dual where exists (select rule_set_id from sert_core.rule_sets where rule_set_key='SERT-SECURITY');
--precondition-sql-check expectedResult:1 select count(*) from dual where exists (select rule_set_id from sert_core.rule_sets where rule_set_key='SERT-2024');
------------------------------------------------------------------------------
-- This script is designed to migrate exceptions from the original Rule Set Key
-- some early deployments used a ruleset named with a year, this is not good
-- for continuity.
-- 1. we need to identify and migrate any existing exceptions, so long as
--   they do not already exist in the new rule set. (they shouldnt)
-- 2. after migration we also wish to deactivate the current, active ruleset
--   to ensure users only have access to a single default ruleset.
------------------------------------------------------------------------------
declare
  l_src_rule_set_id sert_core.exceptions.rule_Set_id%type;
  l_dest_rule_set_id sert_core.exceptions.rule_Set_id%type;
  l_dest_rule_set_key  sert_core.rule_sets.rule_set_key%type;
  l_src_rule_set_key  sert_core.rule_sets.rule_set_key%type;
  l_apex_version  sert_core.rule_sets.apex_version%type;
begin
  l_dest_rule_set_key := 'SERT-SECURITY';
  l_src_rule_set_key := 'SERT-2024';

  select max(apex_version)
  into l_apex_version
  from sert_core.exceptions_v;

  -- l_apex_version will be null if no exceptions exist...
  if l_apex_version is not null then
    -- grab the src/dest rule_set_key
    select rule_set_id into l_dest_rule_set_id
    from sert_core.rule_sets
    where rule_set_key = l_dest_rule_set_key and apex_version = l_apex_version;

    -- update  to link to the dest ruleset
    select rule_set_id into l_src_rule_set_id
    from sert_core.rule_sets
    where rule_set_key = l_src_rule_set_key and apex_version = l_apex_version;

    -- update evals to link to the dest ruleset
    update sert_core.evals
    set rule_set_id = l_dest_rule_set_id
    where rule_set_id = l_src_rule_set_id;

    -- update exceptions
    update sert_core.exceptions e1
    set e1.rule_set_id = l_dest_rule_set_id
    where e1.rule_set_id = l_src_rule_set_id
    and not exists ( select 1 from sert_core.exceptions e2
                      where e2.RULE_ID||e2.WORKSPACE_ID||e2.APPLICATION_ID||e2.PAGE_ID||e2.COMPONENT_ID||e2.COLUMN_NAME||e2.ITEM_NAME
                    = e1.RULE_ID||e1.WORKSPACE_ID||e1.APPLICATION_ID||e1.PAGE_ID||e1.COMPONENT_ID||e1.COLUMN_NAME||e1.ITEM_NAME
                  and e2.rule_set_id = l_dest_rule_set_id
                ) ;
  end if; --l_apex_version is not null
  -- inactivate src ruleset
  -- cleanup the unwanted ruleset - deactivate it.
  -- we don't care about versions - deactivate all of them
  update sert_core.rule_sets
  set active_yn = 'N'
  where active_yn = 'Y'
--    and apex_version = l_apex_version
    and rule_set_key = l_src_rule_set_key;

end;
/

-- rollback not required
