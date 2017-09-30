select t.EVENT,t.TOTAL_WAITS,t.TIME_WAITED from v$system_event t where t.WAIT_CLASS <> 'Idle' order by 3 desc;

select * from v$session_event e,v$session s where e.WAIT_CLASS = 'DFS lock handle' and e.SID = s.SID order by 5 desc;
