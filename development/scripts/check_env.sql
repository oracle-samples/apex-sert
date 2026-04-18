select * from nls_session_parameters where parameter in ('NLS_LANGUAGE','NLS_TERRITORY','NLS_NUMERIC_CHARACTERS');

select pref_key,pref_value from sert_core.prefs
 where PREF_KEY in ('SERT_APEX_VERSION','RELEASE_VERSION');

select * from sert_pub.apex_version_pub_v;