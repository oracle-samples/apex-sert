--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_view_sert_core.apex_version_v_1721804374005 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
-- View: sert_core.apex_version_v
-- Purpose: expose APEX version information from the database, the current session item, and the configured target version for comparison/validation.
-- Method: parses apex_release.version_no to major.minor (99.9), selects G_APEX_VERSION via v(), and reads SERT_APEX_VERSION from prefs.

create or replace view sert_core.apex_version_v as
select
  to_number(substr(version_no, 1, instr(version_no, '.', 1) + 1), '99.9') as apex_version
  ,(select to_number(v('G_APEX_VERSION'), '99.9') from dual) as apex_version_item
  ,(select to_number(pref_value, '99.9') from prefs where pref_key = 'SERT_APEX_VERSION') as sert_apex_version
from
  apex_release
/
--rollback not required
