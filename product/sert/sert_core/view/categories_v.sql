--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.categories_v_1721804368829 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
-- View: sert_core.categories_v
-- Purpose: expose category reference data for joins, filters, and display in UI/reporting.
-- Method: simple projection from categories without filtering or transformation.

create or replace force view sert_core.categories_v as
select
  cat.category_id
  ,cat.category_name
  ,cat.category_key
  ,cat.description
  ,cat.created_by
  ,cat.created_on
  ,cat.updated_by
  ,cat.updated_on
from
  categories cat
/
--rollback not required
