@ECHO OFF

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
