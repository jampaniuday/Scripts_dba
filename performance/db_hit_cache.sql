select round((1-(pr.value/(bg.value+cg.value)))*100,2)
from v$sysstat pr, v$sysstat bg, v$sysstat cg
where pr.name='physical reads'
and bg.name='db block gets'
and cg.name='consistent gets'

SELECT NAME, VALUE
  FROM V$SYSSTAT
WHERE NAME IN ('db block gets from cache', 'consistent gets from cache', 'physical reads cache');

select sum(value) from v$sga;

select value from v$pgastat where name like 'total PGA allocated';
select 
(select sum(value) from v$sga)  + 
(select value from v$pgastat where name like 'total PGA allocated') memory 
from dual


SELECT MACHINE, PROGRAM, COUNT(*) FROM V$SESSION GROUP BY MACHINE, PROGRAM
