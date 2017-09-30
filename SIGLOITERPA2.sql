-------------------------------------------------------------------------------------------------------------
select stragg(d.id) from dw_lv_reg_arquivo d where d.id in (
select t.id from dw_lv_reg_arquivo t where t.id not in( select TITULO_LR_DW from dw_contrl_arquivo_lv_reg_arq t where t.TITULO_LR_DW is not null)
and t.descricao is not null )
and d.arquivo is not null 
tab_arq_l_reg_teste_versao

select * from dw_contrl_arquivo_lv_reg_arq d where d.TITULO_LR_DW in (3, 10, 4, 5, 8, 7, 9, 6)
select * from tab_arq_l_reg_teste_versao tr where tr.id_arquivo_dw in (3, 10, 4, 5, 8, 7, 9, 6)
select * from dw_contrl_arquivo_lv_reg_arq dw order by dw.titulo_lr_dw desc 
-------------------------------------------------------------------------------------------------------------

update dw_lv_reg_arquivo a set a.arquivo = null where a.id in(3,10,4,5,8,7,9,6)

--update dw_lv_reg_arquivo t set t.descricao = 'Path';-- where t.id in(

-------------------------------------------------------------------------------------------------------------
select t.id from dw_lv_reg_arquivo t where t.descricao is null 
select t.id from dw_lv_reg_arquivo t where t.id in (
select t.id from dw_lv_reg_arquivo t where t.id not in(SELECT ID_ARQUIVO_DW FROM tab_arq_l_reg_teste_versao a where a.id_arquivo_dw is not null)
and t.descricao is not null
);

-------------------------------------------------------------------------------------------------------------


select * from tab_arq_l_reg_teste_versao a where a.sucesso = 1;

-------------------------------------------------------------------------------------------------------------

select t.id from tab_lv_reg_arquivo t where t.id not in( select TITULO_LR from tab_contrl_arquivo_lv_reg_arq);

--3, 15, 21, 10, 4, 23, 25, 24, 5, 8, 12, 17, 7, 16, 9, 22, 20, 11, 6

select tlr.id, tlr.numero_arquivamento, tlr.expedicao_inicial, tlr.expedicao_inicial from tab_livro_registro tlr, dw_livro_registro dlr, dw_lv_reg_arquivo dlra
where tlr.id = dlr.livro_registro and dlr.id = dlra.livro_registro_dw
and dlr.id in 
(select t.id from dw_lv_reg_arquivo t where t.id not in( select TITULO_LR_DW from dw_contrl_arquivo_lv_reg_arq t where t.TITULO_LR_DW is not null)
and t.descricao is not null)

update dw_lv_reg_arquivo dwl set dwl.descricao = null where dwl.id in (3, 15, 21, 10, 4, 23, 25, 24, 5, 8, 12, 17, 7, 16, 9, 22, 20, 11, 6);
select dwl.id, dwl.descricao from dw_lv_reg_arquivo dwl where dwl.id in (3, 15, 21, 10, 4, 23, 25, 24, 5, 8, 12, 17, 7, 16, 9, 22, 20, 11, 6)
