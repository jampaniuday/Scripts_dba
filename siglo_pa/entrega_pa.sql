--Este script deve ser rodado como system
--Passo 1 : query para montar o script de desabilitar contraints

select 'ALTER TABLE SIGLOACERVOPA.'|| T.table_name || ' disable CONSTRAINT ' || T.constraint_name || ';'  from dba_constraints t where t.table_name in('LOV_SITUACAO_PROCESSO',
'LOV_STATUS_PROCESSO','LOV_TIPO_TITULO','LOV_DIRECAO' ,'LOV_DESTINACAO','LOV_TIPO_ZONA','LOV_ESTADO','LOV_ORGAO','LOV_MUNICIPIO','LOV_TIPO_PESSOA',
'LOV_TIPO_PESSOA_REGISTRO','LOV_SITUACAO_GEOGRAFICO','TAB_REGISTRO_FUNDIARIO','TAB_PROJETO','TAB_TITULO','TAB_SITUACAO_TITULO_FUNDIARIO','TAB_GLEBA',
'TAB_PESSOA','TAB_MEMORIAL_DESCRITIVO','TAB_REGISTRO_FUNDIARIO_PESSOA','TAB_PROCESSO','TAB_REGISTRO_FUNDIARIO_ARQUIV','TAB_TIPO_PROCESSO','TAB_REG_FUND_LOTES',
'TAB_REGISTRO_IMOBILIARIO','TAB_REGISTRO_FUNDIARIO_CONFRO','GEO_MARCO','GEO_LOTE','TAB_CONTRL_ARQ_REG_FUND',
'TAB_CONFIGURACAO') and t.owner ='SIGLOACERVOPA'

--Passo 2 : script de inserção dos dados do sigloiterpa(passivo) para o sigloacervoam
--Obs: Dividido em inserção simples e especifica

--Inserção Simples
select 'insert into SIGLOACERVOPA.'|| T.table_name || ' SELECT * FROM SIGLOITERPA.' || T.table_name || ' WHERE ENTREGA_ID IS NOT NULL;'  from dba_TABLES t where t.table_name in('LOV_SITUACAO_PROCESSO',
'LOV_STATUS_PROCESSO','LOV_TIPO_TITULO','LOV_DIRECAO' ,'LOV_DESTINACAO','LOV_TIPO_ZONA','LOV_ESTADO','LOV_ORGAO','LOV_MUNICIPIO','LOV_TIPO_PESSOA',
'LOV_TIPO_PESSOA_REGISTRO','LOV_SITUACAO_GEOGRAFICO','TAB_REGISTRO_FUNDIARIO','TAB_PROJETO','TAB_TITULO','TAB_SITUACAO_TITULO_FUNDIARIO','TAB_GLEBA',
'TAB_PESSOA','TAB_MEMORIAL_DESCRITIVO','TAB_REGISTRO_FUNDIARIO_PESSOA','TAB_PROCESSO','TAB_REGISTRO_FUNDIARIO_ARQUIV','TAB_TIPO_PROCESSO','TAB_REG_FUND_LOTES',
'TAB_REGISTRO_IMOBILIARIO','TAB_REGISTRO_FUNDIARIO_CONFRO','GEO_MARCO','GEO_LOTE','TAB_CONTRL_ARQ_REG_FUND',
'TAB_CONFIGURACAO') and t.owner ='SIGLOACERVOPA'

--ESPECIFICO
insert into sigloacervopa.TAB_REGISTRO_FUNDIARIO         select id,projeto, gleba, nome_lote, destinacao, estado, municipio, area_declarada, 
area_declarada_unidade, perimetro_declarado, perimetro_declarado_unidade, area_reserva_legal, area_reserva_legal_unidade, orgao, localizacao, 
zona, unidade_avancada, numero_pasta, outorgante_orgao, legislacao_federal, denominacao_imovel, num_imovel_sncr, situacao_geografica, 
situacao_geografica_descricao, numero_lote, 0, NULL, 0, NULL, entrega_id 
from sigloiterpa.tab_registro_fundiario  t where t.entrega_id = 1;

