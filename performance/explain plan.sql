-- Explain plan

explain plan for
select....

--verificar o plano de execu��o

SELECT * FROM   TABLE(DBMS_XPLAN.DISPLAY);
