--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.admin_metrics_v endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
-- View: sert_core.admin_metrics_v
-- Purpose: aggregated counts for admin dashboard (rule sets, rules, evaluations, exceptions).
-- Method: union of four count(*) queries; uses seq for stable ordering while projecting only value and label.

create or replace view sert_core.admin_metrics_v as
select
  value,
  label
from (
  select count(*) as value, 'Rule Sets' as label, 1 as seq
  from rule_sets
  union
  select count(*) as value, 'Rules' as label, 2 as seq
  from rules
  union
  select count(*) as value, 'Evaluations' as label, 3 as seq
  from evals
  union
  select count(*) as value, 'Exceptions' as label, 4 as seq
  from exceptions
)
order by
  seq
;
--rollback not required
