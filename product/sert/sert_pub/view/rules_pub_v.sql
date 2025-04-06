--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_pub.rules_pub_v_1722223805286 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
create or replace force view sert_pub.rules_pub_v
as
select
   rule_id
  ,rule_name
  ,category_name
  ,category_key
  ,risk_name
  ,risk
  ,risk_url
  ,impact
  ,shared_comp_type
  ,rule_criteria_type_name
  ,info
  ,fix
  ,help_url
  ,builder_url_key
  ,builder_url_id
  ,rule_hash
from
  sert_core.rules_pub_v
;
--rollback not required
