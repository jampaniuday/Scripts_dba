/*select * from ceprof_pa.tab_gf1 t*/
/* relatorio p/ gf1*/
select t.numero_gf , te.nome,'GF1' Tipo_Gf, dv.uf_remeten,dv.municipio_remeten,dv.nome_remeten,dv.cpf_cnpj_remeten,
le.uf_destino,le.municipio_destino,dv.nome_destino,dv.cpf_cnpj_destino,t.data_emissao,t.data_validade,t.nota_fiscal,
la.longitude_instalacao,la.latitude_instalacao,t.identificacao_transporte,de.unidade,de.produto,t.tipo_transporte,
lv.nome_cientifico,lv.nome_popular,de.quantidade, de.preco_total,t.codigo_de_barra 


from ceprof_pa.tab_gf1 t,ceprof_pa.tab_dvpf dv, ceprof_pa.tab_especies_gf1 de, ceprof_Pa.Lov_Essencia lv, 
ceprof_pa.tab_local_atividade la,ceprof_pa.tab_empreendimento te,ceprof_pa.tab_local_entrega_dvpf le

where t.id_dvpf=dv.id and
t.id=de.id_gf1 and
t.emissor=la.id_empreendimento and
t.emissor=te.id and
t.numero_dvpf=le.dvpf and
dv.numero_dvpf=le.dvpf and
de.id_essencia=lv.id and
te.id =t.emissor and
la.id=te.id

