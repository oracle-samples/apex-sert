--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_view_sert_core.sg_last_completed_main_etl_v endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
create or replace view sert_core.sg_last_completed_main_etl_v as
select l.*,
       initcap(to_char( l.start_timestamp at time zone sessiontimezone, 'YYYY-MM-DD HH24:MI:SS TZR')) || ', ' ||
       apex_util.get_since(l.start_timestamp) last_sync,
       to_char(round(
          extract(day from (l.end_timestamp - l.start_timestamp)) * 86400 +
          extract(hour from (l.end_timestamp - l.start_timestamp)) * 3600 +
          extract(minute from (l.end_timestamp - l.start_timestamp)) * 60 +
          extract(second from (l.end_timestamp - l.start_timestamp)),
          3), 'fm999999999990.000') duration_in_seconds
  from sg_etl_execution_log l
 where l.pipeline_id = 1
   and l.status = 'COMPLETED'
 order by l.start_timestamp desc
 fetch first 1 rows only
/
--rollback not required
