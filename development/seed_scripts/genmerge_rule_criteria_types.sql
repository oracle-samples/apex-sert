set serveroutput on
set feedback off
spool rule_criteria_types_merge.sql
declare
-->>>>>>>>>>>>>>>>>>>> CHANGE THE LINES BELOW <<<<<<<<<<<<<<<<<<<<<<<
   -- Table to merge in to (UPPER CASE)
   table_name    varchar2(30) := 'sert_core.rule_criteria_types';
   -- LIST OF COLUMNS IN THE TABLE TO INCLUDE
   --  Include columns used to match in the MERGE statement
   --  Exclude things like ID and APEX AUDIT COLS
   column_list   varchar2(4000) := 'rule_criteria_type_name, rule_criteria_type_key';
   -- Columns used for the MERGE MATHCH (comma separated list)
   match_columns varchar2(4000) := 'rule_criteria_type_key';
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   cur           sys_refcursor;
   curid         number;
   desctab       dbms_sql.desc_tab;
   colcnt        number;
   namevar       varchar2(4000);
   numvar        number;
   datevar       date;
   l_sql         varchar2(32767);
   l_count       number;
   l_match_list  apex_t_varchar2 := apex_string.split(replace(match_columns, ' ', ''), ',');
   l_column_list apex_t_varchar2 := apex_string.split(replace(column_list, ' ', ''), ',');
begin
-- ===================================================
-- PREP WORK
-- ===================================================
   -- Build the SQL for the main cursor
   l_sql   := 'select ' || column_list || ' from ' || table_name;
   -- Strip the MATCH LIST out of the COLUMN LIST
   for m in 1..l_match_list.count loop
      for c in 1..l_column_list.count loop
         if l_column_list(c) = l_match_list(m) then
            l_column_list.delete(c);
         end if;
      end loop;
   end loop;

-- ===================================================
-- EMIT PREAMBLE AND JSON OBJECT
-- ===================================================

-- Start witht the "static" preamble
   dbms_output.put_line(q'#
declare
  l_json clob;
begin

  -- Load data in JSON object
  l_json := q'!#');

--Now dump the data from the table into a JSON object
--
-- Initialize the clob output so we can capture it
--
   apex_json.free_output;
   apex_json.initialize_clob_output;
-- Dump the data from the cursor above in JSON format
   open cur for l_sql;

   apex_json.write(cur);
-- Dump the JSON out to the OUTPUT buffer
   dbms_output.put_line(apex_json.get_clob_output);
-- Free the CLOB
   apex_json.free_output;
