declare

   nmUsuario varchar2(30) := '&usuario';
   senha varchar2(30) := '&senha';
   tbs varchar2(30) := '&tbs';
   
   tbsPerm varchar2(100) := tbs||'_DATA';
   tbsTemp varchar2(100) := tbs||'_TEMP';
   tbsIndex varchar2(100) := tbs||'_INDEX';

begin


   dbms_output.put_line('CREATE USER '|| nmusuario ||' IDENTIFIED BY '||senha);
   dbms_output.put_line('DEFAULT TABLESPACE '|| tbsPerm ||' TEMPORARY TABLESPACE '|| tbstemp);
   dbms_output.put_line('QUOTA UNLIMITED ON '|| tbsPerm);
   dbms_output.put_line('QUOTA UNLIMITED ON '|| tbsTemp);
   dbms_output.put_line('QUOTA UNLIMITED ON '|| tbsIndex||';');
   
   --Grants padroes
   dbms_output.put_line('GRANT CONNECT TO '||nmusuario||';');
--   dbms_output.put_line('REVOKE UNLIMITED TABLESPACE FROM '||nmusuario||';');

end;