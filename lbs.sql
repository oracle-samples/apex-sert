
-- run Liquibase to check sattus SERT in standalone mode (no platform)
-- sert base schema must be created so that lb control tables will not be created in ADMIN/SYS schema
-- if it is a PDB, then tablespace DATA must exists
-- this script is only useful during development and SERT must have beein initially installed

-- run liquibase
liquibase status -changelog-file controller.xml -database-changelog-table-name sert_databasechangelog -default-schema-name sert_core -contexts runtime,standalone
