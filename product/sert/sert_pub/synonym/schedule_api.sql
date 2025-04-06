--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:schedule_api_1722223680480 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
create synonym sert_pub.schedule_api for sert_core.schedule_api
;
--rollback not required
