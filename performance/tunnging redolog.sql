--statistic REDO BUFFER ALLOCATION RETRIES quantidade de vezes que o processo de 
--usuario espera por espaço no redo log bufffer deve ser proximo de zero

SELECT NAME, VALUE
FROM V$SYSSTAT
WHERE NAME = 'redo buffer allocation retries';


SELECT a.name,b.value
     FROM   v$statname a,v$sysstat b
     WHERE  a.statistic# = b.statistic#
        AND a.name like '%redo%';

  SELECT SUM(value) "Redo Buffer Waits"
     FROM v$sysstat
     WHERE  name = 'redo log space requests';        
        
        
 SELECT SUM(value) "Redo Buffer Waits"
     FROM v$sysstat
     WHERE  name = 'redo log space wait time';
     
SELECT TO_CHAR(FIRST_TIME,'YYYY-MM-DD') DAY,
TO_CHAR(FIRST_TIME,'HH24') HOUR,
COUNT(*) TOTAL
FROM V$LOG_HISTORY where trunc(FIRST_TIME) > sysdate -1
GROUP BY TO_CHAR(FIRST_TIME,'YYYY-MM-DD'),TO_CHAR(FIRST_TIME,'HH24')
ORDER BY TO_CHAR(FIRST_TIME,'YYYY-MM-DD'),TO_CHAR(FIRST_TIME,'HH24')
ASC;     

select * from V$INSTANCE_RECOVERY

Select Round(e.value/s.value,5) "Redo Log Ratio"
From v$sysstat s, v$sysstat e
Where s.name = 'redo log space requests'
and e.name = 'redo entries'

select	v1.value as redo_buff_alloc_retries, v2.value as redo_entries,
		trunc(v1.value/v2.value,4) as pct_buff_alloc_retries
	from 	v$sysstat v1, v$sysstat v2
	where	v1.name = 'redo buffer allocation retries'
	and	v2.name = 'redo entries';

/* If there are log file switch waits because of log switches, it indicates disk I/O contention.
  Check that the redo log files are stored on separated and fast devices.
  Consider increase the size of the redo log files
*/    
select 	event, total_waits, time_waited, average_wait
	from	v$system_event
	where	event like 'log file switch completion'  
  
select 	event, total_waits, time_waited, average_wait
	from	v$system_event
	where	event like 'log file switch (checkpoint incomplete)';
  
select 	event, total_waits, time_waited, average_wait
	from	v$system_event
	where	event like 'log file switch (archiving needed)';  
  
select value from v$parameter where name = 'db_block_checksum';  
  
