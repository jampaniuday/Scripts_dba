select sid ,event, total_waits, total_timeouts, average_wait, time_waited
  from v$session_event
 where wait_class <> 'Idle'
 order by 6 desc;
