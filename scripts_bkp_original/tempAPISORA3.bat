REM APISORA3
echo ------------------------------------------------- >> E:\apisora3\logs\log_apisora3.log
echo BACKUP APISORA3 EFETUADO EM %DATE% AS %TIME% >> E:\apisora3\logs\log_apisora3.log

rman target = 'sys/mult92vm@apisora3' catalog = 'rman/backup@ora3' @backup_full_apisora3.rman >> E:\apisora3\logs\log_apisora3.log

echo ----------- /usr/bin/orabkparqs ----------------->> E:\apisora3\logs\log_apisora3.log
ssh2 root@apis-server3 '/usr/bin/orabkparqs'          >> E:\apisora3\logs\log_apisora3.log
echo ----------- /usr/bin/orabkparqs ----------------->> E:\apisora3\logs\log_apisora3.log
