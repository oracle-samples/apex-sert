--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:post_install_setup_extension_grant_job endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
declare
  l_frequency varchar2(10)  := upper(nvl('${builder_extension_job_frequency}', 'MINUTELY'));
  l_interval  varchar2(3)   := nvl('${builder_extension_job_interval}', '10');
  l_repeat_interval varchar2(100);
begin
  if '${builder_extension_job}' = 'active' then
    -- Validate frequency; default to MINUTELY if invalid
    if l_frequency not in ('MINUTELY', 'HOURLY', 'DAILY') then
      l_frequency := 'MINUTELY';
    end if;

    -- Validate interval (1-99); use type-specific default if invalid
    if not regexp_like(l_interval, '^\d{1,2}$') or
       to_number(l_interval) < 1 or to_number(l_interval) > 99 then
      case l_frequency
        when 'MINUTELY' then l_interval := '10';
        when 'HOURLY'   then l_interval := '1';
        when 'DAILY'    then l_interval := '1';
      end case;
    end if;

    -- Build repeat_interval for DBMS_Scheduler
    l_repeat_interval := 'FREQ=' || l_frequency || ';INTERVAL=' || l_interval;

    sert_core.extension_xapi.create_extension_grant_job(
      p_to_workspace    => upper('${sert_apex_workspace}'),
      p_repeat_interval => l_repeat_interval
    );
  end if;
end;
/
--rollback not required
