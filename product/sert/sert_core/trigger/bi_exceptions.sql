--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_trigger_bi_exceptions endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace trigger bi_exceptions before
	insert on sert_core.exceptions
	for each row
begin
	if :new.created_by is null then
		:new.created_by := coalesce(
		                           sys_context(
		                                      'APEX$SESSION',
		                                      'APP_USER'
		                           ),
		                           user
		                   );
	end if;
	if :new.created_on is null then
		:new.created_on := systimestamp;
	end if;
end;
/
--rollback not required