insert into sigloacervopa.TAB_PESSOA                      select id, tipo, nome, rg, ie, cpf, cnpj, data_nascimento, naturalidade_estado, naturalidade_municipio, endereco, 
contato, nacionalidade, observacoes, 0,NULL, entrega_id from sigloiterpa.tab_pessoa t where t.entrega_id = 1;

insert into sigloacervopa.GEO_LOTE                         select id, codigo,geometry,entrega_id,
(select treg.orgao from sigloiterpa.tab_registro_fundiario treg where treg.id = t.codigo) orgao
from sigloiterpa.geo_lote t where t.entrega_id = 1;

insert into sigloacervopa.GEO_MARCO                        
select id, codigo,geometry, entrega_id,(select treg.orgao from sigloiterpa.tab_registro_fundiario treg where treg.id = t.codigo) orgao
from  sigloiterpa.geo_marco t where t.entrega_id = 1;


--NORMAL

insert into sigloacervopa.LOV_DIRECAO                    select * from sigloiterpa.lov_direcao t where t.entrega_id = 1;
insert into sigloacervopa.LOV_ESTADO                     select * from sigloiterpa.lov_estado t where t.entrega_id = 1;
insert into sigloacervopa.LOV_MUNICIPIO                  select * from sigloiterpa.lov_municipio  t where t.entrega_id = 1;
insert into sigloacervopa.LOV_ORGAO                      select * from sigloiterpa.lov_orgao t where t.entrega_id = 1;
insert into sigloacervopa.TAB_PROJETO                    select * from sigloiterpa.tab_projeto t where t.entrega_id = 1;
insert into sigloacervopa.TAB_GLEBA                      select * from sigloiterpa.tab_gleba t where t.entrega_id = 1;
insert into sigloacervopa.LOV_SITUACAO_GEOGRAFICO        select * from sigloiterpa.lov_situacao_geografico t where t.entrega_id = 1;
insert into sigloacervopa.LOV_TIPO_PESSOA                select * from sigloiterpa.lov_tipo_pessoa t where t.entrega_id = 1;
insert into sigloacervopa.LOV_TIPO_PESSOA_REGISTRO       select * from sigloiterpa.lov_tipo_pessoa_registro t where t.entrega_id = 1;
insert into sigloacervopa.LOV_TIPO_TITULO                select * from sigloiterpa.lov_tipo_titulo t where t.entrega_id = 1;
insert into sigloacervopa.TAB_CONFIGURACAO               select * from sigloiterpa.tab_configuracao t where t.entrega_id = 1;
insert into sigloacervopa.TAB_CONTRL_ARQ_REG_FUND        select * from sigloiterpa.tab_contrl_arq_reg_fund t where t.entrega_id = 1;
insert into sigloacervopa.TAB_REGISTRO_FUNDIARIO_CONFRO  select * from sigloiterpa.tab_registro_fundiario_confro t where t.entrega_id = 1;
insert into sigloacervopa.TAB_REGISTRO_FUNDIARIO_PESSOA  select * from sigloiterpa.tab_registro_fundiario_pessoa t where t.entrega_id = 1;
insert into sigloacervopa.TAB_PROCESSO                   select * from sigloiterpa.tab_processo t where t.entrega_id = 1;
insert into sigloacervopa.TAB_REGISTRO_FUNDIARIO_ARQUIV  select * from sigloiterpa.tab_registro_fundiario_arquiv t where t.entrega_id = 1;
insert into sigloacervopa.LOV_DESTINACAO                 select * from sigloiterpa.LOV_DESTINACAO t where t.entrega_id = 1;
insert into sigloacervopa.LOV_SITUACAO_PROCESSO          select * from sigloiterpa.LOV_SITUACAO_PROCESSO t where t.entrega_id = 1;
insert into sigloacervopa.LOV_STATUS_PROCESSO            select * from sigloiterpa.LOV_STATUS_PROCESSO t where t.entrega_id = 1;
insert into sigloacervopa.LOV_TIPO_ZONA                  select * from sigloiterpa.LOV_TIPO_ZONA t where t.entrega_id = 1;
insert into sigloacervopa.TAB_LIVRO_REG_TIT_CONFRO       select * from sigloiterpa.TAB_LIVRO_REG_TIT_CONFRO t where t.entrega_id = 1;
insert into sigloacervopa.TAB_LIVRO_REG_TIT_PESSOA       select * from sigloiterpa.TAB_LIVRO_REG_TIT_PESSOA t where t.entrega_id = 1;
insert into sigloacervopa.TAB_MEMORIAL_DESCRITIVO        Select * from sigloiterpa.TAB_MEMORIAL_DESCRITIVO t where t.entrega_id = 1;
insert into sigloacervopa.TAB_REGISTRO_IMOBILIARIO       select * from sigloiterpa.TAB_REGISTRO_IMOBILIARIO t where t.entrega_id = 1;
insert into sigloacervopa.TAB_REG_FUND_LOTES             select * from sigloiterpa.TAB_REG_FUND_LOTES t where t.entrega_id = 1;
insert into sigloacervopa.TAB_SITUACAO_TITULO_FUNDIARIO  select * from sigloiterpa.TAB_SITUACAO_TITULO_FUNDIARIO t where t.entrega_id = 1;
insert into sigloacervopa.TAB_TIPO_PROCESSO              select * from sigloiterpa.TAB_TIPO_PROCESSO t where t.entrega_id = 1;
insert into sigloacervopa.TAB_TITULO                     select * from sigloiterpa.TAB_TITULO t where t.entrega_id = 1;
insert into sigloacervopa.TAB_LIVRO_REGISTRO             select * from sigloiterpa.tab_livro_registro t where t.entrega_id = 1;

