--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------


--changeset mipotter:create_view_sert_core.rule_severity_v endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
create or replace force view sert_core.rule_severity_v
as
select  rule_severity_id,
        rule_severity_name,
        rule_severity_key,
        seq
  from  sert_core.rule_severity
/
--rollback not required
