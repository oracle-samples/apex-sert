--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:prerequisite_sert_app_id endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
declare
  l_app_id  number := to_number(coalesce('${sert_app_id}',0));
  -- l_app_id  number := to_number(coalesce(2101,0));
  l_workspace apex_applications.workspace%type;
  l_alias apex_applications.alias%type;
  l_proceed boolean := false;
begin

  if l_app_id > 0 then
    -- we need to check availability
    begin
      select workspace,alias
      into l_workspace,l_alias
      from apex_applications
      where application_id = l_app_id
      and (workspace <> upper('${sert_apex_workspace}') or alias <> 'APEX_SERT');
      -- if we actually find a record it's a problem
      raise_application_error(-20001, 'Pre-Install error: your intended APEX_SERT application ID is not available App:'||l_app_id||' ('|| l_alias || ') Workpace:'||l_workspace );
    exception
      when NO_DATA_FOUND then
        -- we are good, actually!
        null;
    --   when others then
    --     raise;
    end;
  end if;
end;
/
--rollback not required

--changeset mipotter:prerequisite_sert_admin_app_id endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
declare
  l_app_id  number := to_number(coalesce('${sert_admin_id}',0));
  -- l_app_id  number := to_number(coalesce(2101,0));
  l_workspace apex_applications.workspace%type;
  l_alias apex_applications.alias%type;
  l_proceed boolean := false;
begin

  if l_app_id > 0 then
    -- we need to check availability
    begin
      select workspace,alias
      into l_workspace,l_alias
      from apex_applications
      where application_id = l_app_id
      and (workspace <> upper('${sert_apex_workspace}') or alias <> 'APEX_SERT_ADMIN');
      -- if we actually find a record it's a problem
      raise_application_error(-20001, 'Pre-Install error: your intended APEX_SERT application ID is not available App:'||l_app_id||' ('|| l_alias || ') Workpace:'||l_workspace );
    exception
      when NO_DATA_FOUND then
        -- we are good, actually!
        null;
      when others then
        raise;
    end;
  end if;
end;
/
--rollback not required
