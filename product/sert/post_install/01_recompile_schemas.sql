--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset  mipotter:compile_schemas stripComments:false runOnChange:true runAlways:true endDelimiter:/ rollbackEndDelimiter:/

declare
  v_sql varchar2(1024);
begin
  sys.dbms_utility.compile_schema(schema => 'SERT_CORE', compile_all => false);
  sys.dbms_utility.compile_schema(schema => 'SERT_PUB', compile_all => false);

  -- in 19.28 ADB and 19.27 PDB we are seeing one package (exceptions_api)
  -- remain invalid, direct compilation then succeeds. this is a generic
  -- workaround to attempt a explicit compile

  -- Loop through all invalid packages and package bodies in the SERT_CORE schema
  for cur_rec in (
    -- Query dba_objects to find invalid packages and package bodies
    select object_name, object_type
    from dba_objects
    where owner = 'SERT_CORE'
    and status = 'INVALID'
    and object_type in ('PACKAGE', 'PACKAGE BODY')
  ) loop
    if cur_rec.object_type = 'PACKAGE' then
      v_sql := 'alter package SERT_CORE.' || cur_rec.object_name || ' compile';
    else
      v_sql := 'alter package SERT_CORE.' || cur_rec.object_name || ' compile body';
    end if;

    -- Attempt to recompile the object
    begin
      execute immediate v_sql;
    exception
      -- Catch any exceptions that occur during recompilation
      when others then
        raise;
    end;
  end loop;
end;
/
