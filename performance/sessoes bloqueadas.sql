select distinct a.osuser,
                a.username,
                a.machine,
                a.sid,
                a.serial#,
                'alter system kill session ' || chr(39) || a.sid || ',' ||
                a.serial# || chr(39) || ' immediate;' as comando_oracle,
                'kill -9 ' || b.spid as comando_so,
                blocking_session bloqueador
  from gv$session a
  join gv$process b
    on (a.inst_id = b.inst_id and a.paddr = b.addr)
 where blocking_session is not null;
