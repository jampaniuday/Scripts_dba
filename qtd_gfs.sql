
select to_DATE(tt.dd , 'mm/yy') Data, sum (tt.qtde) Quantidade from(

select to_char(t.data_emissao , 'mm/yyyy') dd ,count(t.id) qtde 
from dw_gf1 t group by to_char(t.data_emissao , 'mm/yyyy')
union
select to_char(t.data_emissao , 'mm/yyyy') dd ,count(t.id) qtde 
from dw_gf2 t group by to_char(t.data_emissao , 'mm/yyyy')
union
select to_char(t.data_emissao , 'mm/yyyy') dd ,count(t.id) qtde 
from dw_gf3 t group by to_char(t.data_emissao , 'mm/yyyy')
union
select to_char(t.data_emissao , 'mm/yyyy') dd,count(t.id) qtde 
from dw_gf4 t group by to_char(t.data_emissao , 'mm/yyyy')

) tt group by to_DATE(tt.dd , 'mm/yy')
