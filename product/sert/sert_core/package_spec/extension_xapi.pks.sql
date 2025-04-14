--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset mipotter:create_package_spec_sert_core.extension_xapi stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/

-- ---------------------------------------------------------------------------
--
-- ---------------------------------------------------------------------------
create or replace package sert_core.extension_xapi
AUTHID CURRENT_USER
as

-- ---------------------------------------------------------------------------
-- extension_xapi.allow_hosting( 'SERT');
-- ---------------------------------------------------------------------------
  procedure allow_hosting ( p_workspace in varchar2);

-- ---------------------------------------------------------------------------
--
-- ---------------------------------------------------------------------------
  procedure add_menu_entry (
    p_url in varchar2,
    p_workspace in varchar2,
    p_label in varchar2 default 'APEX SERT',
    p_description in varchar2 default 'APEX SERT Security and standards scanner'
  );

-- ---------------------------------------------------------------------------
--
-- ---------------------------------------------------------------------------
  procedure revoke_extension_workspace(
    p_to_workspace in varchar2 default 'SERT',
    p_from_workspace in varchar2 default null
  );

-- ---------------------------------------------------------------------------
--
-- ---------------------------------------------------------------------------
  procedure grant_extension_workspace (
    p_to_workspace in varchar2 default 'SERT'
  );

  procedure grant_extension_workspace (
    p_to_workspace in varchar2 default 'SERT',
    p_from_workspace in varchar2
  );


end extension_xapi;
/
--rollback not required
