write a bash script to export an APEX application using sqlcl via a presaved VSCODE sql developer connection .
the connection name should be stored in an environment_variable $SQLC_CONN
the existing files should be removed prior to export, this is to ensure that deleted application components in the APEX export are indeed removed from source.
test the sqlcl connection before any destructive steps if the sql connection fails, abort the execution safely
apex_config.json must be used to determine specific details of the export. it contains a json array, 
this array defines where sqlcl should extract split APEX exports.
if a record contains id-lo, id-hi, they define a bounded range of application IDS, for which the path to 
extract to and the controller path is defined for all application IDs between id-lo and id-hi.
Alternatively, a record containing "id" defines the paths to use for that single application ID.
the record set with id = default defines default values to be used for any application where 
the value is not already defined.
if preserveInstallXML = true, then the install.sql inside the fnnnn/install.xml MUST be backed up and 
restored after the export is completed, the existing install.xml must be preserved

extract_to_path should be used as a value for the -dir argument
example (incomplete) command in sqlcl :
```
liquibase generate-apex-object -applicationid 2100 -split -skipexportdate -exporiginalids -ovf -dir prod
```
audittype should be null (no names in export)
-exporiginalids is required

reference: 
```
API parameters for generate-apex-object
liquibase generate-apex-object
Generates the changeset for an APEX object

Usage:
  liquibase|lb  generate-apex-object|geao {OPTIONS}

Options:
  -applicationid|-api <applicationid> {INTEGER}   ID for application to be exported

  -audittype|-auty <audittype> {DATES_ONLY|NAMES_AND_DATES|NULL} (NULL)
  Specifies the detail of audit information to include: 
  * NULL: export will not include any audit information 
  * NAMES_AND_DATES: export will include created on, created by, updated on, updated by values if they exist.
  * DATES_ONLY: export will include created on and updated on values if they exist. Usernames will not be included.

  -changesby|-chb <changesby>
  Expects string parameter. Limit -list values to changes by the given user

  -changessince|-chs <changessince> {yyyy-MM-dd}
  Expects date parameter (yyyy-mm-dd). Limit -list values to changes since the given date

  -contexts|-co <contexts>
  Context string to use for filtering which changes to operate on

  -debug|-de
  Enable Debug output

  -deploymentsystem|-desy <deploymentsystem>
  Deployment system for exported feedback

  -dir|-di <dir> {PATH}
  Save all files in the given directory, e.g. -dir some/sub/directory

  -expaclassignments|-exacl
  Export ACL User Role Assignments

  -expcomments|-exco
  Export developer comments

  -expcomponents|-exc <expcomponents>
  Export application components. Parameters must be of form TYPE:ID, multiple values must be quoted "TYPE:ID TYPE:ID" 

  -expfeedback|-exfe
  Export team development feedback for all workspaces or identified by -workspaceid

  -expfeedbacksince|-exfs <expfeedbacksince> {yyyy-MM-dd}
  Export team development feedback since date in the format YYYYMMDD

  -expfiles|-exfi
  Export all workspace files identified by -workspaceid

  -expirnotif|-exir
  Export all interactive report notifications

  -expminimal|-exmi
  Only export workspace definition, users, and groups

  -expnosubscriptions|-exns
  Do not export references to subscribed components

  -exporiginalids|-exoi
  Export will emit ids as they were when the application was imported

  -exppubreports|-exre
  Export all user saved public interactive reports

  -expsavedreports|-exsr
  Export all user saved interactive reports

  -expsupportingobjects|-exso <expsupportingobjects> {I|N|Y} (Y)
  Pass (Y)es, (N)o or (I)nstall to override the default

  -expteamdevdata|-exte
  Export team development data for all workspaces or identified by -workspaceid

  -exptranslations|-extr
  Export the translation mappings and all text from the translation repository

  -exptype|-exty <exptype> {APPLICATION_SOURCE|CHECKSUM-SH1|CHECKSUM-SH256|EMBEDDED_CODE|READABLE_JSON|READABLE_YAML,...} (APPLICATION_SOURCE)
  Comma delimited list of export types to perform:
  * APPLICATION_SOURCE: export an APEX application using other parameters passed.
  * EMBEDDED_CODE: Export code such as SQL, PL/SQL and Javascript. APEX ignores all other options when EMBEDDED_CODE is selected.
  * CHECKSUM-SH1: Export a SHA1 checksum that is independent of IDs and can be compared across instances and workspaces.
  * CHECKSUM-SH256: Export an SHA-256 checksum that is independent of IDs and can be compared across instances and workspaces.
  * READABLE_JSON: Export a readable version of the application meta-data in JSON format.
  * READABLE_YAML: Export a readable version of the application meta-data in YAML format.

  -expworkspace|-exwo
  Export workspace identified by -workspaceid or all workspaces if -workspaceid not specified

  -fail-on-error|-foe <fail-on-error> (true)
  Sets the failOnError true/false attribute in the changeset. 
  When true execution of the changeset will stop if changelog fails.
  Default value is true when not specified. 

  -instance|-in
  Export all applications

  -labels|-la <labels>
  Label expression to use for filtering which changes to operate on

  -list|-li
  Lists applications installed in the database

  -log|-lo
  Enable Logging
  Standard logging is INFO level (no debug flag)
  Debug logging is FINEST level (both log and debug flag)

  -overwrite-files|-ovf
  Overwrite any existing files in directory. This will not affect other files.

  -runalways|-ra
  Set runAlways attribute to true/false in changelog, when true the changelog will always run

  -skipexportdate|-sked
  Skip export date in application export files

  -split|-sp
  This will make the export split the files into directories based on the object types.

  -workspaceid|-woi <workspaceid> {INTEGER}
  Workspace ID for which all applications to be exported or the workspace to be exported
  ```
  - after the export, SHA256 checksums are calculated for each file, and then inserted to the top of file
an OVERALL app_checksum ( a checksum of all the file checksums) is calculated FIRST, and this use for the app_checksum piece. each .sql file shall have an app_checksum along with the specific file_checksum at top of file.
example
```
prompt app_checksum: 2DE9A600B35DA758AB5065B23A022765E1A26789CE4DD1077A96B8C82547917F
-- file_checksum: 69675E02B08AC671E28D68A4D1F1F1B123D5D3D50AA96339B7F93583593DE52B

 a file named apex_install.xml is created in the application directory at the same level as the fnnn directory. this should be removed at the end of the script.
 