--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024-2026 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mlancast:create_view_sert_core.sg_etl_execution_log_v endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
create or replace view sert_core.sg_etl_execution_log_v as
select p.pipeline_id,
       p.job_description as description,
       l.log_id,
       l.start_timestamp,
       l.end_timestamp,
       l.status,
       apex_util.get_since(p_value => l.start_timestamp, p_short => 'N') ago,
       to_char(round(
          extract(day from (l.end_timestamp - l.start_timestamp)) * 86400 +
          extract(hour from (l.end_timestamp - l.start_timestamp)) * 3600 +
          extract(minute from (l.end_timestamp - l.start_timestamp)) * 60 +
          extract(second from (l.end_timestamp - l.start_timestamp)),
          3), 'fm999999999990.000') duration_in_seconds,
       l.error_message
  from sg_etl_execution_log l
  join sg_etl_pipelines p on (p.pipeline_id = l.pipeline_id)
/
--rollback not required

