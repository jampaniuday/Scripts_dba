-- Explain plan

explain plan for
select....

--verificar o plano de execução

SELECT * FROM   TABLE(DBMS_XPLAN.DISPLAY);
