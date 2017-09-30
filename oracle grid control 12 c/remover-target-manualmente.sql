--Oracle grid control 12 c script de remo��o de targets
-- etapa 1 
-- Parar o agent no target:
-- agent_home/agent_inst/bin/emctl stop agent
--
-- etapa 2 remover os arquivos do agente e criar um novo diretorio
--
-- etapa 3
--
-- Realizar o select abaixo no banco do repositorio para encontrar o target a ser removido

select target_name from mgmt_targets where target_type='oracle_emd';

-- etapa 4 
-- exeutar o procedimento abaixo com as informa��es do target a ser removido

exec mgmt_admin.cleanup_agent('192.168.12.131:3872');
