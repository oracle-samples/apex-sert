--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:risks_merge_1722422316221 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ 
declare
  l_json clob;
begin

  -- Load data in JSON object
  l_json := q'!
[
{
"RISK_CODE":"A01-2021"
,"RISK_NAME":"Broken Access Control"
,"URL":"https:\/\/owasp.org\/Top10\/A01_2021-Broken_Access_Control\/"
}
,{
"RISK_CODE":"A02-2021"
,"RISK_NAME":"Cryptographic Failures"
,"URL":"https:\/\/owasp.org\/Top10\/A02_2021-Cryptographic_Failures\/"
}
,{
"RISK_CODE":"A03-2021"
,"RISK_NAME":"Injection"
,"URL":"https:\/\/owasp.org\/Top10\/A03_2021-Injection\/"
}
,{
"RISK_CODE":"A04-2021"
,"RISK_NAME":"Insecure Design"
,"URL":"https:\/\/owasp.org\/Top10\/A04_2021-Insecure_Design\/"
}
,{
"RISK_CODE":"A05-2021"
,"RISK_NAME":"Security Misconfiguration"
,"URL":"https:\/\/owasp.org\/Top10\/A05_2021-Security_Misconfiguration\/"
}
,{
"RISK_CODE":"A06-2021"
,"RISK_NAME":"Vulnerable and Outdated Components"
,"URL":"https:\/\/owasp.org\/Top10\/A06_2021-Vulnerable_and_Outdated_Components\/"
}
,{
"RISK_CODE":"A07-2021"
,"RISK_NAME":"Identification and Authentication Failures"
,"URL":"https:\/\/owasp.org\/Top10\/A07_2021-Identification_and_Authentication_Failures\/"
}
,{
"RISK_CODE":"A08-2021"
,"RISK_NAME":"Software and Data Integrity Failures"
,"URL":"https:\/\/owasp.org\/Top10\/A08_2021-Software_and_Data_Integrity_Failures\/"
}
,{
"RISK_CODE":"A09-2021"
,"RISK_NAME":"Security Logging and Monitoring Failures"
,"URL":"https:\/\/owasp.org\/Top10\/A09_2021-Security_Logging_and_Monitoring_Failures\/"
}
,{
"RISK_CODE":"A10-2021"
,"RISK_NAME":"Server-Side Request Forgery"
,"URL":"https:\/\/owasp.org\/Top10\/A10_2021-Server-Side_Request_Forgery_%28SSRF%29\/"
}
]

!';

for data in (
  select *
  from json_table(l_json, '$[*]' columns
        RISK_CODE varchar2(250)  path '$.RISK_CODE'
      , RISK_NAME varchar2(250)  path '$.RISK_NAME'
      , URL varchar2(250)  path '$.URL'

   )
) LOOP
   merge into sert_core.risks dest
      using (
         select
           data.risk_code risk_code
         from dual
      ) src
      on (1 = 1
          and dest.risk_code = src.risk_code
       )
   when matched then
      update
         set
          dest.risk_name = data.risk_name
        , dest.url = data.url

   when not matched then
      insert (
          risk_name
        , url
        , risk_code

   )
   values (
          data.risk_name
        , data.url
        , data.risk_code
 );
end loop;

end;
/
--rollback not required
