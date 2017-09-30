update adm_sgv.RECEPCAO_RELATORIO_WEB
set situacao = 6, data_alteracao = sysdate, usuario_alteracao = 'sistema.web'
where situacao = 1 or situacao = 0
and relatorio_web_id in (48);
