--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset sundhing:prefs_1727056366159 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
grant select on sert_core.prefs to sert_pub
/
--rollback not required
