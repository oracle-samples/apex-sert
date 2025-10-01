--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset mlancast:data_api_create_spec stripComments:false endDelimiter:/ runOnChange:true
create or replace package sert_core.data_api authid definer as

g_import apex_t_varchar2 := apex_t_varchar2();

function hex_to_blob (
    p_import in apex_t_varchar2 )
    return blob;

--==============================================================================
-- Function export_rules_script
--==============================================================================
-- Exports the rules as separate code blocks calling the import_rule procedure.
--==============================================================================
function export_rules_script
return clob;

procedure apex_download_rules_script;

procedure import_rule (
    p_rule_name              in varchar2,
    p_rule_key               in varchar2,
    p_category_name          in varchar2,
    p_category_key           in varchar2,
    p_risk_code              in varchar2,
    p_risk_name              in varchar2,
    p_apex_version           in varchar2,
    p_help_url               in varchar2,
    p_builder_url_key        in varchar2,
    p_impact                 in varchar2,
    p_active_yn              in varchar2,
    p_internal_yn            in varchar2,
    p_rule_type              in varchar2,
    p_view_name              in varchar2,
    p_column_to_evaluate     in varchar2,
    p_component_id           in varchar2,
    p_component_name         in varchar2,
    p_column_name            in varchar2,
    p_item_name              in varchar2,
    p_shared_comp_name       in varchar2,
    p_operand                in varchar2,
    p_val_char               in varchar2,
    p_val_number             in number,
    p_case_sensitive_yn      in varchar2,
    p_rule_criteria_type_key in varchar2,
    p_additional_where       in varchar2,
    p_custom_query           in varchar2,
    p_info                   in clob,
    p_fix                    in clob,
    p_time_to_fix            in number,
    p_valid_exceptions       in varchar2,
    p_rule_severity_name     in varchar2,
    p_rule_severity_key      in varchar2,
    p_description            in varchar2,
    p_created_by             in varchar2 default 'SERT_CORE',
    p_created_on             in timestamp with time zone default systimestamp,
    p_updated_by             in varchar2  default 'SERT_CORE',
    p_updated_on             in timestamp with time zone  default systimestamp);


--==============================================================================
-- Function export_rules_hex_script
--==============================================================================
-- Exports rules as JSON data, compressed and converted to a hex format for
-- installation using the import_rules procedure.
-- The script file is compact (90% smaller, ~3k KB) and installs faster,
-- compared with export_rules_script. However is not a readable format.
--==============================================================================
function export_rules_hex_script
    return clob;

procedure apex_download_rules_hex_script;

procedure import_rules (
    p_rules in blob );

procedure create_rule_set_rules (
    p_rule_set_key in sert_core.rule_sets.rule_set_key%type,
    p_apex_version in sert_core.rule_sets.apex_version%type
    );

end data_api;
/
--rollback drop package sert_core.data_api;
