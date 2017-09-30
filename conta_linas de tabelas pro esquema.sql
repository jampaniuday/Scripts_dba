select T.OWNER, SUM(num_rows) COUNTER
from  dba_tables t
GROUP BY t.owner;