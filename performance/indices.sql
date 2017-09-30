
SPOOL c:\indices3.txt 
set colsep ","; 
SET HEADING On; 
SET NEWPAGE 1; 
set linesize 240
set pagesize 260
 
clear breaks
clear computes
 
break on TABLE_NAME skip 2 ON INDEX_NAME ON INDEX_TYPE ON MB
compute sum of NR_EXEC on TABLE_NAME SKIP 2
compute sum of MB on TABLE_NAME SKIP 2
 
 
SET TIMI OFF
set linesize 340
set pagesize 10000
col OWNER noprint
col TABLE_NAME for a30 heading 'Table name'
col INDEX_NAME for a30 heading 'Index name'
col INDEX_TYPE for a30 heading 'Index type'
col NR_EXEC for 9G999G990 heading 'Executions'
col MB for 999G990D90 Heading 'Index|Size MB' justify  right
 
        WITH Q AS (
                SELECT
                       S.OWNER                  A_OWNER,
                       TABLE_NAME               A_TABLE_NAME,
                       INDEX_NAME               A_INDEX_NAME,
                       INDEX_TYPE               A_INDEX_TYPE,
                       SUM(S.bytes) / 1048576   A_MB
                  FROM DBA_SEGMENTS S,
                       DBA_INDEXES  I
                 WHERE S.OWNER =  'ADM_SGV_TRN'
                   AND I.OWNER =  'ADM_SGV_TRN'
                   AND I.table_name IN('TRANSACAO','TRANSACAO_VALORADA','TRANSACAO_VALORADA_SUMARIZADA')
                   AND INDEX_NAME = SEGMENT_NAME
                 GROUP BY S.OWNER, TABLE_NAME, INDEX_NAME, INDEX_TYPE
                HAVING SUM(S.BYTES) > 1048576 * 100
        )
        SELECT /*+ NO_QUERY_TRANSFORMATION(S) */
               A_OWNER                                    OWNER,
               A_TABLE_NAME                               TABLE_NAME,
               A_INDEX_NAME                               INDEX_NAME,
               A_INDEX_TYPE                               INDEX_TYPE,
               A_MB                                       MB,
               COUNT(OPERATION)                           NR_EXEC
         FROM  Q,
               DBA_HIST_SQL_PLAN d
         WHERE
               D.OBJECT_OWNER(+)= q.A_OWNER AND
               D.OBJECT_NAME(+) = q.A_INDEX_NAME
        GROUP BY
               A_OWNER,
               A_TABLE_NAME,
               A_INDEX_NAME,
               A_INDEX_TYPE,
               A_MB
              
        ORDER BY
               A_OWNER,
               A_TABLE_NAME,
               A_INDEX_NAME,
               A_INDEX_TYPE,
               NR_EXEC DESC
;
 
PROMPT Showed only indexes in &&1 schema whose size > &&2 MB in period:
SET HEAD OFF;
select to_char (min(BEGIN_INTERVAL_TIME), 'DD.MM.YYYY')
       || '-' ||
       to_char (max(END_INTERVAL_TIME), 'DD.MM.YYYY')
from dba_hist_snapshot;
 
SET HEAD ON
SET TIMI ON
spool off;
