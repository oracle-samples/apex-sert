--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mzimon:grant_read_on_sert_core_rules_v endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
grant read on sert_core.rules_v to sert_pub
/
--rollback not required
