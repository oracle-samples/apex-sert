--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.rules_pkg_1721803529344 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.rules_pkg
as
  g_log_key varchar2(10) := log_pkg.get_log_key;
  g_log_type varchar2(100) := 'IMPORT';

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: I M P O R T
----------------------------------------------------------------------------------------------------------------------------
-- Imports rules as a JSON file
----------------------------------------------------------------------------------------------------------------------------
procedure import
  (
  p_name in varchar2
  )
is
  l_category_id           categories.category_id%type;
  l_rule_severity_id      rule_severity.rule_severity_id%type;
  l_risk_id               risks.risk_id%type;
  l_rule_criteria_type_id rule_criteria_types.rule_criteria_type_id%type;
  l_builder_url_id        builder_urls.builder_url_id%type;
  l_cnt                   number;
begin

-- set the log_key
apex_util.set_session_state('G_LOG_KEY', g_log_key);

log_pkg.log(p_log_key => g_log_key, p_log => 'Import Started', p_log_type => g_log_type);

-- create a collection to store the parsed JSON file
apex_collection.create_or_truncate_collection(p_collection_name => 'RULES');

-- loop through the JSON file and add each rule, when able
for x in (select * from rules_json_to_relational_v where name = p_name)
loop
 log_pkg.log(p_log_key => g_log_key, p_log => 'Start process for rule_key: '||x.rule_key||' version:'||x.apex_version);
 -- determine if the rule key exists; do not insert if so
  select count(*) into l_cnt from rules_v r where r.rule_key = x.rule_key and r.apex_version = x.apex_version;

 -- determine if the category exists; create it if not
  begin
    select category_id into l_category_id from categories where category_key = x.category_key;
  exception
    -- category does not exist; create it
    when no_data_found then
      insert into categories (category_name, category_key) values (x.category_name, x.category_key) returning category_id into l_category_id;
      log_pkg.log(p_log_key => g_log_key, p_log => 'Created new Category: ' || x.category_name, p_log_type => g_log_type);
  end;

 -- determine if the rule severity exists; create it if not
  begin
    select rule_severity_id into l_rule_severity_id from rule_severity where rule_severity_key = x.rule_severity_key;
  exception
    -- severity does not exist; create it
    when no_data_found then
      insert into rule_severity (rule_severity_name, rule_severity_key) values (x.rule_severity_name, x.rule_severity_key) returning rule_severity_id into l_rule_severity_id;
      log_pkg.log(p_log_key => g_log_key, p_log => 'Created new Rule Severity: ' || x.rule_severity_name, p_log_type => g_log_type);
  end;

 -- determine the rule criteria type
  begin
    select rule_criteria_type_id into l_rule_criteria_type_id from rule_criteria_types where rule_criteria_type_key = x.rule_criteria_type_key;
  exception
    -- rule criteria type does not exist; ignote
    when no_data_found then
      null;
  end;

 -- determine the builder_url
  begin
    select builder_url_id into l_builder_url_id from builder_urls where builder_url_key = x.builder_url_key;
  exception
    when no_data_found then
      null;
  end;

 -- get the risk; these should not be created on the fly, as they are based on OWASP Top 10
  if x.risk_code is not null then
    select risk_id into l_risk_id from risks where risk_code = x.risk_code;
  end if;

  if l_cnt = 0 then
    log_pkg.log(p_log_key => g_log_key, p_log => 'insert rule_key: '||x.rule_key||' version:'||x.apex_version);

   -- all checks cleared - insert the rule
    insert into rules
      (
       rule_name
      ,rule_key
      ,category_id
      ,risk_id
      ,rule_type
      ,rule_severity_id
      ,impact
      ,apex_version
      ,view_name
      ,column_to_evaluate
      ,component_id
      ,component_name
      ,column_name
      ,item_name
      ,shared_comp_name
      ,operand
      ,val_char
      ,val_number
      ,case_sensitive_yn
      ,rule_criteria_type_id
      ,additional_where
      ,custom_query
      ,active_yn
      ,internal_yn
      ,help_url
      ,builder_url_id
      ,info
      ,fix
      ,time_to_fix
      ,description
      )
    values
      (
       x.rule_name
      ,x.rule_key
      ,l_category_id
      ,l_risk_id
      ,x.rule_type
      ,l_rule_severity_id
      ,x.impact
      ,x.apex_version
      ,x.view_name
      ,x.column_to_evaluate
      ,x.component_id
      ,x.component_name
      ,x.column_name
      ,x.item_name
      ,x.shared_comp_name
      ,x.operand
      ,x.val_char
      ,x.val_number
      ,x.case_sensitive_yn
      ,l_rule_criteria_type_id
      ,x.additional_where
      ,x.custom_query
      ,x.active_yn
      ,x.internal_yn
      ,x.help_url
      ,l_builder_url_id
      ,x.info
      ,x.fix
      ,x.time_to_fix
      ,x.description
      );

    apex_collection.add_member(p_collection_name => 'RULES', p_c001 => 'SUCCESS', p_c002 => null, p_c003 => x.rule_name, p_c004 => x.rule_key, p_c005 => x.category_name, p_c006 => x.risk_code || '-' || x.risk_name);
    log_pkg.log(p_log_key => g_log_key, p_log => 'Created new Rule: ' || x.rule_name, p_log_type => g_log_type);

  else
    log_pkg.log(p_log_key => g_log_key, p_log => 'update rule_key: '||x.rule_key||' version:'||x.apex_version);
   -- we should update the existing rule to allow for UPDATED ( fixed) rules) where rules have bugs...
   -- get the builderURL
    begin
      select builder_url_id into l_builder_url_id from builder_urls where builder_url_key = x.builder_url_key;
    exception
      when no_data_found then
        null;
    end;

    update rules
    set
      rule_name             = x.rule_name,
      category_id           = l_category_id,
      risk_id               = l_risk_id,
      rule_type             = x.rule_type,
      rule_severity_id      = l_rule_severity_id,
      impact                = x.impact,
      apex_version          = x.apex_version,
      view_name             = x.view_name,
      column_to_evaluate    = x.column_to_evaluate,
      component_id          = x.component_id,
      component_name        = x.component_name,
      column_name           = x.column_name,
      item_name             = x.item_name,
      shared_comp_name      = x.shared_comp_name,
      operand               = x.operand,
      val_char              = x.val_char,
      val_number            = x.val_number,
      case_sensitive_yn     = x.case_sensitive_yn,
      rule_criteria_type_id = l_rule_criteria_type_id,
      additional_where      = x.additional_where,
      custom_query          = x.custom_query,
      active_yn             = x.active_yn,
      internal_yn           = x.internal_yn,
      help_url              = x.help_url,
      builder_url_id        = l_builder_url_id,
      info                  = x.info,
      fix                   = x.fix,
      time_to_fix           = x.time_to_fix,
      description           = x.description
    where rule_key = x.rule_key and apex_version = x.apex_version;
   -- rule not uploaded as a rule key with the same name exists
    -- apex_collection.add_member(p_collection_name => 'RULES', p_c001 => 'FAIL', p_c002 => 'Rule already exists', p_c003 => x.rule_name, p_c004 => x.rule_key, p_c005 => x.category_name, p_c006 => x.risk_code || '-' || x.risk_name);
    -- log_pkg.log(p_log_key => g_log_key, p_log => 'Rule NOT Created because it already exists: ' || x.rule_name || ' / ' || x.rule_key, p_log_type => g_log_type);
  end if;

  -- reset the variables
  l_category_id           := null;
  l_rule_severity_id      := null;
  l_risk_id               := null;
  l_rule_criteria_type_id := null;

