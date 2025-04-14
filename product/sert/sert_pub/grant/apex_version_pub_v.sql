--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:grant_read_on_sert_core_1721803216897 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
grant read on sert_core.apex_version_pub_v to sert_pub
/
--rollback not required
