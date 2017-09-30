--QUANTIDADE DE TABELAS

select COUNT(*) from dba_tab_cols c 
where c.data_type='SDO_GEOMETRY' AND C.OWNER IN ('ETWEB_PA','SLGEO_PA')

select COUNT(*) from dba_tab_cols c 
where c.data_type='SDO_GEOMETRY' AND C.OWNER IN ('SLTGEOPA','SIMLAMTEC')




--tamanho das tabelas espaciais
select O.owner,O.tablespace_name,SUM(O.BYTES)/1024 /1024 TAM_MB   
from dba_segments o , DBA_TAB_COLS C
WHERE O.owner IN('ETWEB_PA','SLGEO_PA') AND C.TABLE_NAME= O.segment_name AND c.data_type='SDO_GEOMETRY'
GROUP BY O.owner, O.tablespace_name


