/*AS CONSULTAS ABAIXO DEVEM SER EXECUTADAS INDIVIDUALMENTE
Consulta 1 Sobre a DW_ADMINISTRADOR
Deve se executada no plsql logado com o usuario ccsema*/

select * from ccsema.dw_administrador t 
where t.login_executor='Sistema'
and t.data_execucao between '25/4/2009' and '10/5/2009'

---------------------------------------------------------------------------
---------------------------------------------------------------------------

/*Consulta 2 Sobre a DW_ADMINSTRADOR_ACESSO
Deve se executada no plsql logado com o usuario ccsema*/

select * from ccsema.dw_administrador_acesso z 
where z.login_executor='sistema'
and z.data_execucao between '25/4/2009' and '10/5/2009'

---------------------------------------------------------------------------
---------------------------------------------------------------------------

/*Consulta 3 Sobre a DW_ADMINSTRADOR_MP
Deve se executada no plsql logado com o usuario ccsema*/

select * from ccsema.dw_administrador_mp a 
where a.login_executor='sistema'
and a.data_execucao between '25/4/2009' and '10/5/2009'

---------------------------------------------------------------------------
---------------------------------------------------------------------------

/*Consulta 4 Sobre a DW_PAPEL
Deve se executada no plsql logado com o usuario ccsema*/

select * from ccsema.dw_papel b 
where b.login_executor='sistema'
and b.data_execucao between '25/4/2009' and '10/5/2009'

----------------------------------------------------------------------------
----------------------------------------------------------------------------

/*Consulta 5 Sobre a DW_PAPEL_MP
Deve se executada no plsql logado com o usuario ccsema*/

select * from ccsema.dw_papel_mp n 
where n.login_executor='sistema' 
and n.data_execucao between '25/4/2009' and '10/5/2009'

------------------------------------------------------------------------------
------------------------------------------------------------------------------

/*Consulta 6 Sobre a DW_PAPEL_HORARIO_ACESSO
Deve se executada no plsql logado com o usuario ccsema*/

select * from ccsema.dw_papel_horario_acesso l 
where l.login_executor='sistema'
and l.data_execucao between '25/4/2009' and '10/5/2009'
