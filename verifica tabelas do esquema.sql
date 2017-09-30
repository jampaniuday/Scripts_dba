declare
   cursor crs_tabelas is
      select m.table_name 
      from user_all_tables m order by 1;

begin

	 for x in crs_tabelas
	 loop
			dbms_output.put_line(x.table_name);
	 
	 end loop;
    

end;
