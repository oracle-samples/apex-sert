--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:prefs_merge_1722422231485 endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
begin
    merge into sert_core.prefs dst
    using ( select 'Log Evaluations' as pref_name
            , 'LOG_EVALUATIONS' as pref_key
            , 'N' as pref_value
            from dual
            union select 'Log Imports' as pref_name
            , 'LOG_IMPORTS' as pref_key
            , 'N' as pref_value
            from dual
            union select 'Low Score Value' as pref_name
            , 'LOW_SCORE_VALUE' as pref_key
            , '70' as pref_value
            from dual
            union select 'High Score Value' as pref_name
            , 'HIGH_SCORE_VALUE' as pref_key
            , '95' as pref_value
            from dual
            union select 'AOP URL' as pref_name
            , 'AOP_URL' as pref_key
            , '${sert_aop_url}' as pref_value
            from dual
            where '${sert_aop_url}' is not null
            union select 'EMAIL FROM' as pref_name
            , 'EMAIL_FROM' as pref_key
            , '${sert_email_from}' as pref_value
            from dual
            where '${sert_email_from}' is not null
            -- union select 'EVALUALATION HISTORY' as pref_name
            -- , 'EVAL_HISTORY' as pref_key
            -- , 'N' as pref_value
            -- from dual
    ) src
    on ( src.pref_key = dst.pref_key)
      when matched then
        update set dst.pref_value = src.pref_value
      when not matched then
        insert (pref_name, pref_key, pref_value)
        values (src.pref_name,src.pref_key,src.pref_value);
end;
/
--rollback not required

--changeset mipotter:050_prefs_merge_log_eval_history endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
begin
        sert_core.prefs_api.upsert_pref(
            p_pref_name   => 'Log Evaluation History',
            p_pref_key    => 'LOG_EVAL_HISTORY',
            p_pref_value  => 'N',
            p_internal_yn => 'N');
end;
/
--changeset mipotter:050_prefs_merge_log_eval_result_history endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/ stripComments:false
begin
        sert_core.prefs_api.upsert_pref(
            p_pref_name   => 'Log Eval Result History',
            p_pref_key    => 'LOG_EVAL_RESULT_HISTORY',
            p_pref_value  => 'N',
            p_internal_yn => 'N');
end;
/

--rollback not required