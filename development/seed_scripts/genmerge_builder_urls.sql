set serveroutput on
set feedback off
spool builder_urls_merge.sql

declare
  -- Script: Generate MERGE statements for a target table from its current data.
  -- Purpose: Spools a MERGE script by emitting JSON from the table and iterating via JSON_TABLE.
  -- Edit only the configuration variables below, then run this script.

  -- >>>>>>>>>>>>>>>> Change the lines below <<<<<<<<<<<<<<<<<
  -- Table to merge into (uppercase).
  l_table_name        varchar2(30)      := 'sert_core.builder_urls';
  -- List of columns in the table to include.
  -- Include columns used to match in the MERGE statement.
  -- Exclude things like ID and APEX audit columns.
  l_column_list_s     varchar2(4000)    := 'component_name, builder_url_key, data_type_id, data_link';
  -- Columns used for the MERGE match (comma-separated list).
  l_match_columns     varchar2(4000)    := 'builder_url_key';
  -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  l_cur               sys_refcursor;
  l_cur_id            number;
  l_desc_tab          dbms_sql.desc_tab;
  l_col_cnt           number;
  l_name_var          varchar2(4000);
  l_num_var           number;
  l_date_var          date;

  l_sql               varchar2(32767);
  l_count             number;

  l_match_list        apex_t_varchar2  := apex_string.split(replace(l_match_columns, ' ', ''), ',');
  l_column_list       apex_t_varchar2  := apex_string.split(replace(l_column_list_s, ' ', ''), ',');
