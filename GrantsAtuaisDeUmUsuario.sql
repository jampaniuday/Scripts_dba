DECLARE
   v_usuario varchar2(50):= UPPER('&usuario');

   cursor a is
      SELECT * FROM DBA_TAB_PRIVS P
      WHERE P.GRANTEE = v_usuario
      ORDER BY P.owner, P.table_name, P.privilege;
      
   cursor b is 
      select p.granted_role permissao, p.admin_option admin 
      from dba_role_privs p 
      where p.grantee = v_usuario
   union      
      select q.privilege permissao, q.admin_option admin
      from dba_sys_privs q 
      where q.grantee = v_usuario;


BEGIN
   

   for x in a loop
     if x.grantable = 'YES' then
        dbms_output.put_line('GRANT '|| x.privilege ||' ON '|| x.owner ||'.'|| x.table_name ||' TO '||v_usuario||' WITH ADMIN OPTION;');
     else
        dbms_output.put_line('GRANT '|| x.privilege ||' ON '|| x.owner ||'.'|| x.table_name ||' TO '||v_usuario||';');       
     end if;
   end loop;
   
   for x in b loop
     if x.admin = 'YES' then
       dbms_output.put_line('GRANT '|| x.permissao ||' TO '||v_usuario||' WITH ADMIN OPTION;');
     else
       dbms_output.put_line('GRANT '|| x.permissao ||' TO '||v_usuario||';');     
     end if;
   end loop;
END;
    