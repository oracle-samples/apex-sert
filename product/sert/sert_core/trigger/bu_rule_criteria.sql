--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_trigger_bu_rule_criteria_1721802550561 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace trigger bu_rule_criteria before
	update on sert_core.rule_criteria
	for each row
begin
	:new.updated_by := coalesce(
	                           sys_context(
	                                      'APEX$SESSION',
	                                      'APP_USER'
	                           ),
	                           user
	                   );
	:new.updated_on := systimestamp;
end;
/
--rollback not required
