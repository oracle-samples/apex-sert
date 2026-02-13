--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_type_sert_core.sg_parameter_1768458354461 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_types where owner = upper('sert_core') and type_name = upper('sg_parameter');
create type sert_core.sg_parameter as object (
    parameter_name      varchar2(128),
    parameter_value     varchar2(4000)
);
/
--rollback not required

--changeset mlancast:create_type_sert_core.sg_parameters_1768458381551 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:; stripComments:false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from dba_types where owner = upper('sert_core') and type_name = upper('sg_parameters');
create type sert_core.sg_parameters as table of sert_core.sg_parameter;
--rollback not required
