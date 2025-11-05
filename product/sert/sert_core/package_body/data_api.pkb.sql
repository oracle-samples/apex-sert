--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset mlancast:data_api_create_body stripComments:false endDelimiter:/ runOnChange:true
create or replace package body sert_core.data_api as
-- ==============================================================================
-- Purpose

-- - Implements import/export utilities for SERT rules and related lookup data.
-- - Produces Liquibase-formatted SQL scripts to insert rules via conventional SQL,
--   and an alternative “hex” export that embeds compressed JSON into SQL for bulk import.
-- - Provides helper utilities for safe string/line handling, logging, and rule set maintenance.

-- Key globals and constants
-- - CR, LF, CRLF: newline constants as Unicode sequences.
-- - g_buffer apex_t_varchar2: in-memory buffer for assembling script output.
-- - g_max_param_length pls_integer: width used to align generated parameter names in formatted SQL.
-- - g_log_key, g_log_type: values used by log_pkg for consistent logging context (g_log_type = 'IMPORT').
-- ==============================================================================
  CR   constant varchar2(1) := unistr('\000d');
  LF   constant varchar2(1) := unistr('\000a');
  CRLF constant varchar2(2) := unistr('\000d\000a');

  g_buffer           apex_t_varchar2 := apex_t_varchar2();
  g_max_param_length pls_integer     := 11;
  g_log_key          varchar2(10)    := log_pkg.get_log_key;
  g_log_type         varchar2(100)   := 'IMPORT';

-- ==============================================================================
-- clear_buffer / get_buffer: resets and returns the buffer used to build script output.
-- ==============================================================================
  procedure clear_buffer is
  begin
    g_buffer := apex_t_varchar2();
  end clear_buffer;

  function get_buffer
    return apex_t_varchar2
  is
    l_buf apex_t_varchar2 := g_buffer;
  begin
    clear_buffer;
    return l_buf;
  end get_buffer;

-- ==============================================================================
-- - set_max_param_length(p_length): sets the alignment width for formatting generated SQL parameters.
-- Sets the maximum parameter length for dynamic parameter formatting in buffer output.
-- This influences padding/column width in generated rule scripts.
-- ==============================================================================
  procedure set_max_param_length (
    p_length in pls_integer
  ) is
  begin
    g_max_param_length := p_length;
  end set_max_param_length;

-- ==============================================================================
-- - blob_to_hex(p_blob) return apex_t_varchar2: returns a varray of hexadecimal
--   chunks representing a BLOB (chunk size c_size=100 bytes).
-- ==============================================================================
  function blob_to_hex (
    p_blob in blob
  ) return apex_t_varchar2
  is
    c_size   constant pls_integer := 100;
    l_arr    apex_t_varchar2      := apex_t_varchar2();
    l_offset pls_integer          := 1;
  begin
    -- Oracle implicitly converts RAW or LONG RAW data to character data,
    -- the resulting character value contains a hexadecimal representation of the binary input,
    -- where each character is a hexadecimal digit (0-9, A-F) representing four consecutive bits of RAW data.
    if p_blob is not null then

      for i in 1 .. ceil(sys.dbms_lob.getlength(p_blob) / c_size) loop

        apex_string.push(l_arr, sys.dbms_lob.substr(p_blob, c_size, l_offset));
        l_offset := l_offset + c_size;

      end loop; -- for i in 1 .. ceil(sys.dbms_lob.getlength(p_blob) / c_size)

    end if; -- p_blob is not null
    return l_arr;
  end blob_to_hex;

-- ==============================================================================
-- - enquote(p_str) return varchar2: wraps strings in quotes and escapes embedded quotes,
--   linefeeds, and ampersands (&). Ensures safe embedding in generated SQL.
-- ==============================================================================
  function enquote (p_str in varchar2 default null) return varchar2
  is
  begin
    return case when p_str is null then ''''''
      else
        -- enquote single quotes and linefeeds and escape characters
        ''''||replace(replace(replace(p_str,'''',''''''),
                        unistr('\000a'), '''||unistr(''\000a'')||'||unistr('\000a')||''''),
                        chr(38), '''||chr(38)||''')||
            ''''
    end;
  end enquote;

