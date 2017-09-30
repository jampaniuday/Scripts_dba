select

/* tab gf2 */
t.id,t.numero_gf ,t.data_emissao,t.data_validade,t.nota_fiscal,t.identificacao_transporte,t.tipo_transporte,

/* Tab emprendimento*/
te.nome,

'GF2' Tipo_Gf, 
/* Tab dvpf2 */
dv.uf_remeten,dv.municipio_remeten,dv.nome_remeten,dv.cpf_cnpj_remeten,
dv.nome_destino,dv.cpf_cnpj_destino,

/* Tab produtos gf2 */
de.unidade,de.produto,de.quantidade, de.preco_total,

/* Lov Essencia */
lv.nome_cientifico,lv.nome_popular,

/* Tab Local Atividade */
la.longitude_instalacao,la.latitude_instalacao

from 
ceprof_pa.tab_gf2 t,
ceprof_pa.tab_dvpf2 dv, 
ceprof_pa.tab_produtos_gf2 de, 
ceprof_Pa.Lov_Essencia lv, 
ceprof_pa.tab_empreendimento te,  
ceprof_pa.tab_local_entrega_dvpf2 ent, 
ceprof.tab_local_atividade la

where
t.id_dvpf2=dv.id and
t.id=de.id_gf2 and
t.numero_dvpf=dv.numero_dvpf and
t.emissor=te.id and
t.numero_dvpf=ent.dvpf and
t.emissor=la.id_empreendimento and
dv.empreendimento_emissor=te.id and
dv.numero_dvpf=ent.dvpf and
dv.empreendimento_emissor=la.id_empreendimento and
de.id_essencia=lv.id
group by de.quantidade






