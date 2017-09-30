@echo off
echo Limpando Backups APISORA3 >> E:\apisora3\logs\limpa_backups_apisora3.log
echo ----------------------------------------------------- >> E:\apisora3\logs\limpa_backups_apisora3.log
del E:\apisora3\atuais\*.* /q >> E:\apisora3\logs\limpa_backups_apisora3.log
move E:\apisora3\*.* E:\apisora3\atuais >> E:\apisora3\logs\limpa_backups_apisora3.log
move E:\apisora3\logs\log_apisora3.log E:\apisora3\atuais >> E:\apisora3\logs\limpa_backups_apisora3.log

echo Limpando Backups APISORA2 >> F:\apisora2\logs\limpa_backups_apisora2.log
echo ----------------------------------------------------- >> F:\apisora2\logs\limpa_backups_apisora2.log
del F:\apisora2\atuais\*.* /q >> F:\apisora2\logs\limpa_backups_apisora2.log
move F:\apisora2\*.* F:\apisora2\atuais >> F:\apisora2\logs\limpa_backups_apisora2.log
move F:\apisora2\logs\log_apisora2.log F:\apisora2\atuais >> F:\apisora2\logs\limpa_backups_apisora2.log

echo Limpando Backups ORA7 >> G:\ora7\logs\limpa_backups_ora7.log
echo ----------------------------------------------------- >> G:\ora7\logs\limpa_backups_ora7.log
del G:\ora7\atuais\*.* /q >> G:\ora7\logs\limpa_backups_ora7.log
move G:\ora7\*.* G:\ora7\atuais >> G:\ora7\logs\limpa_backups_ora7.log
move G:\ora7\logs\log_ora7.log G:\ora7\atuais >> G:\ora7\logs\limpa_backups_ora7.log

echo Limpando Backups ORANET1 >> D:\oranet1\logs\limpa_backups_oranet1.log
echo ----------------------------------------------------- >> D:\oranet1\logs\limpa_backups_oranet1.log
del D:\oranet1\atuais\*.* /q >> D:\oranet1\logs\limpa_backups_oranet1.log
move D:\oranet1\*.* D:\oranet1\atuais >> D:\oranet1\logs\limpa_backups_oranet1.log
move D:\oranet1\logs\log_oranet1.log D:\oranet1\atuais >> D:\oranet1\logs\limpa_backups_oranet1.log




REM --------- Limpa Backups SQL SERVER 2000 ---------------------------------------------------------

rem Limpando Backups da instancia TISERVER
dir F:\SQL_BACKUP\tiserver_\ /A:-D /B > nul
if errorlevel 1 (
  echo A limpeza nao foi efetuada porque a pasta de backups atuais nao contem arquivos.
) else (
  del F:\SQL_BACKUP\tiserver_\bkp_semana_passada\*.* /q
  move F:\SQL_BACKUP\tiserver_\*.* F:\SQL_BACKUP\tiserver_\bkp_semana_passada
) 
