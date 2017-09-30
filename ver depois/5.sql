select 'GRANT ' || rpad(lower(privilege),30) || ' TO ' || lower(grantee) ||
       decode(admin_option,'YES',' WITH ADMIN OPTION;',';')
  from sys.dba_sys_privs
  where grantee not in ('CONNECT','RESOURCE','DBA',
                       'EXP_FULL_DATABASE','IMP_FULL_DATABASE')
order by grantee
