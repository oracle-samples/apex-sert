--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_sert_core.exceptions_api_1721803513628 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.exceptions_api
as
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: S H O W _ E X C E P T I O N.
----------------------------------------------------------------------------------------------------------------------------
-- Determines whether or not to show items/regions/buttons for an evaluation result based on the status
----------------------------------------------------------------------------------------------------------------------------
function show_exception
  (
  p_eval_result_id in number
  )
return boolean
is
  l_result varchar2(100);
begin

select result into l_result from eval_results_v where eval_result_id = p_eval_result_id;
if l_result = 'PASS' then return false;
  else return true;
end if;

-- inspect the specific evaluation result and determine whether or not to render it
--for x in (select * from eval_results_pub_v where eval_result_id = p_eval_result_id)
--loop
---  if x.result = 'PASS' then
 --   return false;
 -- else
 --   return true;
 -- end if;
--end loop;

end show_exception;


----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: E X C E P T I O N _ S T A T U S
----------------------------------------------------------------------------------------------------------------------------
-- Return the status of the exception
----------------------------------------------------------------------------------------------------------------------------
  function exception_status
    (
    p_exception_id in number
    )
  return varchar2
  is
    l_result varchar2(100);
  begin
    select result into l_result from exceptions where exception_id = p_exception_id;
    return l_result;
  exception
    when NO_DATA_FOUND then
      return null;
    when others then
      raise;
  end exception_status;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: I S _ S T A L E
----------------------------------------------------------------------------------------------------------------------------
-- Return TRUE if exception is stale
----------------------------------------------------------------------------------------------------------------------------
  function is_stale(p_exception_id in number)
  return boolean
  is
  begin
    return exception_status(p_exception_id) = 'STALE';
  end is_stale;
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: S H O W _ E X C E P T I O N S _ F O R M
----------------------------------------------------------------------------------------------------------------------------
-- Determines whether or not to show the Exceptions form
----------------------------------------------------------------------------------------------------------------------------
function show_exceptions_form
  (
   p_stale_eval    in varchar2
  ,p_exception_key in varchar2
  )
return boolean
is
begin

if p_stale_eval = 'Y' then
  -- evaluation is on an older version of APEX; do not display the form
  return false;
else
  -- check to see if an exception exists
  for y in (select 1 from exceptions_pub_v where exception_key = p_exception_key)
  loop
    -- there is an exception; do not display the form
    return false;
  end loop;
end if;
-- no exception found; display the form
return true;

end show_exceptions_form;


----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: S H O W _ A D D _ E X C E P T I O N _ B U T T O N
----------------------------------------------------------------------------------------------------------------------------
-- Determines whether or not to show the Add Exception button
----------------------------------------------------------------------------------------------------------------------------
function show_add_exception_button
  (
  p_exception_key in varchar2
  )
return boolean
is
begin

-- check to see if an exception exists
for y in (select 1 from exceptions_pub_v where exception_key = p_exception_key)
loop
  -- there is an exception; do not display the button
  return false;
end loop;

-- no exception found; display the button
return true;

end show_add_exception_button;


----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: S H O W _ W I T H D R A W _ E X C E P T I O N _ B U T T O N
----------------------------------------------------------------------------------------------------------------------------
-- Determines whether or not to show the Withdraw Exception button
----------------------------------------------------------------------------------------------------------------------------
function show_withdraw_exception_button
  (
   p_stale_eval    in varchar2
  ,p_exception_key in varchar2
  ,p_exception_id  in number
  ,p_app_user      in varchar2
  )
return boolean
is
begin

if p_stale_eval = 'Y' then
  -- evaluation is on an older version of APEX; do not display the button
  return false;
else
  -- check to see if an exception exists
  for y in
    (
    select
      1
    from
      exceptions_pub_v
    where
      exception_key = p_exception_key
        and 1 = (select 1 from exceptions_pub_v
              where exception_id = p_exception_id
              and (created_by = p_app_user or result in ('REJECTED','STALE') )
             )
    )
  loop
    -- there is an exception by the current user; display the button
    return true;
  end loop;
