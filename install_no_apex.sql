
-- run Liquibase to install/update SERT in standalone mode (no platform)
-- sert base schema must be created so that lb control tables will not be created in ADMIN/SYS schema
-- if it is a PDB, then tablespace DATA must exists

liquibase update -changelog-file product/sert/pre-install/base_schema.sql -database-changelog-table-name sert_databasechangelog -defaults-file sert.properties
-- run liquibase
liquibase update -changelog-file controller.xml -database-changelog-table-name sert_databasechangelog -default-schema-name sert_core -contexts runtime,standalone

-- PROMPT =============================================================================
-- PROMPT == P O S T   I N S T A L L A T I O N   S T E P S
-- PROMPT =============================================================================
-- PROMPT
-- PROMPT In order to be able to launch APEX-SERT, paste the following into the System Message
-- PROMPT region in the INTERNAL workspace:
-- PROMPT
-- PROMPT <span style="font-size: 16px; color: #C74634; font-weight: 700;">SERT</span> </br>
-- PROMPT <a href="javascript:var launchTOWER=window.open('f?p=SERT:101:::::P101_USERNAME,P101_PASSWORD:' + encodeURIComponent(apex.env.APP_USER) + ',' + apex.env.APP_SESSION);"><span class="a-Icon icon-run-page"></span>&nbsp;Launch APEX-SERT</a>
-- PROMPT
-- PROMPT  To access the APEX-SERT Admin application, enter the following URL while
-- PROMPT  substituting HOST, PORT and DAD with those from your APEX environment:
-- PROMPT
-- PROMPT  http(s)://HOST:PORT/DAD/f?p=SERT_ADMIN
-- PROMPT
-- PROMPT  Please see the APEX-SERT Installation Guide for detailed post-installation steps.
-- PROMPT
