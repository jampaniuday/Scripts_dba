UPDATE adm_sgv.usuario 
SET
bloqueado = 0,
data_expiracao_web = sysdate +3000,
data_ult_acesso_web = sysdate,
usuario_alteracao = 'mario.marietti',
data_alteracao = sysdate

WHERE login_web = 'mario.marietti'
