select count(a.id_bic) from tab_bic_total2 a,(select * from tab_construcao )t  where a.id_bic =t.id



select t.id ID_BIC,decode(t.ocupacao, null ,'Nulo') ocupacao_cons_valor,z.texto ocupacao_cons_texto 
from tab_construcao t, lov_ocupacao_imovel z where t.ocupacao=z.valor or t.ocupacao  is null

select t.id ID_BIC from tab_construcao t where t.ocupacao is null
select count(*) from tab_bic
select count(*) from tab_construcao



