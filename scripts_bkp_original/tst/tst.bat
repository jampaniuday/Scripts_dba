set hash1=teste >> d:\oracle\script\tst\tst_log.log
set hash2=teste2 >> d:\oracle\script\tst\tst_log.log
set DIR2=APIS-SERVER2
set DIR1=\\%DIR2%\backup\
for /f "tokens=1-2 delims=." %%A in ('dir %DIR1% /A:-D /B /O:N') do (
  c:\md5\md5 -f %DIR1%%%A.%%B > d:\oracle\script\tst\%%A%%B$__%DIR2%.md5
  copy /Y %DIR1%%%A.%%B d:\oracle\script\tst >> d:\oracle\script\tst\tst_log.log
  if errorlevel 1 (
    echo Arquivo %DIR1%%%A.%%B nao copiado >> d:\oracle\script\tst\tst_log.log
  ) else (
    c:\md5\md5 -f d:\oracle\script\tst\%%A.%%B > d:\oracle\script\tst\%%A%%B$__%computername%.md5
    for /f %%C in ('type d:\oracle\script\tst\%%A%%B$__%DIR2%.md5') do set hash1=%%C >> d:\oracle\script\tst\tst_log.log
    for /f %%D in ('type d:\oracle\script\tst\%%A%%B$__%computername%.md5') do set hash2=%%D >> d:\oracle\script\tst\tst_log.log
    set hash1=LETRAS__%hash1% >> d:\oracle\script\tst\tst_log.log
    set hash2=LETRAS__%hash2% >> d:\oracle\script\tst\tst_log.log
    if %hash1% == %hash2% (
      echo %%A.%%B -- Hash OK!, arquivo copiado com sucesso! >> d:\oracle\script\tst\tst_log.log
      echo . >> d:\oracle\script\tst\tst_log.log
    ) else (
      echo %%A.%%B -- Hash nao coincidente, arquivo copiado com ERRO!!! >> d:\oracle\script\tst\tst_log.log
      echo . >> d:\oracle\script\tst\tst_log.log
    )
  )

)