select distinct(replace(replace(ende.CEP ,'.', ''),'-' ,'')) ,translate(ci.nome,'âàãáÁÂÀÃéêÉÊíÍóôõÓÔÕüúÜÚÇç','aaaaAAAAeeEEiIoooOOOuuUUCc')  || '/' || es.sigla
from estabelecimento_empresa ee
join estabelecimento est on est.id = ee.ESTABELECIMENTO_ID
join endereco ende on ende.PROPRIETARIO_ID = est.id and ende.TIPO_PROPRIETARIO = 2 and ende.TIPO_ENDERECO_ID = 1 and ende.ativo = 1
join CIDADE ci on ci.id = ende.cidade_id
join estado es on es.id = ende.estado_id
where ee.ativo = 1
group by ende.CEP,ci.nome,es.sigla
order by 2