end if;
-- no exception found from the current user or exception is from another user; do not display the button
return false;

end show_withdraw_exception_button;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: R E S U B M I T _ E X C E P T I O N
----------------------------------------------------------------------------------------------------------------------------
-- resubmit a stale exception
-- ONLY stale exception wil be resubmitted.
----------------------------------------------------------------------------------------------------------------------------
  procedure resubmit_stale_exception
    ( p_exception_id in number
     ,p_eval_result_id in number
    )
  is
    l_result  sert_core.exceptions.result%type;
  begin
    select max(result) into l_result from exceptions where exception_id = p_exception_id;
    if ( l_result = 'STALE' ) then
      -- we have something to do!
      update exceptions
      set result = 'PENDING'
         ,current_value = (select substr(current_value,1,2000) from eval_results where eval_result_id = p_eval_result_id)
      where exception_id = p_exception_id;
    else
      raise_application_error( -20001,'only a STALE exception can be resubmitted');
    end if;
  exception
    when others then
      raise;
  end resubmit_stale_exception;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: W I T H D R A W _ E X C E P T I O N
----------------------------------------------------------------------------------------------------------------------------
-- Withdraws an exception, stopping any workflows
----------------------------------------------------------------------------------------------------------------------------
procedure withdraw_exception
  (
   p_exception_id in number
  ,p_eval_id      in number
  )
is
begin

delete from exceptions where exception_id = p_exception_id;

-- calculate the scores
-- eval_pkg.calc_score(p_eval_id => p_eval_id);

end withdraw_exception;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: A P P R O V E _ O R _ R E J E C T _ E X C E P T I O N
----------------------------------------------------------------------------------------------------------------------------
-- Either approve or reject an exception
----------------------------------------------------------------------------------------------------------------------------
procedure approve_or_reject_exception
  (
   p_exception_id in number
  ,p_result       in varchar2
  ,p_reason       in varchar2
  ,p_app_user     in varchar2
  ,p_eval_id      in number
  )
is
begin

update exceptions set
   result = p_result
  ,reason = p_reason
  ,actioned_by = coalesce(sys_context('APEX$SESSION','APP_USER'),p_app_user)
  ,actioned_on = systimestamp
where
  exception_id = p_exception_id;

-- calculate the scores
-- eval_pkg.calc_score(p_eval_id => p_eval_id);

end approve_or_reject_exception;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: A D D _ E X C E P T I O N
----------------------------------------------------------------------------------------------------------------------------
-- Adds a new exception
----------------------------------------------------------------------------------------------------------------------------
procedure add_exception
  (
   p_rule_set_id      in number
  ,p_rule_id          in number
  ,p_workspace_id     in number
  ,p_application_id   in number
  ,p_page_id          in number   default null
  ,p_component_id     in varchar2 default null
  ,p_component_name   in varchar2 default null
  ,p_column_name      in varchar2 default null
  ,p_item_name        in varchar2 default null
  ,p_shared_comp_name in varchar2 default null
  ,p_exception        in varchar2
  ,p_current_value    in varchar2
  ,p_eval_id          in number
  )
is
begin

insert into exceptions
  (
   rule_set_id
  ,rule_id
  ,workspace_id
  ,application_id
  ,page_id
  ,component_id
  ,component_name
  ,column_name
  ,item_name
  ,shared_comp_name
  ,exception
  ,result
  ,current_value
  )
values
  (
   p_rule_set_id
  ,p_rule_id
  ,p_workspace_id
  ,p_application_id
  ,p_page_id
  ,p_component_id
  ,p_component_name
  ,p_column_name
  ,p_item_name
  ,p_shared_comp_name
  ,p_exception
  ,'PENDING'
  ,p_current_value
  );

-- calculate the scores
-- eval_pkg.calc_score(p_eval_id => p_eval_id);

