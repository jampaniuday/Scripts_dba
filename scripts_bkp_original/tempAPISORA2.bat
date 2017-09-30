REM APISORA2
echo ------------------------------------------------- >> e:\apisora2\logs\log_apisora2.log
echo BACKUP APISORA2 EFETUADO EM %DATE% AS %TIME% >> e:\apisora2\logs\log_apisora2.log

rman target = 'sys/mult92vm@apisora2' catalog = 'rman/backup@ora3' @backup_full_apisora2.rman >> e:\apisora2\logs\log_apisora2.log

echo ----------- /usr/bin/orabkparqs ----------------->> e:\apisora2\logs\log_apisora2.log
ssh2 root@apis-server2 '/usr/bin/orabkparqs'          >> e:\apisora2\logs\log_apisora2.log
echo ----------- /usr/bin/orabkparqs ----------------->> e:\apisora2\logs\log_apisora2.log
