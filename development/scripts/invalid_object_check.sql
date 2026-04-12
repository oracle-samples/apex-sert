set serverout on

declare
  type t_tab is table of all_objects%rowtype;
  l_tab            t_tab;
  l_set            clob;
  l_chr_lf         varchar2(1)      := chr(10);
  l_invalid_object varchar2(255);
  l_sep            varchar2(50)     := '--------------------------------------------------';
begin
  select ao.*
    bulk collect into l_tab
  from all_objects ao
  join (
    select trim(column_value) as schema_name
    from table(apex_string.split(property('PROJECT.PROJECT_SCHEMAS'), ':'))
  ) ps
    on ps.schema_name = ao.owner
  where ao.status != 'VALID'
    and ao.owner != 'INT_SUPPORT_PUB'
  order by ao.owner, object_name;

  if l_tab.exists(1) then

    dbms_lob.createtemporary(lob_loc => l_set, cache => false);

    for l_idx in 1 .. l_tab.count loop

      l_invalid_object := l_tab(l_idx).object_type || ' : ' || l_tab(l_idx).owner || '.' || l_tab(l_idx).object_name;
      dbms_output.put_line('Invalid Object: ' || l_invalid_object);
      dbms_lob.writeappend(lob_loc => l_set, amount => length(l_invalid_object || l_chr_lf), buffer => l_invalid_object || l_chr_lf);

    end loop; -- for l_idx in 1 .. l_tab.count

    raise_application_error(
      -20001,
      'Invalid objects exist'
        || l_chr_lf || l_sep
        || l_chr_lf || substr(l_set, 1, 32767)
        || l_chr_lf || l_sep
    );

  end if; -- l_tab.exists(1)
end;
/
