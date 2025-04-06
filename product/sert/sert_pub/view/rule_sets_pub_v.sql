--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_pub.rule_sets_pub_v_1722223793534 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
create or replace force view sert_pub.rule_sets_pub_v
as
select
   rule_set_id
  ,rule_set_type_id
  ,rule_set_type_name
  ,rule_set_type_key
  ,rule_set_name
  ,rule_set_key
  ,apex_version
  ,description
  ,cnt
from
  sert_core.rule_sets_pub_v
;
--rollback not required
