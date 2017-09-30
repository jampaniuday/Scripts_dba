select a.sid,a.username
  ,a.opname
  ,b.machine
  ,b.osuser
  ,b.machine
  ,to_char(round((a.sofar * 100) / a.totalwork, 2), '990D00') as perc
  ,c.sql_text
 from v$session_longops a
  join v$session b on (a.sid = b.sid)
  left join v$sqlarea c on (b.sql_id = c.sql_id)
 where a.totalwork != 0
  and a.sofar != totalwork
 order by b.program;
