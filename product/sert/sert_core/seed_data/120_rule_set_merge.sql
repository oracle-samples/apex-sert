--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset mzimon:rule_set_types_merge-24-1 runOnChange:true runAlways:false
merge into sert_core.rule_sets rs
using ( select 'SERT-SECURITY' rule_set_key,24.1 apex_version from dual ) sr
   on ( sr.rule_set_key = rs.rule_set_key and sr.apex_version = rs.apex_version)
 when not matched then
   insert (rule_set_type_id, rule_set_name, rule_set_key,apex_version,active_yn,internal_yn,description)
   values (1,'SECURITY','SERT-SECURITY',24.1,'Y','N',NULL)
;
--rollback not required

--changeset sert:rule_set_types_merge-24-2 runOnChange:true runAlways:false
merge into sert_core.rule_sets rs
using ( select 'SERT-SECURITY' rule_set_key,24.2 apex_version from dual ) sr
   on ( sr.rule_set_key = rs.rule_set_key and sr.apex_version = rs.apex_version)
 when not matched then
   insert (rule_set_type_id, rule_set_name, rule_set_key,apex_version,active_yn,internal_yn,description)
   values (1,'SECURITY','SERT-SECURITY',24.2,'Y','N',NULL)
;
--rollback not required

--changeset sert:rule_set_types_merge-25-1 runOnChange:true runAlways:false
merge into sert_core.rule_sets rs
using ( select 'SERT-SECURITY' rule_set_key,25.1 apex_version from dual ) sr
   on ( sr.rule_set_key = rs.rule_set_key and sr.apex_version = rs.apex_version)
 when not matched then
   insert (rule_set_type_id, rule_set_name, rule_set_key,apex_version,active_yn,internal_yn,description)
   values (1,'SECURITY','SERT-SECURITY',25.1,'Y','N',NULL)
;
--rollback not required
