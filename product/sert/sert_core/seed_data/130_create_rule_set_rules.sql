--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mzimon:create_rule_set_rules_24_1 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
begin
    sert_core.data_api.create_rule_set_rules (
        p_rule_set_key => 'SERT-2024',
        p_apex_version => 24.1
    );
end;
/
--rollback not required
--changeset mipotter:create_rule_set_rules_24_2 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
begin
    sert_core.data_api.create_rule_set_rules (
        p_rule_set_key => 'SERT-2024',
        p_apex_version => 24.2
    );
end;
/
--rollback not required
--changeset mipotter:create_rule_set_rules_security endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
begin
    sert_core.data_api.create_rule_set_rules (
        p_rule_set_key => 'SERT-SECURITY',
        p_apex_version => 24.1
    );
    sert_core.data_api.create_rule_set_rules (
        p_rule_set_key => 'SERT-SECURITY',
        p_apex_version => 24.2
    );
end;
/
--rollback not required
