--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:post_install_setup_extension_grant_job endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
begin
  if '${builder_extension_job}' = 'active' then
    sert_core.extension_xapi.create_extension_grant_job(
      p_to_workspace => upper('${sert_apex_workspace}')
    );
  end if;
end;
/
--rollback not required