end add_exception;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: D O W N L O A D  _ E X C E P T I O N S
----------------------------------------------------------------------------------------------------------------------------
-- Downloads an applications exceptions as a JSON file
----------------------------------------------------------------------------------------------------------------------------
procedure download_exceptions
  (
   p_application_id in number
  ,p_eval_id        in number
  )
is
  l_log_key     varchar2(10) := log_pkg.get_log_key;
  l_pretty_json clob;
begin

log_pkg.log(p_log => 'Downloading Exceptions for Application ' || p_application_id, p_log_key => l_log_key, p_log_type => 'EXCEPTION_EXPORT', p_application_id => p_application_id);

-- loop through the current evaluation to get the rule_set_id
for x in (select * from evals_pub_v where eval_id = p_eval_id)
loop
  -- loop through all exceptions that match on application_id and rule_set_id
  for y in (select * from exceptions_json_to_rel_v where application_id = p_application_id and rule_set_id = x.rule_set_id)
  loop
    -- Apply "nice" formatting to the JSON object to make it easier to consume
    l_pretty_json := json_query(y.json_doc, '$' returning clob pretty);

    -- download the JSON file
    apex_http.download
      (
       p_clob => l_pretty_json
      ,p_content_type => 'application/json'
      ,p_filename => 'Exceptions for App ' || p_application_id || ' - ' || to_char(localtimestamp, 'DD-MON-YYYY HH.MI.SS PM') || '.json'
      );

  end loop;
end loop;

log_pkg.log(p_log => 'Downloading Exceptions Completed for Application ' || p_application_id, p_log_key => l_log_key, p_log_type => 'EXCEPTION_EXPORT', p_application_id => p_application_id);

end download_exceptions;

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: P R O C E S S _ E X C E P T I O N S
----------------------------------------------------------------------------------------------------------------------------
-- Process an Exceptions JSON file via APP wizard process
----------------------------------------------------------------------------------------------------------------------------
procedure process_exceptions
  (
   p_json_export_file      in blob
  ,p_eval_id               in number default null
  ,p_ignore_checksum      in boolean default FALSE
  )
is
  l_fail           number        := 0;
  l_pass           number        := 0;
  l_application_id number;
  l_workspace_id   number;
  l_rule_set_key   varchar2(250);
  l_apex_version   number;
  l_log_key        varchar2(10)  := log_pkg.get_log_key;
  l_checksum       number;
  l_source_ora_hash number;
  l_dest_ora_hash number;
  l_dest_component_id number;
  l_rule_set_id number;
  l_rule_id number;

  l_summary_result_string varchar2(4000);
  l_collection_name  VARCHAR2(20) := 'EXCEPTIONS';
  l_exception_import_status VARCHAR2(10);
  l_exception_import_message VARCHAR2(10000);
  l_current_value VARCHAR2(1000);
  l_dest_component_not_found  VARCHAR2(1);  --YN
  l_session_active  boolean := false;
