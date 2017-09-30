REM ORA7
echo ------------------------------------------------- 
echo BACKUP ORA7 EFETUADO EM %DATE% AS %TIME% 
rman target = 'sys/mult92vm@ora7' catalog = 'rman/backup@ora3' @backup_full_ora7.rman >> log_ora7.log
