--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:grant_read_on_sert_core.rule_severity_v endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
grant read on sert_core.rule_severity_v to sert_pub;
--rollback not required
