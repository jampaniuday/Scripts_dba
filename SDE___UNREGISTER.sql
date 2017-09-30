/*
declare
   v_esquema  varchar2(30):=upper('&esquema');
   v_tabela   varchar2(30):=upper('&tabela');
   v_id       number(10);
   v_idstr    varchar2(10);
begin
   dbms_output.put_line('delete from sde.geometry_columns t where t.f_table_schema='''||v_esquema||''' and t.f_table_name='''||v_tabela||''';');
   dbms_output.put_line('delete from sde.layers t where t.owner='''||v_esquema||''' and t.table_name='''||v_tabela||''';');
   dbms_output.put_line('delete from sde.spatial_references s where s.srid not in');
   dbms_output.put_line('(select distinct t.srid from sde.geometry_columns t   union   select distinct r.srid from sde.layers r);');
   dbms_output.put_line('delete from sde.table_registry t where t.owner='''||v_esquema||''' and t.table_name='''||v_tabela||''';');
   dbms_output.put_line('delete from sde.column_registry t where t.owner='''||v_esquema||''' and t.table_name='''||v_tabela||''';');
   dbms_output.put_line('delete from sde.gdb_usermetadata t where t.owner='''||v_esquema||''' and upper(t.name)='''||v_tabela||''';');

   begin
     select id into v_id from sde.gdb_objectclasses where owner=v_esquema and upper(name)=v_tabela;
     v_idstr:=to_char(v_id);
     dbms_output.put_line('delete from sde.gdb_featureclasses t where t.objectclassid='||v_idstr||';');
     dbms_output.put_line('delete from sde.gdb_fieldinfo t where t.classid='||v_idstr||';');
     dbms_output.put_line('delete from sde.gdb_objectclasses t where t.id='||v_idstr||';');
     dbms_output.put_line('');
   exception
     when others then
       dbms_output.put_line('');
   end;
   dbms_output.put_line('commit;');
end;
*/















declare
   v_esquema  varchar2(30):=upper('&esquema');
   v_tabela   varchar2(30):=upper('&tabela');

   v_id       number(10);
   v_idstr    varchar2(10);
begin
-- for i in (SELECT TABLE_NAME FROM ALL_SDO_GEOM_METADATA WHERE OWNER=v_esquema) loop
--   v_tabela:=i.table_name;
   
   dbms_output.put_line('delete from sde.geometry_columns t where t.f_table_schema='''||v_esquema||''' and t.f_table_name='''||v_tabela||''';');
   dbms_output.put_line('delete from sde.layers t where t.owner='''||v_esquema||''' and t.table_name='''||v_tabela||''';');
   dbms_output.put_line('delete from sde.table_registry t where t.owner='''||v_esquema||''' and t.table_name='''||v_tabela||''';');
   dbms_output.put_line('delete from sde.column_registry t where t.owner='''||v_esquema||''' and t.table_name='''||v_tabela||''';');
   dbms_output.put_line('delete from sde.gdb_usermetadata t where t.owner='''||v_esquema||''' and upper(t.name)='''||v_tabela||''';');

   begin
     select id into v_id from sde.gdb_objectclasses where owner=v_esquema and upper(name)=v_tabela;
     v_idstr:=to_char(v_id);
     dbms_output.put_line('delete from sde.gdb_featureclasses t where t.objectclassid='||v_idstr||';');
     dbms_output.put_line('delete from sde.gdb_fieldinfo t where t.classid='||v_idstr||';');
     dbms_output.put_line('delete from sde.gdb_objectclasses t where t.id='||v_idstr||';');
   exception
     when others then
       dbms_output.put_line('');
   end;
   
   begin
     select layer_id into v_id from sde.layers where owner=v_esquema and upper(table_name)=v_tabela;
     v_idstr:=to_char(v_id);
     dbms_output.put_line('drop trigger '||v_esquema||'.TRG_SDE_IDLAYER_'||v_idstr||';');
   exception
     when others then
       dbms_output.put_line('');
   end;
   
   dbms_output.put_line('');
   dbms_output.put_line('commit;');
   dbms_output.put_line('');
   dbms_output.put_line('');
   dbms_output.put_line('');
   dbms_output.put_line('');
-- end loop;
 dbms_output.put_line('-- Limpa todas as referências espaciais que não pertencem à nenhuma feature.');
 dbms_output.put_line('delete from sde.spatial_references s where s.srid not in');
 dbms_output.put_line('(select distinct t.srid from sde.geometry_columns t   union   select distinct r.srid from sde.layers r);');
 dbms_output.put_line('commit;');
end;
