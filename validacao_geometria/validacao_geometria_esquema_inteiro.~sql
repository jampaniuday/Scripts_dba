declare
v_owner varchar2(60):= upper('&usuario');

cursor tab_geo  is 
  select d.column_name campo_id, t.table_name tabela, c.column_name campo_geo
   from all_tables t, all_tab_columns c,
        (select t.constraint_name,t.table_name,f.column_name from all_constraints t, all_cons_columns f
        where t.owner=f.owner and t.constraint_name=f.constraint_name and t.table_name=f.table_name
        and t.owner=v_owner) d 
         where c.table_name = t.table_name
         and c.data_type = 'SDO_GEOMETRY'
         and t.owner = v_owner
         and t.owner = c.owner and t.table_name=c.table_name and t.table_name=d.table_name;
begin
for v_cursor in tab_geo loop
dbms_output.put_line('select * from (');
dbms_output.put_line('       select '||''''||v_cursor.tabela||''''||'TABELA,' ||v_cursor.campo_id||' CAMPO_ID,'); 
dbms_output.put_line('       desc_erro_geom(sdo_geom.validate_geometry_with_context('||v_cursor.campo_geo||',0.01001))ERRO');
dbms_output.put_line('     from '||v_owner||'.'||v_cursor.tabela);
dbms_output.put_line(') where erro!= ''TRUE''');
dbms_output.put_line('');
dbms_output.put_line('Union');
dbms_output.put_line('');

end loop;
end;
