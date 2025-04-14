--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:comments_api_1722223635415 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
create synonym sert_pub.comments_api for sert_core.comments_api;
--rollback not required
