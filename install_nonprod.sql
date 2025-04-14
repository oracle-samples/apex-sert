@install_prod.sql

PRO RUN NONPROD SCRIPTS
liquibase update -changelog-file nonprod/nonProdController.xml -database-changelog-table-name sert_databasechangelog -default-schema-name sert_core -contexts runtime,standalone,apex
