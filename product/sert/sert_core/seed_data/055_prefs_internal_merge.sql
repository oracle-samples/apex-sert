--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:prefs_apex_version endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
declare
  l_count number := 0;
  l_current_sert_apex_version number;
  l_deploy_version number := 24.2;
begin
  -- determine the currently installed sert_apex_version
  -- value 0 indicates a fresh install
  --
  -- scenarios:
  -- a. fresh install
  --    no pref exists -> upsert
  -- b. existing install ( eg, on the deployed verion 24.1 )
  --    pref_value < deploy value
  --    update pref value.
  --    pref value = deployed value -> take no action to update?
  -- existing install previously updated to current/later than the "deployed" sert_version
  --      do nothing.
  -- later in post-install we will look at upgrade steps and updating sert_apex_version. not to be done here...

  select to_number(coalesce(max(pref_value),'0'),'99.9')
  into l_current_sert_apex_version
  from sert_core.prefs
  where pref_key = 'SERT_APEX_VERSION';

  if ( l_current_sert_apex_version < l_deploy_version ) then
    merge into sert_core.prefs dst
    using ( select 'SERT APEX Version' as pref_name, 'SERT_APEX_VERSION' as pref_key, to_char(l_deploy_version,'99.9') as pref_value, 'Y' as internal_yn from dual ) src
    on ( src.pref_key = dst.pref_key)
      when matched then
        update set dst.pref_value = src.pref_value ,dst.internal_yn = src.internal_yn
      when not matched then
        insert (pref_name, pref_key, pref_value,internal_yn)
        values (src.pref_name,src.pref_key,src.pref_value,src.internal_yn);
  end if; --( l_current_sert_apex_version = 0)
end;
/
--rollback not required

--changeset mipotter:prefs_internal_merge endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
begin
    merge into sert_core.prefs dst
    using ( select 'Sert Help URL' as pref_name
                  , 'SERT_HELP_URL' as pref_key
                  , 'https://docs.oracle.com/en/database/oracle/apex/' as pref_value
                  , 'Y' as internal_yn from dual ) src
    on ( src.pref_key = dst.pref_key)
      when matched then
        update set dst.pref_value = src.pref_value ,dst.internal_yn = src.internal_yn
      when not matched then
        insert (pref_name, pref_key, pref_value,internal_yn)
        values (src.pref_name,src.pref_key,src.pref_value,src.internal_yn);

    merge into sert_core.prefs dst
    using ( select 'Release Version' as pref_name
                  , 'RELEASE_VERSION' as pref_key
                  , '24.2.25' as pref_value
                  , 'Y' as internal_yn from dual ) src
    on ( src.pref_key = dst.pref_key)
      when matched then
        update set dst.pref_value = src.pref_value ,dst.internal_yn = src.internal_yn
      when not matched then
        insert (pref_name, pref_key, pref_value,internal_yn)
        values (src.pref_name,src.pref_key,src.pref_value,src.internal_yn);
end;
/

--rollback not required

--changeset mipotter:prefs_ai_internal_merge endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
begin
  -- Default AI to not enabled.
  merge into sert_core.prefs dst
  using ( select 'AI Enabled' as pref_name
                , 'AI_ENABLED' as pref_key
                , 'N' as pref_value
                , 'Y' as internal_yn from dual ) src
  on ( src.pref_key = dst.pref_key)
    when matched then
      update set dst.pref_value = src.pref_value ,dst.internal_yn = src.internal_yn
    when not matched then
      insert (pref_name, pref_key, pref_value,internal_yn)
      values (src.pref_name,src.pref_key,src.pref_value,src.internal_yn);

  -- AI_STATIC_ID, open_ai
  -- put a default AI static ID - this can be changed by any user.
  merge into sert_core.prefs dst
  using ( select 'AI Static ID' as pref_name
                , 'AI_STATIC_ID' as pref_key
                , 'open_ai' as pref_value
                , 'Y' as internal_yn from dual ) src
  on ( src.pref_key = dst.pref_key)
    when matched then
      update set dst.pref_value = src.pref_value ,dst.internal_yn = src.internal_yn
    when not matched then
      insert (pref_name, pref_key, pref_value,internal_yn)
      values (src.pref_name,src.pref_key,src.pref_value,src.internal_yn);

  -- AI Exception Prompt
  merge into sert_core.prefs dst
  using ( select 'AI Exception Prompt' as pref_name
                , 'AI_EXCEPTION_PROMPT' as pref_key
                , 'You are a senior application security expert specializing in OWASP Top 10 vulnerabilities and secure APEX application development. You are reviewing exception justifications submitted by developers for security findings flagged by the APEX-SERT security evaluation tool. The developer believes their application is not at risk despite the flagged finding, and has submitted a written justification. Your job is to assess whether that justification is legitimate, specific, and credible. Apply scoring strictness according to the rule''s severity: - HIGH: The exception must demonstrate a concrete compensating control or a documented architectural decision. A score of 4 or 5 requires an exceptional, specific justification. Vague or generic responses must score 1 or 2. - MEDIUM: A clear and specific rationale is required. Partially relevant responses score 2-3. Well-justified exceptions with specifics score 4-5. - LOW: More flexibility is allowed, but the justification must still be directly relevant to the specific finding. Generic responses score 1-2. {RULE_CONTEXT} Evaluate the quality of the submitted exception justification based on the rule context above. Assign a score from 1 to 5, where: 1 = Poorly written, irrelevant, or dismissive 3 = Partially acceptable - relevant but vague or incomplete 5 = Specific, credible, and well-aligned with the security context Return only a JSON document in this exact format: { "score": <integer from 1 to 5>, "reason": "<1-2 sentence explanation>" } Do not return any text outside the JSON.' as pref_value
                , 'Y' as internal_yn from dual ) src
  on ( src.pref_key = dst.pref_key)
    when matched then
      update set dst.pref_value = src.pref_value ,dst.internal_yn = src.internal_yn
    when not matched then
      insert (pref_name, pref_key, pref_value,internal_yn)
      values (src.pref_name,src.pref_key,src.pref_value,src.internal_yn);
end;
/
--rollback not required
