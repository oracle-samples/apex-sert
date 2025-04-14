--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:prefs_merge_1722422231485 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
declare
  l_json clob;
begin

  -- Load data in JSON object
  l_json := q'!
[
{
"PREF_NAME":"Log Evaluations"
,"PREF_KEY":"LOG_EVALUATIONS"
,"PREF_VALUE":"N"
}
,{
"PREF_NAME":"Log Imports"
,"PREF_KEY":"LOG_IMPORTS"
,"PREF_VALUE":"Y"
}
,{
"PREF_NAME":"Low Score Value"
,"PREF_KEY":"LOW_SCORE_VALUE"
,"PREF_VALUE":"70"
}
,{
"PREF_NAME":"High Score Value"
,"PREF_KEY":"HIGH_SCORE_VALUE"
,"PREF_VALUE":"95"
}
,{
"PREF_NAME":"AOP URL"
,"PREF_KEY":"AOP_URL"
,"PREF_VALUE":"${sert_aop_url}"
}
,{
"PREF_NAME":"EMAIL FROM"
,"PREF_KEY":"EMAIL_FROM"
,"PREF_VALUE":"${sert_email_from}"
}
,{
"PREF_NAME":"OCI Region Name"
,"PREF_KEY":"OCI_REGION_NAME"
,"PREF_VALUE":"ap-mumbai-1"
}
,{
"PREF_NAME":"OCI Docgen Function OCID"
,"PREF_KEY":"OCI_DOCGEN_FUNCTION_OCID"
,"PREF_VALUE":"ocid1.fnfunc.oc1.ap-mumbai-1.aaaaaaaaa2rjhvcb6bqgpnxmjpqpyvctkgqwxclewxihse4t2525of3kbypq"
}
,{
"PREF_NAME":"OCI Bucket Namespace"
,"PREF_KEY":"OCI_BUCKET_NAMESPACE"
,"PREF_VALUE":"idvvfekwvhut"
}
,{
"PREF_NAME":"OCI Bucket Name"
,"PREF_KEY":"OCI_BUCKET_NAME"
,"PREF_VALUE":"docgen-demo"
}
,{
"PREF_NAME":"OCI Bucket Output Folder"
,"PREF_KEY":"OCI_BUCKET_OUTPUT_FOLDER"
,"PREF_VALUE":"out/"
}
,{
"PREF_NAME":"OCI Bucket Template Folder"
,"PREF_KEY":"OCI_BUCKET_TEMPLATE_FOLDER"
,"PREF_VALUE":"template/"
}
]

!';

for data in (
  select *
  from json_table(l_json, '$[*]' columns
        PREF_NAME varchar2(250)  path '$.PREF_NAME'
      , PREF_KEY varchar2(250)  path '$.PREF_KEY'
      , PREF_VALUE varchar2(4000)  path '$.PREF_VALUE'

   )
) LOOP
   merge into sert_core.prefs dest
      using (
         select
           data.pref_key pref_key
         from dual
      ) src
      on (1 = 1
          and dest.pref_key = src.pref_key
       )
   when matched then
      update
         set
          dest.pref_name = data.pref_name
        , dest.pref_value = data.pref_value

   when not matched then
      insert (
          pref_name
        , pref_value
        , pref_key

   )
   values (
          data.pref_name
        , data.pref_value
        , data.pref_key
 );
end loop;

end;
/
--rollback not required
