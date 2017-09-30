CREATE OR REPLACE TRIGGER LOGIN_SCAN
   AFTER LOGON
   ON DATABASE
DECLARE
BEGIN
   IF DBMS_STANDARD.LOGIN_USER like
         ('ADM_SGV%')
      AND SYS_CONTEXT ('USERENV', 'OS_USER') NOT IN ('root','mario.junior','oracle','radius','sgv','jboss','rodrigo.nakaya','ricardo.bessa')
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'Login Scan Detectou acesso nao autorizado , voce sera desconetado agora! :) ');
   END IF;
END;
/
