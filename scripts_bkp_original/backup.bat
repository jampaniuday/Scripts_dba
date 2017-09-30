@ECHO OFF
REM TECNOMAPAS EXCELÊNCIA EM GEOPROCESSAMENTO
REM Departamento de Análise, Projeto de Implementação de Sistemas
REM 
REM Script de Backups Completos dos Servidores Oracle


REM --------------------------------------------------------------
REM Inicia os backups nos servidores Oracle





REM APISORA3
echo ------------------------------------------------- >> E:\apisora3\logs\log_apisora3.log
echo BACKUP APISORA3 EFETUADO EM %DATE% AS %TIME% >> E:\apisora3\logs\log_apisora3.log

rman target = 'sys/mult92vm@apisora3' catalog = 'rman/backup@ora3' @backup_full_apisora3.rman >> E:\apisora3\logs\log_apisora3.log

echo ----------- /usr/bin/orabkparqs ----------------->> E:\apisora3\logs\log_apisora3.log
ssh2 root@apis-server3 '/usr/bin/orabkparqs'          >> E:\apisora3\logs\log_apisora3.log
echo ----------- /usr/bin/orabkparqs ----------------->> E:\apisora3\logs\log_apisora3.log

REM ISSO AQUI COPIA E VERIFICA CÓPIAS...
for %%i in ("\\apis-server3\backup\*") do (

  copy /Y %%i e:\apisora3 >> E:\apisora3\logs\log_apisora3.log

  if errorlevel 1 (
    echo Arquivo %%i nao copiado >> E:\apisora3\logs\log_apisora3.log
  ) else (
    echo Arquivo %%i copiado >> E:\apisora3\logs\log_apisora3.log
    del %%i >> E:\apisora3\logs\log_apisora3.log
  ) 
) 











REM APISORA2
echo ------------------------------------------------- >> e:\apisora2\logs\log_apisora2.log
echo BACKUP APISORA2 EFETUADO EM %DATE% AS %TIME% >> e:\apisora2\logs\log_apisora2.log

rman target = 'sys/mult92vm@apisora2' catalog = 'rman/backup@ora3' @backup_full_apisora2.rman >> e:\apisora2\logs\log_apisora2.log

echo ----------- /usr/bin/orabkparqs ----------------->> e:\apisora2\logs\log_apisora2.log
ssh2 root@apis-server2 '/usr/bin/orabkparqs'          >> e:\apisora2\logs\log_apisora2.log
echo ----------- /usr/bin/orabkparqs ----------------->> e:\apisora2\logs\log_apisora2.log



REM ORA7
echo ------------------------------------------------- >> G:\ora7\logs\log_ora7.log
echo BACKUP ORA7 EFETUADO EM %DATE% AS %TIME% >> G:\ora7\logs\log_ora7.log
rman target = 'sys/mult92vm@ora7' catalog = 'rman/backup@ora3' @backup_full_ora7.rman >> G:\ora7\logs\log_ora7.log



REM ORANET1
echo ------------------------------------------------- >> D:\oranet1\logs\log_oranet1.log
echo BACKUP ORANET1 EFETUADO EM %DATE% AS %TIME% >> D:\oranet1\logs\log_oranet1.log
rman target = 'sys/mult92vm@oranet1' catalog = 'rman/backup@ora3' @backup_full_oranet1.rman >> D:\oranet1\logs\log_oranet1.log









REM ORA3
echo ------------------------------------------------- >> D:\oracle\ora3\logs\log_ora3.log
echo BACKUP ORA3 EFETUADO EM %DATE% AS %TIME% >> D:\oracle\ora3\logs\log_ora3.log
rman target = 'sys/mult92vm@ora3' catalog = 'rman/backup@ora3' @backup_full_ora3.rman >> D:\oracle\ora3\logs\log_ora3.log







