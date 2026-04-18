--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset crueppri:sso_enable rollbackEndDelimiter:/ endDelimiter:/ labels:SSO runOnChange:true
begin
    gbu_core.gbu_apex_builder_sso.enable;
end;
/
--rollback not required
