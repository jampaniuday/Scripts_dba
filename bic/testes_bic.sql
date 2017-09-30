create table tabela1 as select tb.id,tb.zona,tb.setor,tb.quadra,tb.lote,tb.economia,tb.numero,tb.ocorrencia,tb.proprietario,
tb.compromissario,tb.imovel,tb.codigo,tb.data_processo,tb.origem,tb.zona_anterior,tb.setor_anterior,tb.quadra_base_anterior,
tb.quadra_seq_anterior,lote_anterior,tb.economia_anterior,tb.equipe1,tb.equipe2,tb.croqui,tb.status,tb.data_preenchimento,
tb.verificacao,tb.digitador,tb.matricula_registro,tb.livro_registro,tb.folha_registro,ti.endereco,ti.numero numero_imovel,ti.bairro,
ti.cep,ti.loteamento,ti.complemento,ti.cod_logradouro,ti.cod_bairro,ti.cod_lote,ti.ft_local,ti.face_quadra,ti.imposto,
ti.quadra quadra_imovel,ti.lote lote_imovel,tt.bic,tt.area_terreno,tt.testada_principal,tt.testada_taxas,tt.patrimonio,tt.tributacao,tt.situacao,
tt.topografia,tt.pedologia,tt.ocupacao,tt.valor_patrimonio,tc.area_total,tc.area1,tc.area2,tc.area3,tc.patrimonio patrimonio_contrucao,
tc.tipo_edificacao,tc.caracteristica,tc.obsolescencia,tc.numero_unidades,tc.uso_edificacao,tc.estrutura,tc.vedacao,
tc.esquadrias,tc.cobertura,tc.forro,tc.interior,tc.exterior,tc.piso,tc.inst_eletrica,tc.inst_sanitaria,tc.pintura,
tc.areas_verdes,tc.documento,tc.ocupacao OCUPACAO_CONSTRUCAO,tc.esgoto,tc.arvores,tc.medidor_energia,tc.medidor_agua,tis.escolaridade_chefe,
tis.sexo_chefe,tis.idade_chefe,tis.renda,tis.quant_saude,tis.deficientes
from tab_bic tb, tab_imovel ti, tab_terreno tt, tab_construcao tc, tab_info_socioeconomicas tis
where 
tb.id=ti.id and
tb.id=tt.id and
tb.id=tc.id and
tb.id=tis.id

union

create table tab4 as select * from  tab_terreno tt where tt.id not in (select tb.id from tab_bic tb, tab_imovel ti, tab_terreno tt, tab_construcao tc, tab_info_socioeconomicas tis
where 
tb.id=ti.id and
tb.id=tt.id and
tb.id=tc.id and
tb.id=tis.id)

select * from tab3 a, tab4 b where 
a.id=b.id


select * from tab2 a,tab3 b where 
a.id=b.id

update tabela1 z set  (select null,
endereco,
numero,
bairro,
cep,
loteamento,
complemento,
cod_logradouro,
cod_bairro,
cod_lote,
ft_local,
face_quadra,
imposto,
quadra,
lote,
null,
null,
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null, 
null from tab3 t where t.id =z.id)
