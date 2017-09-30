

select t.cod_lote,(select count(a.id) from tab_arquivos_lote a where t.id=a.id_lote) from tab_lote t order by 1

select * from tab_lote t where t.modalidade=10