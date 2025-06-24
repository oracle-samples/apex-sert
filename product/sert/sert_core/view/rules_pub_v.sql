--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.rules_pub_v_1721804194431 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace force view sert_core.rules_pub_v
as
select
   rule_id
  ,rule_name
  ,risk_name
  ,category_name
  ,category_key
  ,risk
  ,risk_url
  ,impact
  ,shared_comp_type
  ,rule_criteria_type_name
  ,nvl(to_char(info), 'No data found') as info
  ,nvl(to_char(fix), 'No data found')  as fix
  ,help_url
  ,builder_url_key
  ,builder_url_id
  ,rule_hash
  ,view_name
  ,rule_severity_id
  ,rule_severity_name
  ,rule_severity_key
from
  sert_core.rules_v r
/
--rollback not required
