
REM APISORA2
echo ------------------------------------------------- >> F:\apisora2\logs\log_apisora2.log
echo BACKUP APISORA2 EFETUADO EM %DATE% AS %TIME% >> F:\apisora2\logs\log_apisora2.log

rman target = 'sys/mult92vm@apisora2' catalog = 'rman/backup@ora3' @backup_full_apisora2.rman >> F:\apisora2\logs\log_apisora2.log

echo ----------- /usr/bin/orabkparqs ----------------->> F:\apisora2\logs\log_apisora2.log
ssh2 root@apis-server2 '/usr/bin/orabkparqs'          >> F:\apisora2\logs\log_apisora2.log
echo ----------- /usr/bin/orabkparqs ----------------->> F:\apisora2\logs\log_apisora2.log

