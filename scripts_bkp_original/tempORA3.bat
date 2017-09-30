
REM ORA3
echo ------------------------------------------------- >> D:\oracle\ora3\logs\log_ora3.log
echo BACKUP ORA3 EFETUADO EM %DATE% AS %TIME% >> D:\oracle\ora3\logs\log_ora3.log
rman target = 'sys/mult92vm@ora3' catalog = 'rman/backup@ora3' @backup_full_ora3.rman >> D:\oracle\ora3\logs\log_ora3.log

