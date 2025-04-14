--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_spec_sert_core.sert_util stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.sert_util
as

  procedure set_build_option(
    p_application_id    in number,
    p_build_option_name in varchar2,
    p_build_status      in varchar2 default apex_application_admin.c_build_option_status_include
    );

  procedure set_build_option(
    p_workspace      in varchar2,
    p_application_alias in varchar2,
    p_build_option_name in varchar2,
    p_build_status in varchar2 default apex_application_admin.c_build_option_status_include
    );

end sert_util;
/
--rollback not required

