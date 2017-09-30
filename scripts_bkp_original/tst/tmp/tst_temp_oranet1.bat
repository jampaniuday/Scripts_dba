echo ------------------------------------------------- >> F:\oranet1\logs\log_oranet1.log
echo BACKUP ORANET1 EFETUADO EM %DATE% AS %TIME% >> F:\oranet1\logs\log_oranet1.log
rman target = 'sys/sixwing@oranet1.tecnorede.mt' catalog = 'rman/backup@ora3' @backup_full_oranet1.rman >> F:\oranet1\logs\log_oranet1.log
