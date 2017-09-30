select  sum(y.muni),y.municipio,y.data_prot 
from (
SELECT  count(t.municipio)muni ,t.municipio,to_char(t.dataprot, 'yyyy') data_prot   
from  relatorio t group by t.municipio, t.dataprot order by 1 desc
)y group by y.municipio, y.data_prot







