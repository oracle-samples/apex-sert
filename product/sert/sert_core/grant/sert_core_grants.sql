--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:grant_apex_administrator_read_role_to_sert_core endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
grant APEX_ADMINISTRATOR_READ_ROLE to sert_core;
--rollback not required
--changeset mipotter:grant_object_privs_to_sert_core endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
--preconditions onFail:CONTINUE onError:HALT
--precondition-sql-check expectedResult:1 select count(*) FROM V$OPTION WHERE PARAMETER = 'Oracle Database Vault' and value = 'FALSE';
grant CREATE TABLE to sert_core;
grant create view to sert_core;
grant create procedure to sert_core;
grant CREATE SEQUENCE to sert_core;
grant CREATE TRIGGER to sert_core;
grant CREATE TYPE to sert_core;
--rollback not required
