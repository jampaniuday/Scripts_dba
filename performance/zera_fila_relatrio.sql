 update adm_sgv.RECEPCAO_RELATORIO_WEB
set situacao = 6, data_alteracao = sysdate, usuario_alteracao = 'sistema'
where situacao in (0, 1)
