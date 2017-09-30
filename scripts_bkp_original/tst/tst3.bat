
for /f %%C in ('type d:\oracle\scripts\tst\test_hash_remoto.md5') do set hash1=%%C
for /f %%D in ('type d:\oracle\scripts\tst\test_hash_local.md5') do set hash2=%%D
if %hash1% == %hash2% (
  echo %%A.%%B -- Hash OK!, arquivo copiado com sucesso! >> d:\oracle\scripts\tst\tst2_log.log
  echo . >> d:\oracle\scripts\tst\tst2_log.log
) else (
  echo %%A.%%B -- Hash nao coincidente, arquivo copiado com ERRO!!! >> d:\oracle\scripts\tst\tst2_log.log
  echo . >> d:\oracle\scripts\tst\tst2_log.log
)