--Passo 3  :  query para montar o script de habilitar contraints             
select 'ALTER TABLE sigloacervopa.'|| T.table_name || ' ENABLE CONSTRAINT ' || T.constraint_name || ';'  from dba_constraints t where t.table_name in('LOV_SITUACAO_PROCESSO',
'LOV_STATUS_PROCESSO','LOV_TIPO_TITULO','LOV_DIRECAO' ,'LOV_DESTINACAO','LOV_TIPO_ZONA','LOV_ESTADO','LOV_ORGAO','LOV_MUNICIPIO','LOV_TIPO_PESSOA',
'LOV_TIPO_PESSOA_REGISTRO','LOV_SITUACAO_GEOGRAFICO','TAB_REGISTRO_FUNDIARIO','TAB_PROJETO','TAB_TITULO','TAB_SITUACAO_TITULO_FUNDIARIO','TAB_GLEBA',
'TAB_PESSOA','TAB_MEMORIAL_DESCRITIVO','TAB_REGISTRO_FUNDIARIO_PESSOA','TAB_PROCESSO','TAB_REGISTRO_FUNDIARIO_ARQUIV','TAB_TIPO_PROCESSO','TAB_REG_FUND_LOTES',
'TAB_REGISTRO_IMOBILIARIO','TAB_REGISTRO_FUNDIARIO_CONFRO','GEO_MARCO','GEO_LOTE','TAB_CONTRL_ARQ_REG_FUND',
'TAB_CONFIGURACAO') and t.owner ='SIGLOACERVOPA'
                 

--Passo 4  : insert geo
insert into SIGLO_PA.geo_lote_navegador
            (id, 
             geometry, 
             orgao, 
             area_ha, 
             perimetro, 
             codigo, 
             id_acervo, 
             origem)
            (select SIGLO_PA.seq_geo_lote_navegador.nextval,
                sg.geometry,
                sg.orgao,
                st.area_declarada,
                st.perimetro_declarado,
                sg.codigo,
                sg.codigo,
                1
             from SIGLO_PA.syn_tab_reg_fund st, SIGLO_PA.syn_ac_geo_lote sg
            where st.id = sg.codigo
              and st.entrega_id = 1);  

--Passo 5 : Query para verificar os arquivos pdf a serem copiados  e suas localizações
                 
SELECT * FROM sigloiterpa.tab_contrl_arq_reg_fund T WHERE T.ENTREGA_ID =1;                 

--Passo 6 : Informar O operador da entrega,data e id da entrega

insert into siglo_pa.tab_controle_importacao t values (sysdate,'Mario',1)
