@echo off
echo APIS-SERVER2 -- TECNO3 > e:\apisora2\hashs.txt
for /f "tokens=1-2 delims=." %%A in ('dir tst2\ /A:-D /B /O:N') do (
  echo %%A.%%B >> d:\oracle\scripts\tst\hashs.txt
  for /f %%C in ('c:\md5\md5 -f tst2\%%A.%%B') do set AA=%%C
  echo !AA! >> d:\oracle\scripts\tst\hashs.txt
  copy /Y tst2\%%A.%%B tst2\local_%%A.%%B >> d:\oracle\scripts\tst\tst2_log.log
  if errorlevel 1 (
    echo Arquivo tst2\%%A.%%B nao copiado >> d:\oracle\scripts\tst\tst2_log.log
  ) else (
    echo local_%%A.%%B >> d:\oracle\scripts\tst\hashs.txt
    for /f %%D in ('c:\md5\md5 -f tst2\local_%%A.%%B') do set BB=tst%%D
    echo !BB! >> d:\oracle\scripts\tst\hashs.txt
    if !AA!==!BB! (
      echo hash igual! >> d:\oracle\scripts\tst\hashs.txt
    ) else (
      echo hash diferente! >> d:\oracle\scripts\tst\hashs.txt
    )
  )
  echo ............................ >> d:\oracle\scripts\tst\hashs.txt
)