end loop;

log_pkg.log(p_log_key => g_log_key, p_log => 'Import Completed', p_log_type => g_log_type);
exception

  -- handle unanticipated errors
  when others then
    log_pkg.log(p_log_key => g_log_key, p_log => 'An unhandled error has occured', p_log_type => 'UNHANDLED');
    raise;

end import;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: E X P O R T
----------------------------------------------------------------------------------------------------------------------------
-- Exports rules as a JSON file
----------------------------------------------------------------------------------------------------------------------------
procedure export
is
  l_blob blob;
begin

-- set the log_key
apex_util.set_session_state('G_LOG_KEY', g_log_key);

-- log the start point
log_pkg.log(p_log_key => g_log_key, p_log => 'Export Started', p_log_type => 'EXPORT');

-- generate the json file from the view
select apex_util.clob_to_blob(p_clob => json_doc) into l_blob from rules_relational_to_json_v;

-- download the file
sys.htp.init;
sys.owa_util.mime_header ('application/json', false, 'utf-8');
sys.htp.p('cache-control: no-cache');
sys.htp.p('expires: 0');
sys.htp.p('pragma: no-cache');
sys.htp.p('content-length: ' || length(l_blob));
sys.htp.p('content-disposition: attachment; filename="APEX-SERT Rules ' || to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') || '.json');
sys.owa_util.http_header_close;
sys.wpg_docload.download_file(l_blob);

-- log the end point
log_pkg.log(p_log_key => g_log_key, p_log => 'Export Completed', p_log_type => 'EXPORT');

apex_application.stop_apex_engine;

end export;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: A D D _ R U L E _ T O _ R U L E _ S E T S
----------------------------------------------------------------------------------------------------------------------------
-- Adds a rule to a rule set or sets
----------------------------------------------------------------------------------------------------------------------------
procedure add_rule_to_rule_set
  (
  p_rule_id    in number
  ,p_rule_sets in varchar2
  )
is
  l_rule_set_arr apex_application_global.vc_arr2;
begin

-- convert the rule sets to an array
l_rule_set_arr := apex_string.string_to_table(p_rule_sets, ':');

-- loop through them and assign the rule
for x in 1..l_rule_set_arr.count
loop
  insert into rule_set_rules (rule_set_id, rule_id) values (l_rule_set_arr(x), p_rule_id);
end loop;

end add_rule_to_rule_set;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: C O P Y _ R U L E
----------------------------------------------------------------------------------------------------------------------------
-- Makes a copy of an existing rule
----------------------------------------------------------------------------------------------------------------------------
procedure copy_rule
  (
   p_rule_id   in out number
  ,p_rule_name in varchar2
  ,p_rule_key  in varchar2
  ,p_rule_sets in varchar2 default null
  )
is
  l_rule_set_arr apex_application_global.vc_arr2;
begin

-- copy the rule if it does not exist in new version
for x in (select * from rules where rule_id = p_rule_id)
loop
  insert into rules
  (
     rule_name
    ,rule_key
    ,category_id
    ,risk_id
    ,rule_severity_id
    ,rule_type
    ,impact
    ,apex_version
    ,view_name
    ,column_to_evaluate
    ,component_id
    ,component_name
    ,column_name
    ,item_name
    ,shared_comp_name
    ,operand
    ,val_char
    ,val_number
    ,rule_criteria_type_id
    ,case_sensitive_yn
    ,additional_where
    ,custom_query
    ,active_yn
    ,internal_yn
    ,help_url
    ,builder_url_id
    ,info
    ,fix
    ,time_to_fix
    ,description
  )
  values
  (
     p_rule_name
    ,p_rule_key
    ,x.category_id
    ,x.risk_id
    ,x.rule_severity_id
    ,x.rule_type
    ,x.impact
    ,x.apex_version
    ,x.view_name
    ,x.column_to_evaluate
    ,x.component_id
    ,x.component_name
    ,x.column_name
    ,x.item_name
    ,x.shared_comp_name
    ,x.operand
    ,x.val_char
    ,x.val_number
    ,x.rule_criteria_type_id
    ,x.case_sensitive_yn
    ,x.additional_where
    ,x.custom_query
    ,x.active_yn
    ,x.internal_yn
    ,x.help_url
    ,x.builder_url_id
    ,x.info
    ,x.fix
    ,x.time_to_fix
    ,x.description
  )
  returning rule_id into p_rule_id;
end loop;

-- next, add to any rule sets that were selected
if p_rule_sets is not null then

  l_rule_set_arr := apex_string.string_to_table(p_rule_sets,':');
  for x in 1..l_rule_set_arr.count
  loop
    insert into rule_set_rules (rule_set_id, rule_id) values (l_rule_set_arr(x), p_rule_id);
  end loop;

end if;

end copy_rule;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: C O P Y _ R U L E
----------------------------------------------------------------------------------------------------------------------------
-- Makes a copy of an existing rule
----------------------------------------------------------------------------------------------------------------------------
procedure upgrade_rule
  (
   p_rule_id   in out number
  ,p_apex_version in varchar2
  ,p_rule_sets in varchar2 default null
  )
is
  l_rule_set_arr apex_application_global.vc_arr2;
begin

-- copy the rule if it does not exist in specified version
--
for x in (select *
          from rules r1
          where r1.rule_id = p_rule_id
          and r1.internal_yn = 'N'
          and r1.active_yn = 'Y'
          and not exists (
            select rule_id
            from rules r2
            where  r1.rule_key = r2.rule_key and r2.apex_version = p_apex_version
            )
         )
loop

  insert into rules
  (
     rule_name
    ,rule_key
    ,category_id
    ,risk_id
    ,rule_severity_id
    ,rule_type
    ,impact
    ,apex_version
    ,view_name
    ,column_to_evaluate
    ,component_id
    ,component_name
    ,column_name
    ,item_name
    ,shared_comp_name
    ,operand
    ,val_char
    ,val_number
    ,rule_criteria_type_id
    ,case_sensitive_yn
    ,additional_where
    ,custom_query
    ,active_yn
    ,internal_yn
    ,help_url
    ,builder_url_id
    ,info
    ,fix
    ,time_to_fix
    ,description
  )
  values
  (
     x.rule_name
    ,x.rule_key
    ,x.category_id
    ,x.risk_id
    ,x.rule_severity_id
    ,x.rule_type
    ,x.impact
    ,p_apex_version
    ,x.view_name
    ,x.column_to_evaluate
    ,x.component_id
    ,x.component_name
    ,x.column_name
    ,x.item_name
    ,x.shared_comp_name
    ,x.operand
    ,x.val_char
    ,x.val_number
    ,x.rule_criteria_type_id
    ,x.case_sensitive_yn
    ,x.additional_where
    ,x.custom_query
    ,x.active_yn
    ,x.internal_yn
    ,x.help_url
    ,x.builder_url_id
    ,x.info
    ,x.fix
    ,x.time_to_fix
    ,x.description
  )
  returning rule_id into p_rule_id;
end loop;

-- -- next, add to any rule sets that were selected
if p_rule_sets is not null then

  l_rule_set_arr := apex_string.string_to_table(p_rule_sets,':');
  for x in 1..l_rule_set_arr.count
  loop
    insert into rule_set_rules (rule_set_id, rule_id) values (l_rule_set_arr(x), p_rule_id);
  end loop;

end if;

end upgrade_rule;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: U P G R A D E _ R U L E S
----------------------------------------------------------------------------------------------------------------------------
-- Upgrades a rules by creating a copy and disabling the old one
----------------------------------------------------------------------------------------------------------------------------
procedure upgrade_rules
is
  l_apex_version      number := nv('G_APEX_VERSION');
  l_prev_apex_version number;
  l_rule_set_id       number;
  l_prev_rule_set_id  number;
  l_src_rule_id       number;
  l_count             number;
begin
  if l_apex_version is null then
    -- look up the current APEX version
    select apex_version into l_apex_version from apex_version_v;
  end if;
  -- get the current sert_apex_version ( set in preferences)
  select to_number(pref_value,'99.9') into l_prev_apex_version from prefs where pref_key = 'SERT_APEX_VERSION';

  -- Copy all Rules and associate them woth the new version of APEX IFF not already existing
  -- this is done once for all existing rules to "upgrade anything not currently existing"
  -- we only attempt this if NO rules exist for the version.
  select count(*) into l_count
  from rules
  where apex_version = l_apex_version;
  if l_count = 0 then
    insert into rules
      (
      rule_name
      ,rule_key
      ,category_id
      ,risk_id
      ,rule_severity_id
      ,rule_type
      ,impact
      ,apex_version
      ,view_name
      ,column_to_evaluate
      ,component_id
      ,component_name
      ,column_name
      ,item_name
      ,shared_comp_name
      ,operand
      ,val_char
      ,val_number
      ,rule_criteria_type_id
      ,case_sensitive_yn
      ,additional_where
      ,custom_query
      ,active_yn
      ,internal_yn
      ,help_url
      ,builder_url_id
      ,info
      ,fix
      ,time_to_fix
      ,description
      )
    select
      rule_name
      ,rule_key
      ,category_id
      ,risk_id
      ,rule_severity_id
      ,rule_type
      ,impact
      ,l_apex_version
      ,view_name
      ,column_to_evaluate
      ,component_id
      ,component_name
      ,column_name
      ,item_name
      ,shared_comp_name
      ,operand
      ,val_char
      ,val_number
      ,rule_criteria_type_id
      ,case_sensitive_yn
      ,additional_where
      ,custom_query
      ,active_yn
      ,internal_yn
      ,help_url
      ,builder_url_id
      ,info
      ,fix
      ,time_to_fix
      ,description
    from  rules r1
    where r1.apex_version = l_prev_apex_version
      and not exists (
        select r2.rule_key
        from rules r2
        where r2.rule_key = r1.rule_key
          and r2.apex_version = l_apex_version
        )
    ;
  end if; --l_count = 0

  -- Copy the Rule Sets and associate them with the new version of APEX
  -- check if a ruleset exists already for the "current" APEX version - eg 24.2
  -- G_APEX_VERSION
  for rec in
    (select rule_set_key,apex_version,internal_yn,active_yn
       from sert_core.rule_sets rs1
      where rs1.apex_version = l_prev_apex_version
        and active_yn = 'Y'
        and not exists
          (select rs2.rule_set_key
             from sert_core.rule_sets rs2
            where rs2.rule_set_key = rs1.rule_Set_key
              and rs2.apex_version = l_apex_version)
    )
  loop
    insert into rule_sets
      (
      rule_set_type_id
      ,rule_set_name
      ,rule_set_key
      ,apex_version
      ,active_yn
      ,internal_yn
      )
    select
      rule_set_type_id
      ,rule_set_name
      ,rule_set_key
      ,l_apex_version
      ,active_yn
      ,internal_yn
    from rule_sets
    where
      apex_version = l_prev_apex_version
      and rule_set_key = rec.rule_set_key;

    -- we have inserted rec.rule_set_key for the new apex version
    -- get the old and new rule_set_id
    -- new ruleset as the DEST
    select rule_set_id into l_rule_set_id from rule_sets where rule_set_key = rec.rule_set_key and apex_version = l_apex_version;
    -- use old ruleset as the SOURCE
    select rule_set_id into l_prev_rule_set_id from rule_sets where rule_set_key = rec.rule_set_key and apex_version = l_prev_apex_version;

    -- Loop through and add the rules ( insert prev into current)
    -- at this point we are only aiming to map rules already existing in the current apex version
    -- these are already configured in install, or at the start of this function
    for y in (select rsr.rule_set_id, rsr.rule_id, rs.active_yn, rs.internal_yn
              from rule_set_rules rsr, rule_sets rs
              where rs.rule_set_id = rsr.rule_set_id
              and rsr.rule_set_id = l_prev_rule_set_id)
    loop
      l_src_rule_id := y.rule_id;
      -- at this point we have:
      -- 1) migrated rules if NONE exist for the new apex_version ( this covers internal rules)
      -- but we should help out and handle customer built rulesets and rules.
      -- so for each active ruleset, we can migrate the rule if not existing, so that the insertion into rule_set_rules will succeeed
      if ( y.internal_yn = 'N' ) then
        upgrade_rule ( p_rule_id => y.rule_id , p_apex_version => l_apex_version);
      end if;
      -- we know the rule will hav e
      insert into rule_set_rules
        ( rule_set_id
         ,rule_id
        )
      values
        ( l_rule_set_id
         ,(select rule_id from rules where rule_key = (select rule_key from rules where rule_id = y.rule_id) and apex_version = l_apex_version)
        );
      update rules set active_yn = 'N' where rule_id = l_src_rule_id;
    end loop;
    -- we have migrated the ruleset, deactivate the older one.
    update rule_sets set active_yn = 'N' where rule_set_id = l_prev_rule_set_id;
