select * from v$PGASTAT 

SELECT  tablespace, SUM(blocks)*8192/1024/1024 mb, count(*) users
FROM    v$sort_usage
group by  tablespace



SELECT  s.sid, u.username, s.program, s.machine, u.contents,
        u.segtype, u.extents, u.blocks*8192/1024/1024 mb,
        u.segrfno#, s.last_call_et, s.last_call_et/60 exec_mins
FROM    v$sort_usage u, v$session s
WHERE   u.session_addr = s.SADDR
ORDER BY        s.sid


SELECT  substr(name,1,40)               "INIT.ORA Parameter",
        to_number(substr(value,1,16))   "Value"
FROM    v$parameter
WHERE   name IN ('sort_area_size', 'sort_area_retained_size')

SELECT  substr(name,1,32) "Statistic",
        value             "Value"
FROM    v$sysstat
WHERE   name IN ( 'sorts (memory)', 'sorts (disk)')

select * FROM    v$sysstat
WHERE   name IN ( 'sorts (memory)', 'sorts (disk)')
