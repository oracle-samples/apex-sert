--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:sert_core_create stripComments:false runOnChange:true runAlways:false endDelimiter:; rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_users where username = 'SERT_CORE';
create user sert_core no authentication;
--rollback drop user sert_core cascade;

--changeset SERT:set-user-quota-default runOnChange:true endDelimiter:/
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:1 select case PROPERTY_VALUE when NULL then 0 else 1 end PROP from DATABASE_PROPERTIES where PROPERTY_NAME = 'DEFAULT_PERMANENT_TABLESPACE';
--precondition-sql-check expectedResult:0 select count(*) from sys.dual where upper('${sert_data_tablespace}') is not NULL;
---------------------------------------------------------------------
-- this block will identify the configured default tablespace
---------------------------------------------------------------------
declare
    tbl VARCHAR2(50);
    l_sql varchar2(200);
begin
    select PROPERTY_VALUE into tbl from DATABASE_PROPERTIES where PROPERTY_NAME = 'DEFAULT_PERMANENT_TABLESPACE';

    l_sql := 'alter user sert_core quota unlimited on '||tbl;
    execute immediate l_sql;
end;
/
--rollback not required

--changeset SERT:set-user-custom-tablespace runOnChange:true
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:1 select count(*) from sys.dual where upper('${sert_data_tablespace}') is not NULL;
alter user sert_core default tablespace ${sert_data_tablespace} quota unlimited on ${sert_data_tablespace};

--rollback drop user sert_core cascade;

--changeset SERT:set-user-custom-temp-tablespace runOnChange:true
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:1 select count(*) from sys.dual where upper('${sert_temp_tablespace}') is not NULL;
---------------------------------------------------------------------
--
---------------------------------------------------------------------
alter user sert_core temporary tablespace ${sert_temp_tablespace};
--rollback drop user sert_core cascade;

-- #################################################################################

--changeset mipotter:sert_pub_create stripComments:false runOnChange:true runAlways:false endDelimiter:; rollbackEndDelimiter:;
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_users where username = 'SERT_PUB';
create user sert_pub no authentication;
--rollback not required

