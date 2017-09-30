select s.username, p.spid os_process_id, p.pid oracle_process_id
  from v$session s, v$process p
 where s.paddr = p.addr
   and s.username = 'ADM_SGV' and s.MACHINE='ser018052007'
