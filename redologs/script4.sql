select 
   to_char(trunc(first_time), 'Month') c1,
   to_char(trunc(first_time), 'Day : DD-Mon-YYYY') c2,
   count(*) c3
from 
   v$log_history
where 
   trunc(first_time) > last_day(sysdate-100) +1
group by 
   trunc(first_time)
