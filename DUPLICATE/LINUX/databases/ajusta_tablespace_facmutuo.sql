alter database datafile '/basedados/facmutuo/undotbs01.dbf' resize 4096M; 
alter database datafile '/basedados/facmutuo/undotbs01.dbf' AUTOEXTEND ON NEXT 5M MAXSIZE 10240M;
alter database tempfile '/basedados/facmutuo/temp01.dbf' resize 4096M;
alter database tempfile '/basedados/facmutuo/temp01.dbf' AUTOEXTEND ON NEXT 80M MAXSIZE 10240M;
alter database datafile '/basedados/facmutuo/users01.dbf' resize 256M;
alter database datafile '/basedados/facmutuo/users01.dbf' AUTOEXTEND ON NEXT 5M MAXSIZE 10240M;
EXIT;
