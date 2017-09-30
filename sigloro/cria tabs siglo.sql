

create table sigloro2.lote as select z.id_fixo id,z.cod_lote,z.area area_calc,z.perimetro perimetro_calc,a.data,
a.controle,a.informacao,a.versoes,z.geometria  from sigloro.lote_projetado z, sigloro2.lote_original a
where z.id_fixo=a.id and
      z.cod_lote=a.cod_lote 


create table sigloro2.lov_modalidade as select distinct(m.modalidade),m.nome_modalidade from sigloro.lote_projetado m

create table sigloro2.lov_setor as select distinct(s.setor),s.nome_setor from sigloro.lote_projetado s

create table sigloro2.tab_lote as select stl.id,tb.nome_do_imovel,tb.nome_do_lote,tb.cod_lote,tb.modalidade,
tb.setor,tb.nome_projeto,tb.gleba,tb.propriedade,tb.area,tb.perimetro,stl.excluido,
stl.id_memorial from sigloro.lote_projetado tb,sigloro2.tab_lote_orig stl where
tb.cod_lote=stl.cod_lote


select s.id,d.id_fixo from sigloro2.tab_lote s, sigloro.lote_projetado d where s.cod_lote=d.cod_lote
