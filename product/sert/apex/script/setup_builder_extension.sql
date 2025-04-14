--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:setup_builder_extension_add_menu_entry endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
-- doc link https://docs.oracle.com/en/database/oracle/apex/24.1/aeapi/APEX_EXTENSION.ADD_MENU_ENTRY-Procedure.html#GUID-3F5696AC-5BCE-4915-9169-8F45D60ED28C
begin
  apex_instance_admin.set_workspace_parameter(upper('${sert_apex_workspace}'),'ALLOW_HOSTING_EXTENSIONS', 'Y');
end;
/
--rollback not required
