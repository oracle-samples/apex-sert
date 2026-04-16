# Installing utPLSQL into a Custom Schema

These steps install utPLSQL into a schema named `unit_test`. All scripts are in the `source/` directory of the utPLSQL release zip. Download the latest release from the [utPLSQL GitHub releases page](https://github.com/utPLSQL/utPLSQL/releases).

## 1. Create the Schema

Run as SYSDBA from the `source/` directory:

```sql
sqlplus sys/<password>@<database> as sysdba @create_utPLSQL_owner.sql unit_test <password> users
```

Parameters: schema name, schema password, tablespace (e.g. `users`).

## 2. Install the Framework

```sql
sqlplus <admin_user>/<password>@<database> @install.sql unit_test
```

## 3. Install the DDL Trigger (Recommended)

Enables compile-time annotation parsing. Requires `ADMINISTER DATABASE TRIGGER` privilege or SYSDBA:

```sql
sqlplus <admin_user>/<password>@<database> @install_ddl_trigger.sql unit_test
```

## 4. Grant Public Access (Optional)

Allows all database users to call utPLSQL without the schema prefix:

```sql
sqlplus <admin_user>/<password>@<database> @create_synonyms_and_grants_for_public.sql unit_test
```

## 5. Verify the Installation

```sql
select substr(ut.version(), 1, 60) as ut_version from dual;
```
