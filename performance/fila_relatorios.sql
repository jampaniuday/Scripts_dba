/*TOTAL DE RELATORIOS AGUARDANDO PARA SER PROCESSADO*/
SELECT COUNT(*)
FROM  ADM_SGV.RECEPCAO_RELATORIO_WEB
WHERE SITUACAO=0;

/*TOTAL DE RELATORIOS DO DIA*/
SELECT COUNT(1) TOTAL
FROM ADM_SGV.RECEPCAO_RELATORIO_WEB
WHERE TRUNC(DATA_INCLUSAO) = TRUNC(SYSDATE);

/*RELATORIOS EM PROCESSAMENTO NO SITE BACKUP*/
SELECT V.USERNAME,
       V.SID,
       V.SQL_ID,
       S.SQL_TEXT,
       V.SQL_EXEC_START AS START_AT,
       FLOOR((SYSDATE - V.SQL_EXEC_START) * 24 * 60) AS MINUTES
FROM V$SESSION V, V$SQLAREA S
WHERE V.USERNAME = 'ADM_SGV'
      AND V.STATUS = 'ACTIVE'
      AND V.MACHINE = 'ser016057006'
      AND V.SQL_ID = S.SQL_ID
ORDER BY MINUTES DESC;

/*RELATORIOS SENDO PROCESSADO ( VIS�O DA FILA )*/
SELECT RELATORIO_WEB_ID AS ID,
       DATA_INCLUSAO,
       DATA_INI_GERACAO,
       USUARIO_INCLUSAO,
       PARAMETRO_USUARIO,
       FLOOR((DATA_INI_GERACAO - DATA_INCLUSAO) * 24 * 60)  AS DELAY ,
       FLOOR((SYSDATE - DATA_INI_GERACAO) * 24 * 60) AS MINUTES,
       DECODE(INSIGNIA,0,'LEVE',1,'PESADA',2,'MUITO PESADA') FILA
 FROM ADM_SGV.RECEPCAO_RELATORIO_WEB
WHERE TRUNC(DATA_INCLUSAO)=TRUNC(SYSDATE)
      AND SITUACAO=1 
      /*DESCOMENTE ABAIXO PARA VER UM USUARIO ESPECIFICO*/
      OR SITUACAO=0
--      AND USUARIO_INCLUSAO = 'deusa.conde'
ORDER BY DATA_INI_GERACAO;

/*QUANTIDADE DE RELATORIOS POR USUARIO (PROCESSADOS, PROCESSANDO E A PROCESSAR)*/
SELECT USUARIO_INCLUSAO, COUNT(1) TOTAL
FROM ADM_SGV.RECEPCAO_RELATORIO_WEB
WHERE TRUNC(DATA_INCLUSAO) = TRUNC(SYSDATE)
GROUP BY USUARIO_INCLUSAO
ORDER BY TOTAL DESC,USUARIO_INCLUSAO;