begin
  -- ===================================================
  -- Prep work
  -- ===================================================
  -- Build the SQL for the main cursor.
  l_sql := 'select ' || l_column_list_s || ' from ' || l_table_name;

  -- Strip the match list out of the column list.
  for m in 1 .. l_match_list.count loop
    for c in 1 .. l_column_list.count loop
      if l_column_list(c) = l_match_list(m) then
        l_column_list.delete(c);
      end if; -- l_column_list(c) = l_match_list(m)
    end loop; -- c in 1 .. l_column_list.count
  end loop; -- m in 1 .. l_match_list.count

  -- ===================================================
  -- Emit preamble and JSON object
  -- ===================================================

  -- Start with the static preamble.
  dbms_output.put_line(q'#
declare
  l_json clob;
begin

  -- Load data in JSON object
  l_json := q'!#');

  -- Now dump the data from the table into a JSON object.
  --
  -- Initialize the CLOB output so we can capture it.
  --
  apex_json.free_output;
  apex_json.initialize_clob_output;

  -- Dump the data from the cursor above in JSON format.
  open l_cur for l_sql;
  apex_json.write(l_cur);

  -- Dump the JSON out to the output buffer.
  dbms_output.put_line(apex_json.get_clob_output);

  -- Free the CLOB.
  apex_json.free_output;

  -- Finish off the quoted string.
  dbms_output.put_line(q'#!';#');

  -- ===================================================
  -- Build for loop with JSON_TABLE
  -- ===================================================

  -- Start of the for loop.
  dbms_output.put_line(q'#
for data in (
  select *
  from json_table(l_json, '$[*]' columns #');

  -- Now create the column references.
  -- Initialize a new cursor.
  open l_cur for l_sql;

  -- Get a handle to the cursor ID so we can grab the returned columns.
  l_cur_id := dbms_sql.to_cursor_number(l_cur);

  -- Describe the select statement output and get the full details.
  dbms_sql.describe_columns(l_cur_id, l_col_cnt, l_desc_tab);

  --
  -- The following will loop through the resulting columns from the cursor
  -- and output the parts of the JSON_TABLE columns clause.
  --
  -- The counter allows us to know when a comma at the front of the line is necessary.
  --
  l_count := 0;

  -- Loop through the columns.
  for i in 1 .. l_col_cnt loop
    -- Do we include a comma or not?
    if l_count > 0 then
      dbms_output.put('      , ');
    else
      dbms_output.put('        ');
    end if; -- l_count > 0

    -- This bit might be confusing, but DBMS_SQL.DESCRIBE_COLUMNS returns the data type for the column as a number:
    --   12 = date
    --    2 = number
    --    ? = treat it as a varchar2
    dbms_output.put(l_desc_tab(i).col_name);
    if l_desc_tab(i).col_type = 12 then
      dbms_output.put(' date ');
    elsif l_desc_tab(i).col_type = 2 then
      dbms_output.put(' number ');
    else
      dbms_output.put(' varchar2(' || l_desc_tab(i).col_max_len || ') ');
    end if; -- l_desc_tab(i).col_type in (12, 2)

    dbms_output.put_line(q'# path '$.#' || upper(l_desc_tab(i).col_name) || q'#' #');

    -- Increment the counter.
    l_count := l_count + 1;
  end loop; -- i in 1 .. l_col_cnt

  -- End the JSON_TABLE clause and start the loop for the MERGE.
  dbms_output.put_line(q'#
   )
) loop
   merge into #' || l_table_name || q'# dest
      using (
         select #');

  -- Iterate through the match column list and create the SELECT list for the USING clause.
  l_count := 0;
  for m in 1 .. l_match_list.count loop
    -- Do we include a comma or not?
    if l_count > 0 then
      dbms_output.put('         , ');
    else
      dbms_output.put('           ');
    end if; -- l_count > 0

    -- Emit the column to be selected.
    dbms_output.put_line('data.' || l_match_list(m) || ' ' || l_match_list(m));

    -- Increment the counter.
    l_count := l_count + 1;
  end loop; -- m in 1 .. l_match_list.count

  -- The record is selected from DUAL, basically so we can do the comparison in the WHERE clause below.
  dbms_output.put_line(q'#         from dual
      ) src
      on (1 = 1 #');

  -- Emit the WHERE clause for each of the match columns matching DEST and SRC.
  for m in 1 .. l_match_list.count loop
    dbms_output.put_line('          and dest.' || l_match_list(m) || ' = src.' || l_match_list(m));
  end loop; -- m in 1 .. l_match_list.count

  -- End the ON clause with a close paren.
  dbms_output.put('       )');

  -- Emit the WHEN MATCHED clause.
  dbms_output.put_line(q'#
   when matched then
      update
         set #');

  -- Iterate through the column list to update when matched.
  l_count := 0;
  for c in l_column_list.first .. l_column_list.last loop
    -- Since we stripped the MATCH column out of the column list above, we have to account for the
    -- sparse array problem by checking to see if an element at the index exists.
    if l_column_list.exists(c) then
      -- Should we include a comma?
      if l_count > 0 then
        dbms_output.put('        , ');
      else
        dbms_output.put('          ');
      end if; -- l_count > 0

      -- Emit the SET line(s).
      dbms_output.put_line('dest.' || l_column_list(c) || ' = data.' || l_column_list(c));

      -- Increment the counter.
      l_count := l_count + 1;
    end if; -- l_column_list.exists(c)
  end loop; -- c in l_column_list.first .. l_column_list.last

  -- Emit the WHEN NOT MATCHED clause.
  dbms_output.put_line(q'#
   when not matched then
      insert ( #');

  -- Emit the columns into the target portion of the INSERT statement.
  l_count := 0;
  for c in l_column_list.first .. l_column_list.last loop
    -- Again we account for the sparse array problem.
    if l_column_list.exists(c) then
      -- Decide whether we output a comma.
      if l_count > 0 then
        dbms_output.put('        , ');
      else
        dbms_output.put('          ');
      end if; -- l_count > 0

      -- Output the column name.
      dbms_output.put_line(l_column_list(c));

      l_count := l_count + 1;
    end if; -- l_column_list.exists(c)
  end loop; -- c in l_column_list.first .. l_column_list.last

  -- Do not forget the match columns too.
  for c in l_match_list.first .. l_match_list.last loop
    -- Decide whether we output a comma.
    if l_count > 0 then
      dbms_output.put('        , ');
    else
      dbms_output.put('          ');
    end if; -- l_count > 0

    -- Output the column name.
    dbms_output.put_line(l_match_list(c));

    l_count := l_count + 1;
  end loop; -- c in l_match_list.first .. l_match_list.last

  -- Emit the VALUES clause.
  dbms_output.put_line(q'#
   )
   values ( #');

  -- Emit the references to the DATA record from the cursor for the VALUES to insert.
  l_count := 0;
  for c in l_column_list.first .. l_column_list.last loop
    -- Sparse array again.
    if l_column_list.exists(c) then
      -- Do we need a comma?
      if l_count > 0 then
        dbms_output.put('        , ');
      else
        dbms_output.put('          ');
      end if; -- l_count > 0

      -- Emit the value.
      dbms_output.put_line('data.' || l_column_list(c));

      l_count := l_count + 1;
    end if; -- l_column_list.exists(c)
  end loop; -- c in l_column_list.first .. l_column_list.last

  -- You also need to emit the match column list for an insert.
  for c in l_match_list.first .. l_match_list.last loop
    -- Do we need a comma?
    if l_count > 0 then
      dbms_output.put('        , ');
    else
      dbms_output.put('          ');
    end if; -- l_count > 0

    -- Emit the value.
    dbms_output.put_line('data.' || l_match_list(c));

    l_count := l_count + 1;
  end loop; -- c in l_match_list.first .. l_match_list.last

  -- End the proc being emitted.
  dbms_output.put_line(q'# );
end loop;

end;
/ #');

  -- And we are done.
end;
/
spool off
