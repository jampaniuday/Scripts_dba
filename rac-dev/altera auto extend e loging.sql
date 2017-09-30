--Alter auto extend
select 'ALTER DATABASE DATAFILE *' ||  t.FILE_NAME || '* AUTOEXTEND ON
NEXT 512M
MAXSIZE UNLIMITED;' from dba_data_files t where t.TABLESPACE_NAME not in('UNDOTBS1','UNDOTBS2','SYSTEM','SYSAUX','USERS')


--Altera logging tbs
select 'ALTER TABLESPACE ' ||  t.TABLESPACE_NAME || ' NOLOGGING;' from dba_data_files t where t.TABLESPACE_NAME not in('UNDOTBS1','UNDOTBS2','SYSTEM','SYSAUX','USERS')


