select 'DBMS_FGA.DROP_POLICY (object_schema   =>  "' || T.object_schema || '" ,object_name     => "' || T.object_name || '" ,policy_name     => "' 
|| T.policy_name
|| '") ;  ' 
from   dba_audit_policies T;

dba_fga_audit_trail
    

