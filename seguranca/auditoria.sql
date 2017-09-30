declare
usuario varchar2(100);
teste varchar2(100);
begin
declare  
cursor usuario is select  u.username 
  from dba_users u
 where u.user_id > 144
   and u.username not in ('XS$NULL',                          'ADMSGVJDE01',                          'ADM_SGV_PROD',                          'AIRCLIC',                          'GRID_MANAGER',                          'MGMT_VIEW',
'PRD_MDS',                          'PRD_ORABAM',                          'PRD_ORASDPM',                          'PRD_SOAINFRA',                          'QLIKVIEW',                          'QV_COMPL',
'SAGE_HML',                          'SAGE_PRD',                          'SAGE_TREINA',                          'SYSMAN',                          'VETORH',                          'WKFTENDENCIA',
'WKFTENDENCIA_PROD',                          'ZABBIX')
minus
select distinct (USER_NAME) from DBA_STMT_AUDIT_OPTS;

begin
open usuario;
loop
  FETCH usuario BULK COLLECT INTO teste LIMIT 1000; 
  FORALL i IN teste.FIRST .. teste.LAST
  AUDIT SELECT TABLE, UPDATE TABLE, INSERT TABLE, DELETE TABLE BY teste(i) BY ACCESS;
 EXIT WHEN teste%NOTFOUND;

end loop;
CLOSE teste;
end;

