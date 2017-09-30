declare


   
   cursor crs_tabesp is 
      select t.table_name, c.COLUMN_NAME
   from all_tables t, all_tab_columns c
         where c.TABLE_NAME = t.table_name
         and c.DATA_TYPE = 'SDO_GEOMETRY'
         and t.owner = '&usuario'
         and t.owner = c.OWNER

minus

   select m.TABLE_NAME, m.COLUMN_NAME from all_sdo_geom_metadata m
   where m.OWNER = '&usuario';

begin

   

   --Inserindo no metadata do mdsys...
   for cursor_tabesp in crs_tabesp loop
      dbms_output.put_line('INSERT INTO USER_SDO_GEOM_METADATA VALUES ('''||cursor_tabesp.table_name||''','''||cursor_tabesp.column_name||''',');
      dbms_output.put_line(' mdsys.sdo_dim_array(mdsys.SDO_DIM_ELEMENT(''X'', -2147483648, 2147483647, 5e-6),mdsys.SDO_DIM_ELEMENT(''Y'', -2147483648, 2147483647, 5e-6)) ,null);');

   end loop;
   
   DBMS_OUTPUT.put_line('COMMIT;');
  
end;
