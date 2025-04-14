set serverout on

DECLARE
    TYPE t_tab IS TABLE OF all_objects%ROWTYPE;
    l_tab t_tab;
    l_set CLOB;
    l_chr_lf VARCHAR2(1) := CHR(10);
    l_invalid_object VARCHAR2(255);
    l_sep VARCHAR2(50) := '--------------------------------------------------';
BEGIN
    SELECT ao.*
        BULK COLLECT INTO l_tab
    FROM all_objects ao
    JOIN (SELECT trim(column_value) as schema_name
            FROM TABLE(APEX_STRING.SPLIT(property('PROJECT.PROJECT_SCHEMAS'), ':'))) ps
            ON ps.schema_name = ao.owner
    WHERE ao.status != 'VALID'
        AND ao.owner != 'INT_SUPPORT_PUB'
    ORDER BY ao.owner, object_name;

    IF l_tab.exists(1) THEN
        DBMS_LOB.CREATETEMPORARY(lob_loc => l_set, cache => FALSE);
        FOR idx IN 1 .. l_tab.count
        LOOP
            l_invalid_object := l_tab(idx).object_type || ' : ' || l_tab(idx).owner || '.' || l_tab(idx).object_name;
            DBMS_OUTPUT.PUT_LINE('Invalid Object: ' || l_invalid_object);
            DBMS_LOB.WRITEAPPEND(lob_loc => l_set, amount => LENGTH(l_invalid_object || l_chr_lf), buffer => l_invalid_object || l_chr_lf);
        END LOOP;
        RAISE_APPLICATION_ERROR(
            -20001,
            'Invalid objects exist'
                || l_chr_lf || l_sep
                || l_chr_lf || SUBSTR(l_set, 1, 32767)
                || l_chr_lf || l_sep
        );
    END IF;
END;
/