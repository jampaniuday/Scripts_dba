REM ORANET1
echo ------------------------------------------------- >> D:\oranet1\logs\log_oranet1.log
echo BACKUP ORANET1 EFETUADO EM %DATE% AS %TIME% >> D:\oranet1\logs\log_oranet1.log
rman target = 'sys/mult92vm@oranet1' catalog = 'rman/backup@ora3' @backup_full_oranet1.rman >> D:\oranet1\logs\log_oranet1.log