-- Loop through and copy Exceptions
    for exception_rec in (select * from exceptions where rule_set_id = l_prev_rule_set_id)
    loop

      -- Copy the exceptions
      insert into exceptions
        (
        rule_set_id
        ,rule_id
        ,exception
        ,workspace_id
        ,application_id
        ,page_id
        ,component_id
        ,column_name
        ,item_name
        ,shared_comp_name
        ,result
        ,reason
        ,current_value
        ,component_name
        ,created_on
        ,created_by
        ,updated_on
        ,updated_by
        )
      values
        (
        l_rule_set_id
        ,(select rule_id from rules where rule_key = (select rule_key from rules where rule_id = exception_rec.rule_id) and apex_version = l_apex_version)
        ,exception_rec.exception
        ,exception_rec.workspace_id
        ,exception_rec.application_id
        ,exception_rec.page_id
        ,exception_rec.component_id
        ,exception_rec.column_name
        ,exception_rec.item_name
        ,exception_rec.shared_comp_name
        ,exception_rec.result
        ,exception_rec.reason
        ,exception_rec.current_value
        ,exception_rec.component_name
        ,exception_rec.created_on
        ,exception_rec.created_by
        ,exception_rec.updated_on
        ,exception_rec.updated_by
        );
    end loop; -- exceptions

  end loop; -- for rec in  rule_sets...

  -- Update the preference to point to the latest version of APEX
  update prefs set pref_value = l_apex_version where pref_key = 'SERT_APEX_VERSION';

end upgrade_rules;


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end rules_pkg;
/
--rollback not required
