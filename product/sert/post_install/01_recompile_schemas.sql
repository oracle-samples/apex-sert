--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset  mipotter:compile_schemas stripComments:false runOnChange:true runAlways:true endDelimiter:/ rollbackEndDelimiter:/

begin
  sys.dbms_utility.compile_schema(schema => 'SERT_CORE', compile_all => false);
  sys.dbms_utility.compile_schema(schema => 'SERT_PUB', compile_all => false);
end;
/
