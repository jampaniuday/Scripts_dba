 
CREATE OR REPLACE TRIGGER block_prod
  AFTER LOGON ON DATABASE
DECLARE
  v_prog sys.v_$session.program%TYPE;
BEGIN
  SELECT program INTO v_prog 
    FROM sys.v_$session
  WHERE  audsid = USERENV('SESSIONID')
    AND  audsid != 0  -- Don't Check SYS Connections
    AND  ROWNUM = 1;  -- Parallel processes will have the same AUDSID's
 
  IF UPPER(v_prog) LIKE '%TOAD%' OR UPPER(v_prog) LIKE '%T.O.A.D%' OR -- Toad
     UPPER(v_prog) LIKE '%SQLNAV%' OR     -- SQL Navigator
     UPPER(v_prog) LIKE '%SQL DEV%' OR -- PLSQL Developer
     
  THEN
     RAISE_APPLICATION_ERROR(-20000, 'Favor utilizar a ferramenta homologada sqlplus.');
  END IF;
END;
/
SHOW ERRORS
