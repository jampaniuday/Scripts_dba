select 'ALTER SYSTEM KILL SESSION ~' ||  t.SID || ',' || t.SERIAL# || '~ immediate;' 
from v$session t where t.SQL_ID='12u9nq8hn4fjh'


ALTER SYSTEM DISCONNECT SESSION '217,55017' immediate;

for rec in
SELECT se.sid,ss.serial# 
              FROM v$session ss, v$sesstat se, v$statname sn 
             WHERE se.statistic# = sn.statistic# 
               AND name like '%CPU used by this session%' 
               AND se.sid = ss.sid 
               AND ss.status = 'ACTIVE' 
               AND ss.username is not null 
               AND ss.sql_id ='4q4m563qf43va'
             ORDER BY value ASC loop
execute immediate 'Alter System Kill Session '''|| rec.Sid  
                       || ',' || rec.Serial# || ''' IMMEDIATE';
end loop;                       
                       
                                    
