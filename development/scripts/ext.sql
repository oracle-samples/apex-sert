--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:tst_set_workspace_parameter_ALLOW_HOSTING_EXTENSIONS endDelimiter:/ runOnChange:true runAlways:true rollbackEndDelimiter:/
begin
  sert_core.extension_xapi.allow_hosting( '${sert_apex_workspace}');
end;
/
--changeset mipotter:tst_setup_builder_extension_add_menu_entry endDelimiter:/ runOnChange:true runAlways:true rollbackEndDelimiter:/
begin
  sert_core.extension_xapi.add_menu_entry (
    p_url => 'r/${sert_apex_workspace}/apex_sert/home?session='||chr(38)||'APP_SESSION_ID.'||chr(38)||'P1_BUILDER_SESSION_ID='||chr(38)||'APP_SESSION_ID.',
    p_workspace =>'${sert_apex_workspace}',
    p_label => 'SERT 2.0'
  );
end;
/
--rollback not required
-- begin
--   sert_core.extension_xapi.add_menu_entry (
--     p_url => 'r/SERT/apex_sert/home?session='||chr(38)||'APP_SESSION_ID.'||chr(38)||'P1_BUILDER_SESSION_ID='||chr(38)||'APP_SESSION_ID.',
--     p_workspace =>'SERT',
--     p_label => 'SERT 2.0'
--   );
-- end;
-- /

--changeset mipotter:tst_setup_builder_extension_grants endDelimiter:/ runOnChange:true runAlways:true rollbackEndDelimiter:/
-- this can be enabled AFTER workspace parameter ALLOW_HOSTING_EXTENSIONS is set ( no automated until patch 24.1.2)
BEGIN
  sert_core.extension_xapi.grant_extension_workspace ( p_to_workspace =>'${sert_apex_workspace}' );
end;
/
--rollback not required
