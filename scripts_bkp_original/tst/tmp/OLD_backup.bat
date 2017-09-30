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
echo ------------------------------------------------- >> F:\apisora2\logs\log_apisora2.log
echo BACKUP APISORA2 EFETUADO EM %DATE% AS %TIME% >> F:\apisora2\logs\log_apisora2.log

rman target = 'sys/mult92vm@apisora2' catalog = 'rman/backup@ora3' @backup_full_apisora2.rman >> F:\apisora2\logs\log_apisora2.log

echo ----------- /usr/bin/orabkparqs ----------------->> F:\apisora2\logs\log_apisora2.log
ssh2 root@apis-server2 '/usr/bin/orabkparqs'          >> F:\apisora2\logs\log_apisora2.log
echo ----------- /usr/bin/orabkparqs ----------------->> F:\apisora2\logs\log_apisora2.log

REM ISSO AQUI COPIA E VERIFICA CÓPIAS...
for %%i in ("\\apis-server2\backup\*") do (

  copy /Y %%i f:\apisora2 >> F:\apisora2\logs\log_apisora2.log

  if errorlevel 1 (
    echo Arquivo %%i nao copiado >> F:\apisora2\logs\log_apisora2.log

  ) else (
    echo Arquivo %%i copiado >> F:\apisora2\logs\log_apisora2.log
    del %%i >> F:\apisora2\logs\log_apisora2.log
  ) 
) 

REM ORA7
echo ------------------------------------------------- >> G:\ora7\logs\log_ora7.log
echo BACKUP ORA7 EFETUADO EM %DATE% AS %TIME% >> G:\ora7\logs\log_ora7.log
rman target = 'sys/mult92vm@ora7' catalog = 'rman/backup@ora3' @backup_full_ora7.rman >> G:\ora7\logs\log_ora7.log

REM ISSO AQUI COPIA E VERIFICA CÓPIAS...
for %%i in ("\\tecno7\backup\*") do (

  copy /Y %%i g:\ora7 >> G:\ora7\logs\log_ora7.log

  if errorlevel 1 (
    echo Arquivo %%i nao copiado >> G:\ora7\logs\log_ora7.log

  ) else (
    echo Arquivo %%i copiado >> G:\ora7\logs\log_ora7.log
    del %%i >> G:\ora7\logs\log_ora7.log
  ) 
) 

REM REM ORANET1 _ antigo
REM echo ------------------------------------------------- >> F:\oranet1\logs\log_oranet1.log
REM echo BACKUP ORANET1 EFETUADO EM %DATE% AS %TIME% >> F:\oranet1\logs\log_oranet1.log
REM rman target = 'sys/sixwing@oranet1' catalog = 'rman/backup@ora3' @backup_full_oranet1.rman >> F:\oranet1\logs\log_oranet1.log
REM 
REM REM ISSO AQUI COPIA E VERIFICA CÓPIAS...
REM for %%i in ("\\tecno-net1\backup\*") do (
REM 
REM   copy /Y %%i f:\oranet1 >> F:\oranet1\logs\log_oranet1.log
REM 
REM   if errorlevel 1 (
REM     echo Arquivo %%i nao copiado >> F:\oranet1\logs\log_oranet1.log
REM 
REM   ) else (
REM     echo Arquivo %%i copiado >> F:\oranet1\logs\log_oranet1.log
REM     del %%i >> F:\oranet1\logs\log_oranet1.log
REM   ) 
REM ) 



REM ORANET1
echo ------------------------------------------------- >> D:\oranet1\logs\log_oranet1.log
echo BACKUP ORANET1 EFETUADO EM %DATE% AS %TIME% >> D:\oranet1\logs\log_oranet1.log
rman target = 'sys/mult92vm@oranet1' catalog = 'rman/backup@ora3' @backup_full_oranet1.rman >> D:\oranet1\logs\log_oranet1.log

REM ISSO AQUI COPIA E VERIFICA CÓPIAS...
for %%i in ("\\tecno-net1\backup\*") do (

  copy /Y %%i D:\oranet1 >> D:\oranet1\logs\log_oranet1.log

  if errorlevel 1 (
    echo Arquivo %%i nao copiado >> D:\oranet1\logs\log_oranet1.log

  ) else (
    echo Arquivo %%i copiado >> D:\oranet1\logs\log_oranet1.log
    del %%i >> D:\oranet1\logs\log_oranet1.log
  ) 
)

REM ORA3
echo ------------------------------------------------- >> D:\oracle\ora3\logs\log_ora3.log
echo BACKUP ORA3 EFETUADO EM %DATE% AS %TIME% >> D:\oracle\ora3\logs\log_ora3.log
rman target = 'sys/mult92vm@ora3' catalog = 'rman/backup@ora3' @backup_full_ora3.rman >> D:\oracle\ora3\logs\log_ora3.log

