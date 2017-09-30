select
t.numero_gf ,'GF3' Tipo_Gf, t.uf_remetente,t.municipio_remetente,t.nome_remetente,te.cnpj,t.uf_destino,
t.municipio_destino,t.nome_destino,t.cpf_cnpj_destino, t.data_emissao,t.data_validade,t.nota_fiscal,
la.longitude_instalacao,la.latitude_instalacao,t.identificacao_transporte,de.unidade,de.produto,t.tipo_transporte
,lv.nome_cientifico,lv.nome_popular,de.quantidade,de.preco_total,T.CODIGO_DE_BARRA


from 
ceprof_pa.tab_gf3 t,
ceprof_pa.tab_produtos_gf3 de, 
ceprof_Pa.Lov_Essencia lv, 
ceprof_pa.tab_empreendimento te,  
ceprof.tab_local_atividade la

where
t.id=de.id_gf3 and
t.emissor=te.id and
t.emissor=la.id_empreendimento and
de.id_gf3=t.id and
de.id_essencia=lv.id
