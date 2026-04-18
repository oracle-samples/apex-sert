set feedback     off
set define       off
set linesize     300
set pagesize     1000
set serveroutput on size unlimited
set sqlformat    default
set termout      on
set timing       on
set verify       off

@install_no_apex.sql

PRO RUN NONPROD SCRIPTS
liquibase update -changelog-file nonprod/nonProdController.xml -database-changelog-table-name sert_databasechangelog -default-schema-name sert_core -contexts runtime,standalone
