--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:aop_api_pkg_syn endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
create or replace synonym sert_pub.aop_api_pkg for sert_core.aop_api_pkg;
--rollback not required
