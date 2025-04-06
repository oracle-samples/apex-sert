--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- only run this if DBV is not enabled.
--changeset mipotter:grant_create_job_to_sert_core_1721803257869 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
--preconditions onFail:CONTINUE onError:HALT
--precondition-sql-check expectedResult:1 select count(*) FROM V$OPTION WHERE PARAMETER = 'Oracle Database Vault' and value = 'FALSE';
grant create job to sert_core
/
--rollback not required
