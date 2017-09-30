select

/* tab gf3 */
t.numero_gf ,'GF4' Tipo_Gf,te4.uf,te4.municipio,te4.nome,te4.cpf_cnpj, te5.uf,te5.municipio,te5.nome,te5.cpf_cnpj,
t.data_emissao,t.data_validade,t.nota_fiscal,la.longitude_instalacao,la.latitude_instalacao,
t.identificacao_transporte,de.unidade,de.produto,t.tipo_transporte,lv.nome_cientifico,lv.nome_popular,
de.quantidade, de.preco_total


from 
ceprof_pa.tab_gf4 t,
ceprof_pa.tab_produtos_gf4 de, 
ceprof_Pa.Lov_Essencia lv, 
ceprof_pa.tab_empreendimento te,  
ceprof.tab_local_atividade la ,
ceprof_pa.tab_empreendimento_gf4 te4 ,
ceprof_pa.tab_empreendimento_gf4 te5

where
t.id=de.id_gf4 and
t.id_emissor=te.id and
t.id_emissor=la.id_empreendimento and
de.id_gf4=t.id and
de.id_essencia=lv.id and
t.id_remetente=te4.id and
t.id_destino = te5.id
