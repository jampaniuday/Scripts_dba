SELECT 'ALTER TABLE ' || S.owner || '.' ||  S.segment_name || ' COMPRESS FOR ALL OPERATIONS;'
  FROM DBA_SEGMENTS S
 WHERE S.owner LIKE 'ADM_SGV%'
   AND S.segment_type IN ('TABLE', 'TABLE PARTITION') AND S.bytes > 10737418240

