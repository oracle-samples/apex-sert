# acdc-setup
Creates the ACDC user for instsalling APEX-SERT.
Because APEX-SERT is installed via liquibase in SQLCL, you cannot use the 
SYS schema for installations.
The ACDC schema provides all the privileges necessary to install APEX-SERT.
You may name the schema as you wish, and we strongly recommend disabling teh account after installation.

[Script descriptions](#script-descriptions)

[Modifying ACDC roles and privileges](#modifying-acdc-roles-and-privileges)

[Packaging and deployment](#packaging-and-deployment)

* [ACDC versioning](#acdc-versioning)
* [Testing](#testing)

[Manual execution](#manual-execution)

## Script descriptions
The driver script for managing the ACDC schema is `create_acdc_schema.sql`. This script takes takes 3 arguments:
 - Schema name
 - Schema password
 - Schema data tablespace name

Running the above script will automatically call the following children scipts (in this provided order):

- `schema_grants.sql`: Grants privileges to ACDC schema
- `schema_revokes.sql`: Revokes privileges from ACDC schema. Follows the same collection convention as `schema_grants.sql` (see below). 
 - `schema_additional_setup.sql`: Additional roles for ACDC; creation/management of revision history

## Modifying ACDC roles and privileges
The `schema_grants.sql` script contains a list of the roles and privileges that are granted to ACDC. To add or modify the roles/privileges provided to ACDC, simply add them to the appropriate collection.

The `schema_revokes.sql` script is run after the `schema_grants.sql` script. To avoid confusion, if a role/privilege is to be removed from the from the ACDC user, it should be removed from `schema_grants.sql` script and added to `schema_revokes.sql`

Below is a list of the collections used to specify the roles and privileges and how to modify them.

***NOTE***: Each collection is ordered by the role/privilege name so that it is easy for developer to identify and find what is already being granted to ACDC. Please continue to enforce this.

### l_roles
This is a collection of the roles that will be provided to ACDC. The collection is made of objects with the following attributes:
 - Role name
 - Can ACDC grant the role to other users

### l_tab_privs
This is a collection of the table privileges that will be provided to ACDC. The collection is made of objects with the following attributes:
 - Object owner
 - Object name
 - Privilege type (read, select, insert, execute, etc.)
 - Can ACDC grant the table privilege to other users
 - Is the privilege for a directory object

### l_sys_privs
This is a collection of the system privileges that will be provided to ACDC. The collection is made of objects with the following attributes:
 - System privilege name
 - Can ACDC grant the system privilege to other users

 ## Packaging and deployment
The scripts in `pipeline_scripts`, along with the stages defined in `.gitlab-ci.yml`, manage the following:

- replacing strings for the ACDC release tag in the schema definition scripts
- packaging (pretentious term for "zipping") of the schema definition scripts
- publishing the resulting zip file to Artifactory

Since ACDC is the schema that drives a lot of our ACE pipeline operations, this pipeline is a little less complex than our others. Useful/important variables can be found in `define_vars.sh`.

### Option 1
Easy mode. 
1. Unpack it
1. Connect to the target database as ADMIN (ADB) or SYS (PDB)
1. Execute `@create_acdc_schema.sql acdc <acdc password> <acdc tablespace>`

Notes:

- The values of `<acdc password>` and `<acdc tablespace>` are only relevant for new installations, but the script expects them on every run. For systems where ACDC is already installed, you do not need to supply valid values for these parameters
- On ADB, the value for `<acdc tablespace>` should always be DATA (or data, we're not _that_ picky)
- Since you're using the packaged scripts, the value for ACDC_RELEASE will already be set, and the database will be updated accordingly.

### Option 2

If you don't have the latest zip file, but you've cloned this repository, you can still run the scripts as described in Option 1. The only thing that would change is the release number in the `acdc.acdc_release_history` table. If you do nothing, the release tag will appear in the target database as `YY.MM.DD_manual`. If you'd prefer to set a different release tag (be careful about this; consider whether future maintainers of the system can find out where you live), you can replace the substitution variable in the SQL scripts as follows:
```
ACDC_RELEASE = your_custom_release_tag
WORK_DIR = <top level directory of cloned repository>
grep -lr __ACDC_RELEASE__ $WORK_DIR | xargs -I% sed -i "s/__ACDC_RELEASE__/${ACDC_RELEASE}/g" % #Caveat: sed will behave differently on a Mac; you'll need to do surgery on this line
sql admin/<admin_password>@your_database @create_acdc_schema.sql acdc <acdc password> <acdc tablespace>
```
### Option 3
Pretend your terminal session is a build pipeline. Hey, dream big.

To run through the build steps manually to generate a zip file, invoke the pipeline scripts in the following sequence.  Note that publishing to artifactory will require you to set the G_ARTIFACTORY_API_KEY environment variable.  If you don't know or can't get that key, you probably should be trying one of the other manual options.

`build_release.sh` will create the zip file with properly-configured schema creation scripts. That's probably all you'll need for a manual run. If you need to push something to Artifactory outside the normal CI/CD pipeline, you can use  `publish_release.sh`; however, please bear in mind that this can have implications for project development pipelines that automatically consume new ACDC builds.

Shorter version: Don't break nothin'.

```
$ read -s G_ARTIFACTORY_API_KEY
<enter value for key>
$ export G_ARTIFACTORY_API_KEY
$ #OPTIONAL export ACDC_RELEASE=<custom_value_for_release_tag>
$ source pipeline-scripts/define_vars.sh
$ pipeline-scripts/build_release.sh
$ #OPTIONAL pipeline-scripts/publish_release.sh
```

