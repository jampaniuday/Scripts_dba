/*Valores da lov_status_dvpf3

=============================================
valor ||      Texto
=============================================
  0   ||  Aguardando memorial
  1   ||  Aguardando aprovação do vendedor
  2   ||  Reprovado
  3   ||  Ativo "essa é a opção que o usuario diz quando quer dizer aprovar"
  4   ||  Aguardando aprovação da Sema
  5   ||  Concluido
  6   ||  Aguardando suspensão do vendedor
  7   ||  Anulada
==============================================  
Create 19/09/2008 10:25
by Mario Martinez Jr
*/

update &Esquema.tab_dvpf3 t set t.status=&Status_Novo  
where t.status=&Status_atual and exists (select * from &Esquema.tab_empreendimento z where z.numero_cadastro=&Cod_emprendimento );


