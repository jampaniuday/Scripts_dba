select sum(t.FREE_MB)/1024 from v$asm_disk t where t.GROUP_NUMBER=2;

select distinct(O.owner),O.tablespace_name,SUM(O.BYTES) TAM_MB   
from dba_segments o,Dba_Users u 
where o.owner in (select  distinct(t.username) 
from Dba_Users T ) and o.owner=u.username 
GROUP BY O.owner, O.tablespace_name ;

select sum(bytes)/1024/1024/1024 || ' MBytes' from dba_segments;

SELECT 'ALTER TABLE ' || S.owner,S.segment_name,S.tablespace_name,S.bytes/1024/1024/1024,s.partition_name FROM DBA_SEGMENTS S WHERE S.owner LIKE 'ADM_SGV%' AND S.segment_type IN('TABLE','TABLE PARTITION') ORDER BY 4 DESC
SELECT S.owner,S.segment_name,S.tablespace_name,S.bytes/1024/1024/1024 FROM DBA_TABLES S WHERE S.owner LIKE 'ADM_SGV%' AND S.segment_type='TABLE'

select * from dba_tables t where t.OWNER like 'ADM_SGV%'
