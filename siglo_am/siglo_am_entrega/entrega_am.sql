--Este script deve ser rodado como system
--Passo 1 : query para montar o script de desabilitar contraints

select 'ALTER TABLE SIGLOACERVOAM.'|| T.table_name || ' dissable CONSTRAINT ' || T.constraint_name || ';'  from dba_constraints t where t.table_name in(
'LOV_DIRECAO','LOV_ESTADO','LOV_MUNICIPIO','LOV_ORGAO','LOV_TIPO_USUARIO','TAB_PROJETO','TAB_GLEBA','LOV_SETOR','TAB_MODALIDADE','LOV_SITUACAO_GEOGRAFICO',
'TAB_PESSOA','LOV_TIPO_PESSOA','LOV_TIPO_PESSOA_REGISTRO','LOV_SITUACAO_USUARIO','LOV_TIPO_TITULO','LOV_ZONA','TAB_CONFIGURACAO','TAB_DENOMINACAO_IMOVEL',
'TAB_REGISTRO_FUNDIARIO','TAB_REGISTRO_FUNDIARIO_ARQUIV','TAB_CONTRL_ARQ_REG_FUND','TAB_REGISTRO_FUNDIARIO_CONFRO','TAB_REGISTRO_FUNDIARIO_PESSOA',
'TAB_LIVRO_REGISTRO','TAB_LIVRO_REGISTRO_CONFRO','TAB_LIVRO_REGISTRO_PESSOA','TAB_LIVRO_TOMBO','TAB_LIVRO_TOMBO_PESSOA','TAB_PROCESSO','GEO_LOTE',
'GEO_MARCO') and t.owner ='SIGLOACERVOAM'

--Passo 2 : script de inserção dos dados do sigloiteam(passivo) para o sigloacervoam
--Obs: Dividido em inserção simples e especifica

--Inserção Simples
insert into sigloacervoam.LOV_DIRECAO                    select * from sigloiteam.lov_direcao t where t.<entrega_id =id_entrega>; 
insert into sigloacervoam.LOV_ESTADO                     select * from sigloiteam.lov_estado t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.LOV_MUNICIPIO                  select * from sigloiteam.lov_municipio  t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.LOV_ORGAO                      select * from sigloiteam.lov_orgao t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_PROJETO                    select * from sigloiteam.tab_projeto t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_GLEBA                      select * from sigloiteam.tab_gleba t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.LOV_SETOR                      select * from sigloiteam.lov_setor t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_MODALIDADE                 select * from sigloiteam.tab_modalidade t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.LOV_SITUACAO_GEOGRAFICO        select * from sigloiteam.lov_situacao_geografico t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.LOV_TIPO_PESSOA                select * from sigloiteam.lov_tipo_pessoa t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.LOV_TIPO_PESSOA_REGISTRO       select * from sigloiteam.lov_tipo_pessoa_registro t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.LOV_TIPO_TITULO                select * from sigloiteam.lov_tipo_titulo t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.LOV_ZONA                       select * from sigloiteam.lov_zona t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_CONFIGURACAO               select * from sigloiteam.tab_configuracao t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_DENOMINACAO_IMOVEL         select * from sigloiteam.tab_denominacao_imovel t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_REGISTRO_FUNDIARIO         select * from sigloiteam.tab_registro_fundiario  t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_CONTRL_ARQ_REG_FUND        select * from sigloiteam.tab_contrl_arq_reg_fund t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_REGISTRO_FUNDIARIO_CONFRO  select * from sigloiteam.tab_registro_fundiario_confro t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_REGISTRO_FUNDIARIO_PESSOA  select * from sigloiteam.tab_registro_fundiario_pessoa t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_LIVRO_REGISTRO_CONFRO      select * from sigloiteam.tab_livro_registro_confro t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_LIVRO_REGISTRO_PESSOA      select * from sigloiteam.tab_livro_registro_pessoa t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_LIVRO_TOMBO                select * from sigloiteam.tab_livro_tombo t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_LIVRO_TOMBO_PESSOA         select * from sigloiteam.tab_livro_tombo_pessoa t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_PROCESSO                   select * from sigloiteam.tab_processo t where t.<entrega_id =id_entrega>;
insert into sigloacervoam.TAB_REGISTRO_FUNDIARIO_ARQUIV  select * from sigloiteam.tab_registro_fundiario_arquiv t where t.<entrega_id =id_entrega>;

