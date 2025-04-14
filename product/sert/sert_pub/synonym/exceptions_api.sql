--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:exceptions_api_1722223673887 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
create synonym sert_pub.exceptions_api for sert_core.exceptions_api
;
--rollback not required
