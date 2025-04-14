--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset mzimon:oci_grants endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
--preconditions onFail:MARK_RAN onError:HALT
-------------------------------------------------------------------------------
-- this file should live in product/sert/sert_pub/grant/oci_grants.sql
-- 06-jan-2025 moving to a development space to disable
-------------------------------------------------------------------------------
grant DWROLE to SERT_PUB
/

begin
    dbms_cloud_admin.enable_resource_principal();
    dbms_cloud_admin.enable_resource_principal(username => 'SERT_PUB');
end;
/
--rollback not required
