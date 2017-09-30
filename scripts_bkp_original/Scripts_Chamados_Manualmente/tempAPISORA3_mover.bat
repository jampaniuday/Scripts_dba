set DIR1=\\apis-server3\backup\
set DIR2=e:\apisora3
set ARQLOG=e:\apisora3\logs\log_apisora3.log
for /f "tokens=2 delims=_." %%H in ('dir %DIR1%sites_??????????????.log /A:-D /B /O:N') do set STRDAT=%%H
echo Movendo arquivos de %DIR1% para TECNO3 ( %DIR2% ) > %DIR2%\hashs_%STRDAT%.txt
for /f "tokens=1-2 delims=." %%A in ('dir %DIR1% /A:-D /B /O:N') do (
  echo %DIR1%%%A.%%B >> %DIR2%\hashs_%STRDAT%.txt
  for /f %%C in ('c:\md5\md5 -f %DIR1%%%A.%%B') do set HSH1=%%C
  echo !HSH1! >> %DIR2%\hashs_%STRDAT%.txt
  copy /Y %DIR1%%%A.%%B %DIR2% >> %ARQLOG%
  if errorlevel 1 (
    echo O arquivo %DIR1%%%A.%%B nao foi copiado. >> %ARQLOG%
  ) else (
    echo %DIR2%\%%A.%%B >> %DIR2%\hashs_%STRDAT%.txt
    for /f %%D in ('c:\md5\md5 -f %DIR2%\%%A.%%B') do set HSH2=%%D
    echo !HSH2! >> %DIR2%\hashs_%STRDAT%.txt
    if !HSH1!==!HSH2! (
      echo Hash OK -- O arquivo %%A.%%B foi copiado com sucesso. >> %ARQLOG%
      echo . >> %ARQLOG%
      del %DIR1%%%A.%%B >> %ARQLOG%
    ) else (
      echo Hash nao coincidente -- o arquivo %%A.%%B foi copiado com ERRO e será apagado. >> %ARQLOG%
      del %DIR2%\%%A.%%B
      echo O arquivo com erro -- %%A.%%B -- foi apagado. Tente fazer uma nova copia. >> %ARQLOG%
      echo . >> %ARQLOG%
    )
  )
)