-- ==============================================================================
-- - push(p_text): appends a line into g_buffer.
-- ==============================================================================
  procedure push (p_text in varchar2 default null) is
  begin
    apex_string.push(g_buffer, p_text);
  end push;

-- ==============================================================================
-- - push_param overloads:

--   - varchar2: handles multi-line values by splitting on LF, emitting apex_string.join(...) to preserve line breaks; aligns name/value; appends optional suffix (default comma).
--   - number: formats numeric or null.
--   - timestamp with time zone: emits a to_timestamp_tz(...) literal or null.
-- ==============================================================================
  procedure push_param (
    p_name   in varchar2,
    p_value  in varchar2,
    p_suffix in varchar2 default ','
  ) is
    l_lines        apex_t_varchar2;
    l_prefix       varchar2(255);
    l_param_length pls_integer := greatest(g_max_param_length, length(p_name));
  begin
    if instr(p_value, LF) > 0 then

      l_lines := apex_string.split(replace(p_value, CR, null));
      l_prefix := rpad(' ', 12);

      push(apex_string.format('        p_%0 => %1', rpad(p_name, l_param_length), 'apex_string.join(apex_t_varchar2('));
      for i in 1 .. l_lines.count loop

        push(l_prefix || enquote(l_lines(i)) || case when i < l_lines.count then ',' else '))' || p_suffix end);

      end loop; -- for i in 1 .. l_lines.count

    else
      push(apex_string.format('        p_%0 => %1%2', rpad(p_name, l_param_length), enquote(p_value), p_suffix));
    end if; -- instr(p_value, LF) > 0
  end push_param;

  procedure push_param (
    p_name   in varchar2,
    p_value  in number,
    p_suffix in varchar2 default ','
  ) is
    l_param_length pls_integer := greatest(g_max_param_length, length(p_name));
  begin
    push(apex_string.format(
      '        p_%0 => %1%2',
      rpad(p_name, l_param_length),
      case when p_value is not null then to_char(p_value) else 'null' end,
      p_suffix));
  end push_param;

  procedure push_param_timestamp_tz (
    p_name   in varchar2,
    p_value  in timestamp with time zone,
    p_suffix in varchar2 default ','
  ) is
    l_param_length pls_integer := greatest(g_max_param_length, length(p_name));
  begin
    push(apex_string.format(
      '        p_%0 => %1%2',
      rpad(p_name, l_param_length),
      case when p_value is not null then 'to_timestamp_tz(''' || to_char(p_value, 'YYYYMMDDHH24MISSxFF TZR TZD') || ''',''YYYYMMDDHH24MISSxFF TZR TZD'')' else 'null' end,
      p_suffix));
  end push_param_timestamp_tz;

-- Lookup import helpers (called before/beside rule import)

-- ==============================================================================
-- - import_categories(p_rules BLOB): scans the incoming rules JSON for distinct
--    categories and inserts any missing categories, counting inserts and logging an outcome message.
-- ==============================================================================
  procedure import_categories (p_rules in blob) is
    l_count pls_integer := 0;
  begin
    for c in (
      select category_key, category_name
        from (
          select distinct
                 category_key,
                 category_name
            from json_table(
                   p_rules, '$[*]'
                   columns (
                     category_key  varchar2 path '$.categoryKey',
                     category_name varchar2 path '$.categoryName'
                   )
                 )
        ) x
      where not exists (select null from categories c where c.category_key = x.category_key)
      order by 1
    )
    loop

      l_count := l_count + 1;
      insert into categories (category_name, category_key) values (c.category_name, c.category_key);
      log_pkg.log(p_log_key => g_log_key, p_log => 'Created new Category: ' || c.category_name, p_log_type => g_log_type);

    end loop; -- for c in (select distinct categories)

    if l_count = 0 then

      log_pkg.log(p_log_key => g_log_key, p_log => 'No new Category records created.', p_log_type => g_log_type);

    end if; -- l_count = 0
  end import_categories;

-- ==============================================================================
-- - import_rule_severity(p_rules BLOB): same approach for rule severities.
-- ==============================================================================
  procedure import_rule_severity (p_rules in blob) is
    l_count pls_integer := 0;
  begin
    for c in (
      select rule_severity_key, rule_severity_name
        from (
          select distinct
                 rule_severity_key,
                 rule_severity_name
            from json_table(
                   p_rules, '$[*]'
                   columns (
                     rule_severity_key  varchar2 path '$.ruleSeverityKey',
                     rule_severity_name varchar2 path '$.ruleSeverityName'
                   )
                 )
        ) x
      where not exists (select null from rule_severity rs where rs.rule_severity_key = x.rule_severity_key)
      order by 1
    )
    loop

      l_count := l_count + 1;
      insert into rule_severity (rule_severity_name, rule_severity_key) values (c.rule_severity_name, c.rule_severity_key);
      log_pkg.log(p_log_key => g_log_key, p_log => 'Created new Rule Severity: ' || c.rule_severity_name, p_log_type => g_log_type);

    end loop; -- for c in (select distinct rule_severity)

    if l_count = 0 then

      log_pkg.log(p_log_key => g_log_key, p_log => 'No new Rule Severity records created.', p_log_type => g_log_type);

    end if; -- l_count = 0
  end import_rule_severity;

-- ==================================================================================================
-- Public Procedures
-- ==================================================================================================

-- ==================================================================================================
-- hex_to_blob(p_import apex_t_varchar2) return BLOB:
-- - Reconstitutes a BLOB from a varray of hex strings, writing each chunk via dbms_lob.writeappend.
-- - Frees the temporary LOB on exceptions and re-raises.
-- ==================================================================================================
  function hex_to_blob (
    p_import in apex_t_varchar2
  ) return blob
  is
    l_blob blob;
    l_size number;
  begin
    sys.dbms_lob.createtemporary(l_blob, true, sys.dbms_lob.session);

    for i in 1 .. p_import.count loop

      l_size := length(p_import(i)) / 2;
      sys.dbms_lob.writeappend(l_blob, l_size, hextoraw(p_import(i)));

    end loop; -- for i in 1 .. p_import.count
    return l_blob;
  exception
    when others then
      if sys.dbms_lob.istemporary(lob_loc => l_blob) = 1 then

        sys.dbms_lob.freetemporary(lob_loc => l_blob);

      end if; -- sys.dbms_lob.istemporary(l_blob) = 1
      raise;
  end hex_to_blob;

-- ==============================================================================
-- export_rules_script return CLOB:
-- - Resets buffer and configures alignment.
-- - Iterates rules_v (ordered by apex_version, rule_key).
-- - Emits a Liquibase changeset per rule that calls sert_core.data_api.import_rule(...) with all relevant parameters via push_param.
-- - Returns the final script as CLOB via apex_string.join_clob(get_buffer).
-- ==============================================================================
  function export_rules_script return clob
  is
  begin
    clear_buffer;
    set_max_param_length(p_length => length('rule_criteria_type_key'));

    push('--liquibase formatted sql');
    for c in (
      select *
        from rules_v
      order by apex_version, rule_key
    )
    loop

      push(apex_string.format('--changeset sert:import_sert_rule_%s stripComments:false endDelimiter:/ runOnChange:true', apex_string_util.get_slug(c.rule_key || '-' || c.apex_version)));
      push('begin');
      push('    sert_core.data_api.import_rule(');

      push_param('rule_name',                 c.rule_name);
      push_param('rule_key',                  c.rule_key);
      push_param('category_name',             c.category_name);
      push_param('category_key',              c.category_key);
      push_param('risk_code',                 c.risk_code);
      push_param('risk_name',                 c.risk_name);
      push_param('apex_version',              c.apex_version);
      push_param('help_url',                  c.help_url);
      push_param('builder_url_key',           c.builder_url_key);
      push_param('impact',                    c.impact);
      push_param('active_yn',                 c.active_yn);
      push_param('internal_yn',               c.internal_yn);
      push_param('rule_type',                 c.rule_type);
      push_param('view_name',                 c.view_name);
      push_param('column_to_evaluate',        c.column_to_evaluate);
      push_param('component_id',              c.component_id);
      push_param('component_name',            c.component_name);
      push_param('column_name',               c.column_name);
      push_param('item_name',                 c.item_name);
      push_param('shared_comp_name',          c.shared_comp_name);
      push_param('operand',                   c.operand);
      push_param('val_char',                  c.val_char);
      push_param('val_number',                c.val_number);
      push_param('case_sensitive_yn',         c.case_sensitive_yn);
      push_param('rule_criteria_type_key',    c.rule_criteria_type_key);
      push_param('additional_where',          c.additional_where);
      push_param('custom_query',              c.custom_query);
      push_param('info',                      c.info);
      push_param('fix',                       c.fix);
      push_param('time_to_fix',               c.time_to_fix);
      push_param('valid_exceptions',          c.valid_exceptions);
      push_param('rule_severity_name',        c.rule_severity_name);
      push_param('rule_severity_key',         c.rule_severity_key);
      push_param('description',               c.description, ' );');
      -- push_param('created_by',                c.created_by);
      -- push_param_timestamp_tz('created_on',   c.created_on);
      -- push_param('updated_by',                c.updated_by);
      -- push_param_timestamp_tz('updated_on',   c.updated_on,  ' );');

      push('end;');
      push('/');
      push('--rollback not required');
      push();

    end loop; -- for c in (select * from rules_v)

    return apex_string.join_clob(get_buffer);
  end export_rules_script;

-- ==============================================================================
-- - apex_download_rules_script:
--   - Builds a filename “110_rule_import_.sql”.
--   - Sends export_rules_script to the client via apex_http.download.
-- ==============================================================================
  procedure apex_download_rules_script is
    l_filename varchar2(255);
    l_clob     clob;
  begin
    select replace(apex_string_util.get_slug('110_rule_import_' || sert_apex_version), '-', '_') || '.sql' filename
      into l_filename
      from apex_version_v;

    l_clob := export_rules_script;

    apex_http.download(
      p_clob         => l_clob,
      p_content_type => 'application/sql',
      p_filename     => l_filename);
  end apex_download_rules_script;

-- ==============================================================================
-- - import_rule(... many parameters ...):
--   - Local state: l_cnt (existing rule check), lookup IDs (category, severity, criteria type, builder url, risk).
--
--   - Nested loader procedures:
--     - load_category_id: ensures category exists (creates if missing).
--     - load_rule_severity_id: ensures severity exists (creates if missing).
--     - load_rule_criteria_type_id: optional lookup; if missing, leaves null.
--     - load_builder_url_id: optional lookup; if missing, leaves null.
--     - load_risk_id: optional; uses risk_code if provided; otherwise leaves null.
--
--   - Flow:
--     1. Count existing rules by (rule_key, apex_version).
--     2. Load mandatory lookups (category, severity).
--     3. Load optional lookups (criteria type, builder url, risk).
--     4. If exists: UPDATE rules with provided values; log “Rule NOT created...”; return.
--     5. Else: INSERT into rules; log “Created new Rule: ...”.
--
--   - Error handling: when others => logs “An unhandled error has occured” and re-raises.
-- ==============================================================================
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
    p_updated_by             in varchar2 default 'SERT_CORE',
    p_updated_on             in timestamp with time zone default systimestamp
  ) is
    l_cnt                   number;
    l_category_id           number;
    l_rule_severity_id      number;
    l_rule_criteria_type_id number;
    l_builder_url_id        number;
    l_risk_id               number;

    procedure load_category_id is
    begin
      select category_id into l_category_id from categories where category_key = p_category_key;
    exception
      when no_data_found then
        insert into categories (category_name, category_key)
          values (p_category_name, p_category_key)
          returning category_id into l_category_id;
        log_pkg.log(p_log_key => g_log_key, p_log => 'Created new Category: ' || p_category_name, p_log_type => g_log_type);
    end load_category_id;

    procedure load_rule_severity_id is
    begin
      select rule_severity_id into l_rule_severity_id from rule_severity where rule_severity_key = p_rule_severity_key;
    exception
      when no_data_found then
        insert into rule_severity (rule_severity_name, rule_severity_key)
          values (p_rule_severity_name, p_rule_severity_key)
          returning rule_severity_id into l_rule_severity_id;
        log_pkg.log(p_log_key => g_log_key, p_log => 'Created new Rule Severity: ' || p_rule_severity_name, p_log_type => g_log_type);
    end load_rule_severity_id;

    procedure load_rule_criteria_type_id is
    begin
      select rule_criteria_type_id into l_rule_criteria_type_id from rule_criteria_types where rule_criteria_type_key = p_rule_criteria_type_key;
    exception
      when no_data_found then
        null;
    end load_rule_criteria_type_id;

    procedure load_builder_url_id is
    begin
      select builder_url_id into l_builder_url_id from builder_urls where builder_url_key = p_builder_url_key;
    exception
      when no_data_found then
        null;
    end load_builder_url_id;

    procedure load_risk_id is
    begin
      -- Get the risk; these should not be created on the fly, as they are based on OWASP Top 10
      if p_risk_code is not null then

        select risk_id into l_risk_id from risks where risk_code = p_risk_code;

      end if; -- p_risk_code is not null
    end load_risk_id;

  begin
    -- Determine if the rule key exists; do not insert if so
    select count(*) into l_cnt from rules_v where rule_key = p_rule_key and apex_version = p_apex_version;
    -- Load mandatory lookups
    load_category_id;
    load_rule_severity_id;

    -- Load optional lookups
    load_rule_criteria_type_id;
    load_builder_url_id;
    load_risk_id;

    log_pkg.log(p_log_key => g_log_key, p_log => 'count: ' || l_cnt || ' / ' || p_rule_key || ' / ' || p_apex_version, p_log_type => g_log_type);

    if l_cnt > 0 then

      update rules
         set rule_name             = p_rule_name,
             rule_key              = p_rule_key,
             category_id           = l_category_id,
             risk_id               = l_risk_id,
             apex_version          = p_apex_version,
             help_url              = p_help_url,
             builder_url_id        = l_builder_url_id,
             impact                = p_impact,
             active_yn             = p_active_yn,
             internal_yn           = p_internal_yn,
             rule_type             = p_rule_type,
             view_name             = p_view_name,
             column_to_evaluate    = p_column_to_evaluate,
             component_id          = p_component_id,
             component_name        = p_component_name,
             column_name           = p_column_name,
             item_name             = p_item_name,
             shared_comp_name      = p_shared_comp_name,
             operand               = p_operand,
             val_char              = p_val_char,
             val_number            = p_val_number,
             case_sensitive_yn     = p_case_sensitive_yn,
             rule_criteria_type_id = l_rule_criteria_type_id,
             additional_where      = p_additional_where,
             custom_query          = p_custom_query,
             info                  = p_info,
             fix                   = p_fix,
             time_to_fix           = p_time_to_fix,
             valid_exceptions      = p_valid_exceptions,
             rule_severity_id      = l_rule_severity_id,
             description           = p_description,
             created_by            = p_created_by,
             created_on            = p_created_on,
             updated_by            = p_updated_by,
             updated_on            = p_updated_on
       where rule_key = p_rule_key
         and apex_version = p_apex_version;
      -- rule not uploaded as a rule key with the same name exists
      log_pkg.log(p_log_key => g_log_key, p_log => 'Rule NOT created because it already exists: ' || p_rule_name || ' / ' || p_rule_key, p_log_type => g_log_type);
      return;

    end if; -- l_cnt > 0

    -- all checks cleared - insert the rule
    insert into rules (
      rule_name, rule_key, category_id, risk_id, rule_type, rule_severity_id, impact, apex_version, view_name,
      column_to_evaluate, component_id, component_name, column_name, item_name, shared_comp_name, operand,
      val_char, val_number, case_sensitive_yn, rule_criteria_type_id, additional_where, custom_query, active_yn,
      internal_yn, help_url, builder_url_id, info, fix, time_to_fix, valid_exceptions, description
    ) values (
      p_rule_name, p_rule_key, l_category_id, l_risk_id, p_rule_type, l_rule_severity_id, p_impact, p_apex_version, p_view_name,
      p_column_to_evaluate, p_component_id, p_component_name, p_column_name, p_item_name, p_shared_comp_name, p_operand,
      p_val_char, p_val_number, p_case_sensitive_yn, l_rule_criteria_type_id, p_additional_where, p_custom_query, p_active_yn,
      p_internal_yn, p_help_url, l_builder_url_id, p_info, p_fix, p_time_to_fix, p_valid_exceptions, p_description
    );

    log_pkg.log(p_log_key => g_log_key, p_log => 'Created new Rule: ' || p_rule_name, p_log_type => g_log_type);
  exception
    when others then
      -- handle unanticipated errors
      log_pkg.log(p_log_key => g_log_key, p_log => 'An unhandled error has occured', p_log_type => 'UNHANDLED');
      raise;
  end import_rule;

-- ==============================================================================
-- - export_rules_hex_script return CLOB:
--   - Selects rules_relational_to_json_v.json_doc into CLOB (full rules in JSON).
--   - Compresses with sys.utl_compress.lz_compress and converts to hex via blob_to_hex.
--
--   - Emits a Liquibase changeset that:
--     - Initializes sert_core.data_api.g_import := apex_t_varchar2();
--     - Pushes the hex lines into g_import in chunks (c_max_lines=1500) across multiple blocks to avoid excessively long statements.
--     - Calls import_rules(p_rules => hex_to_blob(g_import)).
--   - Returns the composed script.
--   - Note: The script references a package global variable g_import (apex_t_varchar2) expected to exist in the data_api package specification.
-- ==============================================================================
  function export_rules_hex_script
    return clob
  is
    c_max_lines    constant pls_integer := 1500;
    l_clob         clob;
    l_file_content apex_t_varchar2;
  begin
    clear_buffer;

    select json_doc into l_clob from rules_relational_to_json_v;
    l_file_content := blob_to_hex(p_blob => sys.utl_compress.lz_compress(apex_util.clob_to_blob(l_clob)));

    -- Code block(s) for file content
    push('--liquibase formatted sql');
    push('--changeset sert:sert_rules_import stripComments:false endDelimiter:/ runOnChange:true');
    push('begin');
    push('sert_core.data_api.g_import := apex_t_varchar2();');
    push('apex_string.push(sert_core.data_api.g_import, apex_t_varchar2(');
    for i in 1 .. l_file_content.count loop

      push(case when mod(i, c_max_lines) <> 1 then ',' else ' ' end || enquote(l_file_content(i)));

      if mod(i, c_max_lines) = 0 and i < l_file_content.count then

        push('));');
        push('end;');
        push('/');
        push('begin');
        push('apex_string.push(sert_core.data_api.g_import, apex_t_varchar2(');

      end if; -- mod(i, c_max_lines) = 0 and i < l_file_content.count
    end loop; -- for i in 1 .. l_file_content.count
    push('));');
    push('end;');
    push('/');
    push();

    -- Code block to call import_rules
    push('begin');
    push('    sert_core.data_api.import_rules( p_rules => sert_core.data_api.hex_to_blob(p_import => sert_core.data_api.g_import) );');
    push('end;');
    push('/');
    push();
    push('--rollback not required');

    return apex_string.join_clob(get_buffer);
  end export_rules_hex_script;

-- ==============================================================================
-- - apex_download_rules_hex_script:
--   - Builds filename “115_import_sert_rules_hex_.sql”.
--   - Downloads export_rules_hex_script via apex_http.download.
-- ==============================================================================
  procedure apex_download_rules_hex_script is
    l_filename varchar2(255);
    l_clob     clob;
  begin
    select replace(apex_string_util.get_slug('115_import_sert_rules_hex_' || sert_apex_version), '-', '_') || '.sql' filename
      into l_filename
      from apex_version_v;

    l_clob := export_rules_hex_script;

    apex_http.download(
      p_clob         => l_clob,
      p_content_type => 'application/sql',
      p_filename     => l_filename);
  end apex_download_rules_hex_script;

-- ==============================================================================
-- - import_rules(p_rules BLOB):
--   - Uncompresses p_rules with utl_compress.lz_uncompress.
--   - Ensures mandatory lookups (categories/severity) are present by calling import_categories/import_rule_severity.
--   - Iterates JSON rules via json_table, left-joining to existing tables to resolve IDs:
--     - categories, rule_severity, rules (left join to detect new), rule_criteria_types, builder_urls, risks.
--   - For each rule:
--     - If new (no rule_id): INSERT into rules and log “Created new Rule: …”.
--     - Else: log “Rule NOT created because it already exists: …”.
--   - Logs total new rules count and completion.
--   - Error handling: when others => logs unhandled and re-raises.
-- ==============================================================================
  procedure import_rules (
    p_rules in blob
  ) is
    l_rules blob;
    l_count pls_integer := 0;
  begin
    log_pkg.log(p_log_key => g_log_key, p_log => 'Import Started', p_log_type => g_log_type);

    l_rules := sys.utl_compress.lz_uncompress(p_rules);

    -- Add any new mandatory lookups
    import_categories(p_rules => l_rules);
    import_rule_severity(p_rules => l_rules);

    for c in (
      select r.rule_id,
             j.rule_name,
             j.rule_key,
             c.category_id,
             rsk.risk_id,
             j.rule_type,
             rs.rule_severity_id,
             j.impact,
             j.apex_version,
             j.view_name,
             j.column_to_evaluate,
             j.component_id,
             j.component_name,
             j.column_name,
             j.item_name,
             j.shared_comp_name,
             j.operand,
             j.val_char,
             j.val_number,
             j.case_sensitive_yn,
             rct.rule_criteria_type_id,
             j.additional_where,
             j.custom_query,
             j.active_yn,
             j.internal_yn,
             j.help_url,
             u.builder_url_id,
             j.info,
             j.fix,
             j.time_to_fix,
             j.description
        from json_table(
               l_rules,
               '$[*]'
               columns (
                 rule_name              varchar path '$.ruleName',
                 rule_key               varchar path '$.ruleKey',
                 category_name          varchar path '$.categoryName',
                 category_key           varchar path '$.categoryKey',
                 risk_code              varchar path '$.riskCode',
                 risk_name              varchar path '$.RiskName',
                 apex_version           number  path '$.apexVersion',
                 help_url               varchar path '$.helpUrl',
                 builder_url_key        varchar path '$.builderUrlKey',
                 impact                 varchar path '$.impact',
                 active_yn              varchar path '$.activeYN',
                 internal_yn            varchar path '$.internalYN',
                 rule_type              varchar path '$.ruleType',
                 view_name              varchar path '$.viewName',
                 column_to_evaluate     varchar path '$.columnToEvaluate',
                 component_id           varchar path '$.componentId',
                 component_name         varchar path '$.componentName',
                 column_name            varchar path '$.columnName',
                 item_name              varchar path '$.itemName',
                 shared_comp_name       varchar path '$.sharedCompName',
                 operand                varchar path '$.operand',
                 val_char               varchar path '$.valChar',
                 val_number             number  path '$.valNumber',
                 case_sensitive_yn      varchar path '$.caseSensitiveYN',
                 rule_criteria_type_key varchar path '$.ruleCriteriaTypeKey',
                 additional_where       varchar path '$.additionalWhere',
                 custom_query           varchar path '$.customQuery',
                 info                   varchar path '$.info',
                 fix                    varchar path '$.fix',
                 time_to_fix            varchar path '$.timeToFix',
                 rule_severity_name     varchar path '$.ruleSeverityName',
                 rule_severity_key      varchar path '$.ruleSeverityKey',
                 description            varchar path '$.description',
                 created_by             varchar path '$.createdBy',
                 created_on             date    path '$.createdOn',
                 updated_by             varchar path '$.updatedBy',
                 updated_on             date    path '$.updatedOn'
               )
             ) j,
             categories c,
             rule_severity rs,
             rules r,
             rule_criteria_types rct,
             builder_urls u,
             risks rsk
       where j.category_key = c.category_key
         and j.rule_severity_key = rs.rule_severity_key
         -- Outer join to identify new rules as well as existing rules
         and j.rule_key = r.rule_key (+)
         -- Ignore missing keys
         and j.rule_criteria_type_key = rct.rule_criteria_type_key (+)
         and j.builder_url_key = u.builder_url_key (+)
         and j.risk_code = rsk.risk_code (+)
    )
    loop

      if c.rule_id is null then

        l_count := l_count + 1;
        insert into rules (
          rule_name, rule_key, category_id, risk_id, rule_type, rule_severity_id, impact, apex_version, view_name,
          column_to_evaluate, component_id, component_name, column_name, item_name, shared_comp_name, operand,
          val_char, val_number, case_sensitive_yn, rule_criteria_type_id, additional_where, custom_query, active_yn,
          internal_yn, help_url, builder_url_id, info, fix, time_to_fix, description
        ) values (
          c.rule_name, c.rule_key, c.category_id, c.risk_id, c.rule_type, c.rule_severity_id, c.impact, c.apex_version, c.view_name,
          c.column_to_evaluate, c.component_id, c.component_name, c.column_name, c.item_name, c.shared_comp_name, c.operand,
          c.val_char, c.val_number, c.case_sensitive_yn, c.rule_criteria_type_id, c.additional_where, c.custom_query, c.active_yn,
          c.internal_yn, c.help_url, c.builder_url_id, c.info, c.fix, c.time_to_fix, c.description
        );

        log_pkg.log(p_log_key => g_log_key, p_log => 'Created new Rule: ' || c.rule_name, p_log_type => g_log_type);

      else
        log_pkg.log(p_log_key => g_log_key, p_log => 'Rule NOT created because it already exists: ' || c.rule_name || ' / ' || c.rule_key, p_log_type => g_log_type);
      end if; -- c.rule_id is null

    end loop; -- for c in (json_table(..) join ..)

    log_pkg.log(p_log_key => g_log_key, p_log => 'New Rules created: ' || l_count, p_log_type => g_log_type);
    log_pkg.log(p_log_key => g_log_key, p_log => 'Import Completed', p_log_type => g_log_type);
  exception
    when others then
      -- handle unanticipated errors
      log_pkg.log(p_log_key => g_log_key, p_log => 'An unhandled error has occured', p_log_type => 'UNHANDLED');
      raise;
  end import_rules;


-- ==============================================================================
-- create_rule_set_rules(p_rule_set_key, p_apex_version):
-- - Looks up rule_set_id by key/version.
-- - If found: iterates all rules for that apex_version; for each, checks existence in rule_set_rules and inserts missing links.
-- - Else: logs not created because the rule_set_id does not exist; returns.
-- - Error handling: logs unhandled and re-raises.
-- ==============================================================================
  procedure create_rule_set_rules (
    p_rule_set_key in sert_core.rule_sets.rule_set_key%type,
    p_apex_version in sert_core.rule_sets.apex_version%type
  ) is

    l_rule_set_id sert_core.rule_sets.rule_set_id%type;
    l_found       varchar2(1);

    cursor c_rule_sets is
      select rule_set_id
        from sert_core.rule_sets
       where rule_set_key = p_rule_set_key
         and apex_version = p_apex_version;

    cursor c_rules (
      p_rule_set_id in sert_core.rule_set_rules.rule_set_id%type,
      p_rule_id     in sert_core.rule_set_rules.rule_id%type
    ) is
      select 'Y'
        from sert_core.rule_set_rules
       where rule_set_id = p_rule_set_id
         and rule_id = p_rule_id;

  begin
    log_pkg.log(p_log => 'New rules for rule set started: ' || p_rule_set_key || '-' || p_apex_version);

    open c_rule_sets;
    fetch c_rule_sets into l_rule_set_id;
    close c_rule_sets;

    if l_rule_set_id is not null then

      for i in (select rule_id from sert_core.rules where apex_version = p_apex_version) loop

        l_found := 'N';
        open c_rules(l_rule_set_id, i.rule_id);
        fetch c_rules into l_found;
        close c_rules;

        if l_found = 'N' then

          insert into sert_core.rule_set_rules (rule_set_id, rule_id)
          values (l_rule_set_id, i.rule_id);

        end if; -- l_found = 'N'

      end loop; -- for i in (select rule_id ..)

    else
      log_pkg.log(p_log_key => g_log_key, p_log => 'Rule set rules NOT created because rule_set_id does not exist: ' || p_rule_set_key || '-' || p_apex_version, p_log_type => g_log_type);
      return;

    end if; -- l_rule_set_id is not null

    log_pkg.log(p_log => 'New rules for rule set completed: ' || p_rule_set_key || '-' || p_apex_version);
  exception
    when others then
      -- handle unanticipated errors
      log_pkg.log(p_log_key => g_log_key, p_log => 'An unhandled error has occured', p_log_type => 'UNHANDLED');
      raise;
  end create_rule_set_rules;

end data_api;
/
--rollback drop package body sert_core.data_api;
