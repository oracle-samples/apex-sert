--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset sundhing:rules_1727056335361 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
grant select on sert_core.rules to sert_pub
/
--rollback not required
