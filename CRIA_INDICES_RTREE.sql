declare
   cursor crs_tabelas is
      select m.table_name,
		   m.column_name,
         'IDXR_'||'&nmindice'||'_' || substr(m.table_name, 1, 3) ||
         substr(m.table_name, instr(m.table_name, '_', -1) + 1, 4) || rownum index_name
      from all_sdo_geom_metadata m
      where m.OWNER = '&usuario'
      and 
      (not exists
         (
      
      SELECT I.table_name
      FROM ALL_INDEXES I
      WHERE i.ityp_name = 'SPATIAL_INDEX'
      and m.TABLE_NAME = i.table_name
      and m.OWNER = i.owner
         )
      )
      order by m.TABLE_NAME;

begin

	 for x in crs_tabelas
	 loop
			dbms_output.put_line('CREATE INDEX ' || x.index_name ||
													 ' ON &usuario.' || x.table_name || '(' ||
													 x.column_name ||
													 ') INDEXTYPE IS MDSYS.SPATIAL_INDEX PARAMETERS (''TABLESPACE=&tbsindex SDO_INDX_DIMS=2'');');
	 
	 end loop;
    

end;
