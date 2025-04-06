--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.apex_version_pub_v_1721804378393 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace force view sert_core.apex_version_pub_v
as
select
   apex_version
  ,apex_version_item
  ,sert_apex_version
from
  sert_core.apex_version_v
/
--rollback not required