begin
  -- verify a session exists
  l_session_active := APEX_CUSTOM_AUTH.GET_SESSION_ID is not null;

  -- get the application_id for the specific evaluation
  if p_eval_id is not null then
    -- The import was initiated from the SERT application. Fetch the information from
    -- the evaluation we are trying to import into
    select application_id, rule_set_key, apex_version, workspace_id
    into l_application_id, l_rule_set_key, l_apex_version, l_workspace_id
    from evals_v
    where eval_id = p_eval_id;

  else
    -- The import was initiated from outside of APEX, we still expect a given export
    -- to be for only one applications/rule set, so use an agg query to get that
    -- info directly from the export JSON.
    select any_value(application_id), any_value(rule_set_key), any_value(workspace_id)
    into l_application_id, l_rule_set_key, l_workspace_id
    from exceptions_from_json(p_exceptions => p_json_export_file);

    select sert_apex_version
    into l_apex_version
    from apex_version_v;

  end if;

  log_pkg.log(p_log => 'Uploading Exceptions for Application ' || l_application_id || ' - Rule Set ' || l_rule_set_key, p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);

  if(l_session_active ) then
    apex_collection.create_or_truncate_collection(p_collection_name => l_collection_name);
  end if;

  if p_ignore_checksum = true then
    log_pkg.log(p_log => 'p_ignore_checksum set to TRUE, component checksums will be ignored ', p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);  
  end if;

  for x in (select * from exceptions_from_json(p_exceptions => p_json_export_file))
  loop

    -- check to make sure that the user can see the application and if so, try to insert the row

    -- generate a checksum based on the data uploaded

    if l_rule_set_key = x.rule_set_key then

      --this ora_hash is for exception itself
      select ora_hash
        (
        x.rule_key
        || x.page_id
        || x.component_name
        || x.column_name
        || x.item_name
        || x.shared_comp_name
        || x.current_value
        || utl_i18n.unescape_reference(x.exception)
        || x.result
        || x.reason
        || x.created_by
        || x.updated_by
        || x.actioned_by
        )
      into l_checksum
      from dual;

      -- verify that the checksums match or ignore checksum if instructed so
      if x.checksum = l_checksum or p_ignore_checksum = TRUE then

        -- checksums match; insert the exception
        log_pkg.log(p_log => 'insert:', p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);

        select rule_set_id
        into l_rule_set_id
        from rule_sets
        where rule_set_key = x.rule_set_key
        and apex_version = l_apex_version;

        select rule_id
        into l_rule_id
        from rules
        where rule_key = x.rule_key
        and apex_version = l_apex_version;

        l_dest_component_not_found := 'N';

        --if ws and app id is the same and component_id is null, we don't need to recalc component id
        --else recalc component_id.
        if x.component_id  is NULL and
           l_application_id = x.application_id and
           l_workspace_id = x.workspace_id then

          --component_id is unchanged
          l_source_ora_hash := 1;
          l_dest_ora_hash := 1;
          l_dest_component_id := x.component_id;

        else
          --component_id is different

          --construct l_source_ora_hash
          select ora_hash(
            x.rule_key ||
            x.page_id ||
            x.component_name ||
            x.column_name ||
            x.item_name ||
            x.shared_comp_name ||
            x.current_value
            )
          into l_source_ora_hash
          from dual;

          --fetch new component_id and construct l_dest_ora_hash
          begin
            select r.component_id,
                  ora_hash(
                  (select rule_key
                   from rules
                   where rule_id= r.rule_id
                   and apex_version = l_apex_version
                  ) ||
                  r.page_id ||
                  r.component_name ||
                  r.column_name ||
                  r.item_name ||
                  r.shared_comp_name ||
                  r.current_value
                  ) as orahash,
                  r.current_value
            into l_dest_component_id, l_dest_ora_hash, l_current_value
            from sert_core.eval_results_v r
            where application_id = l_application_id
            and nvl(page_id,-1) = nvl(x.page_id,-1)
            and nvl(item_name,'N/A') = nvl(x.item_name,'N/A')
            and nvl(column_name,'N/A') = nvl(x.column_name,'N/A')
            and rule_set_id = l_rule_set_id
            and nvl(component_name,'N/A') = nvl(x.component_name,'N/A')
            and rule_id = l_rule_id;

          exception
            when no_data_found then
              l_dest_component_not_found := 'Y';

            when others then
              log_pkg.log(p_log => 'Upload exceptons, failed constructing dest_ora_hash:' ||
                                   ' l_source_ora_hash:'|| l_source_ora_hash || '-' ||
                                   ' l_application_id:' || l_application_id ||
                                   ' x.page_id:' || nvl(x.page_id,-1)||
                                   ' x.item_name:' || nvl(x.item_name,'N/A') ||
                                   ' x.column_name:' || nvl(x.column_name,'N/A') ||
                                   ' l_rule_set_id: ' || l_rule_set_id ||
                                   ' l_rule_id: ' || l_rule_id ||
                                   ' x.rule_key:' || x.rule_key ||
                                   ' x.component_name:' || x.component_name ||
                                   ' SQLERRM:' || SQLERRM
                          , p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);

          end;

        end if;  --ws and app id unchanged, component_id NULL


        if l_source_ora_hash = l_dest_ora_hash then

          begin
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
            ,created_by
            ,created_on
            ,updated_by
            ,updated_on
            ,actioned_by
            ,actioned_on
            ,component_name
            )
            values
            (
            l_rule_set_id
            ,l_rule_id
            ,utl_i18n.unescape_reference(x.exception)
            ,l_workspace_id
            ,l_application_id
            ,x.page_id
            ,l_dest_component_id
            ,x.column_name
            ,x.item_name
            ,x.shared_comp_name
            ,x.result
            ,x.reason
            ,x.current_value
            ,x.created_by
            ,to_timestamp_tz(x.created_on, 'YYYY-MM-DD"T"HH24:MI:SS.FF6TZH:TZM')
            ,x.updated_by
            ,to_timestamp_tz(x.updated_on, 'YYYY-MM-DD"T"HH24:MI:SS.FF6TZH:TZM')
            ,x.actioned_by
            ,to_timestamp_tz(x.actioned_on, 'YYYY-MM-DD"T"HH24:MI:SS.FF6TZH:TZM')
            ,x.component_name
            );

            -- increment the pass counter
            l_pass := l_pass + 1;

            log_pkg.log(p_log => 'Exception Uploaded - Application: ' || x.application_id || ' - Rule Set: ' || l_rule_set_key || ' - Rule Key: ' || x.rule_key,
                        p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);

            l_exception_import_status := 'SUCCESS';
            l_exception_import_message := NULL;

          exception
            when dup_val_on_index then
              -- exception already exists, update status
              update exceptions
              set result = x.result
              where rule_set_id = l_rule_set_id
              and rule_id = l_rule_id
              and workspace_id = l_workspace_id
              and application_id = l_application_id
              and nvl(page_id,-1) = nvl(x.page_id,-1)
              and component_id = l_dest_component_id
              and nvl(column_name,'N/A') = nvl(x.column_name,'N/A')
              and nvl(item_name,'N/A') = nvl(x.item_name,'N/A');
              
            -- increment the pass counter
            l_pass := l_pass + 1;

            log_pkg.log(p_log => 'Exception Updated Status: ' ||x.result || ' - Application: ' || x.application_id || ' - Rule Set: ' || l_rule_set_key || ' - Rule Key: ' || x.rule_key,
                        p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);

            l_exception_import_status := 'SUCCESS';
            l_exception_import_message := NULL;
              
              -- exception already exists, do not insert another one; increment the fail counter
              --log_pkg.log(p_log => 'fail:'||SQLERRM, p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);
              --l_fail := l_fail + 1;
              --log_pkg.log(p_log => 'Exception Failed (already exists) - Application: ' || x.application_id || ' - Rule Set: ' || l_rule_set_key || ' - Rule Key: ' || x.rule_key,
              --            p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);

              --l_exception_import_status := 'FAIL';
              --l_exception_import_message := 'Exception is a duplicate';

            when others then
              -- exception already exists, do not insert another one; increment the fail counter
              log_pkg.log(p_log => 'fail:'||SQLERRM, p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);
              l_fail := l_fail + 1;
              log_pkg.log(p_log => 'Exception Failed (Other - Application: ' || x.application_id || ' - Rule Set: ' || l_rule_set_key || ' - Rule Key: ' || x.rule_key,
                          p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);

              l_exception_import_status := 'FAIL';
              l_exception_import_message := 'Exception Other';

          end;


        else
          --no ora_hash match between source and dest component
          log_pkg.log(p_log => 'Exception Failed  - l_source_ora_hash:'||l_source_ora_hash || '-'
                      || ' l_dest_ora_hash:' || l_dest_ora_hash
                      ||  SQLERRM ,
                      p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);

          l_exception_import_status := 'FAIL';

          --test current values and if different -add this to the message - 'Current value for component differs'
          if l_dest_component_not_found = 'Y' then
            l_exception_import_message := 'Component does not exist. ';

          elsif nvl(x.current_value,'N/A') <> nvl(l_current_value,'N/A') then
            l_exception_import_message := 'Component checksum not matched. Current value for component differs.';

          else
            l_exception_import_message := 'Component checksum not matched. ';

          end if;


        end if; --scanned object orahash check

      else
        -- checksum does not match; increment the fail counter
        log_pkg.log(p_log => 'no insert:', p_log_key => l_log_key, p_log_type => 'EVAL', p_application_id => l_application_id);
        l_fail := l_fail + 1;
        log_pkg.log(p_log => 'Exception Failed (checksum mismatch) - Application: ' || x.application_id || ' - Rule Set: ' || l_rule_set_key || ' - Rule Key: ' || x.rule_key,
                    p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);

        l_exception_import_status := 'FAIL';
        l_exception_import_message := 'Exception checksum not matched';

      end if;  --exception checksum check

    else
      -- exception is for another app/rule set combination; increment the fail counter
      log_pkg.log(p_log => 'other1:', p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);
      l_fail := l_fail + 1;
      log_pkg.log(p_log => 'Exception Failed (other) - Application: ' || x.application_id || ' - Rule Set: ' || l_rule_set_key || ' - Rule Key: ' || x.rule_key,
                  p_log_key => l_log_key, p_log_type => 'EXCEPTION_IMPORT', p_application_id => l_application_id);

      l_exception_import_status := 'FAIL';
      l_exception_import_message := 'Exception is for another rule set';

    end if; --rule_set_key and apex_version check

    if (l_session_active ) then

      apex_collection.add_member(p_collection_name => l_collection_name,
                                p_c001 => l_exception_import_status,
                                p_c002 => l_exception_import_message,
                                p_c003 => x.page_id,
                                p_c004 => x.column_name,
                                p_c005 => x.item_name,
                                p_c006 => x.shared_comp_name,
                                p_c007 => x.component_name,
                                p_c008 => x.current_value,
                                p_c009 => x.reason
                                );
    end if;
  end loop;


  l_summary_result_string := l_pass || ' exceptions imported' || case when l_fail > 0 then ', ' || l_fail || ' ignored' end;
  -- This could be called outside of an APEX session context, so first make sure
  -- we have a valid session before trying to set session state.
  if apex_custom_auth.is_session_valid then
    -- set the message to be displayed
    apex_util.set_session_state('P40_MSG', l_summary_result_string);
  else
    -- Prepend with additional info outside of APEX to give more awareness about
    -- what application just had exceptions imported.
    dbms_output.put_line('Application f' || l_application_id || ' import result: ' || l_summary_result_string);
  end if;

  log_pkg.log(p_log => 'Uploading Exceptions for Application ' || l_application_id || ' - Rule Set ' || l_rule_set_key || ' Completed',
              p_log_key => l_log_key, p_log_type => 'EXCEPTION_EXPORT', p_application_id => l_application_id);

end process_exceptions;


----------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE: U P L O A D _ E X C E P T I O N S _ W I Z A R D
----------------------------------------------------------------------------------------------------------------------------
-- Uploads and applies an Exceptions JSON file from an upload in APEX
----------------------------------------------------------------------------------------------------------------------------
procedure upload_exceptions_wizard
  (
   p_name      in varchar2
  ,p_eval_id   in number
  ,p_ignore_checksum      in boolean default FALSE
  )
is
  l_blob_content apex_application_temp_files.blob_content%type;
begin

  -- find the file that was just uploaded
  select blob_content into l_blob_content from apex_application_temp_files where name = p_name;

  process_exceptions(p_json_export_file => l_blob_content, 
                     p_eval_id => p_eval_id,
                     p_ignore_checksum => p_ignore_checksum);

end upload_exceptions_wizard;


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end exceptions_api;
/
--rollback not required
