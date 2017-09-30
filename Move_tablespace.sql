declare 
  
  Usu varchar2(100) := '&usuario';
  TbsData varchar2(100) := '&tbs'||'_DATA';
  TbsIndex varchar2(100) := '&tbs'||'_INDEX';

  cursor tabelas is 
    select t.table_name nome
    from all_all_tables t
    where
      t.owner like Usu
      and t.tablespace_name <> TbsData;
      
  cursor indices is 
    select i.index_name nome
    from all_indexes i
    where i.owner = Usu 
    and i.tablespace_name <> TbsIndex;
      
      
begin

  for t in tabelas loop
     dbms_output.put_line('alter table '|| Usu ||'.'|| t.nome ||' move tablespace '|| TbsData ||';');
  end loop;

  for t in indices loop
    dbms_output.put_line('alter index '|| Usu ||'.'|| t.nome ||' rebuild tablespace '|| TbsIndex ||';');
  end loop;
end;
/
