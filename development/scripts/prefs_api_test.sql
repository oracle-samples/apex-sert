-- prefs_api test harness
-- Purpose: Exercise sert_core.prefs_api pref_true, pref_value, and upsert_pref.
-- How to run: @development/scripts/prefs_api_test.sql (ensure serveroutput is enabled)

set serveroutput on size unlimited

declare
    -- Variables used by the test harness.
    l_ai_enabled_result     boolean;
    l_ai_enabled_text       varchar2(5);
    l_high_score_val_before sert_core.prefs.pref_value%type;
    l_high_score_val_after  sert_core.prefs.pref_value%type;
begin
    -- Read existing HIGH_SCORE_VALUE (may be null or not present).
    begin
        l_high_score_val_before := sert_core.prefs_api.pref_value('HIGH_SCORE_VALUE');
    exception
        when others then
            -- Preference not found or unexpected error; continue with upsert.
            l_high_score_val_before := null;
    end;

    -- Upsert preference: name "High Score Value", key "HIGH_SCORE_VALUE", value "96", internal_yn = 'N'.
    sert_core.prefs_api.upsert_pref(
        p_pref_name   => 'High Score Value',
        p_pref_key    => 'HIGH_SCORE_VALUE',
        p_pref_value  => '95',
        p_internal_yn => 'N');

    -- Read updated value.
    l_high_score_val_after := sert_core.prefs_api.pref_value('HIGH_SCORE_VALUE');

    -- Evaluate AI_ENABLED flag via pref_true.
    l_ai_enabled_result := sert_core.prefs_api.pref_true('AI_ENABLED');

    if ( l_ai_enabled_result ) then
        l_ai_enabled_text := 'TRUE';
    else
        l_ai_enabled_text := 'FALSE';
    end if; -- l_ai_enabled_result

    -- Report results.
    dbms_output.put_line('prefs_api test harness results:');
    dbms_output.put_line('--------------------------------');
    dbms_output.put_line('pref_true(''AI_ENABLED'') = ' || l_ai_enabled_text);
    dbms_output.put_line('pref_value(''HIGH_SCORE_VALUE'') before upsert = ' || nvl(l_high_score_val_before, '<NULL>'));
    dbms_output.put_line('upsert_pref(''High Score Value'', ''HIGH_SCORE_VALUE'', ''96'', ''N'') completed.');
    dbms_output.put_line('pref_value(''HIGH_SCORE_VALUE'') after upsert = ' || nvl(l_high_score_val_after, '<NULL>'));
exception
    when others then
        dbms_output.put_line('Unhandled error in prefs_api test harness: ' || sqlerrm);
        raise;
end;
/
