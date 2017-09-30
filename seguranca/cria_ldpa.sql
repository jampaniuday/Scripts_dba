
BEGIN
  DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(acl         => 'ldap.xml',
                                    description => 'Conexao com o LDAP',
                                    principal   => 'ADM_SGV',
                                    is_grant    => true,
                                    privilege   => 'connect');

  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(acl       => 'ldap.xml',
                                       principal => 'ADM_SGV',
                                       is_grant  => true,
                                       privilege => 'resolve');

  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(acl  => 'ldap.xml',
                                    host => '172.16.80.10');

  

END;
/

select * from DBA_NETWORK_ACL_PRIVILEGES;
select * from DBA_NETWORK_ACLS;
