/*declare
*/   /*cursor crs_tabelas is
      select m.table_name,
       m.column_name,M.DATA_TYPE,M.DATA_LENGTH,M.DATA_PRECISION
       from DBA_TAB_COLS m
      where m.OWNER = 'ETWEB_PA' AND M.DATA_TYPE <> 'BLOB' AND M.DATA_TYPE <> 'CLOB'
      order by m.TABLE_NAME;

  
  cursor crs_colunas (teste Varchar2)is
      select m.table_name,
       m.column_name,M.DATA_TYPE,M.DATA_LENGTH,M.DATA_PRECISION
       from DBA_TAB_COLS m
      where m.OWNER = 'ETWEB_PA' AND M.DATA_TYPE <> 'BLOB' AND M.DATA_TYPE <> 'CLOB'
      order by m.TABLE_NAME;*/


/*begin*/

/*   for x in crs_tabelas
   loop
      dbms_output.put_line('CREATE TABLE ' || x.TABLE_name ||'( '  ||
  
   for z in crs_colunas  loop
   
       x.COLUMN_NAME || ' (' ||
       x.DATA_TYPE || '(' || x.DATA_LENGTH || '),'
                           );
   
  end loop; 
   end loop; */
   declare
   begin
   for i in (select  t.table_name from USER_all_tables t  ) loop
   
   
       dbms_output.put_line('create table ' || i.table_name ||'( ');    
        
      for j in (select * from user_tab_cols t where t.table_name like t.table_name AND t.DATA_TYPE <> 'BLOB' AND t.DATA_TYPE <> 'CLOB' ) loop
      
       dbms_output.put_line(j.column_name || ' ' ||j.data_type ||'('|| j.data_length || '),' );    
      
      end loop;
   
   end loop;
   

end;
