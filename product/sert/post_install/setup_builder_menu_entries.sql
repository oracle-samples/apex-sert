--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:post_install_builder_remove_apex_sert_menu_entry endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
begin
  -- this is an old style
  apex_extension.remove_menu_entry(p_label => 'APEX SERT',p_workspace => upper('${sert_apex_workspace}'));
end;
/
--rollback not required

--changeset mipotter:post_install_builder_add_menu_entry endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
-- doc link https://docs.oracle.com/en/database/oracle/apex/24.1/aeapi/APEX_EXTENSION.ADD_MENU_ENTRY-Procedure.html#GUID-3F5696AC-5BCE-4915-9169-8F45D60ED28C
begin

  apex_extension.remove_menu_entry(p_label => 'Evaluations',p_workspace => upper('${sert_apex_workspace}'));
  APEX_EXTENSION.ADD_MENU_ENTRY (
    p_label            => 'Evaluations',
    p_url              => 'r/${sert_apex_workspace}/apex_sert/home?session='||chr(38)||'APP_SESSION_ID.'||chr(38)||'P1_BUILDER_SESSION_ID='||chr(38)||'APP_SESSION_ID.',

    p_display_sequence => 10,
    p_description      => 'APEX SERT Security and standards scanner',
    p_is_public        => true,
    p_workspace        =>upper('${sert_apex_workspace}')
  );
end;
/
--rollback not required

--changeset mipotter:post_install_setup_builder_extension_grants endDelimiter:/ runOnChange:true runAlways:true rollbackEndDelimiter:/
-- this can be enabled AFTER workspace parameter ALLOW_HOSTING_EXTENSIONS is set ( no automated until patch 24.1.2)
BEGIN
  sert_core.extension_xapi.grant_extension_workspace ( p_to_workspace =>'${sert_apex_workspace}' );
end;
/
--rollback not required
