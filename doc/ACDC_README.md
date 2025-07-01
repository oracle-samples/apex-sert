# ACDC-SETUP

Creates the ACDC user for instsalling APEX-SERT.
Because APEX-SERT is installed via liquibase in SQLCL, you cannot use the
SYS schema for installations.
The ACDC schema provides all the privileges necessary to install APEX-SERT.
You may name the schema as you wish, and we strongly recommend disabling teh account after installation.

[Script descriptions](#script-descriptions)

[Modifying ACDC roles and privileges](#modifying-acdc-roles-and-privileges)

[Too much info, just install the thing!](#installation)

## Script descriptions

The driver script for managing the ACDC schema is `create_acdc_schema.sql`. This script takes takes 3 arguments:

* Schema name
* Schema password
* Schema data tablespace name

Running the above script will automatically call the following children scipts (in this provided order):

* `schema_grants.sql`: Grants privileges to ACDC schema
* `schema_revokes.sql`: Revokes privileges from ACDC schema. Follows the same collection convention as `schema_grants.sql` (see below).
* `schema_additional_setup.sql`: Additional roles for ACDC; creation/management of revision history

## Modifying ACDC roles and privileges
The `schema_grants.sql` script contains a list of the roles and privileges that are granted to ACDC. To add or modify the roles/privileges provided to ACDC, simply add them to the appropriate collection.

The `schema_revokes.sql` script is run after the `schema_grants.sql` script. To avoid confusion, if a role/privilege is to be removed from the from the ACDC user, it should be removed from `schema_grants.sql` script and added to `schema_revokes.sql`

Below is a list of the collections used to specify the roles and privileges and how to modify them.

***NOTE***: Each collection is ordered by the role/privilege name so that it is easy for developer to identify and find what is already being granted to ACDC. Please continue to enforce this.

### l_roles

This is a collection of the roles that will be provided to ACDC. The collection is made of objects with the following attributes:

* Role name
* Can ACDC grant the role to other users

### l_tab_privs

This is a collection of the table privileges that will be provided to ACDC. The collection is made of objects with the following attributes:

* Object owner
* Object name
* Privilege type (read, select, insert, execute, etc.)
* Can ACDC grant the table privilege to other users
* Is the privilege for a directory object

### l_sys_privs

This is a collection of the system privileges that will be provided to ACDC. The collection is made of objects with the following attributes:

* System privilege name
* Can ACDC grant the system privilege to other users

## Installation

1. Unpack it
1. Connect to the target database as ADMIN (ADB) or SYS (PDB)
1. Execute `@create_acdc_schema.sql acdc <acdc password> <acdc tablespace>`

Notes:

* The values of `<acdc password>` and `<acdc tablespace>` are only relevant for new installations, but the script expects them on every run. For systems where ACDC is already installed, you do not need to supply valid values for these parameters
* On ADB, the value for `<acdc tablespace>` should always be DATA (or data, we're not _that_ picky)
* Since you're using the packaged scripts, the value for ACDC_RELEASE will already be set, and the database will be updated accordingly.
