--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_trigger_bu_exceptions_1721802530640 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace trigger bu_exceptions before
	update on sert_core.exceptions
	for each row
begin
	if :new.updated_by is null then
		:new.updated_by := coalesce(
		                           sys_context(
		                                      'APEX$SESSION',
		                                      'APP_USER'
		                           ),
		                           user
		                   );
	end if;
	if :new.updated_on is null then
		:new.updated_on := systimestamp;
	end if;
end;
/
--rollback not required
