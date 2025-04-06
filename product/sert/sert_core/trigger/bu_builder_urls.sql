--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_trigger_bu_builder_urls_1721802506338 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace trigger bu_builder_urls before
	update on sert_core.builder_urls
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
