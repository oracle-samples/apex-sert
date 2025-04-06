
-- run Liquibase to install/update SERT in standalone mode (no platform)
-- sert base schema must be created so that lb control tables will not be created in ADMIN/SYS schema
-- if it is a PDB, then tablespace DATA must exists
@install_prod
exit