--Inserção Especifica
insert into sigloacervoam.TAB_LIVRO_REGISTRO             select id, registro_fundiario, municipio, data_titulo, area_propriedade, unidade_area_prop, livro, 
folha, numero_titulo, nome_propriedade, perimetro, unidade_perimetro, frente, unidade_frente, lado_esquerdo, unidade_esquerdo, lado_direito, 
unidade_direito, fundos, unidade_fundos, situacao_titulo, completo, entrega_id from sigloiteam.tab_livro_registro t where t.<entrega_id =id_entrega>;

insert into sigloacervoam.TAB_PESSOA                      select id, tipo, nome, rg, ie, cpf, cnpj, data_nascimento, naturalidade_estado, naturalidade_municipio, endereco, 
contato, nacionalidade, observacoes, NULL, entrega_id from sigloiteam.tab_pessoa t where t.<entrega_id =id_entrega>;

insert into sigloacervoam.GEO_LOTE                         select id, codigo, (select treg.orgao from sigloiteam.tab_registro_fundiario treg where treg.id = t.codigo) orgao,
geometry, entrega_id from sigloiteam.geo_lote t where t.<entrega_id =id_entrega>;

insert into sigloacervoam.GEO_MARCO                        select id, codigo,(select treg.orgao from sigloiteam.tab_registro_fundiario treg where treg.id = t.codigo) orgao,
geometry, entrega_id  from  sigloiteam.geo_marco t where t.<entrega_id =id_entrega>;


--Passo 3  :  query para montar o script de habilitar contraints             
select 'ALTER TABLE SIGLOACERVOAM.'|| T.table_name || ' ENABLE CONSTRAINT ' || T.constraint_name || ';'  from dba_constraints t where t.table_name in(
'LOV_DIRECAO','LOV_ESTADO','LOV_MUNICIPIO','LOV_ORGAO','LOV_TIPO_USUARIO','TAB_PROJETO','TAB_GLEBA','LOV_SETOR','TAB_MODALIDADE','LOV_SITUACAO_GEOGRAFICO',
'TAB_PESSOA','LOV_TIPO_PESSOA','LOV_TIPO_PESSOA_REGISTRO','LOV_SITUACAO_USUARIO','LOV_TIPO_TITULO','LOV_ZONA','TAB_CONFIGURACAO','TAB_DENOMINACAO_IMOVEL',
'TAB_REGISTRO_FUNDIARIO','TAB_REGISTRO_FUNDIARIO_ARQUIV','TAB_CONTRL_ARQ_REG_FUND','TAB_REGISTRO_FUNDIARIO_CONFRO','TAB_REGISTRO_FUNDIARIO_PESSOA',
'TAB_LIVRO_REGISTRO','TAB_LIVRO_REGISTRO_CONFRO','TAB_LIVRO_REGISTRO_PESSOA','TAB_LIVRO_TOMBO','TAB_LIVRO_TOMBO_PESSOA','TAB_PROCESSO','GEO_LOTE',
'GEO_MARCO') and t.owner ='SIGLOACERVOAM'
                 

--Passo 4 : Query para verificar os arquivos pdf a serem copiados  e suas localizações
                 
SELECT * FROM SIGLOITEAM.tab_contrl_arq_reg_fund T WHERE T.<ENTREGA_ID=id_entrega>                 

--Passo 5 : Informar O operador da entrega,data e id da entrega

insert into siglo_am.tab_controle_importacao t values (sysdate,'nome_do_dba',id_entrega)
