select t.GRANTEE Usuario,t.GRANTED_ROLE Permissão,u.account_status Status ,u.lock_date Data_Lock , P.PTIME Dt_ultima_alteração_da_senha from dba_role_privs t  ,  sys.user$ P , dba_users u 
where t.GRANTEE=u.username AND P.NAME=U.userNAME and --t.GRANTEE not in ('XDB','WMSYS','SYSMAN','SYS','SYSTEM','DBA','CTXSYS','DBSNMP','HS_ADMIN_ROLE','MGMT_VIEW','OEM_MONITOR','OLAPSYS','OWBSYS','SELECT_CATALOG_ROLE','SPATIAL_CSW_ADMIN_USR','SPATIAL_WFS_ADMIN_USR')
 t.GRANTED_ROLE = ('DBA')
 
select Z.username from dba_users z where z.user_id > 100 and z.username like 'ADM_S%' OR Z.username LIKE 'SI%'

SELECT name,
       ctime,
       ptime
FROM   sys.user$
WHERE  name LIKE 'MARIO%'; 
