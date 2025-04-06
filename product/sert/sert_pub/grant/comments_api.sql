--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:grant_execute_on_sert_core_1721803250524 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
grant execute on sert_core.comments_api to sert_pub
/
--rollback not required
