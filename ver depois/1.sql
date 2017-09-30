select 'ALTER TABLE ' || T.owner || '.' || T.segment_name ||
       ' MOVE TABLESPACE CSF_DATA;'
  from dba_segments t
 where t.tablespace_name = 'CSF_DATA'
   AND T.segment_type = 'TABLE'

select 'ALTER INDEX  ' || T.owner || '.' || T.segment_name ||
       '  REBUILD TABLESPACE CSF_DATA ONLINE;'
  from dba_segments t
 where t.tablespace_name = 'CSF_DATA'
   AND T.segment_type = 'INDEX'

select 'ALTER TABLE ' || S.owner || '.' || S.TABLE_NAME ||
       ' MOVE lob(' || S.COLUMN_NAME  || ')STORE AS (TABLESPACE CSF_DATA);'
  from dba_lobs S
 where S.tablespace_name = 'CSF_DATA'

