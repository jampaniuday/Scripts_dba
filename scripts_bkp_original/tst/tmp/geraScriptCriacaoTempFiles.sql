--sqlplus -s "sys/mult92vm@apisora4 as sysdba" @geraScriptCriacaoTempFiles.sql
SET SERVEROUTPUT ON SIZE 1000000;
SET TERMOUT OFF;
SPOOL TEMPFILES_SCRIPT.SQL;

declare
begin
   for i in (select r.tablespace_name tsname, r.file_name tfname, (t.CREATE_BYTES/1024)/1024 tam_ini, ((t.BLOCK_SIZE * r.increment_by)/1024)/1024 incr from v$tempfile t, dba_temp_files r where t.NAME = r.file_name) loop
     --dbms_output.put_line('DROP TABLESPACE '|| i.tsname ||';');
     --dbms_output.put_line('CREATE TEMPORARY TABLESPACE '|| i.tsname ||' TEMPFILE '''|| i.tfname ||'''');
     --dbms_output.put_line('SIZE '|| i.tam_ini ||'M REUSE AUTOEXTEND ON NEXT '|| i.incr ||'M MAXSIZE UNLIMITED');
     --dbms_output.put_line('EXTENT MANAGEMENT LOCAL UNIFORM SIZE '||ROUND(i.tam_ini/2) ||'M;');

     dbms_output.put_line('ALTER TABLESPACE '|| i.tsname ||' ADD TEMPFILE '''|| i.tfname ||'''');
     dbms_output.put_line('SIZE '|| i.tam_ini ||'M REUSE AUTOEXTEND ON NEXT '|| i.incr ||'M MAXSIZE UNLIMITED;');

   end loop;
   dbms_output.put_line('EXIT');
end;
/

SPOOL OFF;
EXIT

