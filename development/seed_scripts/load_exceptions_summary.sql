set serveroutput on
set feedback on

-- Step 1: Create table if it does not exist
DECLARE
    l_count NUMBER;
BEGIN
    SELECT COUNT(1) INTO l_count
    FROM all_tables
    WHERE owner = 'SERT_CORE'
      AND table_name = 'EXCEPTION_SUMMARIES';

    IF l_count = 0 THEN
        EXECUTE IMMEDIATE q'[
            CREATE TABLE sert_core.exception_summaries (
                rule_key        VARCHAR2(255),
                exception       CLOB,
                exception_count NUMBER,
                score           NUMBER,
                reason          CLOB
            )
        ]';
        DBMS_OUTPUT.PUT_LINE('Table EXCEPTION_SUMMARIES created.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Table EXCEPTION_SUMMARIES already exists, skipping create.');
    END IF;
END;
/

-- Step 2: Load records from the JSON array using SQLcl JavaScript + JDBC
-- Run this script from the development/seed_scripts/ directory,
-- or change 'exceptions_summary.json' below to an absolute path.
script
var Paths        = Java.type('java.nio.file.Paths');
var Files        = Java.type('java.nio.file.Files');
var StringReader = Java.type('java.io.StringReader');

var path    = Paths.get('exceptions_summary.json');
var bytes   = Files.readAllBytes(path);
var content = new java.lang.String(bytes, 'UTF-8');
var rows    = JSON.parse(content);

var sql = 'INSERT INTO sert_core.exception_summaries ' +
          '(rule_key, exception, exception_count, score, reason) ' +
          'VALUES (?, ?, ?, ?, ?)';

var pstmt = conn.prepareStatement(sql);
var count = 0;
var BATCH = 50;

for (var i = 0; i < rows.length; i++) {
    var row = rows[i];
    pstmt.setString(1, row.rule_key        || null);
    pstmt.setCharacterStream(2, new StringReader(row.exception || ''));
    pstmt.setInt   (3, row.exception_count || 0);
    pstmt.setInt   (4, row.score           || 0);
    pstmt.setCharacterStream(5, new StringReader(row.reason    || ''));
    pstmt.addBatch();
    count++;
    if (count % BATCH === 0) { pstmt.executeBatch(); }
}

if (count % BATCH !== 0) { pstmt.executeBatch(); }
pstmt.close();
conn.commit();

print(count + ' records loaded into SERT_CORE.EXCEPTION_SUMMARIES.');
/
