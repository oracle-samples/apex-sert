	-- Load exceptions file f1266.json
  set define off
	declare
		l_exception_clob clob;
		l_exception_blob blob;
	begin
		l_exception_clob := apex_string.join_clob(apex_t_varchar2(
			'[',
			'  {',
			'    "ruleSetKey" : "SERT-SECURITY",',
			'    "ruleKey" : "BROWSER_CACHE",',
			'    "apexVersion" : 24.2,',
			'    "exception" : "what's an apostrophe in an exception worth?",',
			'    "workspaceId" : 32049826282261068,',
			'    "applicationId" : 1266,',
			'    "pageId" : 1,',
			'    "componentId" : null,',
			'    "columnName" : null,',
			'    "itemName" : null,',
			'    "sharedCompName" : null,',
			'    "result" : "PENDING",',
			'    "reason" : null,',
			'    "currentValue" : "Application Default (page) / Enabled (app)",',
			'    "createdBy" : "MICHAEL.POTTER@ORACLE.COM",',
			'    "createdOn" : "2025-05-16T10:44:10.832363+10:00",',
			'    "updatedBy" : null,',
			'    "updatedOn" : null,',
			'    "actionedBy" : null,',
			'    "actionedOn" : null,',
			'    "componentName" : null,',
			'    "checksum" : 2229650267',
			'  },',
			'  {',
			'    "ruleSetKey" : "SERT-SECURITY",',
			'    "ruleKey" : "BROWSER_CACHE",',
			'    "apexVersion" : 24.2,',
			'    "exception" : "what's an apostrophe in an exception worth?",',
			'    "workspaceId" : 32049826282261068,',
			'    "applicationId" : 1266,',
			'    "pageId" : 405,',
			'    "componentId" : null,',
			'    "columnName" : null,',
			'    "itemName" : null,',
			'    "sharedCompName" : null,',
			'    "result" : "PENDING",',
			'    "reason" : null,',
			'    "currentValue" : "Application Default (page) / Enabled (app)",',
			'    "createdBy" : "MICHAEL.POTTER@ORACLE.COM",',
			'    "createdOn" : "2025-05-16T10:44:10.858156+10:00",',
			'    "updatedBy" : null,',
			'    "updatedOn" : null,',
			'    "actionedBy" : null,',
			'    "actionedOn" : null,',
			'    "componentName" : null,',
			'    "checksum" : 3435852631',
			'  }',
			']'		));
		l_exception_blob := apex_util.clob_to_blob(l_exception_clob);
	sert_core.exceptions_api.process_exceptions (p_json_export_file => l_exception_blob);
	end;

end;
/
PRO SERT exception count after upload
select count(1) from sert_core.exceptions;
exit