-- Finish off the quoted string
   dbms_output.put_line(q'#!';#');

-- ===================================================
-- Build for loop with JSON_TABLE
-- ===================================================
--Start of the for loop
   dbms_output.put_line(q'#
for data in (
  select *
  from json_table(l_json, '$[*]' columns #');
-- Now create the column references
-- Initialize a new cursor
   open cur for l_sql;
   -- Get a handle to the cursor ID so we can grab the returned columns
   curid   := dbms_sql.to_cursor_number(cur);
   -- Describe the Select statement output and get the full details.
   dbms_sql.describe_columns(curid, colcnt, desctab);
   --
   -- The following will loop through the resulting columns from the cursor
   -- and output the parts of the JSON_TABLE columns clause
   --
   -- The counter allows us to know when a comma at the front of the line is necessary
   --
   l_count := 0;
   -- Loop through the columns
   for i in 1..colcnt loop
      -- do we include a comma or not
      if l_count > 0 then
         dbms_output.put('      , ');
      else
         dbms_output.put('        ');
      end if;
   -- This bit might be confusing, bu the DBMS_SQL_DESCRIBE_COLUMNS returns the data type for the column as a number
   --   12 = Date
   --    2 = NUMBER
   --    ? = Treat it as a varchar
      dbms_output.put(desctab(i).col_name);
      if desctab(i).col_type = 12 then
         dbms_output.put(' date ');
      elsif desctab(i).col_type = 2 then
         dbms_output.put(' number ');
      else
         dbms_output.put(' varchar2(' || desctab(i).col_max_len || ') ');
      end if;

      dbms_output.put_line(q'# path '$.#' || upper(desctab(i).col_name) || q'#' #');
   -- Increment the counter
      l_count := l_count + 1;
   end loop;
   -- End the JSON_TABLE clause and start the loop for the merge.
   dbms_output.put_line(q'#
   )
) LOOP
   merge into #' || table_name || q'# dest
      using (
         select #');
   -- Iterate through the column list and create the SELECT list for the USING clause
   l_count := 0;
   for m in 1..l_match_list.count loop
      -- Do we include a comma or not
      if l_count > 0 then
         dbms_output.put('         , ');
      else
         dbms_output.put('           ');
      end if;
      -- emit the column to be selected
      dbms_output.put_line('data.' || l_match_list(m) || ' ' || l_match_list(m));
      -- Increment the counter
      l_count := l_count + 1;
   end loop;
   -- The record is selected from dual, basically so we can do the comparison in the whwere clause below.
   dbms_output.put_line(q'#         from dual
      ) src
      on (1 = 1 #');
   -- Here we're emitting the where clause for each of the MATCH columns matching DEST and SRC
   for m in 1..l_match_list.count loop
      dbms_output.put_line('          and dest.' || l_match_list(m) || ' = src.' || l_match_list(m));
   end loop;
   -- End the ON clause with a close parin
   dbms_output.put('       )');
   -- Emit the WHEN MATCHED clause
   dbms_output.put_line(q'#
   when matched then
      update
         set #');
   -- Now itterate through the column list to update when matched.
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
         end if;
         -- Emit the SET line(s)
         dbms_output.put_line('dest.' || l_column_list(c) || ' = data.' || l_column_list(c));
         -- Increment the counter
         l_count := l_count + 1;
      end if;
   end loop;

   -- Emit the WHEN NOT MATCHED clause
   dbms_output.put_line(q'#
   when not matched then
      insert ( #');
   -- Emit the columns into the target portion of the insert statement
   l_count := 0;
   for c in l_column_list.first .. l_column_list.last loop
      -- Again we account for the sparse array problem
      if l_column_list.exists(c) then
         -- Decide whether we output a comma
         if l_count > 0 then
            dbms_output.put('        , ');
         else
            dbms_output.put('          ');
         end if;
         -- Output the column name
         dbms_output.put_line(l_column_list(c));
         l_count := l_count + 1;
      end if;
   end loop;
 -- Don't forget the match columns too.
   for c in l_match_list.first .. l_match_list.last loop
         -- Decide whether we output a comma
         if l_count > 0 then
            dbms_output.put('        , ');
         else
            dbms_output.put('          ');
         end if;
         -- Output the column name
         dbms_output.put_line(l_match_list(c));
         l_count := l_count + 1;
   end loop;
   -- Emit the Values Clause
   dbms_output.put_line(q'#
   )
   values ( #');
   -- Emit the references to the DATA record from the cursor for the VALUES to insert.
   l_count := 0;
   for c in l_column_list.first .. l_column_list.last loop
      -- Sparse Array again
      if l_column_list.exists(c) then
         -- Do we need a comma
         if l_count > 0 then
            dbms_output.put('        , ');
         else
            dbms_output.put('          ');
         end if;
         -- Emit the value
         dbms_output.put_line('data.' || l_column_list(c));
         l_count := l_count + 1;
      end if;
   end loop;
   -- You also need to emit the MATCH colulmn list for an insert.
   for c in l_match_list.first .. l_match_list.last loop
         -- Do we need a comma
         if l_count > 0 then
            dbms_output.put('        , ');
         else
            dbms_output.put('          ');
         end if;
         -- Emit the value
         dbms_output.put_line('data.' || l_match_list(c));
         l_count := l_count + 1;
   end loop;
   -- End the proc
   dbms_output.put_line(q'# );
end loop;

end;
/ #');

--AND WERE DONE

end;
/
spool off