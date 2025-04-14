--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.apex_version_v_1721804374005 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
create or replace view sert_core.apex_version_v
as
select
   substr(VERSION_NO, 1, instr(version_no,'.',1)+1) as apex_version
  ,(select v('G_APEX_VERSION') from dual) as apex_version_item
  ,(select pref_value from prefs where pref_key = 'SERT_APEX_VERSION') as sert_apex_version
from
  apex_release
/
--rollback not required
