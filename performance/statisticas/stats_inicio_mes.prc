CREATE OR REPLACE PROCEDURE stats_inicio_mes AS

P_NOVA   VARCHAR2(10);
P_ANTIGA VARCHAR2(10);

BEGIN

  select 'A' || to_char(sysdate, 'yy') || '_M' || to_char(sysdate ,'mm') into P_NOVA from dual;
  select 'A' || to_char(add_months(sysdate, -1), 'yy') || '_M' || to_char(add_months(sysdate, -1) ,'mm') into P_ANTIGA from dual;

  DBMS_STATS.COPY_TABLE_STATS('ADM_SGV_TRN','TRANSACAO',P_ANTIGA,P_NOVA,FORCE => TRUE);
  DBMS_STATS.COPY_TABLE_STATS('ADM_SGV_TRN','TRANSACAO_VALORADA',P_ANTIGA,P_NOVA,FORCE => TRUE);
  DBMS_STATS.COPY_TABLE_STATS('ADM_SGV_TRN','TRANSACAO_VALORADA_SUMARIZADA',P_ANTIGA,P_NOVA,FORCE => TRUE);
  DBMS_STATS.gather_system_stats;
  DBMS_STATS.gather_fixed_objects_stats;


END;
/
