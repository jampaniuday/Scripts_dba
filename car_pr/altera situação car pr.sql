/*Script p/ mudar a situa��o de um projeto no car pr para 

situa��o tab_referencia
1  Aguardando processamento
2	Em processamento
3	Processado
4	Falha no processamento

situa��o tab_projeto
1	Cadastrado
2	Conclu�do
3	Reprovado

situa��o tab_lau
1	Aguardando arquivo
2	Aguardando processamento
3	Em processamento
4	Processado
5	Falha no processamento
6	Conclu�do
7	Reprovado*/

Update base_parana.tab_referencia t set t.situacao = 4 where t.projeto=&id;
Update base_parana.tab_lau l set l.situacao = 7 where l.projeto=&id;
Update base_parana.tab_projeto p set p.situacao = 3 where p.id=&id;
