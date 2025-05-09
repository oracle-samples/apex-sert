--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mzimon:grant_select_on_exceptions_json_to_relational_v endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
grant select on sert_core.exceptions_json_to_relational_v to sert_pub
/
--rollback not required
