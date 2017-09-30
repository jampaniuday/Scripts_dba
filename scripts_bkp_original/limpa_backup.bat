@echo off
echo Limpando Backups APISORA3 >> E:\apisora3\logs\limpa_backups_apisora3.log
echo ----------------------------------------------------- >> E:\apisora3\logs\limpa_backups_apisora3.log
del E:\apisora3\atuais\*.* /q >> E:\apisora3\logs\limpa_backups_apisora3.log
move E:\apisora3\*.* E:\apisora3\atuais >> E:\apisora3\logs\limpa_backups_apisora3.log
move E:\apisora3\logs\log_apisora3.log E:\apisora3\atuais >> E:\apisora3\logs\limpa_backups_apisora3.log



REM --------- Limpa Backups SQL SERVER 2000 ---------------------------------------------------------

rem Limpando Backups da instancia TISERVER
dir e:\SQL_BACKUP\tiserver_\ /A:-D /B > nul
if errorlevel 1 (
  echo A limpeza nao foi efetuada porque a pasta de backups atuais nao contem arquivos.
) else (
  del e:\SQL_BACKUP\tiserver_\bkp_semana_passada\*.* /q
  move e:\SQL_BACKUP\tiserver_\*.* e:\SQL_BACKUP\tiserver_\bkp_semana_passada
) 
