c:
cd Temp
rem  +-------------------------------------------------------------------+
rem  | Autor: Diego Henrique Stammerjohann                               |
rem  | Data:  09/04/2015                                                 |
rem  | Procedimento de Clonagem Database 11G Windows                     |
rem  +-------------------------------------------------------------------+
echo off
SET ORACLE_HOME=C:\app\administrador\product\11.2.0\dbhome_2
SET PATH=%ORACLE_HOME%\BIN;%PATH%
SET ORACLE_SID=DBHML
SET NLS_DATE_FORMAT=DD-MM-YYYY HH24:MI:SS
SET NLS_LANG=AMERICAN_AMERICA.WE8MSWIN1252
SET RMAN_CMD_AUX=rman target sys/PASS@TOTVS_PROD auxiliary  /
SET SCRIPTS=C:\Seven\scripts\Duplicate
SET DEST_DATAFILES="C:\basedados\bdembctl\LABKRONA C:\basedados\bdembdbf C:\basedados\bdembind C:\basedados\bdembtmp"

set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%

SET DTLOG=%_my_datetime%
SET RMAN_LOG=C:\Seven\Logs\log_duplicate_rman_%DTLOG%.log
set LOGDUPLIC=C:\Seven\Logs\log_duplicate_database_%DTLOG%.log

echo ##################################################################### 
echo     Inicio PROCEDIMENTO CLONAGEM PARA O AMBIENTE %ORACLE_SID%         
echo   CUIDADO!!!!!! ESTE PROCEDIMENTO APAGARA COMPLETAMENTE %ORACLE_SID%       
echo                 PRESSIONE ENTER.... PARA CONTINUAR                 
echo #####################################################################

pause

cls

echo ##################################################################### 
echo     Inicio PROCEDIMENTO CLONAGEM PARA O AMBIENTE %ORACLE_SID%       
echo   CUIDADO!!!!!! ESTE PROCEDIMENTO APAGARA COMPLETAMENTE %ORACLE_SID% 
echo            Tem CERTEZA DE ESTAR NO AMBIENTE CORRETO                
echo                 PRESSIONE ENTER.... PARA CONTINUAR                  
echo #####################################################################  

pause

echo ##################################################################### >> %LOGDUPLIC%
echo #               Inicio shutdown do Ambiente  %ORACLE_SID%           # >> %LOGDUPLIC%
echo ##################################################################### >> %LOGDUPLIC%

echo ##################################################################### 
echo #               Inicio shutdown do Ambiente  %ORACLE_SID%           # 
echo #####################################################################

sqlplus -s  "/ as sysdba" < %SCRIPTS%\shutdown_clone.sql 

echo ##################################################################### >> %LOGDUPLIC%
echo #               Inicio Remocao Arquivos do Ambiente  %ORACLE_SID%   # >> %LOGDUPLIC%
echo ##################################################################### >> %LOGDUPLIC%


echo ##################################################################### 
echo #               Inicio Remocao Arquivos do Ambiente  %ORACLE_SID%   # 
echo ##################################################################### 

del /F /Q %DEST_DATAFILES% 

